local cache_file = vim.fn.stdpath("data") .. "/cmake_exe_paths.json"

local function load_cache()
    local file = io.open(cache_file, "r")
    if not file then return {} end
    local content = file:read("*a")
    file:close()
    local ok, data = pcall(vim.json.decode, content)
    return (ok and type(data) == "table") and data or {}
end

local function save_cache(cache)
    local file = io.open(cache_file, "w")
    if file then
        file:write(vim.json.encode(cache))
        file:close()
    end
end

return {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        cmake_regenerate_on_save = false,
        cmake_build_directory = "build/${variant:buildType}",
        cmake_compile_commands_options = { target = "build" },
        cmake_dap_configuration = {
            name = "CMake Debug (Install)",
            type = "codelldb",
            request = "launch",
            stopOnEntry = false,
            runInTerminal = true,
            program = function()
                local cmake = require'cmake-tools'
                local cwd = vim.fn.getcwd()
                local cache = load_cache()

                local current_path = cache[cwd]

                if not current_path then
                    local target = cmake.get_launch_target()
                    local build_dir = cmake.get_build_directory()

                    if target and target ~= "" and build_dir then
                        current_path = build_dir .. "/.install/" .. target
                    elseif build_dir then
                        current_path = build_dir .. "/" .. target
                    else
                        current_path = cwd .. "/build/"
                    end
                end

                local input = vim.fn.input("Path to executable: ", current_path, "file")

                if input and input ~= "" then
                    cache[cwd] = input
                    save_cache(cache)
                    return input
                end

                return current_path
            end,
            initCommands = { "settings set target.x86-disassembly-flavor intel" }
        }
    },
    keys = {
        { "<leader>cv", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "Select CMake preset (cmake-tools.nvim)" },
        { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake generate (cmake-tools.nvim)" },

        { "<leader>ct", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select CMake build target (cmake-tools.nvim)" },
        { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "Build CMake target (cmake-tools.nvim)" },
        { "<leader>ci", "<cmd>CMakeInstall<cr>", desc = "CMake install (cmake-tools.nvim)" },

        { "<leader>cT", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Select CMake launch target (cmake-tools.nvim)" },
        { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "Debug CMake target (cmake-tools.nvim)" },

        { "<leader>cc", "<cmd>CMakeClean<cr>", desc = "CMake clean (cmake-tools.nvim)" },

        { "<leader>cx", "<cmd>CMakeStopExecutor<cr>", desc = "Stop CMake executor (cmake-tools.nvim)" }
    }
}
