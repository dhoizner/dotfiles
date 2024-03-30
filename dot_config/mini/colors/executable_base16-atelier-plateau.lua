local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
	  base00 = "#1b1818",
	  base01 = "#292424",
	  base02 = "#585050",
	  base03 = "#655d5d",
	  base04 = "#7e7777",
	  base05 = "#8a8585",
	  base06 = "#e7dfdf",
	  base07 = "#f4ecec",
	  base08 = "#ca4949",
	  base09 = "#b45a3c",
	  base0A = "#a06e3b",
	  base0B = "#4b8b8b",
	  base0C = "#5485b6",
	  base0D = "#7272ca",
	  base0E = "#8464c4",
	  base0F = "#bd5187",
  }
end

if vim.o.background == 'light' then
  palette = {
	  base00 = "#f4ecec",
	  base01 = "#e7dfdf",
	  base02 = "#8a8585",
	  base03 = "#7e7777",
	  base04 = "#655d5d",
	  base05 = "#585050",
	  base06 = "#292424",
	  base07 = "#1b1818",
	  base08 = "#ca4949",
	  base09 = "#b45a3c",
	  base0A = "#a06e3b",
	  base0B = "#4b8b8b",
	  base0C = "#5485b6",
	  base0D = "#7272ca",
	  base0E = "#8464c4",
	  base0F = "#bd5187",
  }
end

if palette then
  require('mini.base16').setup({ 
    palette = palette, 
    use_cterm = true 
  })
  vim.g.colors_name = 'base16-atelier-plateau'
end
