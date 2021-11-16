# Qb-Vaults
Storage Inventory Creator and Viewer


# ScreenShots
> Eye Target
![Target](https://cdn.discordapp.com/attachments/861207027636240384/909754077909491753/unknown.png)

> Qb-input
![Target](https://cdn.discordapp.com/attachments/861207027636240384/909754148537376828/unknown.png)

> Qb-inventory
![Target](https://cdn.discordapp.com/attachments/861207027636240384/909754249343275008/unknown.png)

## Dependencies
- [QB Core](https://github.com/qbcore-framework/qb-core)
- [Qb-target](https://github.com/BerkieBb/qb-target)
- [RE2-Team-Qb-input](https://github.com/Re2team/qb-input)


## Config
You need to Add lotions in config/sh_config like sample :
```
Config.location = {
    [1] = {name="Adams_Apple" , coords= vector3(-43.81, -1236.47, 29.34)},
    [2] = {name="North_Calafia_Way" , coords= vector3(1300.53, 4319.27, 38.17)}
}
```
And Add location target to boxZone Like sample :

```
["qb-vault1"] = {
        name = "Adams-Apple-Storage",
        coords = vector3(-44.43, -1235.34, 29.39),
        length = 1,
        width = 3,
        heading = 270.41,
        debugPoly = false,
        minZ = 27.36,
        maxZ = 30.87834,
        options = {
            {
              type = "client",
			  action = function(entity) 
				TriggerEvent('qb-vault:openStorage', 'Adams_Apple_Vaults')
			  end,
              icon = "fas fa-box-open",
              label = "Open Storage",
            },
			{
				type = "client",
				action = function(entity) 
				  TriggerEvent('qb-vault:createStorage', 'Adams_Apple_Vaults')
				end,
				icon = "fas fa-boxes",
				label = "Buy A Storage",
			  },
        },
        distance = 2
},
```

## WIP

```
- Make Vault Hackable
- Make Key For Your Friend
- Add Shop to buy Storage Capacity
```