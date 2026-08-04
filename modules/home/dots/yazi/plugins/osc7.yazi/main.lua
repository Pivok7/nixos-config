--- @since 26.5.6

local function setup()
  ps.sub("cd", function()
    local cwd = tostring(cx.active.current.cwd)
    io.write("\x1b]7;file://localhost" .. cwd .. "\x07")
    io.flush()
  end)
end

return { setup = setup }
