do
    local function run(msg, matches)
    local support = '1095749156'
    local data = load_data(_config.moderation.data)
    local name_log = user_print_name(msg.from)
        if matches[1] == 'support' or 'tosupport' then
        local group_link = data[tostring(support)]['settings']['set_link']
    return "➖➖➖➖➖➖➖➖➖➖\n💢UltronTG💢 Support Group Link⤵\n➖➖➖➖➖➖➖➖➖➖\n️"..group_link.."➖➖➖➖➖➖➖➖➖➖\nClick Here For Join To Support Group\n➖➖➖➖➖➖➖➖➖➖"
    end
end
return {
    patterns = {
    "^[#!/]([Ss]upport)$",
    "^[#!/]([Tt]osupport)$",
    "^([Ss]upport)$",
    "^([Tt]osupport)$",
     },
    run = run
}
end
