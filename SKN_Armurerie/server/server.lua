ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterNetEvent('skn:Arme')
AddEventHandler('skn:Arme', function(Nom, Arme, Price)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local gun = Arme
    if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Armurerie', nil, "Vous venez d\'acheter ~y~1x~g~ "..Nom.." ~s~pour ~r~"..Price.."$ ~s~!", 'CHAR_ACTING_UP', 1)
        TriggerClientEvent('skn:giveArme', _src, gun)
    else 
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Armurerie', nil, "Vous n\'avez pas suffisament ~r~d\'argent~s~ !", 'CHAR_ACTING_UP', 1)
    end
end)