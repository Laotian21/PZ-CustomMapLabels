local data = {}

data.Defaults = {
	Town = {
		-- 颜色与透明度
		r = 0.08, g = 0.09, b = 0.25, a = 1.0,       -- 颜色和透明度 (RGBA)

		-- 默认外观与行为
		scale              = 3.5,                    -- 缩放大小
		rotation           = 0.0,                    -- 旋转角度
		anchorX            = 0.5,                    -- 锚点 (0.5, 0.5 表示中心对齐)
		anchorY            = 0.5,                    -- 锚点 (0.5, 0.5 表示中心对齐)
		layerID            = "text-town",            -- 符号所在的图层 (例如: "text-town", "text-building", "text-place")
		matchPerspective   = true,                   -- (true/false) 标签是否匹配地图视角（通常为 true）
		applyZoom          = true,                   -- (true/false) 标签是否随地图缩放而变化大小（通常为 true）
		minZoom            = 0.0,                    -- 标签开始可见的最小缩放级别
		maxZoom            = 13.0,                   -- 标签保持可见的最大缩放级别   
		userDefined        = false,                  -- (true/false) 用户是否可自定义标签,如无特殊需求请保持false
	},
	-- 示例：
	-- MilitaryBase = {
    -- inherits = "Town",
	-- 	r = 0.1, g = 0.2, b = 0.1, a = 1.0,
	-- 	scale = 2.5,
	--  ... (继承或覆写其他属性)
	-- }
}

