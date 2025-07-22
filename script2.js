const profilePicBtn = document.getElementById("profilePicBtn");
const dropdownContent = profilePicBtn.querySelector(".dropdown-content");

// Toggle visibility of dropdown content on double click
profilePicBtn.addEventListener("dblclick", function() {
  dropdownContent.classList.toggle("show");
});

// Close dropdown content when clicking outside of it
document.addEventListener("click", function(event) {
  if (!profilePicBtn.contains(event.target)) {
    dropdownContent.classList.remove("show");
  }
});

// Script to keep the dropdown menu open when hovering over it
// document.getElementById("dropdownContent").addEventListener("mouseenter", function() {
//     this.style.display = "block";
//   });
  
//   document.getElementById("dropdownContent").addEventListener("mouseleave", function() {
//     this.style.display = "none";
//   });
  