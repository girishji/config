local status_ok, dictionary = pcall(require, "cmp_dictionary")
if not status_ok then
  print("giri: load failed for cmp_dict")
  return
end

-- See the doc directory in github

dictionary.setup {

  dic = {
    -- ["*"] = { "/Users/gp/.local/share/nvim/site/pack/packer/start/google-10000-english/google-10000-english-usa-no-swears.txt" },
    ["*"] = { "/usr/share/dict/words" },
    -- ["lua"] = "path/to/lua.dic",
    -- ["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
    -- filename = {
    --   ["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
    -- },
    -- filepath = {
    --   ["%.tmux.*%.conf"] = "path/to/tmux.dic"
    -- },
    -- spelllang = {
    -- en = "path/to/english.dic",
    -- },
  },
  -- The following are default values.
  exact = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  async = false,
  capacity = 5,
  debug = true,

}
