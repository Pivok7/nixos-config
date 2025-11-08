local selected_or_hovered = ya.sync(function()
    local tab, paths = cx.active, {}
    for _, u in pairs(tab.selected) do
        paths[#paths + 1] = tostring(u)
    end
    if #paths == 0 and tab.current.hovered then
        paths[1] = tostring(tab.current.hovered.url)
    end
    return paths
end)

return {
    entry = function()
        ya.manager_emit("escape", { visual = true })

        local urls = selected_or_hovered()
        if #urls == 0 then
            return ya.notify { title = "Dragon", content = "No file selected", level = "warn", timeout = 5 }
        end

	if #urls == 1 then
	    local status, err = Command("dragon-drop"):arg("--and-exit"):arg(urls):spawn():wait()
	    if not status or not status.success then
		ya.notify {
		    title = "Dragon",
		    content = string.format("Dragon failed to start, exit code %s", status and status.code or err),
		    level = "error",
		    timeout = 5,
		}
	    end

	else
	    local status, err = Command("dragon-drop"):arg("--keep"):arg(urls):spawn():wait()
	    if not status or not status.success then
		ya.notify {
		    title = "Dragon",
		    content = string.format("Dragon failed to start, exit code %s", status and status.code or err),
		    level = "error",
		    timeout = 5,
		}
	    end
	end

    end,
}
