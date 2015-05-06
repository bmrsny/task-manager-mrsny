// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require_tree .
//
//

function markAsCompleted(button) {
  $(button).parents('li').prepend('<p>Completed</p>');
  $('#flash-container').show().addClass('alert-success')
  .text('Successfully Completed Task');
  setTimeout(function(){
    $('#flash-container').fadeOut();
  }, 1000);
  $(button).parent().remove();
}

function completeTask(button, id) {
  $.ajax({
    method: "PUT",
    url: "/complete_tasks/" + id,
    data: {id: id},
    success: markAsCompleted(button)
  });
}

function showMatches(match, all) {
  all.each(function(index, element) {
    if($(element).text().match(match)) {
      $(element).show();
    } else {
      $(element).hide();
    }
  });
}

//function sortByTitles(all){
  //all.sort(function(a,b) {
    //var an = a.getAttribute('data-title'),
    //bn = b.getAttribute('data-title');

    //if(an > bn) {
      //return 1;
    //}

    //if(an < bn) {
      //return -1;
    //}
    //return 0;
  //});

  //all.detach().appendTo('body');
//}

//function sortByTitles(all){
  //$(all).sort(function(element){
   //$(element).data('title');
  //});
  //all.detach().appendTo('body');
//}


//function sortByDescriptions(all){
  //all.sort(function(a,b) {
    //var an = a.getAttribute('data-description'),
    //bn = b.getAttribute('data-title');

    //if(an > bn) {
      //return 1;
    //}

    //if(an < bn) {
      //return -1;
    //}
    //return 0;
  //});

  //all.detach().appendTo('body');
//}

$(document).ready(function() {
  var all = $('.tasks').children().children();

  $('#tasks').dataTable();

  // mark task as complete
  $('.complete-task').click(function(){
    var button = this
    var id = $(this).parents('li').attr('id')
    completeTask(button, id)
  });

  // filter with a search bar
  $('#filter').click(function(e) {
    e.preventDefault();
    var input = $('#search_term').val();
    var match = new RegExp(input, 'i');
    showMatches(match, all);
  });

  $('#reset').click(function(e) {
    e.preventDefault();
    all.show();
  });

  $('#sort-titles').click(function(e) {
    e.preventDefault();
    sortByTitles(all);
  });

  $('#sort-descriptions').click(function(e) {
    e.preventDefault();
    sortByDescriptions(all);
  });

});
