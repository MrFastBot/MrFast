local function Mosy(msg, matches)
if matches[1]:lower() == 'del' then 
      if not is_sudo(msg) then
        return "Only By David"
      end
if matches[2]:lower() == 'gban' then 
local hash = 'gbanned'
    --[[    local data_cat = 'gbanlist'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)]]
send_large_msg(get_receiver(msg), "Global Baned Users Has been Cleaned!")
redis:del(hash)
     end
if matches[2]:lower() == 'ban' and is_owner(msg) then
local chat_id = msg.to.id
local hash = 'banned:'..chat_id
      --[[  local data_cat = 'banlist'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)]]
send_large_msg(get_receiver(msg), "Baned Users Has been Cleaned!")
redis:del(hash)
end
end
 end

return {
  patterns = {
  "[!/#]([Dd][Ee][Ll]) (.*)$",
  },
  run = Mosy
}
