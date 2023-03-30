// window.onclick = (event) => {
//     const modalCategoryAcc = document.getElementById('modalAddCategoryAcc');
//     if (event.target == modalCategoryAcc) {
//         modalCategoryAcc.style.display = "none";
//     }
// }


// TIMER

const timer = document.getElementById('timer');
const DAYOFWEEK = ['Chủ nhật', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ5', 'Thứ 6', 'Thứ 7'];

const showTimer = () => {
    const time = new Date();
    timer.innerText = `${DAYOFWEEK[time.getDay()]}, ${time.getDate()}/${time.getMonth()}/${time.getFullYear()} - ${time.getHours()} giờ ${time.getMinutes()} phút ${time.getSeconds()} giây`;
};

showTimer()
setInterval(() => {
    showTimer();
}, 1000);


// ACCOUNT

function handleOpenModal(e) {
    const modal = document.getElementById(`${e.value}`);
    modal.style.display = "block";
}

function handleCloseModal(e) {
    const modal = document.getElementById(`${e.value}`);
    modal.style.display = "none";
}

// handle image input
function handlePutNewImg(e) {
    const fileInput = document.getElementById('imageInput');
    const imageLabel = fileInput.previousElementSibling;
    const img = imageLabel.querySelector('img');
    const file = e.files[0];
    const reader = new FileReader();
    reader.addEventListener('load', () => {
        img.setAttribute('src', reader.result);
        img.style.display = 'block';
    });
    reader.readAsDataURL(file);
}


// ORDER

// btn add product in order
let indexProd = 0;
let indexSize = 0;
window.onload = () => {
    indexSize = indexProd = 0;
}
function addProductInOrder() {
    const listProduct = document.getElementsByClassName('list-product')[0];
    listProduct.innerHTML += `
        <div class="form-group-line">
            <div class="form-line">
                <label for="codeProduct${indexProd}">Mã sản phẩm:</label>
                <input type="text" id="codeProduct${indexProd}" name="codeProduct${indexProd}">
            </div>

            <div class="form-line">
                <label for="nameProduct${indexProd}">Tên sản phẩm:</label>
                <input type="text" id="nameProduct${indexProd}" name="nameProduct${indexProd}">
            </div>

            <div class="form-line">
                <label for="priceProduct${indexProd}">Đơn giá:</label>
                <input type="number" id="priceProduct${indexProd}" name="priceProduct${indexProd}">
            </div>

            <div class="form-line">
                <label for="quantityProduct${indexProd}">Số lượng:</label>
                <input type="number" id="quantityProduct${indexProd}" name="quantityProduct${indexProd}">
            </div>
        </div>
    `;
    indexProd++;
}


// PRODUCT

// handle add new size
function addSizeInProduct() {
    const listSize = document.getElementsByClassName('list-size')[0];
    listSize.innerHTML += `
        <div class="item-size">
            <div>
                <label for="size">Size:</label>
                <input type="text" id="size${indexSize}" name="size${indexSize}">
            </div>
            <div>
                <label for="size${indexSize}">Số lượng:</label>
                <input type="number" id="size${indexSize}" name="size${indexSize}" value="0">
            </div>
        </div>
    `;
    indexSize++;
}


// handle image input
const handleImageInput = () => {
    const fileInputs = document.getElementsByClassName('image-input');
    const imageLabels = [];
    const imgs = [];
    for (let i = 0; i < fileInputs.length; i++) {
        imageLabels.push(fileInputs[i].previousElementSibling);
        imgs.push(imageLabels[i].querySelector('img'));
        fileInputs[i].addEventListener('change', function () {
            const file = this.files[0];
            const reader = new FileReader();
            reader.addEventListener('load', () => {
                imgs[i].setAttribute('src', reader.result);
                imgs[i].style.display = 'block';
            });
            reader.readAsDataURL(file);
        });
    }
};



// btn add new image
let indeximg = 0;
function addImgInProduct() {
    const listImage = document.getElementsByClassName('list-image')[0];
    listImage.innerHTML += `
        <div class="item-image">
            <label for="imageInput${indeximg}">
                <p>Chọn ảnh</p>
                <img style="display: none;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/2048px-Solid_white.svg.png" alt="">
            </label>
            <input class="image-input" id="imageInput${indeximg}" type="file" name="imageInput${indeximg}">
        </div>
    `;
    indeximg++;
    handleImageInput();
}




// // btn reset event
// const btnReset = document.getElementsByClassName('reset')[0];
// btnReset.addEventListener('click', () => {
//     for (let i = 0; i < imgs.length; i++) {
//         imgs[i].setAttribute('src', '');
//     }
// });


