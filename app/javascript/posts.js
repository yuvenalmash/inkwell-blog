document.addEventListener('click', function (event) {
  if(event.target.matches('.like-link')) {
    event.preventDefault();
    const postId = event.target.dataset.postId;
    const likeCount = document.querySelector(`#likes-counter-${postId}`);
    const likeCountValue = parseInt(likeCount.textContent);
    const likeCountNewValue = likeCountValue + (event.target.textContent === 'Like' ? 1 : -1);
    likeCount.textContent = likeCountNewValue;
  }
});
