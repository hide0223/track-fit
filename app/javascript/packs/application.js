// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

   document.addEventListener('DOMContentLoaded', function() {
     var elements = document.getElementsByClassName('post-link');
     for (var i = 0; i < elements.length; i++) {
       elements[i].addEventListener('click', function(event) {
         event.preventDefault();
         window.location.href = this.getAttribute('href');
       });
     }
   });
