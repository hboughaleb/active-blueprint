$(document).ready(function(){
  $(".checkbox .check_boxes").click(function(){
    $(this).parent().parent().toggleClass("active");
  });
});
