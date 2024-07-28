local ftCHeckZone = Citizen.InvokeNative(0xB3FB80A32BAE3065, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 25.0, 25.0, 2.0)
local itemSet = CreateItemset(1)
local foundFT = false
local ftInDist = false
local ftDistCheck = 999999
local ftCoords = vector3(0, 0, 0)
local ftVol = {}
local FTCustom = {}
local UIAppHash = 1833066477
local PromptG = GetRandomIntInRange(25500, 0xffffff)
local promptFT
local promptLabel
local promptString
local DataBind = {}
local UIItemList = {}
local menuTab = 1
local menuItem = 1
local lastItem = 1
local WP = vector3(0, 0, 0)
local campDefault = vector3(1758.888, -1903.404, 47.893)
local posseCampDefault = vector3(1758.888, -1903.404, 47.893)
local moonshineDefault = vector3(-1083.986, 703.458, 104.281)
local hasPerm = false
local hasCash = 5000
-- hasCash = MoneyGetCashBalance()
----------------------------------------------------------------------------------
-- Tab And Item Descriptors.
----------------------------------------------------------------------------------
local menuTabs = {
    'Locations', 
    'Player', 
    'Vip Locations'
}
FTPoints = {
    ----------------------------------------------------------------------------------
    -- Main Locations for Fast Travel
    ----------------------------------------------------------------------------------
    {
        {
            locationLabel = "Blackwater",
            locationDesc = "NFT_BLACKWATER_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-738.595, -1252.058, 44.734),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/blackwater.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Valentine",
            locationDesc = "NFT_VALENTINE_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-175.067, 640.543, 114.133),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/valentine.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Strawberry",
            locationDesc = "NFT_STRAWBERRY_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-1783.893, -430.469, 156.470),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/strawberry.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Armadillo",
            locationDesc = "NFT_ARMADILLO_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-3734.225, -2602.259, -12.917),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/armadillo.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Tumbleweed",
            locationDesc = "NFT_TUMBLEWEED_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-5425.016, -2919.998, 0.940),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/tumbleweed.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Annesburg",
            locationDesc = "NFT_ANNESBERG_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(2934.167, 1273.326, 44.653),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/annesburg.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Van Horn",
            locationDesc = "NFT_VAN_HORN_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(2892.003, 619.931, 57.734),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/vanhorn.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Emerald Station",
            locationDesc = "NFT_EMERALD_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(1519.545, 431.535, 90.681),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/emeraldranch.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "MacFarlane's Ranch",
            locationDesc = "NFT_MACFARLANES_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-2490.510, -2438.064, 60.583),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/emeraldranch.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Manzanita Post",
            locationDesc = "NFT_MANZANITA_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-1995.512, -1610.602, 118.119),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/manzanitapost.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Rhodes",
            locationDesc = "NFT_RHODES_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(1269.275, -1297.568, 76.957),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/rhodes.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "St Denis",
            locationDesc = "NFT_SAINT_DENIS_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(2695.005, -1446.752, 46.266),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/stdenis.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Colter",
            locationDesc = "NFT_COLTER_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(-1294.828, 2416.529, 305.952),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/stdenis.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Lagras",
            locationDesc = "NFT_LAGRAS_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(2108.463, -584.866, 41.675),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/stdenis.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Wapiti",
            locationDesc = "NFT_WAPITI_DESC",
            playerCountInArea = 0,
            targetCoords = vector3(486.875, 2209.392, 246.876),
            cardImg = "https://mad.kiwi/madwizzardworld/assets/img/stdenis.jpg",
            price = 1,
            enabled = 1,
            permission = "all",
            footer = "Select To Fast Travel"
        }        
    },
    ----------------------------------------------------------------------------------
    -- CUSTOM SECTION
    ----------------------------------------------------------------------------------
    {
        {
            locationLabel = "Personal Waypoint",
            locationDesc = "Takes you to your Current Personal Waypoint.",
            playerCountInArea = 0,
            targetCoords = vector3(0, 0, 0),
            price = 250,
            enabled = 0,
            permission = "personal",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Personal Camp",
            locationDesc = "NFT_CAMP_DESC",
            playerCountInArea = 0,
            targetCoords = campDefault,
            price = 100,
            enabled = 1,
            permission = "personal",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Moonshine Shack",
            locationDesc = "NFT_MOONSHINE_DESC",
            playerCountInArea = 0,
            targetCoords = moonshineDefault,
            price = 100,
            enabled = 1,
            permission = "personal",
            footer = "Select To Fast Travel"
        },
        {
            locationLabel = "Posse Camp",
            locationDesc = "NFT_CAMP_DESC",
            playerCountInArea = 0,
            targetCoords = posseCampDefault,
            price = 100,
            enabled = 0,
            permission = "personal",
            footer = "Select To Fast Travel"
        }
    },
    ----------------------------------------------------------------------------------
    -- VIP SECTION
    ----------------------------------------------------------------------------------
    {
        {
            locationLabel = "Respawn Room",
            locationDesc = "vip",
            playerCountInArea = 0,
            targetCoords = vector3(-559.93, -3776.59, 238.6),
            price = 0,
            enabled = 1,
            permission = "vip",
            footer = "Note: Server Permissions Required"
        }
    }
}
----------------------------------------------------------------------------------
-- Functions For Fast Travel
----------------------------------------------------------------------------------
function ProcessTeleport(menuItemData, eData, mOP) 
    local pPed = PlayerPedId()
    menuItem = eData[2] + 1 
    if menuTab == 2 then        
        if menuItem == 1 then
            if Citizen.InvokeNative(0xD42BD6EB2E0F1677, pPed) then
                local WP = GetWaypointCoords()
                if (WP.x == 0 and WP.y == 0) then
                    FTClose()
                else
                    FTPoints[2][1].targetCoords = vector3(WP.x, WP.y, 0)
                    TriggerServerEvent("mwgft:wp", {WP, menuItemData})              
                    FTClose()
                end
            end
        else
            TriggerServerEvent("mwgft:player", {tpItem, menuItemData})
            FTClose()
        end
    elseif menuTab == 3 then
        TriggerServerEvent("mwgft:vip", {tpItem, menuItemData})
        FTClose()
    else
        local itemContainterID = Citizen.InvokeNative("0x0C827D175F1292F3", DataBind[2], eData[2])
        local mopVal = Citizen.InvokeNative("0xFFC566A4801F6B40", itemContainterID, "dynamic_list_item_extra_int_field_one_value")
        TriggerServerEvent("mwgft:location", {tpItem, menuItemData, mopVal})
        FTClose()
    end     
