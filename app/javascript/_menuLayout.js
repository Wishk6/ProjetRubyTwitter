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

function openModal() {
    let modal = document.getElementById('modal');
    modal.style.display = "flex";
}

function closeModal() {
    let modal = document.getElementById('modal');
    modal.style.display = "none";
}

window.onclick = function(event) {
    let modal = document.getElementById('modal');
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }