--[[
    Note: 
    - When updating the resource (if ever needed) please keep a copy of your settings!
    - Only enable framework compatibility if your server is running on said framework!
]]

SETTINGS = {
    show_id = true, -- Makes the name also include Player ID.
    logging = true, -- Enables print output to the console (and chat).
    use_esx = false, -- Enable the ESX Compatibility for admin/advanced commands.
    use_vrp = false, -- Enable the vRP Compatibility for admin/advanced commands.
    use_framework_name = true, -- Replaces the players name with their framework name. 
    check_updates = true, -- Check for updates on resource startup (highly recommended)
    cb = function(source, message, command, args, raw)  -- Do things like send a log after command is executed
    end,
}