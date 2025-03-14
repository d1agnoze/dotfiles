local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta
local func = ls.function_node
local date = function()
  return { os.date "%Y-%m-%d" }
end
vim.cmd [[
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
  smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
  imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
  smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]
ls.add_snippets("all", { s("tern", { i(1, "cond"), t " ? ", i(2, "then"), t " : ", i(3, "else") }) })
ls.add_snippets("all", { s("fai", { t "(", i(1, ""), t " )", t " => ", t "{ ", i(2, ""), t " }" }) })

local sfc = s(
  { trig = "sfc", dscr = "Stateless functional component" },
  fmta(
    [[ 
                    const <> = ( <> ) =>> {
                      return <<div>><> Works just fine!<</div>>;
                    }
                    export default <>
                  ]],
    {
      i(1),
      i(2),
      rep(1),
      rep(1),
    }
  )
)
local ffc = s(
  { trig = "ffc", dscr = "Stateful fucntional component" },
  fmta(
    [[
                export default <> function <> (<>){
                  return <<div>>Hello from <>!<</div>>;
                }
              ]],
    { i(1, "async"), i(2, "name"), i(3, "args"), rep(2) }
  )
)
local tryc = s(
  { trig = "tryc", dscr = "try catch" },
  fmta(
    [[
    try {
      <>
    }catch (err: any){}
              ]],
    { i(1, "") }
  )
)

local jsd = s({ trig = "jd", dscr = "Jsdoc" }, fmta(
  [[
  /**
    * @<>
    **/]]
  , { i(1) }))

local clog = s({ trig = "log", dscr = "Console log" }, fmta([[console.log(<>)]], { i(1, "var") }))
local prdate = s({ trig = "date", namr = "Date", dscr = "Date in the form of YYYY-MM-DD" }, { func(date, {}) })

ls.add_snippets(nil, {
  all = { prdate },
  typescript = { sfc, ffc, clog, tryc, jsd },
  javascript = { sfc, ffc, clog, tryc, jsd },
  typescriptreact = { sfc, ffc, clog, tryc, jsd },
  javascriptreact = { sfc, ffc, clog, tryc, jsd },
})
