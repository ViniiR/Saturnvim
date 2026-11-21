return {
    git = {
        commits = {
            format = {
                documentation = function(trigger_char, commit, item)
                    local format = require("cmp_git.format")
                    return format.git.commits.documentation(trigger_char, {
                        title = commit.title,
                        author_name = commit.author_name,
                        sha = commit.sha,
                        author_mail = "---", -- Hide email
                        description = commit.description,
                        diff = commit.diff,
                        body = commit.body,
                    }, item)
                end,
            },
        },
    },
    trigger_actions = {
        {
            pattern = [[^[[:alnum:]-]\+]],
            actions = { "git_autosquash_prefixes" },
        },
        {
            pattern = [[^\%(fixup\|squash\|amend\)!\s*\zs.*]],
            keyword_pattern = [[^\%(fixup\|squash\|amend\)\%(\zs!\S*\|!\s*\zs.*\)]],
            actions = { "git_autosquash" },
        },
        {
            pattern = [[^[[:alnum:]-]\+]],
            actions = { "git_trailer_keys" },
        },
        {
            pattern = [[^[[:alnum:]-]\+:\s*\zs\%([^[:space:]<>:#@!][^<>:#@!]*\%(<[^>]*\)\?\)\?]],
            keyword_pattern = [[^[[:alnum:]-]\+\zs:\S*\|^[[:alnum:]-]\+:\s*\zs\%([^[:space:]<>:#@!][^<>:#@!]*\%(<[^>]*\)\?\)\?]],
            actions = { "git_trailer_identities", "git_trailer_values" },
        },
        -- Was previously ":"
        -- but it still triggers at ":" since the commit messages contain that character
        {
            trigger_character = "*",
            actions = { "git_commits" },
        },
        {
            trigger_character = "#",
            actions = {
                "gitlab_issues",
                "github_issues_and_change_requests",
                "gitea_issues_and_change_requests",
                "forgejo_issues_and_change_requests",
            },
        },
        {
            trigger_character = "@",
            actions = { "gitlab_mentions", "github_mentions", "gitea_mentions", "forgejo_mentions" },
        },
        {
            trigger_character = "!",
            actions = { "gitlab_change_requests", "gitea_change_requests", "forgejo_change_requests" },
        },
    },
}