end
--
function cullPlantsNearFT(itemHash, tCoords)
    if ftVol[itemHash] == nil or ftVol[itemHash] == 0 then
        local veg_radius = 2.0
        local veg_Flags =  1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 + 256   -- implement to all debris, grass, bush, etc...
        local veg_ModType = 1 	-- 1 | VMT_Cull
        ftVol[itemHash] = Citizen.InvokeNative(0xFA50F79257745E74, tCoords.x, tCoords.y, tCoords.z, veg_radius, veg_ModType, veg_Flags, 0);
    end
end
--
function CreateMenuList(menuNum)
    local clearlist = Citizen.InvokeNative("0xA1F15C1D03DF802D", DataBind[2]);    
    local pPed = PlayerPedId()
    local coords = GetEntityCoords(pPed)
    for k,v in pairs(FTPoints[menuTab]) do
        local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.targetCoords.x, v.targetCoords.y, v.targetCoords.z, false)
        mOP = math.floor(dist)
        mOP2 = math.floor(dist)
        if menuTab ~= 1 then 
            dist = 1000000
            mOP = v.price * 100
            mOP2 = v.price * 100
        end
        local mop2cash = mOP / 100
        local keySting = "Fast_Travel_Location_"..k
        local container = {}        
        container[1] = Citizen.InvokeNative("0xEB4F9A3537EEABCD", DataBind[2], keySting);
        if hasCash < mop2cash then -- if we dont have the cash, disable the item
            container[2] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_enabled", 0);    
        else
            container[2] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_enabled", v.enabled);
        end
        if dist <= 500 then -- if we are close to a WP, dont show it. walk ya lazy bastards
            container[3] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_visible", 0);
        else            
            container[3] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_visible", 1);
        end        
        if v.enabled then -- draw color of main text based on enabled or not.
            container[4] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_main_color", GetHashKey("COLOR_MENU_TEXT"));
        else
            container[4] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_main_color", GetHashKey("COLOR_MENU_TEXT_DISABLED"));
        end
        container[5] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_link", 0);
        container[6] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_event_channel_hash", UIAppHash);
        container[7] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_select_hash", UIAppHash);
        container[8] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_focus_hash", UIAppHash);
        container[9] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_prompt_text", 1993479432); --joaat("ib_select") text eq: "Travel"
        container[10] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_prompt_enabled", 0);
        container[11] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_prompt_visible", 0);
        container[13] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_prompt_option_select_hash", -1); 
        container[15] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_prompt_option_text", 1993479432); --joaat("ib_select") text eq: "Travel"
        container[16] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_prompt_option_enabled", 0);
        container[17] = Citizen.InvokeNative("0x58BAA5F635DA2FF4", container[1], "dynamic_list_item_prompt_option_visible", 0);
        container[18] = Citizen.InvokeNative("0x617FCA1C5652BBAD", container[1], "dynamic_list_item_raw_text_entry", v.locationLabel)
        container[21] = Citizen.InvokeNative("0x307A3247C5457BDE", container[1], "dynamic_list_item_extra_int_field_one_value", mOP)
        container[22] = Citizen.InvokeNative("0x307A3247C5457BDE", container[1], "dynamic_list_item_extra_int_field_two_value", mOP2)
        container[23] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_prompt_r3_text", 1993479432)
        container[24] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_prompt_toggle_text", 1993479432)
        if hasCash < mop2cash then -- if we do not have enough cash make the cash display red. 
            container[4] = Citizen.InvokeNative("0x8538F1205D60ECA6", container[1], "dynamic_list_item_main_color", GetHashKey("COLOR_MENU_TEXT_ATTENTION"));
        end 
        local INSERT2UILIST = Citizen.InvokeNative("0x5859E970794D92F3", DataBind[2], k, "ft_dynamic_text_and_price", container[1])
        UIItemList[k] = Citizen.InvokeNative("0x307A3247C5457BDE", container[1], "locationArrayIndex", k);
    end
