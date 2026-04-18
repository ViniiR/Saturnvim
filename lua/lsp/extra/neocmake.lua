---@type vim.lsp.Config
return {
    cmd = { "neocmakelsp", "stdio" },
    filetypes = { "cmake" },
    root_markers = { ".neocmake.toml", ".git", "build", "cmake" },
    single_file_support = true, -- suggested
    init_options = {
        format = {
            enable = true,
        },
        lint = {
            enable = true,
        },
        scan_cmake_in_package = true, -- default is true
    },
}
