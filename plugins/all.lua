do
local function get_msgs_user_chat(user_id, chat_id)
  local user_info = {}
  local uhash = 'ℹ️Chat ID➡️'..chat_id..'\n©Chat Users:\n'
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info.msgs = tonumber(redis:get(um_hash) or 0)
  user_info.name = user_print_name(user)..' ['..user_id..']'
  return user_info
end
local function chat_stats(chat_id)
  local hash = 'ℹ️Chat ID➡️'..chat_id..'\n©Chat Users:\n'
  local users = redis:smembers(hash)
  local users_info = {}
  for i = 1, #users do
    local user_id = users[i]
    local user_info = get_msgs_user_chat(user_id, chat_id)
    table.insert(users_info, user_info)
  end
  table.sort(users_info, function(a, b) 
      if a.msgs and b.msgs then
        return a.msgs > b.msgs
      end
    end)
  local text = 'ℹ️Chat stats⤵️\n\n'
  for k,user in pairs(users_info) do
    text = text..user.name..' = '..user.msgs..'\n'
  end
  return text
end

local function get_group_type(target)
  local data = load_data(_config.moderation.data)
  local group_type = data[tostring(target)]['group_type']
    if not group_type or group_type == nil then
       return 'No Group Type Available❌\nUse /type In The SuperGroup To Set Type💢'
    end
    return group_type
end

local function get_description(target)
  local data = load_data(_config.moderation.data)
  local data_cat = 'description'
  if not data[tostring(target)][data_cat] then
    return 'No Description Available❌'
  end
  local about = data[tostring(target)][data_cat]
  return about
end

local function get_rules(target)
  local data = load_data(_config.moderation.data)
  local data_cat = 'rules'
  if not data[tostring(target)][data_cat] then
    return 'No Rules Available❌'
  end
  local rules = data[tostring(target)][data_cat]
  return rules
end


local function modlist(target)
  local data = load_data(_config.moderation.data)
  local groups = 'groups'
  if not data[tostring(groups)] or not data[tostring(groups)][tostring(target)] then
    return 'Group is not added or is Realm.'
  end
  if next(data[tostring(target)]['moderators']) == nil then
    return 'No Moderator In This Group❌'
  end
  local i = 1
  local message = '\nList of moderators⤵️\n'
  for k,v in pairs(data[tostring(target)]['moderators']) do
    message = message ..i..' - @'..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

local function get_link(target)
  local data = load_data(_config.moderation.data)
  local group_link = data[tostring(target)]['settings']['set_link']
  if not group_link or group_link == nil then 
    return "No link"
  end
  return "SuperGroup/Group invition linkℹ️\n➖➖➖➖➖➖➖➖➖➖\n"..group_link
end

local function all(msg,target,receiver)
  local data = load_data(_config.moderation.data)
  if not data[tostring(target)] then
    return
  end
  local text = "All The Things I Know About This Group\n\n"
  local group_type = get_group_type(target)
  text = text.."'❕SuperGroup Type➡️"..group_type
  if group_type == "Group" or group_type == "Realm" then
	local settings = show_group_settingsmod(msg,target)
	text = text.."\n\n"..settings
  elseif group_type == "SuperGroup" then
	local settings = show_supergroup_settingsmod(msg,target)
	text = text..'\n\n'..settings
  end
  local rules = get_rules(target)
  text = text.."\n\nSuperGroup Rules⤵️\n"..rules
  local description = get_description(target)
  text = text.."\n\nSuperGroup About⤵️\n"..description
  local modlist = modlist(target)
  text = text.."\n\nSuperGroup Moderator⤵️\n"..modlist
  local link = get_link(target)
  text = text.."\n\nSuperGroup ivition Link⤵️\n"..link
  local stats = chat_stats(target)
  text = text.."\nChat Stats⤵️\n"..stats
  local mutes_list = mutes_list(target)
  text = text.."\nSuperGroup Mute List⤵️\n"..mutes_list
  local muted_user_list = muted_user_list(target)
  text = text.."\nSuperGroup Silent List⤵️\n"..muted_user_list
  local ban_list = ban_list(target)
  text = text.."\nBan list⤵️\n"..ban_list
  local file = io.open("./groups/all/"..target.."all.txt", "w")
  file:write(text)
  file:flush()
  file:close()
  send_document(receiver,"./groups/all/"..target.."all.txt", ok_cb, false)
  return
end

local function run(msg, matches)
  if matches[1]:lower() == "all" and matches[2]:lower() and is_owner2(msg.from.id, matches[2]) then
    local receiver = get_receiver(msg)
    local target = matches[2]
    return all(msg,target,receiver)
  end
  if not is_owner(msg) then
    return
  end
  if matches[1]:lower() == "all" and not matches[2] then
    local receiver = get_receiver(msg)
    return all(msg,msg.to.id,receiver)
  end
end


return {
  patterns = {
  "^[#!/](.*)$",
  "^[#!/](.*) (%d+)$"
  },
  run = run
}
end
