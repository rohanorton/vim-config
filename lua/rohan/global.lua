-- Global print function for debugging and inspecting objects
function P(...)
    local args = { n = select("#", ...), ... }
    for i = 1, args.n do
        args[i] = vim.inspect(args[i])
    end
    print(unpack(args))
end
