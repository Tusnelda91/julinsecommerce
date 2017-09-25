var refreshRating = function() {
  $('.rating').raty({
    starHalf: '<%= asset_path 'star-half.png' %>',
    starOff: '<%= asset_path 'star-off.png' %>',
    starOn: '<%= asset_path 'star-on.png' %>',
    scoreName: 'comment[rating]'
  });
  $('.rated').raty({
    starHalf: '<%= asset_path 'star-half.png' %>',
    starOff: '<%= asset_path 'star-off.png' %>',
    starOn: '<%= asset_path 'star-on.png' %>',
    readOnly :true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).on('turbolinks:load', function(){
/* Elevate Zoom Plugin */
  refreshRating();
  if ($(window).width() < 768){
    $('.img-zoom').elevateZoom({
      zoomWindowPosition: 6,
      zoomWindowHeight: 300,
      zoomWindowWidth: 320,
      responsive: true
    });
  } else {
      $('.img-zoom').elevateZoom({
        zoomWindowPosition: 1,
        zoomWindowHeight: 300,
        responsive: true
      });
  }
});
