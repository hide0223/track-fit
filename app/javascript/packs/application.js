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

// document.addEventListener('DOMContentLoaded', function() {
//   let selectBox = document.getElementById('content_type');
//   let mealForm = document.getElementById('meal_form');
//   let trainingForm = document.getElementById('training_form');

//   let mealCategorySelect = document.getElementById('meal_category');

//   let breakfastForm = document.getElementById('breakfast_form');
//   let lunchForm = document.getElementById('lunch_form');
//   let dinnerForm = document.getElementById('dinner_form');
//   let snackForm = document.getElementById('snack_form');

//   selectBox.addEventListener('change', function() {
//     let selectedValue = selectBox.value;

//     mealForm.style.display = 'none';
//     trainingForm.style.display = 'none';

//     if (selectedValue === '食事') {
//       mealForm.style.display = 'block';
//     } else if (selectedValue === 'トレーニング') {
//       trainingForm.style.display = 'block';
//     }
//   });

//   mealCategorySelect.addEventListener('change', function() {
//     let selectedCategory = mealCategorySelect.value;

//     breakfastForm.style.display = 'none';
//     lunchForm.style.display = 'none';
//     dinnerForm.style.display = 'none';
//     snackForm.style.display = 'none';

//     if (selectedCategory === '朝食') {
//       breakfastForm.style.display = 'block';
//     } else if (selectedCategory === '昼食') {
//       lunchForm.style.display = 'block';
//     } else if (selectedCategory === '夕食') {
//       dinnerForm.style.display = 'block';
//     } else if (selectedCategory === '間食') {
//       snackForm.style.display = 'block';
//     }
//   });
// });
// document.addEventListener('DOMContentLoaded', function() {
//   let selectBox = document.getElementById('content_type');
//   let elements = document.querySelectorAll('div h1');

//   selectBox.addEventListener('change', function() {
//     let selectedValue = selectBox.value;

//     elements.forEach(function(element) {
//       if (element.innerText !== selectedValue) {
//         element.parentElement.style.display = 'none';
//       } else {
//         element.parentElement.style.display = 'block';
//       }
//     });
//   });
// });
