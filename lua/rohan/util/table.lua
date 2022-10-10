--- keys
local keys = function(t)
  local l = {}
  for k, _ in pairs(t) do
    l[#l + 1] = k
  end
  return l
end

--- values
local values = function(t)
  local l = {}
  for _, v in pairs(t) do
    l[#l + 1] = v
  end
  return l
end

--- reduce
local reduce = function(fn, xs, acc)
  local n = #xs
  if n == 0 then
    return acc
  end
  local res = acc and fn(acc, xs[1]) or xs[1]
  for i = 2, n do
    res = fn(res, xs[i])
  end
  return res
end

--- for_each
local for_each = function(fn, xs)
  for i, x in ipairs(xs) do
    fn(x, i, xs)
  end
  return xs
end

--- map
local map = function(fn, xs)
  local res = {}
  for i, x in ipairs(xs) do
    res[i] = fn(x, i, xs)
  end
  return res
end

--- filter
local filter = function(fn, xs)
  local res = {}
  for _, x in ipairs(xs) do
    if fn(x) then
      table.insert(x)
    end
  end
  return res
end

--- intersection
local intersection = function(t1, t2)
  local res = {}
  for k, v in pairs(t1) do
    if t2[k] then
      res[k] = v
    end
  end
  return res
end

--- union
local union = function(t1, t2)
  local res = {}
  for k, v in pairs(t1) do
    res[k] = v
  end
  for k, v in pairs(t2) do
    res[k] = v
  end
  return res
end

--- combine
local combine = function(...)
  return reduce(union, { ... }, {})
end

return union(table, {
  keys = keys,
  values = values,
  combine = combine,
  union = union,
  intersection = intersection,
  reduce = reduce,
  map = map,
  filter = filter,
  for_each = for_each,
})
