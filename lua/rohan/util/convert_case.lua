local stringx = require("pl.stringx")
local class = require("pl.class")

local function normalise(str)
  return str
    -- replace underscores and hyphens with spaces
    :gsub("[_-]", " ")
    -- replace capitals
    :gsub("%u", function(c)
      return " " .. c:lower()
    end)
end

local Convert = class()

function Convert:_init(str)
  self.words = stringx.split(normalise(str), " ")
end

function Convert:to_camel_case()
  local res = ""
  for i, word in ipairs(self.words) do
    local subbed = i == 1 and word or word:gsub("^%l", string.upper)
    res = res .. subbed
  end
  return res
end

function Convert:to_snake_case()
  return table.concat(self.words, "_")
end

function Convert:to_kebab_case()
  return table.concat(self.words, "-")
end

function Convert:to_pascal_case()
  local res = ""
  for _, word in ipairs(self.words) do
    res = res .. word:gsub("^%l", string.upper)
  end
  return res
end

return Convert
