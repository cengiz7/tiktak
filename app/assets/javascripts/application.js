//= require jquery3
//= require rails-ujs
//= require turbolinks
//= require foundation
//= require foundation-datepicker
//= require_tree .

$(document).on('turbolinks:load', function() {
    $(function(){ $(document).foundation(); });
});