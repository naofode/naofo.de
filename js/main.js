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

onImgLoad = function(img) {
    var i = $(img).data('index'), total = $(img).data('total');
    if (i < total -1) {
        var copy = $(img).clone();
        copy.data('index', i + 1).attr('src', $(img).attr('src').replace('_'+i,'_'+(i+1)));
        copy.insertAfter(img);
    }
}