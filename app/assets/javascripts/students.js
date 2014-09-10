$(document).ready(function () {
  $("a").tooltip();

  $("#owl-demo").owlCarousel({
    autoPlay: 3000, 
    rewindSpeed : 1000,
    singleItem : true
  });

   $("#student_avatar").change(function(){
    readURL(this);
    });

   $("#student_avatar1").change(function(){
    readURL1(this);
  });
});

function readURL(input) {
  $("#image_div").show();
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#img_prev')
      .attr('src', e.target.result)
      .width(100)
      .height(100);
    };
    reader.readAsDataURL(input.files[0]);
  }
}

function readURL1(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#img_prev2')
      .attr('src', e.target.result)
      .width(100)
      .height(100);
    };
    reader.readAsDataURL(input.files[0]);
  }
}
