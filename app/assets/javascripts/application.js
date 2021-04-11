//= require jquery3
//= require rails-ujs
//= require turbolinks
//= require foundation
//= require foundation-datepicker
//= require toastr
//= require_tree .

$(document).on('turbolinks:load', function() {
    $(function(){ $(document).foundation(); });
});

toastr.options.closeButton = true;
toastr.options.debug= false;
toastr.options.newestOnTop= true;
toastr.options.progressBar = true;
toastr.options.positionClass = "toast-bottom-right";
toastr.options.preventDuplicates = false;
toastr.options.timeOut = "3000";
toastr.options.showMethod = "fadeIn";
toastr.options.hideMethod = "fadeOut";
