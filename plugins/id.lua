do
function run(msg, matches)
  return "Group Name: "..msg.to.title.."\nGrop ID: "..msg.from.id.."\n\nFull Name: "..(msg.from.first_name or '').."\nFirst Name: "..(msg.from.first_name or '').."\nLast Name: "..(msg.from.last_name or '').."\n\nID: "..msg.from.id.."\nUsename: Telegram.me/"..(msg.from.username or '').."\nPhone Number: +"..(msg.from.phone or '-----')
end
return {
  description = "", 
  usage = "",
  patterns = {
    "^[!/#]id$",
    "^[(Ii)]d$",
  },
  run = run
}
end
