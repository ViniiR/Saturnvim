{
    vim-api = {
        prefix = "va";
        body = "vim.api.$1";
    };
    vim-fn = {
        prefix = "vf";
        body = "vim.fn.$1";
    };
    vim-print-inspect = {
        prefix = "vip";
        body = "vim.print(vim.inspect($1))";
    };
    vim-print = {
        prefix = "vp";
        body = "vim.print($1)";
    };
}
