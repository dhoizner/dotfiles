local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
	  base00 = "#131513",
	  base01 = "#242924",
	  base02 = "#5e6e5e",
	  base03 = "#687d68",
	  base04 = "#809980",
	  base05 = "#8ca68c",
	  base06 = "#cfe8cf",
	  base07 = "#f4fbf4",
	  base08 = "#e6193c",
	  base09 = "#87711d",
	  base0A = "#98981b",
	  base0B = "#29a329",
	  base0C = "#1999b3",
	  base0D = "#3d62f5",
	  base0E = "#ad2bee",
	  base0F = "#e619c3",
  }
end

if vim.o.background == 'light' then
  palette = {
	  base00 = "#f4fbf4",
	  base01 = "#cfe8cf",
	  base02 = "#8ca68c",
	  base03 = "#809980",
	  base04 = "#687d68",
	  base05 = "#5e6e5e",
	  base06 = "#242924",
	  base07 = "#131513",
	  base08 = "#e6193c",
	  base09 = "#87711d",
	  base0A = "#98981b",
	  base0B = "#29a329",
	  base0C = "#1999b3",
	  base0D = "#3d62f5",
	  base0E = "#ad2bee",
	  base0F = "#e619c3",
  }
end

if palette then
  require('mini.base16').setup({ 
    palette = palette, 
    use_cterm = true 
  })
  vim.g.colors_name = 'base16-atelier-seaside'
end
