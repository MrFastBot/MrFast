local function run(msg, matches)
local text =  "Pong!" or "Fuck off I'm onlline" or "I'm onlline ͡° ͜ʖ ͡°" or "Pingo kir khar onlline hastam" or "Khafe onlline hastam"
return text
end
return {
  patterns = {
    '^([Pp]ing)$',
    '^[/#!]([Pp]ing)$'
},
run = run
}
