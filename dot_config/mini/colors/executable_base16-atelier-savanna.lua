local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
	  base00 = "#171c19",
	  base01 = "#232a25",
	  base02 = "#526057",
	  base03 = "#5f6d64",
	  base04 = "#78877d",
	  base05 = "#87928a",
	  base06 = "#dfe7e2",
	  base07 = "#ecf4ee",
	  base08 = "#b16139",
	  base09 = "#9f713c",
	  base0A = "#a07e3b",
	  base0B = "#489963",
	  base0C = "#1c9aa0",
	  base0D = "#478c90",
	  base0E = "#55859b",
	  base0F = "#867469",
  }
end

if vim.o.background == 'light' then
  palette = {
	  base00 = "#ecf4ee",
	  base01 = "#dfe7e2",
	  base02 = "#87928a",
	  base03 = "#78877d",
	  base04 = "#5f6d64",
	  base05 = "#526057",
	  base06 = "#232a25",
	  base07 = "#171c19",
	  base08 = "#b16139",
	  base09 = "#9f713c",
	  base0A = "#a07e3b",
	  base0B = "#489963",
	  base0C = "#1c9aa0",
	  base0D = "#478c90",
	  base0E = "#55859b",
	  base0F = "#867469",
  }
end

if palette then
  require('mini.base16').setup({ 
    palette = palette, 
    use_cterm = true 
  })
  vim.g.colors_name = 'base16-atelier-savanna'
end
