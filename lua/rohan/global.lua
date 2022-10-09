-- Global print function for debugging and inspecting objects
function P(...)
  local args = { n = select("#", ...), ... }
  for i = 1, args.n do
    args[i] = vim.inspect(args[i])
  end
  print(unpack(args))
end

local noop = function() end

function SAFE_REQUIRE(mods, callback)
  -- If mods is string, wrap in table.
  mods = type(mods) == "table" and mods or { mods }
  callback = callback or noop

  local loaded = {}
  for _, modname in ipairs(mods) do
    local ok, mod = pcall(require, modname)
    if not ok then
      print("Unable to load module: " .. modname)
      return
    end
    table.insert(loaded, mod)
  end
  callback(unpack(loaded))
end

function RELOAD(...)
  return require("plenary.reload").reload_module(...)
end

function R(name)
  RELOAD(name)
  return require(name)
end
