local QBCore = exports['qb-core']:GetCoreObject() -- We've ALWAYS got to grab our core object

AddEventHandler('qb-vault:openStorage', function(location)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    local storagename=location.."_"..citizenid
    local dialog = exports['qb-input']:ShowInput({
        header = "Storage Password",
        submitText = "Submit",
        inputs = {
            {
                text = "Password", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })

    if dialog ~= nil then
        TriggerServerEvent('qb-vault:server:checkThePassword', dialog.password,citizenid,storagename)
    end
end)

AddEventHandler('qb-vault:createStorage', function(location)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    local storagename=location.."_"..citizenid
    TriggerServerEvent('qb-vault:server:checkStorageExist',citizenid,storagename,location)
end)


RegisterNetEvent('qb-vault:openInventory')
AddEventHandler('qb-vault:openInventory', function(data)
    local storage=data
    if storage[1] ~= nil then
        Wait(100)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", storage[1].storagename,{
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", storage[1].storagename)
        QBCore.Functions.Notify("Vault is Opening...", "success")

    else
        QBCore.Functions.Notify("There is No Storage in Here", "error")
    end

    
end)



RegisterNetEvent('qb-vault:storagechecker')
AddEventHandler('qb-vault:storagechecker', function(data,location)
    local storage=data
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    local storagename=location.."_"..citizenid
    if storage[1] == nil then
        if player.money['cash'] >= tonumber(Config.StorageCreationAmount) then
            TriggerServerEvent('qb-vault:server:removeMoney')
            local cpdialog = exports['qb-input']:ShowInput({
                header = "Create Password",
                submitText = "Submit",
                inputs = {
                    {
                        text = "Password", -- text you want to be displayed as a place holder
                        name = "password", -- name of the input should be unique otherwise it might override
                        type = "password", -- type of the input
                        isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
                    }
                },
            })
            if cpdialog ~= nil then
                TriggerServerEvent('qb-vault:server:createStorage', cpdialog.password,citizenid,storagename)
                QBCore.Functions.Notify("Vault has been Created", "success")
            end
        else
            QBCore.Functions.Notify("You Dont Have any Money", "error")
        end
        
    else
            QBCore.Functions.Notify("You Can not Create Storage in here...", "error")
    end
end)
