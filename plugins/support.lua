local function run(msg, matches)
    if matches[1] == "support" then
 local user = "user#id"..msg.from.id
 local chat = "chat#id"..1065776650

 chat_add_user(chat, user, ok_cb, false)
    end
return {
  patterns = {
    "^[Ss]upport$",
  },
  run = run
}
