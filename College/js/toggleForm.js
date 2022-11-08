document.addEventListener("DOMContentLoaded", function () {
    const callForm = document.getElementById("callForm");
    const form = document.getElementById("form");
    callForm.addEventListener("click", function () {
      form.style.visibility = "visible";
    });
    const closeForm = document.getElementById("closeForm");

    closeForm.addEventListener("click", function () {
      form.style.visibility = "hidden";
    });
  });