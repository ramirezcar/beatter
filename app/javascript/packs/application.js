// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
global.toastr = require("toastr")

Rails.start()
ActiveStorage.start()
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

  const like_action_btns = document.querySelectorAll("a[data-remote]");
  
  like_action_btns.forEach((element) => {
    element.addEventListener("ajax:success", (e) => {
      let post_parent = document.querySelector('#post-' + e.target.id)
      add_like(post_parent)
      
    });
  });
  
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


require("trix")
require("@rails/actiontext")