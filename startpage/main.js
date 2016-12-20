function startTime() {
    var today = new Date();
    document.getElementById('time').innerHTML =
        checkTime(today.getHours()) + " : " + checkTime(today.getMinutes());
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}

function interpretSearch() {
    var search = document.getElementById("js-search-input").value.split(" ");
    var searchTerms = "";
    console.log(search[0])
    switch(search[0])
    {
        case '?':
            alert("t: twitter\ntw: twitch\nr: reddit\neb: ebay\ny youtube\na: amazon");
            break;
        case 't:':
            window.location.href = encodeURI("https://twitter.com/" + search[1]);
            return false;
        case 'tw:':
            window.location.href = encodeURI("https://twitch.tv/" + search[1]);
            return false;
        case 'r:':
            window.location.href = encodeURI("https://reddit.com/r/" + search[1]);
            return false;
        case 'eb:':
            for(var i = 1; i < search.length; i++)
            {
                searchTerms += search[i]+'+';
            }
            window.location.href = encodeURI("http://www.ebay.de/sch/i.html?_odkw=0&_from=R40&_nkw=" + searchTerms);
            return false;
        case 'y:':
            for(var i = 1; i < search.length; i++)
            {
                searchTerms += search[i]+'+';
            }
            window.location.href = encodeURI("https://youtube.com/results?search_query=" + searchTerms);
            return false;
        case 'a:':
            for(var i = 1; i < search.length; i++)
            {
                searchTerms += search[i]+'+';
            }
            window.location.href = "https://www.amazon.de/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=" + searchTerms;
            return false;
        default:
            for(var i = 0; i < search.length; i++)
            {
                searchTerms += search[i]+'+';
            };
            window.location.href = "https://duckduckgo.com/?q=" + searchTerms;
            return false;
    }
};
