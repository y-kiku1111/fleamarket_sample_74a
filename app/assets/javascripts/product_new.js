$(function(){
  $( document ).on( 'change', '#price-result', function(){
    var s = $( this ).val();
    var result_tax = s / 10;
    var result_profit = s * 0.9;
    $('.haihun_tax').html(result_tax);
    $('.haihun_profit').html(result_profit);
  });
});
