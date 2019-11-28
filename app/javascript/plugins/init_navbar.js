const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  let brand = document.querySelector('.navbar-brand');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
        brand.innerHTML = `<img id="logo" height="auto" width="185" crop="thumb" gravity="face" src="/assets/goflamingo-logo-black.png">`
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        brand.innerHTML = `<img id="logo" height="auto" width="185" crop="thumb" gravity="face" src="/assets/goflamingo-logo-white.png">`
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
