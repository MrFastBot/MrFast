do local function run(msg, matches)
 local data = load_data(_config.moderation.data)
 local settings = data[tostring(msg.to.id)]['settings']
 local group_link = data[tostring(msg.to.id)]['settings']['set_link']
 if not group_link then
  group_link = "Not Found!"
 end
 local message = 'You have new message\n➖➖➖➖➖➖➖➖➖➖\n'
 .."🔗Group Info:\n"
 .."🔴Name: "..msg.to.print_name.."\n"
 .."🔴ID:  "..msg.to.id.."\n"
 .."🔴Link:  "..group_link.."\n➖➖➖➖➖➖➖➖➖➖\n"
 .."🔗User Info:\n"
 .."⚪️Name:  "..msg.from.print_name.."\n"
 .."⚪️Username:  @"..msg.from.username.."\n"
 .."⚪️ID:  "..msg.from.id.."\n".."➖➖➖➖➖➖➖➖➖➖\nMessage: \n"..matches[1]
 local userid = 'user#id239607076'
 send_large_msg(userid, message)
 return "Thanks For FeedBack!\nPlease Waite For Answer."
end

return {
 description = "Feedback System",
 usagehtm = '<tr><td align="center">feedback متن</td><td align="right">ارسال نظر شما به سودو ادمین همراه مشخصات کامل شما و گروهی که در آن هستید</td></tr>',
 usage = {
  "feedback (pm) : ارسال نظر به سودو",
 },
 patterns = {
  "^[Ff]eedback (.*)$",
    "^[/#!]([Ff]eedback) (.*)$"
 },
 run = run,
}
end
