$('.submenu').hide();

$('.menu').on('click', () => {
  $('.submenu').slideDown('slow');
});

$('.close').on('click', (e) => {
  e.stopPropagation();
  $('.submenu').slideUp('fast');
});

// 검색 영역 토글 이벤트
$('.searchBtn').on('click', function () {
  $('.search-area').toggle();
});
// 회원 이벤트
$('.profileBtn').on('click', function () {
  alert('회원 이벤트');
});

$('.basketBtn').on('click', function () {
  alert('장바구니 이벤트');
});

// 검색 유효성, submit이벤트
$('#searchForm').on('submit', function (e) {
  let input = $(this).children('#searchInput');
  let searchData = input.val().trim();
  if (searchData < 1) {
    e.preventDefault();
    input.css('border', '1px solid #CC0000');
    alert('1자 이상의 검색어를 입력하세요.');
  } else {
    input.css('border', '1px solid #000');
  }
});
