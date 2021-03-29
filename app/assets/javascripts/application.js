//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require bootstrap-sprockets
//= require tinymce-jquery
//= require_tree .


//= require foundation
$(document).on('turbolinks:load', function() {
    $(function(){ $(document).foundation(); });
});