local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
	  base00 = "#20201d",
	  base01 = "#292824",
	  base02 = "#6e6b5e",
	  base03 = "#7d7a68",
	  base04 = "#999580",
	  base05 = "#a6a28c",
	  base06 = "#e8e4cf",
	  base07 = "#fefbec",
	  base08 = "#d73737",
	  base09 = "#b65611",
	  base0A = "#ae9513",
	  base0B = "#60ac39",
	  base0C = "#1fad83",
	  base0D = "#6684e1",
	  base0E = "#b854d4",
	  base0F = "#d43552",
  }
end

if vim.o.background == 'light' then
  palette = {
	  base00 = "#fefbec",
	  base01 = "#e8e4cf",
	  base02 = "#a6a28c",
	  base03 = "#999580",
	  base04 = "#7d7a68",
	  base05 = "#6e6b5e",
	  base06 = "#292824",
	  base07 = "#20201d",
	  base08 = "#d73737",
	  base09 = "#b65611",
	  base0A = "#ae9513",
	  base0B = "#60ac39",
	  base0C = "#1fad83",
	  base0D = "#6684e1",
	  base0E = "#b854d4",
	  base0F = "#d43552",
  }
end

if palette then
  require('mini.base16').setup({ 
    palette = palette, 
    use_cterm = true 
  })
  vim.g.colors_name = 'base16-atelier-dune'
end