end
-- Tab Page Increment UI Event
function tabPageIncrement()
    if menuTab >= 3 then
        menuTab = 1
    else
        menuTab = menuTab + 1
    end
    local subHeader = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subHeader", menuTabs[menuTab])                
    local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", "Fast Travel")
    CreateMenuList(menuTab)
    local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
end
-- Tab Page Decrement UI Event
function tabPageDecrement()
    if menuTab <= 1 then
        menuTab = 3
    else
        menuTab = menuTab - 1
    end
    local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", "Fast Travel")
    local subHeader = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subHeader", menuTabs[menuTab])
    CreateMenuList(menuTab)
    local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
end
-- Unfocused UI Item Event
function eventUnfocus(eData)
    lastItem = eData[2] + 1  
    local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", "Fast Travel")      
    local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
end
-- Focused UI Item Event
function eventFocus(eData)
    local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", "Fast Travel")
    menuItem = eData[2] + 1
    local strFocusTxT = ""
    if menuTab ~= 1 then
        if menuTab == 2 then
            if FTPoints[menuTab][menuItem].enabled == 0 then
                if menuItem == 1 then
                    strFocusTxT = "This is Disabled, Because no Waypoint exists. You need to set your Waypoint via the InGame Map."            
                elseif menuItem == 2 then
                    strFocusTxT = "You Do Not Currently Have a Personal Camp."
                elseif menuItem == 3 then
                    strFocusTxT = "You Do Not Currently Have a Posse/Posse Camp."
                elseif menuItem == 4 then
                    strFocusTxT = "You Do Not Currently Have a Moonshine Shack."
                else
                    strFocusTxT = "Dafugg did you get this?!?!"
                end                               
                local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", strFocusTxT)
            else
                if menuItem == 1 then
                    local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", FTPoints[menuTab][menuItem].locationDesc)
                else
                    local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", VarString(2, FTPoints[menuTab][menuItem].locationDesc))
                end
            end
        else
            strFocusTxT = "-= "..FTPoints[menuTab][menuItem].locationLabel.." =-~n~"..FTPoints[menuTab][menuItem].locationDesc..""
            local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", strFocusTxT)
        end
    else
        local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", VarString(2, FTPoints[menuTab][menuItem].locationDesc))
    end
    local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subFooter", "")
    local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "footer", FTPoints[menuTab][menuItem].footer)                  
    local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
