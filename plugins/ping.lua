local function run(msg, matches)
local text =  "pong!"
return text
end
return {
  patterns = {
    '^ping$'
},
run = run
}
