local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
	  base00 = "#1b181b",
	  base01 = "#292329",
	  base02 = "#695d69",
	  base03 = "#776977",
	  base04 = "#9e8f9e",
	  base05 = "#ab9bab",
	  base06 = "#d8cad8",
	  base07 = "#f7f3f7",
	  base08 = "#ca402b",
	  base09 = "#a65926",
	  base0A = "#bb8a35",
	  base0B = "#918b3b",
	  base0C = "#159393",
	  base0D = "#516aec",
	  base0E = "#7b59c0",
	  base0F = "#cc33cc",
  }
end

if vim.o.background == 'light' then
  palette = {
	  base00 = "#f7f3f7",
	  base01 = "#d8cad8",
	  base02 = "#ab9bab",
	  base03 = "#9e8f9e",
	  base04 = "#776977",
	  base05 = "#695d69",
	  base06 = "#292329",
	  base07 = "#1b181b",
	  base08 = "#ca402b",
	  base09 = "#a65926",
	  base0A = "#bb8a35",
	  base0B = "#918b3b",
	  base0C = "#159393",
	  base0D = "#516aec",
	  base0E = "#7b59c0",
	  base0F = "#cc33cc",
  }
end

if palette then
  require('mini.base16').setup({ 
    palette = palette, 
    use_cterm = true 
  })
  vim.g.colors_name = 'base16-atelier-heath'
end