-- 必需: key, x, y, type
-- 可选: 任何需要覆盖默认值的属性 (例如 scale, rotation)
---------------------------------------------------------------------------------
data.ModMapLabels = {
	---EchoCreek MilitaryBase[回音河军事基地]---(3476333350)---
	["\\EchoCreek MilitaryBase"] = {
		{ key = "MapLabel_EchoCreek_MilitaryBase", x = 3468,  y = 10257, type = "Town", scale = 2.5 },
	},
	---Willowbrook Bastion![柳溪镇]---(3479667649)---
	["\\Willowbrook Bastion!"] = {
		{ key = "MapLabel_Willowbrook_Bastion",  x = 9153,  y = 9879,  type = "Town" },
	},
	---Asakusa lake town[浅草湖镇]---(3482962418)---
	["\\Asakusa lake town"] = {
		{ key = "MapLabel_ASAKUSALAKE",          x = 10785, y = 11595, type = "Town" },
	},
	---Ashenwood[灰木镇]---(3493916941)---
	["\\AshenwoodmodNewB42"] = {
		{ key = "MapLabel_Ashenwood",            x = 11535, y = 11424, type = "Town" },
	},
	---Atlanta Tower Survival[亚特兰大]---(3525104670)---
	["\\Atlanta Tower Survival"] = {
		{ key = "MapLabel_AtlantaTowerSurvival", x = 11249, y = 12752, type = "Town" },
	},
	---Constown[康斯镇]---(3480990544)---
	["\\Constown42"] = {
		{ key = "MapLabel_Constown",             x = 5652,  y = 11100, type = "Town" },
	},
	---Coryerdon[科里尔登]---(3502623745)---
	["\\CoryerdonB42"] = {
		{ key = "MapLabel_CORYERDON",            x = 8771,  y = 5969,  type = "Town" },
	},
	---Daisy County[雏菊镇]---(3390753141)---
	["\\Daisy County B42 version"] = {
		{ key = "MapLabel_DaisyCounty",          x = 10198, y = 7640,  type = "Town" },
	},
	---Fort Benning[本宁堡]---(3490580478)---
	["\\FortBenningB42"] = {
		{ key = "MapLabel_FORTBENNING",          x = 6106,  y = 7033,  type = "Town" },
	},
	---Fort JadeLake[翡翠湖堡]---(3537326669)---
	["\\Fort JadeLake"] = {
		{ key = "MapLabel_FortJadeLake",         x = 11247, y = 8882,  type = "Town", scale = 3.0 },
	},
	---Fort Waterfront[滨水要塞]---(3486814612)---
	["\\Fort Waterfront B42"] = {
		{ key = "MapLabel_FORTWATERFRONT",       x = 10251, y = 10993, type = "Town" },
	},
	---Grapeseed[葡萄籽镇]---(2463499011)---
	["\\42Grapeseed"] = {
		{ key = "MapLabel_Grapeseed",            x = 6835,  y = 11204, type = "Town" },
	},
	---Fairhaven[费尔黑文]---(3533512793)---
	["\\fairhavenmap"] = {
		{ key = "MapLabel_Fairhaven",            x = 10652, y = 13347, type = "Town" },
	},
	---Hazelnut Manor[榛果庄园]---(3495993590)---
	["\\HazelnutManor"] = {
		{ key = "MapLabel_HazelnutManor",        x = 12735, y = 6230,  type = "Town", scale = 2.5 },
	},
	---Hazelnut Manor (Poor Version)[榛果庄园无物资版]---(3495993590)---
	["\\Hazelnut Manor[Poor Version]"] = {
		{ key = "MapLabel_HazelnutManor",        x = 12735, y = 6230,  type = "Town", scale = 2.5 },
	},
	---Kingsmouth[王口岛]---(3498269494)---
	["\\KingsmouthB42"] = {
		{ key = "MapLabel_KINGSMOUTH",           x = 7160,  y = 16447, type = "Town" },
	},
	---Kingsmouth North[王口岛地图左上方]---(3498573050)---
	["\\KingsmouthNorthB42"] = {
		{ key = "MapLabel_KINGSMOUTHNORTH",      x = 547,   y = 4415,  type = "Town" },
	},
	---White Forest[白森林]---(3519054686)---
	["\\linzimod"] = {
		{ key = "MapLabel_WhiteForest",          x = 9586,  y = 11369, type = "Town" },
	},
	---Little Township[小马驹镇]---(3477336014)---
	["\\LittleTownshipB42"] = {
		{ key = "MapLabel_LittleTownship",       x = 8251,  y = 8544,  type = "Town", scale = 3.0 },
	},
	---Louisville Quarantine Zone[路易斯维尔隔离区]---(2934132344)---
	["\\Louisville_Quarantine_Zone"] = {
		{ key = "MapLabel_LouisvilleQuarantineZone", x = 13622, y = 4089, type = "Town" },
	},
	---Meiya's Town[没牙的小镇]---(3478788261)---
	["\\Meiya'sTown"] = {
		{ key = "MapLabel_MEIYATOWN",            x = 8235,  y = 10937, type = "Town", scale = 3.0 },
	},
	---Fort Preston[普雷斯顿堡]---(3496507146)---
	["\\muldraughmilitarybaseas24"] = {
		{ key = "MapLabel_FortPreston",          x = 9045,  y = 10987, type = "Town", scale = 2.7 },
	},
	---Nettle Township[荨麻镇]---(3391349130)---
	["\\Nettle Township B42 version"] = {
		{ key = "MapLabel_Nettle_Township",      x = 6904,  y = 9292,  type = "Town" },
	},
	---Oakshire[橡树郡]---(3535422434)---
	["\\Oakshire42"] = {
		{ key = "MapLabel_Oakshire",             x = 8640,  y = 7854,  type = "Town", scale = 4.5 },
	},
	---Raccoon City[浣熊市]---(3388468313)---
	["\\RaccoonCityB42"] = {
		{ key = "MapLabel_RaccoonCity",          x = 10199, y = 10206, type = "Town" },
	},
	---Raven Creek[渡鸦港]---(3484263516)---
	["\\RavenCreekB42"] = {
		{ key = "MapLabel_RAVENCREEK",           x = 5115,  y = 16364, type = "Town" },
	},
	---Safeharbor Garrison[安泊戍镇]---(3522517059)---
	["\\modid"] = {
		{ key = "MapLabel_SafeharborGarrison",   x = 12169, y = 10769, type = "Town", scale = 5.5 },
	},
	---SafeWay Hamlet[途安里]---(3533315055)---
	["\\SafeWayHamlet"] = {
		{ key = "MapLabel_SafeWayHamlet",        x = 12718, y = 11255, type = "Town", scale = 3.0 },
	},
	---Sector-7 Breach[七号沦陷区]---(3513107552)---
	["\\Sector-7 Breach"] = {
		{ key = "MapLabel_Sector7Breach",        x = 9262,  y = 7558,  type = "Town", scale = 3.0, rotation = 45.0 },
	},
	---Taibei Road[台北路]---(3401261192)---
	["\\Taibeiroad4"] = {
		{ key = "MapLabel_TAIBEIROAD",           x = 8449,  y = 10775, type = "Town" },
	},
	---Taylorsville[泰勒斯维尔]---(3134394569)---
	["\\Taylorsville"] = {
		{ key = "MapLabel_Taylorsville",         x = 9675,  y = 6866,  type = "Town", scale = 5.5 },
	},
	---Tikitown[蒂基镇]---(3037854728)---
	["\\tikitown"] = {
		{ key = "MapLabel_Tikitown",             x = 7288,  y = 7354,  type = "Town", scale = 5.5 },
	},
	---Trapalake town[菱角湖]---(3390327877)---
	["\\TrapalaketownB42"] = {
		{ key = "MapLabel_Trapalaketown",        x = 8725,  y = 11853, type = "Town", scale = 3.0 },
	},
	---Vila-Z[维拉-Z]---(3524981481)---
	["\\VilaZMap"] = {
		{ key = "MapLabel_VILAZ",                x = 9747,  y = 9739,  type = "Town", scale = 3.0 },
	},
	---West Point Expansion[西点镇拓展]---(3475754603)---
	["\\WestPointExpansionB42"] = {
		{ key = "MapLabel_WestPointExpansion",   x = 12472, y = 6977,  type = "Town" },
	},
	---White Wolf Ridge[白狼岭]---(3499861271)---
	["\\White Wolf Ridge"] = {
		{ key = "MapLabel_WhiteWolfRidge",       x = 12602, y = 9030,  type = "Town" },
	},
	---Iris Eyot[艾瑞斯岛]---(3545473388)---
	["\\IrisEyot"] = {
		{ key = "MapLabel_IrisEyot",             x = 4634,  y = 11251, type = "Town", scale = 3.0 },
	},
	---Ed's Auto Salvage[艾德的汽修厂]---(3478900814)---
	["\\EdsAutoSalvageB42"] = {
		{ key = "MapLabel_EdsAutoSalvage",       x = 8719,  y = 8539,  type = "Town", scale = 2.0, rotation = 45.0 },
	},
	---Louisville Mall Base[路易维尔商场基地]---(3540209438)---
	["\\Louisville Mall Base (Build 42)"] = {
		{ key = "MapLabel_LouisvilleMallBase",   x = 13813, y = 1242,  type = "Town", scale = 2.6 },
	},
	---Erika's Furniture Store[艾丽卡家具店]---(3363546437)---
	["\\Erikas_Furniture_Store"] = {
		{ key = "MapLabel_ErikasFurnitureStore", x = 11541, y = 8267,  type = "Town", scale = 2.8 },
	},
	---Blackpine County[黑松县]---(3363546437)---
	["\\BlackpineCounty"] = {
		{ key = "MapLabel_BlackpineCounty", x = 10763, y = 14644,  type = "Town", scale = 5.5 },
	},
	---PeaceTown[寂静镇]---(3561017137)---
	["\\PeaceTown"] = {
		{ key = "MapLabel_PeaceTown", x = 3481, y = 7526,  type = "Town", scale = 3.0 },
	},
	---Riverside Mansion Unofficial[河畔豪宅]---(3485388592)---
	["\\RMSafeHouseUnofficial"] = {
		{ key = "MapLabel_RMSafeHouseUnofficial",          x = 5583,  y = 5309, type = "Town", scale = 2.7 },
	},
	---Camden County[康登县]---(3504080284)---
	["\\CamdenCountyB42"] = {
		{ key = "MapLabel_CamdenCounty",          x = 16200,  y = 11456, type = "Town", scale = 8.5 },
	},
}

return data