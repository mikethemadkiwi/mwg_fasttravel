--[[ FX Information ]]--
fx_version   'cerulean'
lua54        'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game         'rdr3'
--[[ Resource Information ]]--
name 'mwg_fasttravel'
author 'mikethemadkiwi'
description 'Fast Travel For RedM Using Native RDR3 Interfaces'
version '0.0.1'
--[[ Dependancies ]]--
dependencies {
    '/onesync',
}
--[[ Client Scripts ]]--
client_scripts {
    'dataview.lua',
    'ft.lua'
}
--[[ Server Scripts ]]--
server_scripts {
    'ft_server.lua'
}