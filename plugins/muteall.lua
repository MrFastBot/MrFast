do
local function pre_process(msg)
 local hash = 'muteall:'..msg.to.id
  if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg)  then
   delete_msg(msg.id, ok_cb, false)
       end
    return msg
 end
 
local function run(msg, matches)
 if matches[1] == 'mute all' and is_momod(msg) then
       local hash = 'muteall:'..msg.to.id
       if not matches[2] then
              redis:set(hash, true)
             return "Mute all has been enabled"
 else
 local num = tonumber(matches[2]) * 60
 redis:setex(hash, num, true)
 return "Mute all has been enabled for |#"..matches[2].."#| minutes"
 end
 end
if matches[1] == 'unmute all' and is_momod(msg) then
               local hash = 'muteall:'..msg.to.id
        redis:del(hash)
          return "Mute all has been disabled"
  end
end
return {
   patterns = {
      '^[/!#](mute all)$',
      '^[/!#](unmute all)$',
   '^[/!#](mute all) (%d+)$',
 },
run = run,
  pre_process = pre_process
}
end
