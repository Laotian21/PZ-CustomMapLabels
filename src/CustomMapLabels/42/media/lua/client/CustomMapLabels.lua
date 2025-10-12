local CustomMapLabels = {}

local MapLabelData = require("MapLabelData")
local ModMapLabels = MapLabelData and MapLabelData.ModMapLabels

function CustomMapLabels.processLabelData(rawData, defaults)
    if not rawData or not defaults then return {} end

    local processedData = {}
    for modId, labels in pairs(rawData) do
        processedData[modId] = {}
        for _, conciseLabel in ipairs(labels) do
            local templateName = conciseLabel.type
            local primaryTemplate = defaults[templateName]

            if primaryTemplate then
                local fullLabel = {}

                local parentTemplateName = primaryTemplate.inherits
                if parentTemplateName and defaults[parentTemplateName] then
                    for key, value in pairs(defaults[parentTemplateName]) do
                        fullLabel[key] = value
                    end
                end

                for key, value in pairs(primaryTemplate) do
                    fullLabel[key] = value
                end

                for key, value in pairs(conciseLabel) do
                    fullLabel[key] = value
                end

                table.insert(processedData[modId], fullLabel)
            end
        end
    end
    return processedData
end

function CustomMapLabels.generateKeyFromText(text)
	if not text or text == "" then return nil end
	local processedText = text:gsub("<[Bb][Rr][^>]*>", " ")
	local sanitizedText = processedText:gsub("[^%w%s]", ""):gsub("%s+", "")
	return string.lower("MapLabel_" .. sanitizedText)
end

function CustomMapLabels.processAllMapLabels()
	if not ISWorldMap_instance then
		ISWorldMap.ShowWorldMap(0)
		ISWorldMap_instance:close()
	end

	local mapAPI = ISWorldMap_instance.javaObject:getAPIv3()
	if not mapAPI then return end
	local symAPI = mapAPI:getSymbolsAPIv2()
    if not symAPI then return end
	local FullModMapLabels = CustomMapLabels.processLabelData(ModMapLabels, MapLabelData.Defaults)
	
	local managedKeys = {}
	local managedKeysLookup = {}
    local activeModLabels = {}
	if FullModMapLabels then
		for modId, labels in pairs(FullModMapLabels) do
			if getActivatedMods():contains(modId) then
                table.insert(activeModLabels, labels)
				for _, data in ipairs(labels) do
					if data.key then
						managedKeys[data.key] = true
						managedKeysLookup[string.lower(data.key)] = data.key
					end
				end
			end
		end
	end

	local indicesToRemove = {}
	local symbolsToRebuild = {}

	for i = 0, symAPI:getSymbolCount() - 1 do
		local sym = symAPI:getSymbolByIndex(i)
		
		if sym and sym:isText() and not sym:isUserDefined() then
			local untranslatedKey = sym:getUntranslatedText()
			if untranslatedKey then
				local originalCaseKey = managedKeys[untranslatedKey] or managedKeysLookup[string.lower(untranslatedKey)]

				if originalCaseKey then
					table.insert(indicesToRemove, i)
				
				elseif not untranslatedKey:find("^MapLabel_") then
					local newKeyLowercase = CustomMapLabels.generateKeyFromText(untranslatedKey)
					
					if newKeyLowercase then
						local matchedOriginalKey = managedKeysLookup[newKeyLowercase]
						if matchedOriginalKey and getTextOrNull(matchedOriginalKey) then
							local originalData = {
								newTranslationKey = matchedOriginalKey,
								x = sym:getWorldX(), y = sym:getWorldY(), layerID = sym:getLayerID(),
								r = sym:getRed(), g = sym:getGreen(), b = sym:getBlue(), a = sym:getAlpha(),
								scale = sym:getScale(), rotation = sym:getRotation(),
								anchorX = sym:getAnchorX(), anchorY = sym:getAnchorY(),
								matchPerspective = sym:isMatchPerspective(), applyZoom = sym:isApplyZoom(),
								minZoom = sym:getMinZoom(), maxZoom = sym:getMaxZoom(),
								userDefined = false
							}
							table.insert(symbolsToRebuild, {data=originalData, index=i})
						end
					end
				end
			end
		end
	end

    for _, item in ipairs(symbolsToRebuild) do table.insert(indicesToRemove, item.index) end
    if #indicesToRemove > 0 then
        table.sort(indicesToRemove, function(a,b) return a > b end)
        local uniqueIndices = {}
        for _, index in ipairs(indicesToRemove) do 
            if not uniqueIndices[index] then 
                symAPI:removeSymbolByIndex(index)
                uniqueIndices[index] = true 
            end 
        end
    end
    
    for _, item in ipairs(symbolsToRebuild) do
        local data = item.data
        local newSymbol = symAPI:addUntranslatedText(data.newTranslationKey, data.layerID, data.x, data.y)
        if newSymbol then
            newSymbol:setRGBA(data.r, data.g, data.b, data.a)
            newSymbol:setScale(data.scale)
            newSymbol:setRotation(data.rotation)
            newSymbol:setAnchor(data.anchorX, data.anchorY)
            newSymbol:setMatchPerspective(data.matchPerspective)
            newSymbol:setApplyZoom(data.applyZoom)
            newSymbol:setMinZoom(data.minZoom)
            newSymbol:setMaxZoom(data.maxZoom)
            newSymbol:setUserDefined(data.userDefined)
        end
    end

	for _, labels in ipairs(activeModLabels) do
		for _, data in ipairs(labels) do
			if data.key and getTextOrNull(data.key) then
				local newSymbol = symAPI:addUntranslatedText(data.key, data.layerID or "text-place", data.x, data.y)
				if newSymbol then
					newSymbol:setRGBA(data.r or 0.0, data.g or 0.0, data.b or 0.0, data.a or 1.0)
					newSymbol:setScale(data.scale or 1.0)
					newSymbol:setRotation(data.rotation or 0.0)
					newSymbol:setAnchor(data.anchorX or 0.5, data.anchorY or 0.5)
					newSymbol:setMatchPerspective(data.matchPerspective ~= false)
					newSymbol:setApplyZoom(data.applyZoom ~= false)
					newSymbol:setMinZoom(data.minZoom or 0.0)
					newSymbol:setMaxZoom(data.maxZoom or 24.0)
					newSymbol:setUserDefined(false)
				end
			end
		end
	end
end

Events.OnGameStart.Add(CustomMapLabels.processAllMapLabels)