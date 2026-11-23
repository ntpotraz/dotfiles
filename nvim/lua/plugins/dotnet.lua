-- C# / .NET tooling: seblyng/roslyn.nvim + GustavEikaas/easy-dotnet.nvim

-- Configure Roslyn LSP via Neovim 0.12's native vim.lsp.config API
vim.lsp.config("roslyn", {
  settings = {
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "fullSolution",
      dotnet_compiler_diagnostics_scope = "fullSolution",
    },
    ["csharp|inlay_hints"] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
      csharp_enable_inlay_hints_for_lambda_parameter_types = true,
      csharp_enable_inlay_hints_for_types = true,
      dotnet_enable_inlay_hints_for_indexer_parameters = true,
      dotnet_enable_inlay_hints_for_literal_parameters = true,
      dotnet_enable_inlay_hints_for_object_creation_parameters = true,
      dotnet_enable_inlay_hints_for_other_parameters = true,
      dotnet_enable_inlay_hints_for_parameters = true,
      dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
      dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
      dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
    ["csharp|completion"] = {
      dotnet_show_completion_items_from_unimported_namespaces = true,
      dotnet_show_name_completion_suggestions = true,
    },
    ["csharp|symbol_search"] = {
      dotnet_search_reference_assemblies = true,
    },
  },
})

-- Activate roslyn.nvim (handles .sln/.csproj discovery, source-generated files, etc.)
-- Install the server via Mason: :MasonInstall roslyn
require("roslyn").setup({})

-- Activate easy-dotnet.nvim (solution/project management, NuGet, build, run, test runner)
-- Disable easy-dotnet's built-in LSP so it does not conflict with seblyng/roslyn.nvim.
require("easy-dotnet").setup({
  picker = "snacks",
  lsp = {
    enabled = false,
  },
})
