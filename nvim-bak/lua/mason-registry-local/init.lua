--- Local Mason registry override. Listed first in mason.nvim's `registries` so
--- these specs win over the upstream `github:mason-org/mason-registry`.
return {
  'mason-registry-local.roslyn-language-server',
}
