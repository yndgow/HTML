$(() => {
  for (let i = 2; i <= 5; i++) {
    $('.category > li:nth-child(' + i + ')').on('mouseover', () => {
      $('.category li:nth-child(' + i + ') > ol:nth-of-type(1)').css('visibility','visible');
    });
  }
  $('#menu > li').on('mouseout', () => {
    $('.category li > ol').css('visibility', 'hidden');
  });
  $('.sub_categori').on('mouseover', () => {
    $(this).css('visibility', 'visible');
  });
});
