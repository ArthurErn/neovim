# Neovim Flutter Setup for Windows 11

Um guia completo para configurar o Neovim no Windows 11 com uma experiência similar ao VS Code, otimizado para desenvolvimento Flutter.

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Git** - Para controle de versão
- **Flutter SDK** - Adicionado ao PATH
- **Dart SDK** - (incluído com Flutter)
- **GitHub CLI** - Para autenticação
- **Node.js** - Para Copilot (opcional)
- **Ripgrep** - Para busca no Telescope

## 🚀 Instalação

### 1. Instalando o Neovim 0.11

**Opção 1: Download manual**
1. Baixe o [Neovim 0.11 para Windows](https://github.com/neovim/neovim/releases)
2. Extraia a pasta e adicione `Neovim\bin` ao PATH do Windows

**Opção 2: Via gerenciadores de pacote**

```powershell
# Chocolatey
choco install neovim -y

# Winget
winget install Neovim.Neovim --accept-package-agreements --accept-source-agreements
```

**Verificar instalação:**
```bash
nvim --version
```

### 2. Instalando dependências

```powershell
# GitHub CLI
choco install gh
# ou
winget install GitHub.cli

# Autenticar GitHub
gh auth login

# Node.js (para Copilot)
choco install nodejs-lts -y
# ou
winget install OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements

# Ripgrep (para Telescope)
choco install ripgrep
# ou
winget install BurntSushi.ripgrep
```

## ⚙️ Configuração

### 1. Estrutura de diretórios

Crie a estrutura de pastas do Neovim:

```powershell
mkdir "$env:LOCALAPPDATA\nvim" -ErrorAction SilentlyContinue
cd "$env:LOCALAPPDATA\nvim"
mkdir lua -ErrorAction SilentlyContinue
if (-not (Test-Path init.lua)) { New-Item init.lua }
```

### 2. Configurando Lazy.nvim

O Lazy.nvim é o gerenciador de plugins recomendado. Adicione sua configuração no arquivo `init.lua` criado na etapa anterior.

## 🎯 Principais Atalhos

### Edição Básica
| Modo | Tecla | Ação |
|------|-------|------|
| Normal/Insert | `Ctrl+C` | Copiar para clipboard |
| Normal/Insert | `Ctrl+V` | Colar do clipboard |
| Normal/Insert | `Ctrl+S` | Salvar arquivo |
| Normal | `Ctrl+W` | Fechar buffer |
| Normal | `Ctrl+A` | Selecionar tudo |
| Normal/Insert | `Ctrl+Z` | Desfazer |
| Normal/Insert | `Ctrl+Y` | Refazer |

### Navegação
| Modo | Tecla | Ação |
|------|-------|------|
| Normal | `Space+E` | Toggle NvimTree |
| Normal | `Ctrl+P` | Telescope find_files |
| Normal | `Ctrl+Alt+F` | Telescope live_grep |
| Normal | `Ctrl+F` | Busca no buffer |
| Normal | `Ctrl+T` | Nova aba |
| Normal | `Alt+L` | Próxima aba |
| Normal | `Ctrl+X` | Aba anterior |

### Duplicação e Movimento
| Modo | Tecla | Ação |
|------|-------|------|
| Normal | `Ctrl+D` | Duplicar linha abaixo |
| Normal | `Shift+Ctrl+D` | Duplicar linha acima |
| Visual | `Shift+Seta` | Seleção visual |
| Visual | `Tab` | Indentar |
| Visual | `Shift+Tab` | Desindentar |

### LSP (Language Server Protocol)
| Modo | Tecla | Ação |
|------|-------|------|
| Normal/Insert | `Ctrl+K` | Hover documentação |
| Normal | `K` | Hover LSP |
| Normal | `Alt+D` | Ir para definição (nova aba) |
| Normal | `Space+CA` | Code actions |
| Normal | `Space+RN` | Renomear símbolo |
| Insert | `Ctrl+Space` | Autocompletar |
| Normal/Visual | `Alt+.` | Code action |

### Flutter
| Modo | Tecla | Ação |
|------|-------|------|
| Normal | `Space+FR` | Flutter Run |
| Normal | `Space+FQ` | Flutter Quit |
| Normal | `Space+F+Shift+R` | Flutter Restart |
| Normal | `Space+FD` | Flutter Devices |
| Normal | `Space+FO` | Flutter Outline Toggle |
| Normal | `Space+FI` | Sugerir imports |
| Normal/Insert/Visual | `Alt+F` | Formatar código |

### Git (GitSigns)
| Modo | Tecla | Ação |
|------|-------|------|
| Normal | `]C` | Próximo hunk |
| Normal | `[C` | Hunk anterior |
| Normal | `Space+HS` | Stagear hunk |
| Normal | `Space+HR` | Resetar hunk |
| Normal | `Space+HP` | Preview hunk |
| Normal | `Space+HB` | Blame linha |
| Normal | `Space+GS` | Git status |

### Terminal
| Modo | Tecla | Ação |
|------|-------|------|
| Normal | `Alt+T` | Terminal horizontal |
| Normal | `Alt+E` | Sair do Neovim |

## 🔌 Plugins Opcionais

### ToggleTerm

Gerenciador de múltiplos terminais com janelas flutuantes.

```lua
{
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      direction = 'float',
      close_on_exit = true,
    })
  end,
}
```

**Atalhos adicionais:**
```lua
vim.api.nvim_set_keymap('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })
```

### GitHub Copilot

Assistente de código com IA.

```lua
{
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = true },
    })
  end,
}
```

**Integração com nvim-cmp:**
```lua
{
  "zbirenbaum/copilot-cmp",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    require("copilot_cmp").setup()
  end,
}
```

## 🧪 Testando o Ambiente

1. Abra um arquivo `.dart`
2. Verifique se o LSP está ativo: `:LspInfo`
3. Teste os atalhos:
   - `Ctrl+P` para abrir arquivos
   - `Ctrl+Alt+F` para buscar texto
   - `Space+FR` para executar Flutter

## 🛠️ Bibliotecas Externas

### Mason (Snippets)

```bash
# Após instalar Flutter
flutter pub global activate mason_cli

# Adicionar ao PATH (temporário)
$env:Path += ";$env:USERPROFILE\.pub-cache\bin"

# Tornar permanente (opcional)
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$env:USERPROFILE\.pub-cache\bin", [EnvironmentVariableTarget]::User)
```

## 🔧 Soluções de Problemas

### Erros do GCC

```powershell
choco install mingw -y
choco install visualstudio2019buildtools -y
choco install visualstudio2022buildtools -y
```

### Configuração de Temas

❌ **Formato depreciado:**
```lua
require("github-theme").setup({
  theme_style = "dark", -- Esta linha está obsoleta
})
```

✅ **Formato correto:**
```lua
require("github-theme").setup({})
vim.cmd("colorscheme github_dark") -- ou github_light, github_dim, etc.
```

## 📁 Estrutura Final

```
~/.config/nvim/  (ou %LOCALAPPDATA%\nvim\ no Windows)
├── init.lua
├── lua/
│   ├── config/
│   ├── plugins/
│   └── utils/
└── README.md
```


**Desenvolvido para Windows 11 com foco em Flutter Development**

> Para mais detalhes sobre configurações específicas, consulte a documentação oficial do [Neovim](https://neovim.io/) e do [Flutter](https://flutter.dev/).
