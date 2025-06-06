local saturnvim_text = {
    [[                                                          ___                                                                ]],
    [[                                                       ,o88888                                                               ]],
    [[                                                    ,o8888888'                                                               ]],
    [[                              ,:o:o:oooo.        ,8O88Pd8888"                                                                ]],
    [[                          ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"                                                                  ]],
    [[                        ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"                                                                    ]],
    [[                       , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"                                                                      ]],
    [[                      , ..:.::o:ooOoOO8O888O8O,COCOO"                                                                        ]],
    [[                     , . ..:.::o:ooOoOOOO8OOOOCOCO"                                                                          ]],
    [[                      . ..:.::o:ooOoOoOO8O8OCCCC"o                                                                           ]],
    [[                         . ..:.::o:ooooOoCoCCC"o:o                                                                           ]],
    [[                         . ..:.::o:o:,cooooCo"oo:o:                                                                          ]],
    [[                      `   . . ..:.:cocoooo"'o:o:::'                                                                          ]],
    [[                      .`   . ..::ccccoc"'o:o:o:::'                                                                         ]],
    [[                     :.:.    ,c:cccc"':████,██████           █████      ██                                           ]],
    [[                   ..:.:"'`::::c:"'..:███████████             █████                                                   ]],
    [[                 ...:.'.:.::::"'    ..█████████ ███████████████████ ███   ███████████                         ]],
    [[                .. . ....:."' `   . .█████████  ███    █████████████ █████ ██████████████                         ]],
    [[              . . . ...."'          █████████ ██████████ █████████ █████ █████ ████ █████                         ]],
    [[              .. . ."'            ███████████ ███    ███ █████████ █████ █████ ████ █████                        ]],
    [[             .                   ██████  █████████████████████ ████ █████ █████ ████ ██████                       ]],
    [[                                                                                                                             ]],
}

local get_nvim_version = function()
    local version = vim.version()
    return string.format("%d.%d.%d", version.major, version.minor, version.patch)
end

require("dashboard").setup({
    theme = "hyper",
    config = {
        header = saturnvim_text,
        week_header = {
            enable = false, -- change header based on week day
        },
        shortcut = {
            -- 
            -- 
            -- 
            -- 
            { desc = SATURNVIM, group = "DashboardShortCut" },
            { desc = string.format("[%s %s]", NEOVIM_ICONS.filled, get_nvim_version()), group = "DashboardShortCut" },
        },
        packages = { enable = true },
        project = { enable = false },
        mru = { label = "", icon = "", icon_hl = "" },
        -- center = {},
        footer = {
            "",
            string.format("Made by %s", V_ICON),
        },
    },
})
-- -- General
-- DashboardHeader DashboardFooter
-- -- Hyper theme
-- DashboardProjectTitle DashboardProjectTitleIcon DashboardProjectIcon
-- DashboardMruTitle DashboardMruIcon DashboardFiles DashboardShortCutIcon
-- -- Doome theme
-- DashboardDesc DashboardKey DashboardIcon DashboardShortCut
--
-- local saturn_plus = {
--     [[                                                   ]],
--     [[                                              ___  ]],
--     [[                                           ,o88888 ]],
--     [[                                        ,o8888888' ]],
--     [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
--     [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
--     [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
--     [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
--     [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
--     [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
--     [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
--     [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
--     [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
--     [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
--     [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
--     [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
--     [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
--     [[     ...:.'.:.::::"'    . . . . .'                 ]],
--     [[    .. . ....:."' `   .  . . ''                    ]],
--     [[  . . . ...."'                                     ]],
--     [[  .. . ."'                                         ]],
--     [[ .                                                 ]],
--     [[                                                   ]],
-- }
-- [[                                                                     ]],
-- [[       ████ ██████           █████      ██                     ]],
-- [[      ███████████             █████                             ]],
-- [[      █████████ ███████████████████ ███   ███████████   ]],
-- [[     █████████  ███    █████████████ █████ ██████████████   ]],
-- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
-- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
-- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
-- [[                                                                       ]],
