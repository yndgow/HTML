$(() => {
  // 무한슬라이드를 위한 이미지태그 복사(31231순으로 만들어주기위해)
  $('.slide').each(function () {
    let firstImg = $(this).find('img:first').clone(); // 처음 이미지 복사
    let lastImg = $(this).find('img:last').clone(); // 마지막 이미지 복사
    $(this).append(firstImg); // 처음 이미지 마지막 뒤에 붙이기
    $(this).prepend(lastImg); // 마지막 이미지 처음 앞에 붙이기
    $(this).css('transition', 'none'); // 새로고침시 움직임 없애기
    $(this).css('left', '-380px'); // 보여줄 이미지 위치 변경
  });

  // 상품별 슬라이드 이벤트
  // 슬라이드 Next
  $('.btnNext').on('click', function (e) {
    e.stopPropagation(); // 이벤트 위임 금지
    let classNames = $(this).attr('class'); // 클래스 이름 변수
    slideImg($(this), classNames); // 함수 실행
  });
  // 슬라이드 Prev
  $('.btnPrev').on('click', function (e) {
    e.stopPropagation(); // 이벤트 위임 금지
    let classNames = $(this).attr('class'); // 클래스 이름 변수
    slideImg($(this), classNames); // 함수 실행
  });
  // 슬라이드 버튼 마우스 오버시 나타내기
  $('.product-one').on('mouseover mouseout', function () {
    $(this).find('p').toggleClass('active');
  });
  // 필터 마우스 오버시 나타내기
  $('.detail-filter-current').on('mouseover', function () {
    $('.detail-filter-option').addClass('active');
  });
  $('.detail-filter-option').on('mouseover', function () {
    $('.detail-filter-option').addClass('active');
  });
  $('.detail-filter-current').on('mouseout', function () {
    $('.detail-filter-option').removeClass('active');
  });
  $('.detail-filter-option').on('mouseout', function () {
    $('.detail-filter-option').removeClass('active');
  });
  // 필터 클릭시 정렬
  $('.option-list').on('click', function () {
    let href = $(this).children('a').attr('href');
    console.log(href);
    location.href = href;
  });

  // TODO
  $('.product-all-btn').on('click', function () {
    alert('모두 보기 ajax');
  });

  // 상세보기로 이동
  // $('.product-one').click(function (e) {
  //   let productId = $(this).attr('id');
  //   location.href = `http://localhost:90/CUGGI/product/detail?productId=${productId}`;
  // });
});

//
//
//  함수 영역
/* 무한슬라이드 함수 */
/*
  이미지 ABC 있다고 가정할때, 무한슬라이드 하기위해서 CABCA 이런식으로 배치해준다.
  4번째 C에서 A로 이미지가 넘어갔을때 현재 나타내는 위치를 2번째 A로 바꿔준다.
  그 후 다시 B-C 로 넘어가게 만들어준다.
*/

let isClickEnabled = true; // 중복방지 변수
// tag : 슬라이드 이미지를 감싸고 있는 태그 넣기
function slideImg(tag, classNames) {
  if (!isClickEnabled) return; // 클릭 이벤트가 비활성화된 경우 함수를 빠져나감

  const slide = $(tag).siblings('.slide'); // slide 변수화
  const curLeft = parseInt(slide.css('left')); // left 값
  const slideWidth = slide.width(); // 슬라이드 총 길이
  const imgCount = slide.children('img').length; // 이미지 개수
  const imgOneWidth = slideWidth / imgCount; // 이미지 하나의 총 길이(마진을 포함한) 380
  const maxLength = -(imgOneWidth * (imgCount - 2)); // 한 슬라이드의 총 길이(복사한 이미지를 제외한)
  const startImgVal = 0; // 첫 이미지의 left 값

  // 슬라이드 일반 동작(Next)
  const transitionSlide = (newleft) => {
    slide.css('transition', 'left 0.5s ease-out'); // 슬라이드 애니메이션 효과
    slide.css('left', newleft + 'px'); // css 변경으로 이동
  };

  // 무한 슬라이드 동작시
  const resetSilde = (newleft, imgPostion) => {
    slide.css({ transition: 'none', left: imgPostion }); // 마지막 이미지(복사) 도착시 첫 이미지(원본)로 돌아가고 표시하지 않기위해 애니메이션 삭제
    requestAnimationFrame(() => {
      transitionSlide(newleft); // 애니메이션 프레임 확보를 위한?
    });
  };

  // 슬라이드 Next
  if (classNames.includes('btnNext')) {
    if (curLeft != maxLength) {
      transitionSlide(curLeft - imgOneWidth); // 현재 값에서 다음에 올 이미지 길이만큼 뺀 값(이동할 거리)
    } else {
      resetSilde(startImgVal - imgOneWidth, startImgVal); // 첫이미지에서 다음 이미지로 이동할 left 값, 첫 이미지 left 값
    }
  }
  // 슬라이드 Prev
  if (classNames.includes('btnPrev')) {
    if (curLeft != startImgVal) {
      transitionSlide(curLeft + imgOneWidth); // 현재 값에서 다음에 올 이미지 길이만큼 더한 값(이동할 거리)
    } else {
      resetSilde(maxLength + imgOneWidth, maxLength); // 마지막 이미지에서 이전 이미지로 이동할 left값, 마지막 이미지 left 값
    }
  }

  isClickEnabled = false; // 중복 방지 변수
  setTimeout(function () {
    // 일정시간후 변수 바꾸기
    isClickEnabled = true;
  }, 500);
}
