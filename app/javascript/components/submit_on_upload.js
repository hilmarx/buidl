function submitOnUpload () {
  const file = document.querySelector('.file')
  file.addEventListener('change', (event) => {
    const form = document.getElementById('edit_profile_2')
    form.submit()
  })
  // file.onchange = function() {
  // }
}

export {submitOnUpload}
