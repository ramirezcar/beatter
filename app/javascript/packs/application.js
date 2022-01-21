// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
global.jQuery = require('jquery');
import "bootstrap"

global.$ = window.jQuery = require('jquery')

Rails.start()
ActiveStorage.start()
global.toastr = require("toastr")
// import Turbolinks from "turbolinks"
// Turbolinks.start()

toastr.options = {
  toastClass: 'toast',
  closeButton: true,
  debug: false,
  newestOnTop: true,
  progressBar: true,
  positionClass: "toast-bottom-left",
  preventDuplicates: true,
  showDuration: "300",
  hideDuration: "1000",
  timeOut: "5000",
  extendedTimeOut: "1000",
  showEasing: "swing",
  hideEasing: "linear",
  showMethod: "fadeIn",
  hideMethod: "fadeOut"
}
// On Load
window.addEventListener('load', (event) => {

  console.log("Start")
  
  const like_action_btns = document.querySelectorAll("a[data-remote].btn-like")
  const comment_action_btns = document.querySelectorAll(".comment-input form[data-remote]")
  const show_comment_input_btns = document.querySelectorAll("div.btn-comment")
  
  like_action_btns.forEach((element) => {
    element.addEventListener("ajax:success", (e) => {
      let post_parent = document.querySelector('#post-' + e.target.id)
      add_like(post_parent)
    });
  });
  
  comment_action_btns.forEach((element) => {
    element.addEventListener("ajax:success", (data) => {
      let post_parent = document.querySelector('#post-' + data.target.id)
      console.log(data)
      add_comment(post_parent, data.detail[0].comment)
    });
    
    show_comment_input_btns.forEach((element) => {
      element.addEventListener("click", (e) => {
        let post_parent = document.querySelector('#post-' + e.target.id)
        let comment_input = post_parent.querySelector('.comment-input')
        let comments_section = post_parent.querySelector('.comments')
        comments_section.classList.toggle('truncate')
        comments_section.classList.toggle('h-4r')
        comment_input.classList.toggle('d-none')
        comment_input.querySelector('#comment').focus()
      });
    });
  });


  // comment_action_btns.forEach((element) => {
  //   addEventListener("ajax:success", add_comment)
  // })
  //   // });
  // );
  
  const track_play_btns = document.querySelectorAll("a.track-play-btn");
  
  track_play_btns.forEach((element) => {
    element.addEventListener("click", (e) => {
      stop_other_tracks(e.currentTarget)
      play_track(e.currentTarget)
    });
  });
});

function add_like(post_parent) {
  // Obteniendo los iconos del boton like del post
  let liked_svg = post_parent.querySelector('.liked-icon')
  let unliked_svg = post_parent.querySelector('.unliked-icon')
  // Ocultando y mostrando cada icono segun si contiene la clase que lo oculta o no
  liked_svg.classList.toggle('d-none')
  unliked_svg.classList.toggle('d-none')
  // Alterando contador del likes del post
  let like_counter = post_parent.querySelector('.post-likes').firstElementChild
  like_counter.innerText = !liked_svg.classList.contains('d-none') ? parseInt(like_counter.innerText) + 1 : parseInt(like_counter.innerText) -1
}

function add_comment(post_parent, data) {
  // Obteniendo la seccion de comentarios del post
  let comments_section = post_parent.querySelector('.comments')
  // Preparando elemento hijo a agregar
  let innerHTML = '<div class="post-comment col py-2 px-4">'
  innerHTML += '<span class="fw-bold me-1"><a class="font-weight-bold">' + data.user + '</a></span>  <span class="fw-light">'+data.comment+ '</span>'
  innerHTML += '<div class="text-muted ago">Hace unos segundos</div>'
  innerHTML += '</div>'
  // Agregando elemento emergente al DOM
  comments_section.innerHTML += (innerHTML)
}

function get_audio_by_play_btn(element){
  let audio_tag = null
  if (element.querySelector('.audio-player')) {
    audio_tag = element.querySelector('.audio-player')
  } else {
    let track_parent = document.querySelector('#track-' + element.id)
    audio_tag = track_parent.querySelector('.audio-player')
  }
  return audio_tag
}

function get_play_btn_by_audio_tag(element){
  let track_parent = document.querySelector('#track-' + element.id)
  let btn = track_parent.querySelector('a.track-play-btn')
  return btn
}

function stop_other_tracks(element){
  let audio_tag = get_audio_by_play_btn(element)

  var audios = document.getElementsByTagName('audio');
    for(var i = 0, len = audios.length; i < len;i++){
        if(audios[i] != audio_tag){
            pause(audios[i])
        }
    }
}

function pause(element) {
  element.pause();
  get_play_btn_by_audio_tag(element).innerText = "Reproducir"
}

function play_track(element) {
  let audio_tag = get_audio_by_play_btn(element)

  if (audio_tag.paused) {
    audio_tag.play()
    // element.innerText = "Pausar"
  } else {
    pause(audio_tag)
  }
}



// let Notifications = (function() {
//   function Notifications() {
//     let notifications = document.querySelectorAll("[data-behavior='notifications']");
//     console.log(notifications);
//     if (notifications.length > 0) {
//       // handleSuccess(notifications.data("notifications"));
//       document.querySelector("[data-behavior='notifications-link']").on("click", handleClick());
//       debugger;
//       setInterval(((function(_this) {
//         return function() {
//           return _this.getNewNotifications();
//         };
//       })(this)), 5000);
//     }
//   }

//   let getNewNotifications = function() {
//     return $.ajax({
//       url: "/notifications.json",
//       dataType: "JSON",
//       method: "GET",
//       success: this.handleSuccess
//     });
//   };

//   let handleClick = function(e) {
//     $.ajax({
//       url: "/notifications/mark_as_read",
//       dataType: "JSON",
//       method: "POST",
//       success: function() {
//         return $("[data-behavior='unread-count']").text(0);
//       }
//     });
//     return console.log('Yes.');
//   };

//   let handleSuccess = function(data) {
//     var items, unread_count;
//     items = $.map(data, function(notification) {
//       return notification.template;
//     });
//     unread_count = 0;
//     $.each(data, function(i, notification) {
//       if (notification.unread) {
//         return unread_count += 1;
//       }
//     });
//     document.querySelector("[data-behavior='unread-count']").text(unread_count);
//     return document.querySelector("[data-behavior='notification-items']").html(items);
//   };

//   return Notifications;

// })();

// jQuery(function() {
//   return new Notifications;
// });


require("trix")
require("@rails/actiontext")