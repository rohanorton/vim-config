local stringx = require("pl.stringx")

local Convert = function(str)
  local self = {}
  local normalised_str = str
    -- replace underscores and hyphens with spaces
    :gsub("[_-]", " ")
    -- replace capitals
    :gsub("%u", function(c)
      return " " .. c:lower()
    end)

  local words = stringx.split(normalised_str, " ")

  self.to_camel_case = function()
    local res = ""
    for i, word in ipairs(words) do
      local subbed = i == 1 and word or word:gsub("^%l", string.upper)
      res = res .. subbed
    end
    return res
  end

  self.to_snake_case = function()
    return table.concat(words, "_")
  end

  self.to_kebab_case = function()
    return table.concat(words, "-")
  end

  self.to_pascal_case = function()
    local res = ""
    for _, word in ipairs(words) do
      res = res .. word:gsub("^%l", string.upper)
    end
    return res
  end

  return self
end

return Convert
