-- Based on https://github.com/kovidgoyal/kitty/issues/45#issuecomment-568920629
hs.hotkey.bind({"ctrl"}, "space", function()
    local app = hs.application.get("kitty")
    if app then
        app:selectMenuItem({"Shell", "New OS Window"})
    else
        hs.application.launchOrFocus("kitty")
    end
end)
