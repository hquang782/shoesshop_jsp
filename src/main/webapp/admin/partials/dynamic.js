var dropdownAccount = document.getElementsByClassName('dropdown-account-link')[0];

function clickAccountItem(e) {
    dropdownAccount.classList.contains('open-dropdown') ? dropdownAccount.classList.remove('open-dropdown') : dropdownAccount.classList.add('open-dropdown');
}
