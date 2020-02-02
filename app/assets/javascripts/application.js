// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage

//= require bootstrap-sprockets
//= require adminlte

//= require cocoon



function via_cep(input) {
  form = input.parent().parent().parent();
  $.post("/utils/zipcode", { zipcode: input.val() }, function(data) {
    form.find('input[id$=street]').val(data.response.logradouro);
    form.find('input[id$=district]').val(data.response.bairro);
    form.find('input[id$=complement]').val(data.response.complemento);
    select = form.find('select[id$=city_id]');
    select.val(select.find('[data-ibge=' + data.response.ibge + ']').val());
  });
}

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();

  $('input[id$=zipcode]').blur(function(){
    via_cep($(this));
  });
});
