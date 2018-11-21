function submitOnUpload () {
  const file = document.querySelector('.file')
  file.addEventListener('change', (event) => {
    const form = document.getElementById('form')
    form.submit()
  })

  // file.onchange = function() {
  // }
}


function submitOnUploadUser () {
  const file = document.querySelector('.file')
  file.addEventListener('change', (event) => {
    console.log(event)
    const form = document.querySelector('.edit_profile')
    console.log(form)
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
