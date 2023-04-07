/*-------PRODUCT--------*/

const mota = document.querySelector(".mota")
const thongso = document.querySelector(".thongso")
if(mota){
    mota.addEventListener("click", function(){
        document.querySelector(".product-content-right-bottom-content-mota").style.display ="block"
        document.querySelector(".product-content-right-bottom-content-thongso").style.display = "none"
    })
}
if(thongso){
    thongso.addEventListener("click", function(){
        document.querySelector(".product-content-right-bottom-content-mota").style.display = "none"
        document.querySelector(".product-content-right-bottom-content-thongso").style.display = "block"
    })
}
/**
 * Select img
 */

const bigImg = document.querySelector(".product-content-left-big-img img")
const smallImg = document.querySelectorAll(".product-content-left-small-img img")
smallImg.forEach(function(imgItem, X){
    imgItem.addEventListener("click", function(){
        bigImg.src = imgItem.src
    })
})

const butTon = document.querySelector(".product-content-right-bottom-top")
if(butTon){
    butTon.addEventListener("click", function(){
        document.querySelector(".product-content-right-bottom-content-big").classList.toggle("activeB")
    })
}
