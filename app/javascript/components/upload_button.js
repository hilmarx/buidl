function uploadButton () {
  const fakeButton = document.getElementById('upload-fake-btn') //this is the font awesome

  fakeButton.addEventListener("click", (event) => {
    event.preventDefault();

    const targetedButton = document.getElementById('profile_photo')
    targetedButton.click()
  });
}

function uploadButtonProject () {
  const fakeButton = document.getElementById('upload-fake-btn-project') //this is the font awesome
  fakeButton.addEventListener("click", (event) => {
    event.preventDefault();
    console.log('hello')

    const targetedButton = document.getElementById('project_photo')
    targetedButton.click()
  });
}





export {uploadButton}
export { uploadButtonProject }
