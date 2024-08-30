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

// document.addEventListener('DOMContentLoaded', function() {
//   const side = document.getElementById('side');
//   const aside = document.getElementById('aside');

//   // sideをタップしたときにsideを表示
//   side.addEventListener('click', function() {
//     side.classList.toggle('show');
//   });

//   // sideがスクロールされたときにasideを表示
//   side.addEventListener('scroll', function() {
//     aside.classList.add('show');
//     side.classList.remove('show');
//   });

//   // asideがスクロールされたときにasideを表示
//   aside.addEventListener('scroll', function() {
//     side.classList.remove('show');
//   });
// });

$(document).on('turbolinks:load', function() {
  $('.left-btn').click(function () {
    switchMenu('right', 'left');
  })

  $('.right-btn').click(function () {
    switchMenu('left', 'right');
  })

  function switchMenu(hiddenMenuElementName, visibleMenuElementName) {
    // JS式展開で引数を入れている
    const visibleBgBlack = $(`.${hiddenMenuElementName}-black`);
    const hiddenBgBlack = $(`.${visibleMenuElementName}-black`);
    const visibleMenu = $(`#${visibleMenuElementName}-menu`);
    const hiddenMenu = $(`#${hiddenMenuElementName}-menu`);

    // 反対側のメニューが出ていれば消す
    if (hiddenBgBlack.hasClass('d-block')) {
      hiddenBgBlack.removeClass('d-block').addClass('d-none');
      hiddenMenu.removeClass('d-block position-fixed w-100').addClass('d-none col-lg-3');
    }

    // メニュー表示処理
    if (visibleBgBlack.hasClass('d-block')) {
      // 隠す
      visibleBgBlack.removeClass('d-block').addClass('d-none');
      visibleMenu.removeClass('d-block position-fixed w-100').addClass('d-none col-lg-3');
    } else {
      // 表示する
      visibleBgBlack.removeClass('d-none').addClass('d-block');
      visibleMenu.removeClass('d-none col-lg-3').addClass('d-block position-fixed w-100');
    }
  }
});

// 画面がlg(991.98px以上)以上になったときハンバーガーメニューをリセット
$(window).on('resize', function() {
  if(window.matchMedia('(min-width: 991.98px)').matches){
    $('.right-black').removeClass('d-block').addClass('d-none');
    $('.left-black').removeClass('d-block').addClass('d-none');

    $('#left-menu').removeClass().addClass('d-none d-lg-block col-lg-3');
    $('#right-menu').removeClass().addClass('d-none d-lg-block col-lg-3');
  }
});