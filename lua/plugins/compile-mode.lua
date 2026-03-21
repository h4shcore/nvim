return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
        default_command = {
          c = "make -k ",
          cpp = "make -k ",
          rust = "cargo r ",
        },
        input_word_completion = true,
        baleia_setup = true,
        bang_expansion = true,
        recompile_no_fail = true;
    }
  end
}
