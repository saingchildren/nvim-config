return {
  "zbirenbaum/copilot-cmp",
  config = function ()
    require("copilot_cmp").setup({
      suggestion = {
        auto_trigger = true,  -- 是否自動觸發建議
        keymap = {
          accept = "<C-Enter>",  -- 用於接受 Copilot 建議的快捷鍵
        },
      },
    })
  end
}
