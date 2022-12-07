$(() => {
  for (let i = 2; i <= 5; i++) {
    $(".category > li:nth-child(" + i + ")").on("mouseover", () => {
      $(".category li:nth-child(" + i + ") > ol:nth-of-type(1)").css("visibility", "visible");
    });
  }
  $("#menu > li").on("mouseout", () => {
    $(".category li > ol").css("visibility", "hidden");
  });
  $(".sub_categori").on("mouseover", () => {
    $(this).css("visibility", "visible");
  });
  // 수량증감 버튼
  $(".descBtn").click(() => {
    let num = $("input[name=num]").val();
    num = Number(num);
    if (num > 1) num -= 1;
    $("input[name=num]").val(num);
  });
  $(".incrBtn").click(() => {
    let num = $("input[name=num]").val();
    num = Number(num);
    if (num < 100) num += 1;
    $("input[name=num]").val(num);
  });
});
