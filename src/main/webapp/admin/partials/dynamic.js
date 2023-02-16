var dropdownAccount = document.getElementsByClassName('dropdown-account-link')[0];
var btnAcountItem = document.getElementsByClassName('account-item')[0];

btnAcountItem.addEventListener('click', () => {
    dropdownAccount.classList.contains('open-dropdown') ? dropdownAccount.classList.remove('open-dropdown') : dropdownAccount.classList.add('open-dropdown');
});


var sidebar = document.getElementsByClassName('sidebar')[0];
var btnSidebar = document.getElementsByClassName('btn-sidebar')[0];

btnSidebar.addEventListener('click', () => {
    sidebar.classList.contains('open-sidebar') ? sidebar.classList.remove('open-sidebar') : sidebar.classList.add('open-sidebar');
});
