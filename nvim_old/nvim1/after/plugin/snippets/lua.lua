local ls = require "luasnip"

ls.add_snippets(nil, {
    all = {
        -- Available in any filetype
        ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
    },

    lua = {
        --Lua specific snippets go here
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
    },
})
