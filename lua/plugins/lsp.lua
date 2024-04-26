local lspconfig = require("lspconfig")

local function get_typescript_server_path(root_dir)
  local global_ts = vim.fn.expand("$NVM_DIR/versions/node/$DEFAULT_NODE_VERSION/lib/node_modules/typescript/lib")
  local project_ts = ""
  local function check_dir(path)
    project_ts = lspconfig.util.path.join(path, ".yarn", "sdks", "typescript", "lib")
    if lspconfig.util.path.exists(project_ts) then
      return path
    end
  end
  if lspconfig.util.search_ancestors(root_dir, check_dir) then
    return project_ts
  else
    return global_ts
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = true },

      -- make sure mason installs the server
      servers = {
        yamlls = {
          settings = {
            yaml = { keyOrdering = false },
          },
        },
        graphql = {
          filetypes = { "graphql", "typescript", "typescriptreact" },
        },
        volar = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config, new_root_dir)
            local mason_registry = require("mason-registry")
            local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
              .. "/node_modules/@vue/language-server"
            lspconfig.tsserver.setup({
              init_options = {
                plugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = vue_language_server_path,
                    languages = { "vue" },
                  },
                },
              },
              filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })
            lspconfig.volar.setup({})
          end,
        },
      },
    },
    init = function()
      -- NOTE: https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gD", "<CMD>Glance definitions<CR>" }
      keys[#keys + 1] = { "gM", "<CMD>Glance implementations<CR>" }
      keys[#keys + 1] = { "gR", "<CMD>Glance references<CR>" }
      keys[#keys + 1] = { "gY", "<CMD>Glance type_definitions<CR>" }
    end,
  },
}
