/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]banner.css
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.10       권나연         신규생성
 * -----------------------------------------------------------
 */

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