end
-- Selected UI Item Event
function eventSelected(eData)
    menuItem = eData[2] + 1
    local itemContainterID = Citizen.InvokeNative("0x0C827D175F1292F3", DataBind[2], eData[2])
    local enabledVal = Citizen.InvokeNative("0xA8EDE09FE07BD77F", itemContainterID, "dynamic_list_item_enabled")
    if enabledVal == 1 then
        local header = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "header", "Fast Travel") 
        local subHeader = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subHeader", menuTabs[menuTab])
        local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", "Fast Travel")
        local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subFooter", "")
        local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "footer", "Select To Fast Travel")
        local clearlist = Citizen.InvokeNative("0xA1F15C1D03DF802D", DataBind[2]);
        ProcessTeleport(FTPoints[menuTab][menuItem], eData)
    else 
        FTClose()
    end
    local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
end
----------------------------------------------------------
----------------------------------------------------------
function FTOpen()
    local dbPresent = Citizen.InvokeNative("0x1E7130793AAAAB8D", DataBind[1])
    if not dbPresent then
        DataBind[1] = Citizen.InvokeNative("0x37BB86A751148A6A", "", "FastTravel", true);
    end
    WP = GetWaypointCoords()
    if (WP.x == 0 and WP.y == 0) then
        FTPoints[2][1].enabled = 0
    else
        FTPoints[2][1].enabled = 1
    end
    menuTab = 1;
    local header = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "header", "Fast Travel") 
    local subHeader = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subHeader", menuTabs[menuTab])
    local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subFooter", "")
    local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "footer", "Select To Fast Travel")
    local clearlist = Citizen.InvokeNative("0xA1F15C1D03DF802D", DataBind[2]);
    DataBind[2] = Citizen.InvokeNative("0xFE74FA57E0CE6824", DataBind[1], "locationList"); 
    CreateMenuList(menuTab)
    Citizen.InvokeNative("0xC8FC7F4E4CF4F581", UIAppHash)
    Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_IN_FAST_TRAVEL_MENU"))
end
--
function FTClose()
    local header = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "header", "Fast Travel") 
    local subHeader = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subHeader", menuTabs[menuTab])
    local description = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "description", "Fast Travel")
    local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "subFooter", "")
    local subFooter = Citizen.InvokeNative("0x617FCA1C5652BBAD", DataBind[1], "footer", "Select To Fast Travel")
    local clearlist = Citizen.InvokeNative("0xA1F15C1D03DF802D", DataBind[2]);
    Citizen.InvokeNative("0xAD7B70F7230C5A12")
    Citizen.InvokeNative("0x0AE9938D0541F2DA", DataBind[1])    
    foundFT = false
    ftInDist = false
end
--
function TriggerFTMenu()
    Citizen.CreateThread(function()
        if IsAnyUiappActive() then
            CloseAllUiappsImmediate()
            Wait(10)
        end
        if Citizen.InvokeNative("0xE555EC27D65EDE80", UIAppHash) then
            if not Citizen.InvokeNative("0x25B7A0206BDFAC76", UIAppHash) then
                FTOpen()
            else
                FTClose()
            end
        end
    end)
