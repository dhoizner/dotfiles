function watch_fish_theme -d "Watch for changes in the theme"
    dark-notify -e | while read -a line
        echo y | set_fish_theme $line
    end
end
