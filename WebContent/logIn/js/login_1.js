(function(){
    var $garim = $("#garim");
    var $garim2 = $("#garim2");
    var $form = $("#form");

    $garim.css({"opacity" : 1});
    $garim2.css({opacity : 1});
    $form.css({opacity : 0});
    

    $garim.animate({opacity : 0}, 2000, function(){
        $garim2.animate({opacity : 0}, 500, function(){
            $form.animate({opacity : 1})
        })
    })


})();

$("#pass").hover(function(){
    $(this).css({
        "background-color" : "rgba(0, 0, 0, 0.2)"});
}, function(){
    $(this).css({
        "background-color" : "transparent"});
});

$(".submit").hover(function(){
    $(this).css({
        "background-color" : "rgba(0, 0, 0, 0.2)"});
}, function(){
    $(this).css({
        "background-color" : "transparent"});
});

$("#hg").hover(function(){
    $(this).css({
        "background-color" : "rgba(0, 0, 0, 0.2)"});
}, function(){
    $(this).css({
        "background-color" : "transparent"});
});

$(".ssub").hover(function(){
    $(this).css({
        "background-color" : "rgba(0, 0, 0, 0.2)"});
}, function(){
    $(this).css({
        "background-color" : "transparent"});
});