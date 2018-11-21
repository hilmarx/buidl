function submitOnUpload () {
  const file = document.querySelector('.file')
  if (file) {

    file.addEventListener('change', (event) => {
      const form = document.getElementById('edit_profile_2')
      form.submit()
    })
  }
  // file.onchange = function() {
  // }
}


function submitOnUploadUser () {
  const file = document.querySelector('.file')
  file.addEventListener('change', (event) => {
    const form = document.getElementById('edit_profile_1')
    form.submit()
  })
}

function submitOnUploadProject () {
  const file = document.querySelector('.file')
  file.addEventListener('change', (event) => {
    const forms = document.querySelectorAll('edit_project')
    forms.forEach(form => form.submit())
  })
}



export {submitOnUpload}
export {submitOnUploadUser}
export {submitOnUploadProject}
