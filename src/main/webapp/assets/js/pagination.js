console.log(dataLength)
let startIndex = 0;
let endIndex = dataLength;
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
    return Math.ceil(dataLength / rowPerPage);
}


function setStartEnd(page) {
    let numPage = document.getElementById("page");
    numPage.value = page.toString() + "/" + getTotalPages().toString()
    startIndex = (page - 1) * rowPerPage;
    endIndex = startIndex + rowPerPage;
    let inputElement = document.getElementById("st");
    inputElement.value = startIndex;
}

setStartEnd(currentPage)
