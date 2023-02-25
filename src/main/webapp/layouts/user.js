


// var nav = document.getElementsByClassName('header')[0];
// var sticky = nav.offsetTop;
// window.onscroll = () => {
//     if (window.pageYOffset > sticky) {
//         nav.classList.add('sticky');
//     } else {
//         nav.classList.remove('sticky');
//     }
// }


//  toggle password

const togglePassword = document.querySelectorAll(".eye");
let activeClassName = "is-active";
togglePassword.forEach((item) => {
    item.addEventListener("click", handleTogglePassword);
});

function handleTogglePassword() {
    let inputType = "password";
    // essentially trying to get the previous sibling element of the parent node of the current element. If the current element doesn't have a parent node, the input variable will be set to undefined
    const input = this.parentNode?.previousElementSibling;
    if (this.matches(".eye-close")) {
        inputType = "text";
        const eyeOpen = this.previousElementSibling;
        eyeOpen && eyeOpen.classList.add(activeClassName);
    } else {
        inputType = "password";
        this.classList.remove(activeClassName);
    }
    input && input.setAttribute("type", inputType);
}
// prevent form submit
const form = document.querySelector("form");
form.addEventListener('submit', function (e) {
    e.preventDefault();
});