function set_fish_theme --argument scheme -d "Set the fish theme based on dark-notify"
    if test "$scheme" = dark
        # fish_config theme save "Catppuccin Mocha"
        fish_config theme save "Rosé Pine"
        set -Ux BAT_THEME "Catppuccin Mocha"
    else if test "$scheme" = light
        # fish_config theme save "Catppuccin Latte"
        fish_config theme save "Rosé Pine Dawn"
        set -Ux BAT_THEME "Catppuccin Latte"
    end
end
