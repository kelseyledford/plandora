
$( document ).ready(function() {
    $(".thumbs").click(function(){
    	var image_selected = $(this).find('img')[0].src;
    	$(".static-viewer").find('img')[0].src = image_selected;
    	$(".viewer").find('img')[0].src = image_selected;
    });
    $(".static-viewer img").click(function(){
    	$(".viewer").fadeIn('slow');
    });
    $(".viewer").click(function(){
    	$(".viewer").fadeOut('slow');
    });
});