end
----------------------------------------------------------------------------------
-- This is the Native Fast Travel Posts... Suck it Jr Devs
----------------------------------------------------------------------------------
function LoadFTMarkers()
    Citizen.CreateThread(function()
        --Loads the IPLS for the Fast Travel Posts in all Native Areas ( s_fasttravelmarker01x - 148678632 ) 
        RequestImap(1858796535);
        RequestImap(945532872);
        RequestImap(-2043326480);
        RequestImap(992791293);
        RequestImap(-1815023148);
        RequestImap(731209239);
        RequestImap(1531008020);
        RequestImap(-952533419);
        RequestImap(582879672);
        RequestImap(1750312025);
        RequestImap(-759698431);
        RequestImap(59954835);
        RequestImap(-1461922204);
        RequestImap(2079207010);
        RequestImap(-1360840312);
        RequestImap(-816857367);
        FTCustom[1] = Citizen.InvokeNative("0x509D5878EB39E842", `s_fasttravelmarker01x`, -563.460, -3783.686, 237.598, false, true, true, true, true)
    end)
end
--
AddEventHandler('onClientMapStart', function()
   LoadFTMarkers()
end)
--
RegisterCommand('ftopen', function(source, args)
    TriggerFTMenu()
end, false)
--
RegisterCommand('ftclose', function(source, args)
    FTClose()
end, false)
----------------------------------------------------------------------------------
-- Prompt Related Code
----------------------------------------------------------------------------------
Citizen.CreateThread(function()
  promptLabel  = CreateVarString(10, 'LITERAL_STRING', "Fast Travel")
  promptString = CreateVarString(10, 'LITERAL_STRING', 'Open Menu')
  promptFT = PromptRegisterBegin()
  PromptSetControlAction(promptFT, 0xE8342FF2)
  PromptSetText(promptFT, promptString)
  PromptSetEnabled(promptFT, true)
  PromptSetVisible(promptFT, true)
  PromptSetHoldMode(promptFT, true)
  PromptSetGroup(promptFT, PromptG)
  PromptRegisterEnd(promptFT)
end)
--
Citizen.CreateThread(function()
    while true do
    Wait(0)
        if ftInDist == true then
            promptLabel  = CreateVarString(10, 'LITERAL_STRING', "Fast Travel")
            PromptSetActiveGroupThisFrame(PromptG, promptLabel)
            if PromptHasHoldModeCompleted(promptFT) then
                if IsPedOnMount(PlayerPedId()) then
                    print('You are mounted')
                elseif IsPedSittingInAnyVehicle(PlayerPedId()) then
                    print('You are in a avhicle')
                else
                    TriggerFTMenu()
                end
            end
            if Citizen.InvokeNative("0x25B7A0206BDFAC76", UIAppHash) then            
                DisableFirstPersonCamThisFrame()
                DisableAllControlActions(0)
            end      
        end
        --
        if Citizen.InvokeNative("0x67ED5A7963F2F722", UIAppHash) then
            local view = DataView.ArrayBuffer(256)
            local retval, eType = Citizen.InvokeNative("0x90237103F27F7937", UIAppHash, view:Buffer(), Citizen.ReturnResultAnyway())
            if retval then
                eData = {view:GetInt32(0),view:GetInt32(8),view:GetInt32(16),view:GetInt32(24)}
                if eData[3] == -997855324 then -- Exit/prompt Event
                    if eData[1] == GetHashKey("ITEM_SELECTED") then
                        FTClose()
                    else
                        print('** Unhandled Prompt Evt**', eData[2])
                        print(eData[1],eData[2],eData[3],eData[4])
                        local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
                    end               
                    local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)                    
                elseif eData[3] == -1517694752 then -- Nav Event
                    if eData[1] == GetHashKey("TAB_PAGE_INCREMENT") then
                        tabPageIncrement(eData)
                    elseif eData[1] == GetHashKey("TAB_PAGE_DECREMENT") then
                        tabPageDecrement(eData)
                    else
                        print('** Unhandled Nav Evt**', eData[2])
                        print(eData[1],eData[2],eData[3],eData[4])
                        local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash) 
                    end
                elseif eData[3] == 1833066477 then   -- Item List Event
                    if eData[1] == GetHashKey("ITEM_SELECTED") then
                        eventSelected(eData)
                    elseif eData[1] == GetHashKey("ITEM_FOCUSED") then
                        eventFocus(eData)
                    elseif eData[1] == GetHashKey("ITEM_UNFOCUSED") then
                        eventUnfocus(eData)
                    else
                        print('** Unhandled Item Evt**', eData[2])
                        print(eData[1],eData[2],eData[3],eData[4])
                        local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
                    end
                else
                    local popeventmsg = Citizen.InvokeNative("0x8E8A2369F48EC839", UIAppHash)
                end
            end
        end
    end
