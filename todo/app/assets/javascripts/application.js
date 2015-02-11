// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// var user = window.location.pathname.split('/')[2];

// $.get("/users/6/tasks.json").done(function(data) {
//                                   var $container = $("<div class ='container'>Container</div>");
//                                   data.forEach(function(task){
//                                   var $content = $('<div style="color:white; background-color:grey;">'+task.content+'</div>');
//                                   var $complete = $('<div style="color:blue; background-color:yellow;">'+task.complete+'</div>');
//                                   var $created = $('<div style="color:pink; background-color:purple;">'+task.created_at+'</div>');
//                                   $container.append($content);
//                                   $container.append($complete);
//                                   $container.append($created);
//                                   });
//                                   $('body').append($container);
// })
window.onload = function() {

var userId = window.location.pathname.split("/")[2];
var usersTasksURL = "/users/"+userId+"/tasks.json";

$.get(usersTasksURL)
	.done(function(data) {
		console.log
	    var $container = $("<div class='container'>Container</div>");
	    data.forEach(function(task) {
	      var $content = $("<div class='"+task.id+"' style='color:pink;'>"+task.content+"</div>");
	      var checked = task.complete ? "checked" : "";
	      var $complete = $("<input type='checkbox' class='checkbox'"+checked+"</input>");
	      var $created_at = $("<div style='color:green;'>"+task.created_at+"</div>");
	      var $button = $("<button class='delete'>Delete</button>");
	      $complete.append($created_at);
	      $content.append($button);
	      $content.append($complete);
	      $container.append($content); 
	    });
	    $('body').append($container);
	    addDeleteListeners();
	    addCheckboxListeners();
});

$('#task-form').submit(function(event) {
  event.preventDefault()
   var $content = $('#task-content');
    console.log("submitted", $content.val());
                 
			$.post(usersTasksURL, {task: {content: $content.val(), complete: false}})
				.done(function(task) {
				// var $container = $('.container');
				// var $content = $("<div style='color:pink;'>"+task.content+"</div>");
				// var $complete = $("<div style='color:blue;'>"+task.complete+"</div>");
				var $container = $("<div class='container'>Container</div>");
				var $content = $("<div class='"+task.id+"' style='color:pink;'>"+task.content+"</div>");
	      var checked = task.complete ? "checked" : "";
	      var $complete = $("<input type='checkbox' class='checkbox'"+checked+"</input>");
				var $created_at = $("<div style='color:green;'>"+task.created_at+"</div>");
				$complete.append($created_at);
				$content.append($complete);
				$container.append($content); 
				console.log(task);
				});
                //Trigger Post Request
        $content.val("");
        $content.focus();

        addDeleteListeners();
        addCheckboxListeners();
 });

var addDeleteListeners = function() {
	$('.delete').on('click', function(event) {
   var $parent = event.toElement.parentElement;
   var deleteUrl = "/users/"+userId+"/tasks/"+ $parent.classList[0]+".json";
	 var deleteRequestObj = {method: "DELETE", url: deleteUrl};
	 $.ajax(deleteRequestObj).done(function(task) {
    console.log(task);
    $parent.remove();
});
   console.log("Task ID: ", $parent.classList[0] );
   console.log("I was clicked");
  });
};

// var addCheckboxListeners = function() {
// 	$('.checkbox').on('click', function(event) {
// 		var $parent = event.toElement.parentElement;
// 		var patchRequestURL = "/users/"+userId+"/tasks/"+ $parent.classList[0]+".json";
// 		var pathRequestObj = { method: "PATCH", url: patchRequestURL, data: {task: {complete: event.toElement.checked}}};
// 		$.ajax(pathRequestObj, {task: {complete: true}})
// 		.done(function(task) {
// 			console.log(task);
// 		});
// 		console.log("I was checked");
// 	});
// };

var addCheckboxListeners = function() {
//combine into code block
$('.checkbox').on('click', function(event){
  var $parent = event.toElement.parentElement;
  var patchRequestURL = '/users/'+userId+'/tasks/'+$parent.classList[0]+".json";
  var patchRequestObj = {method: "PATCH", url: patchRequestURL,
                      data: {task: {complete: event.toElement.checked}}};
                      $.ajax(patchRequestObj, {task: {complete: true}})
                        .done(function(task) {
                        console.log(task);
                        })
  console.log("I was clicked");
});
};

};
