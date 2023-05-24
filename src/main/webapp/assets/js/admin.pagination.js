console.log(data)
const rowPerPage = 5
let startIndex=0;
let endIndex =data.length;
let currentPage = 1;

function previousPages() {
    if (currentPage > 1) {
        currentPage--;
        setStartEnd(currentPage)
    }
}

function nextPages() {
    if (currentPage < getTotalPages()) {
        currentPage++;
        setStartEnd(currentPage)
    }
}
function getTotalPages() {
    return Math.ceil(data.length / rowPerPage);
}
numPage = document.getElementById("currentPage");
numPage.innerText = currentPage.toString()+"/"+getTotalPages().toString()

function setStartEnd(page){
     startIndex = (page - 1) * rowPerPage;
     endIndex = startIndex + rowPerPage;
    let inputElement = document.getElementById("st");
    inputElement.value = startIndex;
}
setStartEnd(currentPage)