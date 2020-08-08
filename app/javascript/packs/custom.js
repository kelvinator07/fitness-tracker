$(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });
  
  $(function() {
    $('[data-toggle="popover"]').popover();
  });

$('.card').on('click', function(event) {
    alert('You clicked the Bootstrap Card');
});

var header = document.querySelectorAll("nav-link");
console.log('header> ' , header)

header.forEach( el => {
  el.addEventListener('click', function() {
    console.log('clicked here ')
  })
})

for (var i = 0; i < header.length; i++) {
  header[i].addEventListener("click", function() {
    console.log('clicked here ')
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  });
}