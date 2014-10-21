$(function() {

    $("form input[type=submit]").click(function() {
        var url = $("input[name=url]").val();
        if (!url) return;
        $('div#mask').fadeIn(333);
        if ($(this).val() == 'gerar') return true;
        if (url.indexOf('http') != 0) {
            url = 'http://'+url;
            $("input[name=url]").val(url);
        }
        $.get('proxy.php?url='+encodeURIComponent(url), function(response) {
            var regex = (/<title>(.*?)<\/title>/m).exec(response);
            if (regex != null) {
                title = regex[1];
                $("textarea").val(title);
            }
            $("fieldset.title, fieldset.captcha").show();
            $("form input[type=submit]").val('gerar');
            $("form").addClass('ready');
            $('div#mask').fadeOut(333);
        });
        return false;
    });
    $("form").submit(function() {
        ga('send', 'event', 'action', 'generate', $("input[name=url]").val());
    });

    $("form input[type=text]").focus();
});

function decode_base64 (s)
{
    var e = {}, i, k, v = [], r = '', w = String.fromCharCode;
    var n = [[65, 91], [97, 123], [48, 58], [43, 44], [47, 48]];

    for (z in n)
    {
        for (i = n[z][0]; i < n[z][1]; i++)
        {
            v.push(w(i));
        }
    }
    for (i = 0; i < 64; i++)
    {
        e[v[i]] = i;
    }

    for (i = 0; i < s.length; i+=72)
    {
        var b = 0, c, x, l = 0, o = s.substring(i, i+72);
        for (x = 0; x < o.length; x++)
        {
            c = e[o.charAt(x)];
            b = (b << 6) + c;
            l += 6;
            while (l >= 8)
            {
                r += w((b >>> (l -= 8)) % 256);
            }
         }
    }
    return r;
}