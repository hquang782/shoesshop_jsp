const $ = document.querySelector.bind(document);

const listCart = [
    {
        id: 1,
        name: "Nike Air Force 1 LV8",
        price: 1100,
        soLuong: 25,
        img: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/46fc5159-8892-472c-acc9-a216d85123ed/air-force-1-lv8-big-kids-shoes-8JtCbS.png"
    },
    {
        id: 2,
        name: "Air Jordan 1 LV8",
        price: 1000,
        soLuong: 30,
        img: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/dadbbaff-8566-427f-9a3c-23b1277cc71d/air-jordan-1-elevate-low-se-womens-shoes-Q630Pk.png"
    },
]

//  xử lý khi hover vào icon cart

const keyLocalStorageItemCart ="DANHSACHITEMCART"

//  luu du lieu vaof localstorage
const setDataStorage = (key, value) => {
    localStorage.setItem(key, value)
}
setDataStorage(keyLocalStorageItemCart, JSON.stringify(listCart))

// lấy dữ liệu từ Storage
const getDataStorage = (key) => {
    return JSON.parse(localStorage.getItem(key))
}



const handleHoverWrap =() => {
    const listcart=getDataStorage(keyLocalStorageItemCart)
    $(".header__cart-list").style.display="block";
    if(listcart.length ===0 )
    {
        $(".list-cart-item").style.display="none";
        $(".no-cart").style.display="block"
    }else
    {
        $(".no-cart").style.display = "none";
        $(".list-cart-item").style.display = "block";
    }
    const main = $(".header__cart-list-item")
    if (main) {
        const item = listcart.map((data, index) => {
            return `
            <li class="header__cart-item">
                <div class="header__cart-item-img">
                    <img src="${data.img}" class="product-img" alt="loi">
                </div>
                <div class="header__cart-item-info">
                    <p class="header__cart-item-info-name">${data.name}</p>
                    <p class="header__cart-item-info-price">$ ${data.price}</p>
                </div>   
            </li>
            <hr class="item_hr" />
           `
        })
        main.innerHTML = item.join("")
    }
}
const handleOutHoverWrap = () => {
    $(".header__cart-list").style.display = "none";
}