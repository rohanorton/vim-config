# Neovim Config

Configuration files for Neovim.

## Troubleshooting

### Hererocks install issue

If hererocks is unable to install the required LuaJit version, it could be
because the hererocks script does not have rules for the desired version.

A hack to fix the issue is to add a translation to the hererocks file
(`~/.cache/nvim/packer_hererocks/hererocks.py`) to act as an alias, as follows:

```python
class LuaJIT(Lua):
    # ...
    translations = {
        "2": "2.0.5",
        "2.0": "2.0.5",
        "2.1": "2.1.0-beta3",
        "2.1.1703358377": "2.1.0-beta3", # <--- ADDED
        "^": "2.0.5",
        "latest": "2.0.5"
    }
    # ...
```

Then run command:

```bash
python hererocks.py --verbose -j 2.1.1703358377 -r latest 2.1.1703358377
```
