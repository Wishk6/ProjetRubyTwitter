function logoutPopUp() { /* toggle logoutBtn */

   let lgtBtn = document.getElementById('lgtBtn');
    if (lgtBtn.className == 'logoutBtnHidden') {
        lgtBtn.classList.remove("logoutBtnHidden");
        lgtBtn.classList.add("logoutBtn");
    } else {
        lgtBtn.classList.remove("logoutBtn");
        lgtBtn.classList.add("logoutBtnHidden");
    }
}