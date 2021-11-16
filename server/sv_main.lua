local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-vault:server:checkThePassword')
AddEventHandler('qb-vault:server:checkThePassword', function(password,citizenid,storagename)
    local src = source
    local storage = exports.oxmysql:fetchSync('SELECT storagename FROM vaults WHERE citizenid = ? And storagename = ? And password = ?',{citizenid,storagename,password})
    TriggerClientEvent('qb-vault:openInventory', src, storage)
end)


RegisterServerEvent('qb-vault:server:createStorage')
AddEventHandler('qb-vault:server:createStorage', function(password,citizenid,storagename)
    local src = source
    local storage = exports.oxmysql:insert('INSERT INTO vaults (`citizenid`, `password`, `storagename`) VALUES (?, ?, ?)',{citizenid,password,storagename})
end)

RegisterServerEvent('qb-vault:server:checkStorageExist')
AddEventHandler('qb-vault:server:checkStorageExist', function(citizenid,storagename,location)
    local src = source

    local storage = exports.oxmysql:fetchSync('SELECT storagename FROM vaults WHERE citizenid = ? And storagename = ?',{citizenid,storagename})
    TriggerClientEvent('qb-vault:storagechecker', src, storage,location)
end)

RegisterServerEvent('qb-vault:server:removeMoney')
AddEventHandler('qb-vault:server:removeMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('cash', Config.StorageCreationAmount, "buy-storage")
end)
