
do

local function alirezapt(msg ,matches)
        if is_sudo(msg) then
local url = "https://storage.pwrtelegram.xyz/pwrtelegrambot/document/file_326.webp"
local file = download_to_file(url,'sudo.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        elseif is_owner(msg) then
        local url = "https://storage.pwrtelegram.xyz/pwrtelegrambot/document/file_327.webp"
local file = download_to_file(url,'owner.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        elseif is_momod(msg) then
        local url = "https://storage.pwrtelegram.xyz/pwrtelegrambot/document/file_328.webp"
local file = download_to_file(url,'momod.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        elseif not is_momod(msg) then
        local url = "https://storage.pwrtelegram.xyz/pwrtelegrambot/document/file_329.webp"
local file = download_to_file(url,'member.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        end
end

return { 
    patterns = { 
        "^[#!/]([Mm][Ee])$",
        "^([Mm][Ee])$",
    },
    run = run,
    
}

end
