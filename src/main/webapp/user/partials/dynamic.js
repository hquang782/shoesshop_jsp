
window.onscroll = () => {
    if (window.pageYOffset > sticky) {
        nav.classList.add('sticky');
    } else {
        nav.classList.remove('sticky');
    }
}

var nav = document.getElementsByClassName('header')[0];
var sticky = nav.offsetTop;