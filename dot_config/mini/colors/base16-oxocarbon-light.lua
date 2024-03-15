local palette = {
    base00 = "#ffffff",
    base01 = "#f2f2f2",
    base02 = "#d0d0d0",
    base03 = "#161616",
    base04 = "#37474f",
    base05 = "#90a4ae",
    base06 = "#525252",
    base07 = "#08bdba",
    base08 = "#ff7eb6",
    base09 = "#ee5396",
    base0A = "#ff6f00",
    base0B = "#0f62fe",
    base0C = "#673ab7",
    base0D = "#42be65",
    base0E = "#be95ff",
    base0F = "#ffab91",
}

if palette then
    require("mini.base16").setup({ palette = palette })
    vim.g.colors_name = "base16-oxocarbon"
    vim.cmd([[ highlight WinSeparator guibg=None ]])
end
