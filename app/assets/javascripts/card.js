document.addEventListener(
  "DOMContentLoaded", e => {

    if (document.getElementById("token_submit") != null) { 
      Payjp.setPublicKey("pk_test_3ec52b536b224b110b5fd750"); 
      let btn = document.getElementById("token_submit"); 
      btn.addEventListener("click", e => { 
        e.preventDefault(); /
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };

        Payjp.createToken(card, (status, response) => {
          if (status === 200) { 
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); 
            $("#card_token").append(
              $('<input type="hidden" name="payjp_token">').val(response.id)
            ); 
            document.inputForm.submit();
            alert("クレジットカードの登録が完了しました。"); 
          } else {
            debugger
            alert("入力された情報が正しくありません。再度お試しください。"); 
          }
        });
      });
    }
  },
  false
);