/* 배너 이미지 슬라이드 */
var swiper = new Swiper('.swiper-container', {
  pagination : {
    el : '.swiper-pagination',
  },
  navigation : {
    nextEl : '.swiper-button-next',
    prevEl : '.swiper-button-prev',
  },
  autoplay : {
    delay : 5000,
  },
});