end)
----------------------------------------------------------------------------------
-- FT Marker Detection. 1sec Interval
----------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Wait(500)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        foundFT = false
        ftInDist = false
        ftDistCheck = 999999
        if ftCHeckZone then
            Citizen.InvokeNative(0x541B8576615C33DE, ftCHeckZone, coords.x, coords.y, coords.z)
            local itemsFound = Citizen.InvokeNative(0x886171A12F400B89, ftCHeckZone, itemSet, 3)
            if itemsFound then
                n = 0
                while n < itemsFound do
                    local itemHash = (GetIndexedItemInItemset(n, itemSet))                      
                    local modelhash = GetEntityModel(itemHash)
                    if modelhash == 148678632 then
                        foundFT = true
                        ftItemHash = itemHash                      
                        ftCoords = GetEntityCoords(itemHash)
                        cullPlantsNearFT(itemHash, ftCoords)
                        ftDistCheck = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, ftCoords.x, ftCoords.y, ftCoords.z, true)                        
                        if ftDistCheck <= 3 then
                            ftInDist = true
                        end
                    end
                    n = n + 1
                end
            end
            Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet)
        end
    end
end)
----------------------------------------------------------------------------------
-- Actual TP and Listener Code
---------------------------------------------------------------------------------- 
RegisterNetEvent("mwgft:clientsend")
AddEventHandler("mwgft:clientsend", function(vecData)

    local pPed = PlayerPedId()
	SetEntityInvincible(pPed, true);
	SetPedCanBeTargetted(pPed, false);
    DoScreenFadeOut(1000)
    while IsScreenFadingOut() do
        Wait(10)
    end
	SetEntityVisible(pPed, false);
	FreezeEntityPosition(pPed, true);
    --
    SetEntityCoords(pPed,vecData.x,vecData.y,vecData.z,0,0,0,0)
    --
    FreezeEntityPosition(pPed, false);   
    SetEntityVisible(pPed, true);
    Wait(2000)
    DoScreenFadeIn(1000)
    while IsScreenFadingIn() do
        Wait(10)
    end              
    SetPedCanBeTargetted(pPed, true);
    SetEntityInvincible(pPed, false);
    foundFT = false
    ftInDist = false
end)
--
RegisterNetEvent("mwgft:clientwp")
AddEventHandler("mwgft:clientwp", function(vecData)
    local pPed = PlayerPedId()
	SetEntityInvincible(pPed, true);
	SetPedCanBeTargetted(pPed, false);
    DoScreenFadeOut(1000)
    while IsScreenFadingOut() do
        Wait(10)
    end
	SetEntityVisible(pPed, false);
	FreezeEntityPosition(pPed, true);
    --   
    local height = 1
    for height = 1, 1000 do
        Citizen.InvokeNative(0x06843DA7060A026B, pPed, vecData.x,vecData.y, height + 0.0)
        local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(vecData.x,vecData.y, height + 0.0)
        if foundground then
            Citizen.InvokeNative(0x06843DA7060A026B, pPed, vecData.x,vecData.y, height + 0.0)
            break
        end
        Wait(25)
    end        
    --
    FreezeEntityPosition(pPed, false); 
    SetEntityVisible(pPed, true);
    Wait(2000)
    DoScreenFadeIn(1000)
    while IsScreenFadingIn() do
        Wait(10)
    end                
    SetPedCanBeTargetted(pPed, true);
    SetEntityInvincible(pPed, false);
    foundFT = false
    ftInDist = false
end)