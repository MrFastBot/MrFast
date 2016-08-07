local function mathjs(exp)
  local url = 'http://api.mathjs.org/v1/'
  url = url..'?expr='..URL.escape(exp)
  local b,c = http.request(url)
  local text = nil
  if c == 200 then
 text = '➖➖➖➖➖➖➖➖➖➖\nAnswer⤵️\n➖➖➖➖➖➖➖➖➖➖\n'..b..'\n➖➖➖➖➖➖➖➖➖➖\n💢Ultron TG💢'
  
  elseif c == 400 then
    text = b
  else
    text = 'Unexpected error\n'
      ..'Is api.mathjs.org up?'
  end
  return text
end

local function run(msg, matches)
  return mathjs(matches[1])
end

return {
  description = "Calculate math expressions with mathjs API",
  usage = "calc [expression]: evaluates the expression and sends the result.",
  patterns = {
    "^[!#/][Cc]alc (.*)",
    "^[Cc]alc (.*)"
  },
  run = run
}
