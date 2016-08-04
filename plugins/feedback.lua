do

function run(msg, matches)

local fuse = '➖➖➖➖➖➖➖➖➖➖\nYou have new message\n➖➖➖➖➖➖➖➖➖➖ \n🔵User ID: ['.. msg.from.id ..']\n🔵User Name: ['..msg.from.print_name..']\n🔵Username:[@ '..msg.from.username..']\n➖➖➖➖➖➖➖➖➖➖\n🔵User Message⤵️\n\n\n'.. matches[1]..'➖➖➖➖➖➖➖➖➖➖'
local fuses = '!printf user#id' .. msg.from.id


    local text = matches[1]
 bannedidone = string.find(msg.from.id, '123')
        bannedidtwo =string.find(msg.from.id, '465')       
   bannedidthree =string.find(msg.from.id, '678')  


        print(msg.to.id)

        if bannedidone or bannedidtwo or bannedidthree then                    --for banned people
 return'You are banned from send [feedbak]'
 else


                 local sends0 = send_msg('chat#107855523', fuse, ok_cb, false)

 return 'Your message sended!\nPlease waite for answer!'

     

end

end
return {
  description = "Feedback",

  usage = "feedback : پیام خودرا ارسال کنید",
  patterns = {
    "^[Ff]eedback (.*)$",
    "^[/!#]([Ff]eedback) (.*)$"
  },
  run = run
}

end
