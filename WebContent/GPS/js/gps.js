

$("#btn1").click(function(){
    $("#btn_bar").animate({"left" : "0px"})
});
    
$("#btn_close").click(function(){
    $("#btn_bar").animate({"left" : "-300px"})
});

$("#pop").click(function(){
    $("#pop").animate({"bottom" : "-600px"})
});

$("#btn_bar a").hover(function(){
    $(this).css({
        "background-color" : "#daefe3", "color" : "#258054"});
}, function(){
    $(this).css({
        "background-color" : "transparent", "color" : "white"});
});

