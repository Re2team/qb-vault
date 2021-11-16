fx_version 'cerulean'
game 'gta5'

description 'qb-template'
version '1.0.0'
author 'QBCore Framework'

shared_scripts {
    'config/sh_config.lua'
}
lua54 'yes'

escrow_ignore {
    'config/sh_config.lua',  -- Only ignore one file
  }
client_scripts {
	'client/*.lua'
}

server_scripts  {
    'server/*.lua'
}