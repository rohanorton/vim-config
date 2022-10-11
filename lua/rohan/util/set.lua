local table = require("rohan.util.table")

-- If somebody could explain OOP in lua to me, I would be very grateful.
local Set

local methods = {
  _ctor = function(self, t)
    local inst = {}
    setmetatable(inst, self)
    self.__index = self

    -- Build.
    t = t or {}
    for _, v in ipairs(t) do
      inst:add(v)
    end

    return inst
  end,

  has = function(self, x)
    return self[x] == true
  end,

  add = function(self, x)
    self[x] = true
  end,

  remove = function(self, x)
    self[x] = nil
  end,

  union = function(s1, s2)
    return Set(table.keys(table.union(s1, s2)))
  end,

  intersection = function(s1, s2)
    return Set(table.keys(table.intersection(s1, s2)))
  end,

  difference = function(self, set)
    local res = Set()
    for k in pairs(self) do
      if not set:has(k) then
        res:add(k)
      end
    end
    return res
  end,

  is_subset = function(self, set)
    for k in pairs(self) do
      if not set:has(k) then
        return false
      end
    end
    return true
  end,

  values = function(self)
    return table.keys(self)
  end,

  size = function(self)
    return table.size(self)
  end,

  __eq = function(s1, s2)
    return s1:is_subset(s2) and s2:is_subset(s1)
  end,
}

Set = setmetatable({}, {
  __index = methods,
  __call = methods._ctor,
})

Set.__eq = methods.__eq
Set.__mul = methods.intersection
Set.__add = methods.union
Set.__lt = methods.is_subset
Set.__len = methods.size

return Set
