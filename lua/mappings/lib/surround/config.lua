return {
    ecmascript = {
        if_statement = {
            block_start = "if (  ) {",
            block_end = "}",
            finder_command = "k_f(la",
        },
        function_statement = {
            block_start = "function () {",
            block_end = "}",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for (  ) {",
            block_end = "}",
            finder_command = "k_f lla",
        },
    },
    lua = {
        if_statement = {
            block_start = "if  then",
            block_end = "end",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "local function ()",
            block_end = "end",
            finder_command = "k_2f a",
        },
        for_statement = {
            block_start = "for  in ipairs() do",
            block_end = "end",
            finder_command = "k_f a",
        },
    },
    rust = {
        if_statement = {
            block_start = "if  {",
            block_end = "}",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "fn () {",
            block_end = "}",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for  in  {",
            block_end = "}",
            finder_command = "k_f a",
        },
    },
    gdscript = {
        if_statement = {
            block_start = "if  :",
            block_end = "",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "func ():",
            block_end = "a",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for  :",
            block_end = "",
            finder_command = "k_f a",
        },
    },
    python = {
        if_statement = {
            block_start = "if  :",
            block_end = "",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "def ():",
            block_end = "",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for  :",
            block_end = "",
            finder_command = "k_f a",
        },
    },
}
