function mpvyt
    if test (count $argv) -lt 1
        echo "Usage: mpvyt <url> [max_height] [--loop|-l] [--shuffle|-s]"
        return 1
    end

    set url ''
    set height 1080
    set loop_flag ''
    set shuffle_flag ''

    for arg in $argv
        switch $arg
            case --loop -l
                set loop_flag '--loop-playlist=inf'
            case --shuffle -s
                set shuffle_flag '--shuffle'
            case ''
                continue
            case '*'
                if string match -q 'ytdl://*' $arg
                    echo $arg
                    set url $arg
                else if string match -q 'http*://' $arg
                    set url $arg
                else if string match -qr '^\d+$' -- $arg
                    set height $arg
                else if test (string length -- $arg) -eq 11
                    set url "https://www.youtube.com/watch?v=$arg"
                else
                    echo "Unknown argument: $arg"
                    return 1
                end
        end
    end
    set format "bestvideo[height<=?$height]+bestaudio"

    if test -z "$url"
        echo "Error: No URL provided."
        return 1
    end
    mpv --really-quiet --ytdl-format="$format" $loop_flag $shuffle_flag $url & disown
end
