const startCaptureButton = document.getElementById('start');

startCaptureButton.addEventListener('click', () => {
  const servletName = 'FaceDetectionVideoCapture'; // Replace with your actual servlet name
  const url = `/${servletName}`;

  fetch(url)
    .then(response => {
      console.log(response); // Log the response from the server
      if (response.status === 200) {
        showPopupNotification('Success', 'Face capture started!');
      } else {
        showPopupNotification('Error', 'Failed to start face capture.');
      }
    })
    .catch(error => {
      console.error(error);
      showPopupNotification('Error', 'An error occurred while communicating with the server.');
    });
});

function showPopupNotification(title, message) {
  // Create a Bootstrap modal element
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">${title}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>${message}</p>
        </div>
      </div>
    </div>
  `;

  // Append the modal to the document body
  document.body.appendChild(modal);

  // Show the modal
  $(modal).modal('show');

  // Remove the modal from the DOM after it's hidden
  $(modal).on('hidden.bs.modal', () => {
    document.body.removeChild(modal);
  });
}
