console.log(data)
const rowPerPage = 5
let currentPage = 1;

function previousPages() {
    if (currentPage > 1) {
        currentPage--;
        displayPage(currentPage)
    }
}

function nextPages() {
    if (currentPage < getTotalPages()) {
        currentPage++;
        displayPage(currentPage);
    }
}

function displayPage(page) {
    const startIndex = (page - 1) * rowPerPage;
    const endIndex = startIndex + rowPerPage;
    const pageData = data.slice(startIndex, endIndex);
    console.log(pageData);
    const listAccount = document.getElementsByClassName('list-accounts')[0]
    for (let i = 0; i < pageData.length; i++) {
        const {username, fullName, email, phoneNumber, dob, role, id} = pageData[i]
        listAccount.innerHTML += `
        <tr>
             <td>${username}</td>
             <td>${fullName}</td>
             <td>${email}</td>
             <td>${phoneNumber}</td>
             <td>${dob}</td>
             <td>${role}</td>
             <td>
                 <button class="btn-edit">Sửa</button>
                     <form method="post" action="/admin/account?act=delete">
                         <input type="hidden" name="accountId" value="${id}">
                         <button class="btn-delete" type="submit">Xóa</button>
                     </form>
             </td>
        </tr>
        `;
    }
}

function getTotalPages() {
    return Math.ceil(data.length / rowPerPage);
}
numPage = document.getElementById("currentPage");
numPage.innerText = currentPage.toString()+"/"+getTotalPages().toString()

displayPage(currentPage)