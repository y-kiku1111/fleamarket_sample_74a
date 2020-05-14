$(function () {
  $("li.Header__left-nav--category").hover(function () {
    $("ul.category1").toggle();
  });
  $("li.Header__left-nav--category li").hover(function () {
    $(">ul", this).toggle();
  }, function () {
    $(">ul", this).toggle();
  });
});
