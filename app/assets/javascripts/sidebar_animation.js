function openNav() {
  var sidebar = document.getElementsByClassName("sidebar");
  var sidenav = document.getElementsByClassName("side-nav")
  var main = document.getElementsByClassName("main")
  var hamburger = document.getElementsByClassName("open-button")

  if (window.innerWidth > 600) {
    main[0].style.marginLeft = "250px";
    main[0].style.width = "80%";
    sidebar[0].style.width = "250px";
    sidebar[0].style.paddingLeft = "25px";
    sidebar[0].style.paddingRight = "25px";
    hamburger[0].innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>"
    hamburger[0].onclick = closeNav
    hamburger[0].style.opacity = 1;
  } else {
    sidebar[0].style.width = "100%";
    sidebar[0].style.paddingLeft = "25px";
    sidebar[0].style.paddingRight = "25px";
    hamburger[0].innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>"
    hamburger[0].onclick = closeNav
    hamburger[0].style.opacity = 1;
    sidenav[0].style.opacity = 1;
  }

}

function closeNav() {
  var sidebar = document.getElementsByClassName("sidebar");
  var main = document.getElementsByClassName("main")
  var hamburger = document.getElementsByClassName("open-button")
  var sidenav = document.getElementsByClassName("side-nav")

  if (window.innerWidth > 600) {
    main[0].style.width = "100%";
    main[0].style.marginLeft = "0px";
    sidebar[0].style.width = "0px";
    sidebar[0].style.paddingLeft = "0px";
    sidebar[0].style.paddingRight = "0px";
    hamburger[0].innerHTML = "<i class='fa fa-bars' aria-hidden='true'></i>"
    hamburger[0].onclick = openNav;
    hamburger[0].style.opacity = 1;
  } else {
    main[0].style.marginLeft = "0px";
    main[0].style.width = "100%";
    sidebar[0].style.width = "0px";
    sidebar[0].style.paddingLeft = "0px";
    sidebar[0].style.paddingRight = "0px";
    hamburger[0].innerHTML = "<i class='fa fa-bars' aria-hidden='true'></i>"
    hamburger[0].onclick = openNav;
    hamburger[0].style.opacity = 1;
    sidenav[0].style.opacity = 0;

  }

}
