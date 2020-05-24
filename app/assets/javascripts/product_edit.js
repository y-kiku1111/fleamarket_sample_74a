$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="edit-child_category" name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.new_page_main__category').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                              <div class='listing-select-wrapper__box'>
                                <select class="listing-select-wrapper__box--select" id="edit-grandchild_category" name="product[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.new_page_main__category').append(grandchildSelectHtml);
  }

  $('#edit-parent_category').on('change', function(){
    $('#edit-child_category').remove();
    $('#edit-grandchild_category').remove();
    var edit_parentCategory = document.getElementById('edit-parent_category').value;
    if (edit_parentCategory != "---"){ 
      $.ajax({
        url: '/products/get_edit_category_children',
        type: 'GET',
        data: { parent_name: edit_parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  $(document).on('change', '#edit-child_category', function(){
    $('#edit-grandchild_category').remove();
    var childId =  document.getElementById('edit-child_category').value;
    if (childId != "---"){
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });


    const buildFileField = (num)=> {
      if (num < 10) {
      const html = `<div data-index="${num}" class="js-file_group">  
                      <input class="js-file" type="file"
                      name="product[product_photos_attributes][${num}][photo]"
                      id="product_images_attributes_${num}_src"><br>
                      <div class="js-remove">削除</div>
                    </div>`;
      return html;} else {
        return false;
      }
    }
    const buildImg = (index, url)=> {
      const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
      return html;
    }
  
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);
  
    $('.hidden-destroy').hide();
  
    $('#edit-image-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
  
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
        $('#edit-image-box').append(buildFileField(fileIndex[0]));
      } else {
        $('#previews').append(buildImg(targetIndex, blobUrl));
        $('#edit-image-box').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
    });
  
    $('#edit-image-box').on('click', '.js-remove', function() {
      const targetIndex = $(this).parent().data('index');
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      if (hiddenCheck) hiddenCheck.prop('checked', true);
  
      $(this).parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
  
      if ($('.js-file').length == 0) $('#edit-image-box').append(buildFileField(fileIndex[0]));
    });
});