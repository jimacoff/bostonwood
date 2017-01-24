function openNav() {
  var sidebar = document.getElementsByClassName("sidebar");
  var main = document.getElementsByClassName("main")
  var hamburger = document.getElementsByClassName("open-button")
  main[0].style.marginLeft = "250px";
  main[0].style.width = "80%";
  sidebar[0].style.width = "250px";
  sidebar[0].style.paddingLeft = "25px";
  sidebar[0].style.paddingRight = "25px";
  hamburger[0].innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>"
  hamburger[0].onclick = closeNav
}

function closeNav() {
  var sidebar = document.getElementsByClassName("sidebar");
  var main = document.getElementsByClassName("main")
  var hamburger = document.getElementsByClassName("open-button")
  main[0].style.marginLeft = "0px";
  main[0].style.width = "100%";
  sidebar[0].style.width = "0px";
  sidebar[0].style.paddingLeft = "0px";
  sidebar[0].style.paddingRight = "0px";
  hamburger[0].innerHTML = "<i class='fa fa-bars' aria-hidden='true'></i>"
  hamburger[0].onclick = openNav
}
