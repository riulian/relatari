// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.





require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//const webpack = require('webpack');
//import "bootstrap";
//import 'popper.js';

  

  $( document).on('turbolinks:load', function() {
    if ($('.upload-hider-labels').length > 0) {
        $('.upload-hider-labels').each(function() {
            return $(this).closest('.form-group').find('a.upload-hider-fields').hide();
         });
    }
    $('form').on('click',  '.replace-upload', function(e) {
        var uploadFields, uploadLabels;
        e.preventDefault();
        uploadLabels = $(this).closest('.upload-hider-labels');
        uploadFields = $(this).closest('.form-group').find('a.upload-hider-fields');
        uploadLabels.hide();
        return uploadFields.show();
    });
    $('.select2').select2();
  
   }) 


