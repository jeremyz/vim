return {
  settings = {

    Lua = {
      diagnostics = {
        globals = { "vim" }, -- teach about vim global variable
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
