local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
	  base00 = "#202746",
	  base01 = "#293256",
	  base02 = "#5e6687",
	  base03 = "#6b7394",
	  base04 = "#898ea4",
	  base05 = "#979db4",
	  base06 = "#dfe2f1",
	  base07 = "#f5f7ff",
	  base08 = "#c94922",
	  base09 = "#c76b29",
	  base0A = "#c08b30",
	  base0B = "#ac9739",
	  base0C = "#22a2c9",
	  base0D = "#3d8fd1",
	  base0E = "#6679cc",
	  base0F = "#9c637a",
  }
end

if vim.o.background == 'light' then
  palette = {
	  base00 = "#f5f7ff",
	  base01 = "#dfe2f1",
	  base02 = "#979db4",
	  base03 = "#898ea4",
	  base04 = "#6b7394",
	  base05 = "#5e6687",
	  base06 = "#293256",
	  base07 = "#202746",
	  base08 = "#c94922",
	  base09 = "#c76b29",
	  base0A = "#c08b30",
	  base0B = "#ac9739",
	  base0C = "#22a2c9",
	  base0D = "#3d8fd1",
	  base0E = "#6679cc",
	  base0F = "#9c637a",
  }
end

if palette then
  require('mini.base16').setup({ 
    palette = palette, 
    use_cterm = true 
  })
  vim.g.colors_name = 'base16-atelier-sulphurpool'
end
