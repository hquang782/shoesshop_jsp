var dropdownAccount = document.getElementsByClassName('dropdown-account-link')[0];
var btnAcountItem = document.getElementsByClassName('account-item')[0];

btnAcountItem.addEventListener('click', () => {
    dropdownAccount.classList.contains('open-dropdown') ? dropdownAccount.classList.remove('open-dropdown') : dropdownAccount.classList.add('open-dropdown');
});


var sidebar = document.getElementsByClassName('sidebar')[0];
var btnSidebar = document.getElementsByClassName('btn-sidebar')[0];
var leftSide = document.getElementsByClassName('wrap-left')[0];
var rightSide = document.getElementsByClassName('wrap-right')[0];

btnSidebar.addEventListener('click', () => {
    if (sidebar.classList.contains('close') && leftSide.classList.contains('close')) {
        sidebar.classList.remove('close');
        leftSide.classList.remove('close');
        rightSide.classList.remove('max-width');
    } else {
        sidebar.classList.add('close');
        leftSide.classList.add('close');
        rightSide.classList.add('max-width');
    }
});
