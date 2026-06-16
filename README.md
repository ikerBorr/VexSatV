# VexSatV

## Quickstart

```bash
git clone --recurse-submodules <repo-url> vexsatv
cd vexsatv
make all        # generate RTL, build firmware, run the sim
```

### Using VS Code / Codespaces

Open the folder in VS Code and choose **Reopen in Container**, or open the repo
in **GitHub Codespaces**. The toolchain and extensions are configured for you;
then run `make all` in the integrated terminal.

## Workflow

| Command | Does |
|---|---|
| `make gen` | SpinalHDL → Verilog RTL into `gen/` |
| `make fw` | build firmware → `fw/build/firmware.{elf,bin,hex,lst}` |
| `make sim` | run the Verilator sim, loading `fw/build/firmware.bin` |
| `make all` | `gen` + `fw` + `sim` |
| `make shell` | interactive shell in the dev container |
| `make clean` | remove generated outputs |

