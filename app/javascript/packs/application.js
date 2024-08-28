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
require("@nathanvda/cocoon");


document.getElementById("aside").addEventListener("click", function() {
  var asideElement = document.getElementById("aside");
  var asidePosition = getComputedStyle(asideElement).right;

  if (asidePosition === "-100%") {
    asideElement.style.right = "0";
  } else {
    asideElement.style.right = "-100%";
  }
});

document.getElementById("side").addEventListener("click", function() {
  var sideElement = document.getElementById("side");
  var sidePosition = getComputedStyle(sideElement).left;

  if (sidePosition === "-100%") {
    sideElement.style.left = "0";
  } else {
    sideElement.style.left = "-100%";
  }
});