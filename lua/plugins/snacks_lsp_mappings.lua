return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    opts.mappings = opts.mappings or {}
    opts.mappings.n = opts.mappings.n or {}

    -- Always override gI
    opts.mappings.n.gI = {
      function()
        require("snacks.picker").lsp_implementations()
      end,
      desc = "Go to Implementations (snacks)",
    }

    if opts.mappings.n.gd then
      opts.mappings.n.gd[1] = function()
        require("snacks.picker").lsp_definitions()
      end
    end
    if opts.mappings.n.gy then
      opts.mappings.n.gy[1] = function()
        require("snacks.picker").lsp_type_definitions()
      end
    end
    if opts.mappings.n["<Leader>lG"] then
      opts.mappings.n["<Leader>lG"][1] = function()
        require("snacks.picker").lsp_workspace_symbols()
      end
    end
    if opts.mappings.n["<Leader>lR"] then
      opts.mappings.n["<Leader>lR"][1] = function()
        require("snacks.picker").lsp_references()
      end
    end
  end,
}
