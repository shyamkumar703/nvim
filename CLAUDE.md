# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a Neovim configuration using Lazy.nvim as the plugin manager. The configuration follows a modular structure:

- **Entry point**: `init.lua` loads the main configuration module and sets up Go auto-formatting
- **Main module**: `lua/shyam/init.lua` orchestrates the configuration by loading settings, keymaps, and plugins
- **Core configuration**: 
  - `lua/shyam/set.lua` - Vim options and settings
  - `lua/shyam/remap.lua` - Key mappings and leader key configuration (space)
  - `lua/shyam/lazy_init.lua` - Lazy.nvim plugin manager setup
- **Plugin configurations**: `lua/shyam/lazy/` directory contains individual plugin configurations

## Plugin Management

Uses Lazy.nvim with plugin specifications in `lua/shyam/lazy/` directory. Each plugin has its own file that returns a plugin spec table. Key plugins include:

- **LSP**: Mason, nvim-lspconfig, nvim-cmp for language server support
- **Navigation**: Telescope for fuzzy finding, Harpoon for file bookmarking, Oil for file management
- **Development**: Treesitter for syntax highlighting, Fugitive for Git integration
- **Languages**: Specialized support for Go, with auto-formatting on save

## Key Conventions

- **Leader key**: Space (`<leader>`)
- **Plugin specs**: Each plugin configuration returns a table with dependencies, config functions, and keymaps
- **LSP setup**: Configured through Mason with specific handlers for different language servers
- **Auto-commands**: Used for Go formatting on save, yank highlighting, and whitespace cleanup

## Language Server Configuration

LSP servers are managed through Mason and include:
- `clangd` for C/C++ (with compile commands)
- `lua_ls` for Lua (configured for Neovim API)
- `rust_analyzer` for Rust
- `gopls` for Go
- `sourcekit` for Swift (custom path configuration)
- `zls` for Zig (custom binary path)

## Go Development

Special handling for Go development:
- Auto-formatting with `gofmt` on save via autocmd in `init.lua`
- Error handling snippet: `<leader>ee` inserts Go error handling boilerplate
- Go LSP server configured through Mason

## File Management

Uses Oil.nvim for file exploration instead of netrw, configured in `lua/shyam/lazy/oil.lua`.

## Development Workflow

When modifying this configuration:
1. Plugin configurations go in `lua/shyam/lazy/[plugin-name].lua`
2. Global settings in `lua/shyam/set.lua`
3. Keymaps in `lua/shyam/remap.lua` or within plugin configs
4. The configuration can be reloaded with `<leader><leader>` (sources current file)
5. Use `:Lazy` to manage plugins