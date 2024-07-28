--
function PaymentProcessing(pSrc, processedpayment)
    -- print('Payment processing', pSrc, processedpayment)
    local paymentMade = false
    ---------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------
    --Update CashPlayerHas to reflect actual player cash using your existing framework.
    local cashplayerhas = 5000
    local permsplayerhas = true
    ---------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------
    if processedpayment <= cashplayerhas then
        --------------------------
        --   Charge framework here.        
        --------------------------
        


        
        
        --------------------------
        --
        --------------------------
        paymentMade = true
    end
    return paymentMade
end
--
function PlayerHasPerms(pSrc)
    local hasperms = false
    ---------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------
    hasperms = IsPrincipalAceAllowed(pSrc, 'madhaus.basic')
    -- print('hasperms:', hasperms)
    ---------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------
    return hasperms
end
--
function TeleportProcessing(pSrc, tarVec)
    -- print('Teleport processing', pSrc, tarVec)
    --------------------------
    --   Teleport framework here.        
    --------------------------
    TriggerClientEvent("mwgft:clientsend", pSrc, tarVec.targetCoords)


    
    
    --------------------------
    --
    --------------------------
end
--
function WaypointProcessing(pSrc, tarVec)
    -- print('Waypoint processing', pSrc, tarVec)
    --------------------------
    --   Waypoint framework here.        
    --------------------------
    TriggerClientEvent("mwgft:clientwp", pSrc, tarVec.targetCoords)
    


    
    
    --------------------------
    --
    --------------------------
end
--
function FailureProcessing(pSrc, FailMsg)
    print('Failure processing', pSrc, FailMsg)
    --------------------------
    --   Failure framework here.        
    --------------------------
    


    
    
    --------------------------
    --
    --------------------------
end
--
RegisterNetEvent("mwgft:location")
AddEventHandler('mwgft:location', function(locData)
    local pSrc = source
    -- print('FastTravelRequest', pSrc, locData[2].locationLabel)
    if locData[2].enabled == 1 then
        local processedpayment = locData[3] / 100
        if PaymentProcessing(pSrc, processedpayment) == true then        
            TeleportProcessing(pSrc, locData[2])
        else
            FailureProcessing(pSrc,'Payment Failed')
        end
    else
        FailureProcessing(pSrc,'Location Unavailable')
    end
end)
--
RegisterNetEvent("mwgft:player")
AddEventHandler("mwgft:player", function(pData)
    local pSrc = source    
    -- print('FastTravelRequest', pSrc, pData[2].locationLabel)
    if pData[2].enabled == 1 then
        if PaymentProcessing(pSrc, pData[2].price) == true then        
            TeleportProcessing(pSrc, pData[2])
        else
            FailureProcessing(pSrc,'Payment Failed')
        end
    else
        FailureProcessing(pSrc,'Location Unavailable')
    end
end)
--
RegisterNetEvent("mwgft:vip")
AddEventHandler("mwgft:vip", function(vData)
    local pSrc = source
    -- print('FastTravelRequest', pSrc, vData[2].locationLabel)
    if vData[2].enabled == 1 then
        if PlayerHasPerms(pSrc) == true then
            if PaymentProcessing(pSrc, vData[2].price) == true then        
                TeleportProcessing(pSrc, vData[2])
            else
                FailureProcessing(pSrc,'Payment Failed')
            end
        else
            FailureProcessing(pSrc,'Permissions Missing')
        end
    else
        FailureProcessing(pSrc,'Location Unavailable')
    end
end)
--
RegisterNetEvent("mwgft:wp")
AddEventHandler('mwgft:wp', function(wData)
    local pSrc = source
    -- print('wp', wData)
    if PaymentProcessing(pSrc, wData[2].price) == true then
        WaypointProcessing(pSrc, wData[2])
    else
        FailureProcessing(pSrc,'Payment Failed')
    end
end)