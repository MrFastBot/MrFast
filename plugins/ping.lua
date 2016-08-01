local function run(msg, matches)
local text =  "Pong!"
return text
end
return {
  patterns = {
    '^([Pp]ing)$'
},
run = run
}
