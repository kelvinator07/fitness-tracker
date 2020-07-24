$(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });
  
  $(function() {
    $('[data-toggle="popover"]').popover();
  });

$('.card').on('click', function(event) {
    alert('You clicked the Bootstrap Card');
});