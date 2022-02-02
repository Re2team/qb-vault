fx_version 'cerulean'
game 'gta5'

description 're2-vault'
version '1.0.0'
author 'QBCore Framework'
shared_scripts {
    'config/sh_config.lua'
}
client_scripts {
	'client/*.lua'
}

server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

lua54 'yes'