local function git_diff(type)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd[type] and gsd[type] > 0 then
        return tostring(gsd[type])
    end

    return ""
end

local M = {}
M.branch = {
    provider = "git_branch",
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80
    end,
    hl = {
         fg = "fg_dark",
        bg = "blue0",
    },
    left_sep = {
        str = " ",
        hl = {
             fg = "fg_dark",
            bg = "blue0",
        },
    },
    right_sep = {
        str = " ",
        hl = {
             fg = "fg_dark",
            bg = "blue0",
        },
    },
}

M.diff_add = {
    provider = function()
        return string.format("+%s ", git_diff("added"))
    end,
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80 and git_diff("added") ~= ""
    end,
    hl = {
         fg = "fg_dark",
        bg = "blue0",
    },
}

M.diff_remove = {
    provider = function()
        return string.format("-%s ", git_diff("removed"))
    end,
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80 and git_diff("removed") ~= ""
    end,
    hl = {
         fg = "fg_dark",
        bg = "blue0",
    },
}

M.diff_changed = {
    provider = function()
        return string.format("~%s ", git_diff("changed"))
    end,
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80 and git_diff("changed") ~= ""
    end,
    hl = {
         fg = "fg_dark",
        bg = "blue0",
    },
}
return M
