const handleClickCart = () => {
    const listCart = document.getElementsByClassName("header__cart-list")[0];
    if (listCart.classList.contains("open-cart")) {
        listCart.classList.remove("open-cart")
    } else {
        listCart.classList.add("open-cart")
    }
}

window.addEventListener("click", (e) => {
    const listCart = document.getElementsByClassName("header__cart-list")[0];
    const iconCart = document.getElementsByClassName("header__cart-icon")[0];
    if (!listCart.contains(e.target) && !iconCart.contains(e.target)) {
        listCart.classList.add("open-cart")
    }
})