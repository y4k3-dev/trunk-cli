# Trunk - Lua File Tree Generator

A lightweight, command-line utility written in Lua that generates a clean, UTF-8 formatted directory tree. 
Designed to mimic the sorting behavior of VS Code and GitHub, this tool automatically respects `.gitignore` rules, formats the output, and instantly copies the result to your Windows clipboard for easy sharing in documentation or chats.

## Prerequisites (For Local Development)

*If you want to use the tool without configuring Lua or compilers, skip to the **Automated Builds** section below.*

- **Lua:** 5.1 or newer.
- **LuaRocks:** The package manager for Lua.
- **luafilesystem (lfs):** A required C-module for file system operations.
- **OS:** Windows (relies on the built-in `clip` and `chcp` commands for clipboard integration).

### Installing Dependencies

If you haven't installed `luafilesystem` yet, you can do so via LuaRocks:

```bash
luarocks install luafilesystem
```

*Note: Compiling `luafilesystem` requires a C compiler (like GCC via MSYS2 or MSVC via the Visual Studio Developer Command Prompt).*

## Usage

You can run the script using the provided `trunk.bat` alias or via standard Lua commands. If you don't provide a path, it defaults to scanning the directory you are currently in.

### Using the Batch Alias (Recommended)

Place `trunk.bat` in the same directory as `main.lua`. From your terminal, you can now run:

**Scan the current directory:**
```bash
trunk .
```

**Scan a specific directory:**
```bash
trunk "D:\Projects\Public\Kalman"
```

### Using Standard Lua

```bash
lua main.lua "D:\Projects\Public\Kalman"
```

### Expected Output

The tool will print the tree to your console and automatically copy it to your clipboard:

```text
Kalman/
├── .gitignore
├── main.py
├── README.md
├── src/
│   ├── filters.py
│   └── signal.py
└── tests/

[+] Successfully copied tree to clipboard!
```

## Automated Builds (GitHub Actions)

This repository includes a GitHub Actions workflow (`.github/workflows/build.yml`) that automatically builds a portable release every time you push to the `main` or `master` branch.

1. Go to the **Actions** tab in your GitHub repository.
2. Select the latest successful **Auto-Build Trunk CLI** run.
3. Scroll down to the **Artifacts** section and download `trunk-windows-cli`.

This downloaded zip contains `main.lua`, `trunk.bat`, and the pre-compiled `lfs.dll`. You can extract this folder anywhere on your PC, add it to your System PATH, and use the `trunk` command globally without needing to install LuaRocks or a C compiler.