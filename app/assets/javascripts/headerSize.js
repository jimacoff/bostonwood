// function init() {
//   window.addEventListener('scroll', function(event) {
//     var distanceY = window.pageYOffset || document.documentElement.scrollTop,
//         shrinkOn = 50,
//         bar = document.getElementsByClassName("top-header")
//         header = document.getElementsByClassName("header-center");
//         hours = document.getElementsByClassName("hours")
//         nav = document.getElementsByClassName("sidebar")
//         flag = document.getElementsByClassName("flag-container")
//         flagImage = document.getElementsByClassName("flag-image")
//     if (distanceY > shrinkOn) {
//       bar[0].className = "top-header smaller"
//       header[0].className = "header-center smaller";
//       nav[0].className = "sidebar smaller";
//       hours[0].className = "hours smaller"
//       flag[0].className = "flag-container smaller"
//       flagImage[0].className = "flag-image smaller"
//     } else {
//       if (header[0].classList.contains("smaller")) {
//         bar[0].className = "top-header"
//         header[0].className = "header-center"
//         nav[0].className = "sidebar"
//         hours[0].className = "hours"
//         flag[0].className = "flag-container"
//         flagImage[0].className = "flag-image"
//       }
//     }
//   });
// }

window.onload = init()
