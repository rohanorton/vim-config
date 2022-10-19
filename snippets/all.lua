local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local extras = require("luasnip.extras")

-- 1970-01-01T03:25:33Z
local iso_datetime = s("iso_datetime", { extras.partial(os.date, "!%Y-%m-%dT%TZ") })

-- 1970-01-01
local iso_date = s("iso_date", { extras.partial(os.date, "!%Y-%m-%d") })

-- Thu, 01 Jan 1970 03:25 GMT
local human_date = s("human_date", { extras.partial(os.date, "%a, %d %B %Y %H:%M %Z") })

-- 03:25
local time = s("time", { extras.partial(os.date, "%H:%M") })

-- Seconds since the epoch
local epoch = s(
  "epoch",
  f(function()
    return tostring(os.time())
  end)
)

local uuid = s(
  "uuid",
  f(function()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(template, "[xy]", function(c)
      local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
      return string.format("%x", v)
    end)
  end)
)

local snippets = {
  -- Dates
  iso_datetime,
  iso_date,
  human_date,
  time,
  epoch,

  -- Util
  uuid,
}

local autosnippets = {}

return snippets, autosnippets
