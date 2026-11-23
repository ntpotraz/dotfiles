--- Pinned declaration of roslyn-language-server.
--- Mason treats the installed version as current for as long as this matches
--- the `source.id` version below (the :Mason UI won't offer an update).
--- To go back to unpinned: delete this file and remove the entry from
--- lua/mason-registry-local/init.lua, then run `:MasonInstall roslyn-language-server`.
return {
  name = 'roslyn-language-server',
  description = 'Roslyn-based C# language server providing rich IntelliSense, refactoring, and diagnostics.\nRequires dotnet to be installed.\n',
  homepage = 'https://github.com/dotnet/roslyn',
  licenses = { 'MIT' },
  languages = { 'C#' },
  categories = { 'LSP' },
  source = { id = 'pkg:nuget/roslyn-language-server@5.8.0-1.26266.2' },
  bin = { ['roslyn-language-server'] = 'nuget:roslyn-language-server' },
  neovim = { lspconfig = 'roslyn_ls' },
}
