$(function(){
  loadPhotos();
});

function loadPhotos(){
  if($('#category-showcase').length>0){
    $('#photos .photo').each(function(){
      var photo = $(this);
      var wrapper = photo.find('.image-wrapper');
      var url = photo.attr('rel');
      $.get(url, {}, function(data){
        $(data).load(function(){
          wrapper.css({
            'height':$(this).height(),
            'width':$(this).width(),
            'background-image':'none'
          });
          $(this).fadeIn(500, 'linear');
        })
        .hide()
        .appendTo(wrapper.find('.img-wrapper-link'));
      });
    });
  }
}
