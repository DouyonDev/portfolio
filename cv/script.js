/**
 * CV PROFESSIONNEL A4 — ABDOUlAYE DOUYON
 * Interactive Controls & A4 PDF Engine
 */

let isEditMode = false;
let isPhotoVisible = true;

// Change Color Theme
function changeTheme(themeName) {
  document.body.className = themeName;
  localStorage.setItem('cv_preferred_theme', themeName);
}

// Toggle Profile Photo (ATS Compliance vs Standard Photo)
function togglePhoto() {
  const photoBlock = document.getElementById('profile-photo-block');
  const btnText = document.getElementById('photo-btn-text');
  
  isPhotoVisible = !isPhotoVisible;
  
  if (isPhotoVisible) {
    photoBlock.classList.remove('hidden');
    btnText.textContent = "Masquer Photo (ATS)";
  } else {
    photoBlock.classList.add('hidden');
    btnText.textContent = "Afficher Photo";
  }
}

// Toggle Live Editable Text Mode
function toggleEditMode() {
  isEditMode = !isEditMode;
  const editBtnText = document.getElementById('edit-btn-text');
  const editableElements = document.querySelectorAll(
    '.candidate-name, .candidate-title, .profile-summary p, .job-title, .job-company, .job-duties li, .item-role, .item-sub, .project-title, .project-desc, .sidebar-title'
  );

  editableElements.forEach(el => {
    el.setAttribute('contenteditable', isEditMode ? 'true' : 'false');
  });

  if (isEditMode) {
    editBtnText.textContent = "Terminer l'édition";
    document.getElementById('toggle-edit-btn').classList.add('btn-primary');
    document.getElementById('toggle-edit-btn').classList.remove('btn-outline');
  } else {
    editBtnText.textContent = "Éditer le texte";
    document.getElementById('toggle-edit-btn').classList.remove('btn-primary');
    document.getElementById('toggle-edit-btn').classList.add('btn-outline');
  }
}

// Native Print Window
function printCV() {
  // Turn off edit mode outline before printing
  if (isEditMode) {
    toggleEditMode();
  }
  window.print();
}

// 1-Click High-Quality A4 PDF Export
function exportPDF() {
  if (isEditMode) {
    toggleEditMode();
  }

  const cvContent = document.getElementById('cv-content');

  // Configure html2pdf for perfect A4 output
  const options = {
    margin: 0,
    filename: 'CV_Abdoulaye_DOUYON_FullStack.pdf',
    image: { type: 'jpeg', quality: 0.98 },
    html2canvas: {
      scale: 2,
      useCORS: true,
      logging: false,
      windowWidth: 1000
    },
    jsPDF: {
      unit: 'mm',
      format: 'a4',
      orientation: 'portrait'
    }
  };

  // Show visual indicator or notification
  const downloadBtn = document.querySelector('.btn-primary');
  const originalText = downloadBtn.innerHTML;
  downloadBtn.innerHTML = `<i class="fa-solid fa-spinner fa-spin"></i> Génération du PDF...`;
  downloadBtn.disabled = true;

  html2pdf().set(options).from(cvContent).save().then(() => {
    downloadBtn.innerHTML = originalText;
    downloadBtn.disabled = false;
  }).catch(err => {
    console.error('Erreur lors de la génération PDF:', err);
    downloadBtn.innerHTML = originalText;
    downloadBtn.disabled = false;
    alert('Une erreur est survenue lors de la génération du PDF. Vous pouvez utiliser le bouton "Imprimer" et choisir "Enregistrer au format PDF".');
  });
}

// Restore saved preference on load
document.addEventListener('DOMContentLoaded', () => {
  const savedTheme = localStorage.getItem('cv_preferred_theme');
  if (savedTheme) {
    document.body.className = savedTheme;
    const themeSelect = document.getElementById('theme-select');
    if (themeSelect) themeSelect.value = savedTheme;
  }
});
