function corona -a 'country'
    if test -n "$country"
        curl https://corona-stats.online/$country
    else
        curl https://corona-stats.online/
    end
end
