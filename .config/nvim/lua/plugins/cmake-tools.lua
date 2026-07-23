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
                local target = cmake.get_launch_target()
                local build_dir = cmake.get_build_directory()

                if target and target ~= "" and build_dir then
                    return build_dir .. "/.install/bin/" .. target
                end

                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
            end,
            initCommands = {
                "settings set target.x86-disassembly-flavor intel"
            }
        }
    },
    keys = {
        { "<leader>cv", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "Select CMake preset (cmake-tools.nvim)" },
        { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake generate (cmake-tools.nvim)" },

        { "<leader>ct", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select CMake build target (cmake-tools.nvim)" },
        { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "Build CMake target (cmake-tools.nvim)" },

        { "<leader>cT", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Select CMake launch target (cmake-tools.nvim)" },
        { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "Launch CMake target (cmake-tools.nvim)" },

        { "<leader>ci", "<cmd>CMakeInstall<cr>", desc = "CMake install (cmake-tools.nvim)" },
        { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "Debug CMake target (cmake-tools.nvim)" },

        { "<leader>cc", "<cmd>CMakeClean<cr>", desc = "CMake clean (cmake-tools.nvim)" },

        { "<leader>cx", "<cmd>CMakeStopExecutor<cr>", desc = "Stop CMake executor (cmake-tools.nvim)" },
        { "<leader>cX", "<cmd>CMakeStopRunner<cr>", desc = "Stop CMake runner (cmake-tools.nvim)" }
    }
}
