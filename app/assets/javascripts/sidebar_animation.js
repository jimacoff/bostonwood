function openNav() {
  var sidebar = document.getElementsByClassName("sidebar");
  var main = document.getElementsByClassName("main")
  var hamburger = document.getElementsByClassName("open-button")
  var close = document.getElementsByClassName("close-button")
  main[0].style.marginLeft = "250px";
  main[0].style.width = "80%";
  sidebar[0].style.width = "250px";
  sidebar[0].style.paddingLeft = "25px";
  sidebar[0].style.paddingRight = "25px";
  hamburger[0].innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>"
  hamburger[0].onclick = closeNav
  close[0].style.opacity = 1;
  hamburger[0].style.opacity = 0;
}

function closeNav() {
  var sidebar = document.getElementsByClassName("sidebar");
  var main = document.getElementsByClassName("main")
  var hamburger = document.getElementsByClassName("open-button")
  var close = document.getElementsByClassName("close-button")
  main[0].style.marginLeft = "0px";
  main[0].style.width = "100%";
  sidebar[0].style.width = "0px";
  sidebar[0].style.paddingLeft = "0px";
  sidebar[0].style.paddingRight = "0px";
  hamburger[0].innerHTML = "<i class='fa fa-bars' aria-hidden='true'></i>"
  hamburger[0].onclick = openNav;
  close[0].style.opacity = 0;
  hamburger[0].style.opacity = 1;
}
