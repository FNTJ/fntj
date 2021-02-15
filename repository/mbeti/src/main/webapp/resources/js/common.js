$(document).ready(function(){
	var menubtn = $(".main-txt .title-box .title-b");
	menubtn.on("click", function(){
		$("body").addClass("on");
		$(".header .top-right .menu .menu-box").slideDown(200);
	});
});