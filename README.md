# Qb-Vaults
Storage Inventory Creator and Viewer


# ScreenShots
> Eye Target
![Target](https://cdn.discordapp.com/attachments/861207027636240384/909754077909491753/unknown.png)

> Create Storage
![Create Storage](https://cdn.discordapp.com/attachments/834702201569017859/938360498196455434/unknown.png)

> View Storage
![View Storage](https://cdn.discordapp.com/attachments/834702201569017859/938360742502084638/unknown.png)

> Storage Info
![View Storage](https://cdn.discordapp.com/attachments/834702201569017859/938361037227438110/unknown.png)

> Add Member
![Add Member](https://cdn.discordapp.com/attachments/834702201569017859/938361102016847872/unknown.png)

> Remove Member
![Add Member](https://cdn.discordapp.com/attachments/834702201569017859/938361120345968640/unknown.png)



> Qb-input

## Dependencies
- [QB Core](https://github.com/qbcore-framework/qb-core)
- [Qb-target](https://github.com/BerkieBb/qb-target)
- [Qb-input](https://github.com/qbcore-framework/qb-input)


## Config
You need to Add lotions in config/sh_config like sample :
```
Config.location = {
    [1] = {name="Adams_Apple" , coords= vector3(-43.81, -1236.47, 29.34),heading=270.41,minz=27.36 , maxz=30.87834,length=1,width=3,distance=2.5,debug=false},
}
```

if You Want to PLayer Who have job Only Create Storage For Players 

in sh_config.lua change 
```
Config.SaleAvailableForJob=true
Config.jobName="warehouseman"   --job you make it in shared file
```


And For job you Need to add lines Bellow tou Your Shared file or in shared Folder in jobs file

```
['warehouseman'] = {
		label = 'Warehouse Keeper',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Manager',
                isboss = true,
                payment = 100
            },
        },
	},
```

## How to Install
```
import vaults.sql
ensure qb-vault
change sh_config.lua to your Own Prefer
```
### You Dont need to add the target to qbtarget config . you need to remove them for this update.

## WIP

```
- Make Vault Hackable
```