fx_version 'cerulean'
game 'gta5'

name 'Extended Commands'
version '0.0.1'

author 'Toxic Dev'
description 'Configurable and Extendable chat command system!'
repository 'https://github.com/NARC-FiveM/Resources/chat-commands'

shared_script 'settings.lua'

client_scripts {
    'system/client/proximity.lua',
    'modules/cl_*.lua'
}

server_scripts {
    'modules/sv_*.lua',
    'modules/sh_*.lua',
    '@vrp/lib/utils.lua',
    'system/server/pre.lua',
    '@mysql-async/lib/MySQL.lua',
    'system/server/fxcheck_*.lua',
    'system/server/commands.lua',
    'system/versioncheck.lua',
    "packages/*.lua"
}