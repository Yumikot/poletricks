// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
// $(function(){
//   $('.like_btn').on('click',function(){
//     var $likeBtn = $(this);
//     var $trickId = $likeBtn.attr("trick_id");　　
//     $.ajax({
//       url: '/likes/'+ $trickId + '/create',　
//     }).done(function(data){
//       //ボタンの色を変える処理
//     });
//   });
// });
// $(function(){
//   $('.like_btn').on('click',function(){
//     var $likeBtn = $(this);
//     var $postId = $likeBtn.attr("post_id");
//     var $like = $(this).find('i');
//     var $btnClass = $like.attr("class");

//     var url = $btnClass == 'far fa-heart unlike' ? '/create' : '/destroy';

//     $.ajax({
//       url: '/likes/'+ $trickId + url,
//       type:'POST',
//     }).done(function(data){
//       if($like.hasClass('unlike')){
//         $like.removeClass('far unlike').addClass('fas like');
//       }else{
//         $like.removeClass('fas like').addClass('far unlike');
//       }
//     });
//   });
// });