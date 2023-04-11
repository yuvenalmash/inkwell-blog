document.addEventListener('click', function (event) {
  if(event.target.matches('.like-link')) {
    event.preventDefault();
    const postId = event.target.dataset.postId;
    const likeCount = document.querySelector(`#likes-counter-${postId}`);
    const likeCountValue = parseInt(likeCount.textContent);
    const likeCountNewValue = likeCountValue + (event.target.textContent === 'Like' ? 1 : -1);
    likeCount.textContent = likeCountNewValue;

    const likeLink = document.querySelector(`#like-link-${postId}`);
    likeLink.textContent = likeLink.textContent === 'Like' ? 'Unlike' : 'Like';
  }
});

document.addEventListener('click', function (event) {
  if(event.target.matches('.comment-link')) {
    event.preventDefault();
    const postId = event.target.dataset.postId;
    const commentForm = document.querySelector(`#comment-form-${postId}`);
    commentForm.style.display = commentForm.style.display === 'none' ? 'block' : 'none';
  }
});
