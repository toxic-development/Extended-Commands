if SETTINGS.check_updates then

    log('[ext-commands]: Checking for updates, please wait...')

    Citizen.CreateThread( function()
      local updatePath = '/toxic-development/Extended-Commands'
      local resourceName = "Extended Commands ("..GetCurrentResourceName()..")"

      function checkVersion(err, responseText, headers)
        local curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

        if not responseText then
            log ('[ext-commands]: Update check failed, if this issues persists please contact Toxic Dev')

        elseif curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then

            log("###############################")
            log(""..resourceName.." is outdated.")
            log("Available version: " .. responseText)
            log("Current Version: " .. curVersion)
            log("Please update it from https://github.com"..updatePath.."")
            log("###############################")
            log("Or do /" .. GetCurrentResourceName() .. " autoupdate")
            log("(This will not overwrite your settings.lua file)")
            log("(This will not remove your command packs)")
            log("###############################")

        elseif tonumber(curVersion) > tonumber(responseText) then
            log("###############################")
            log(""..resourceName.." version mismatch.")
            log("Available version: " .. responseText)
            log("Current Version: " .. curVersion)
            log("Please update/downgrade from https://github.com"..updatePath.."")
            log("###############################")
            log("Or do /" .. GetCurrentResourceName() .. " autoupdate")
            log("(This will not overwrite your settings.lua file)")
            log("(This will not remove your command packs)")
            log("###############################")
        
        else
            log("###############################")
            log(""..resourceName.." is up to date.")
            log("Available version: " .. responseText)
            log("Current Version: " .. curVersion)
            log("Awesome, time to go have some fun")
            log("###############################")
            log("If you like the script give us a follow:")
            log("Github - https://github.com/toxic-development")
            log("Twitter - https://twitter.com/TheRealToxicDev")
            log("Website - https://toxicdev.me")
            log("###############################")

        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com" ..updatePath.. "/tree/master/commands/version", checkVersion, "GET")
   
   end)
end

RegisterCommand(GetCurrentResourceName(), function (_, args)

    if agrs[1] == 'autoupdate' then
        log("###############################")
        log("Extened Commands is updating, please wait...")
        log("###############################")

        local updatePath = '/NARC-FiveM/Resources/chat-commands'

        PerformHttpRequest("https://raw.githubusercontent.com" ..updatePath.. "/tree/master/autoupdate", function(err,responseText, headers)
           
            local function updateFile(fileName)
            local ok = false
            local _1 = false

            PerformHttpRequest("https://raw.githubusercontent.com" ..updatePath.. "/tree/master/commands/" ..fileName, function(err, responseText, headers)
            
                if err ~= 200 then

                    log('[ext-commands]: Failed to download file: ' .. fileName .. ": " .. err)

                else

                    if LoadResourceFile(GetCurrentResourceName(), fileName) ~= responseText then

                        log('[ext-commands]: Downloading file: ' .. fileName .. " please wait...")

                        SaveResourceFile(GetCurrentResourceName(), fileName, responseText, -1)

                    if not LoadResourceFile(GetCurrentResourceName(), fileName) then

                        log('[ext-commands]: Failed to save file: ' .. fileName .. ". Does the directory exist?")

                    else 

                        ok = true
                    end
                end
            end

            _1 = true
        
        end)

        while not _1 do Wait(0) end
        return ok
    end

    local files = 0

    for fileName in string.gmatch(responseText, "%S+") do

        if updateFile(fileName) then

            files = files + 1
        end
    end

    if files > 0 then

        log("###############################")
        log(""..resourceName.." update results")
        log("Updated " .. files .. " files")
    
    else

        log("No changes were made. You are up to date!")

    end

    log("###############################")

    if SETTINGS.use_esx then

        log('ESX changes detected. Please restart the server!')
    
    else

        log('Please run the `/refresh` then `/restart` console commands')

    end

        log("###############################")
    
    end, "GET")

    else

        log('[ext-commands]: Did you mean to do /' .. GetCurrentResourceName() .. " autoupdate")

    end
end, true)

