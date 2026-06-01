local function FilingSystem()
    local paths = {
        folders = {
            "Arsenic",
            "Arsenic/Configs",
        },
        files = {
            ["Arsenic/Waypoints.json"]    = "{}",
            ["Arsenic/LoadedBefore.txt"]  = "",
            ["Arsenic/Settings.json"]     = "{}",
        },
    }

    for _, f in ipairs(paths.folders) do
        if not isfolder(f) then makefolder(f) end
    end

    for path, default in pairs(paths.files) do
        if not isfile(path) then writefile(path, default) end
    end
end

FilingSystem()
