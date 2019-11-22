
    const button = document.querySelector('#find-trip-button');
const smoothScroll = () => {
  button.addEventListener('click', (event) => {
var element = document.querySelector("#index-search-header");
element.scrollIntoView({ behavior: 'smooth'});
});
}

export default smoothScroll;
