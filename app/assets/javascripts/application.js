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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require summernote/summernote-bs4.min
//= require summernote-init
//= require activestorage
//= require turbolinks
//= require_tree .
//= require social-share-button

$(window).on("turbolinks:load",function(){
// ここから文字を<span></span>で囲む記述
$('.typ').children().andSelf().contents().each(function() {
if (this.nodeType == 3) {
$(this).replaceWith($(this).text().replace(/(\S)/g, '<span>$1</span>'));
}
});
// ここから一文字ずつフェードインさせる記述
$('.typ').css({'opacity':1});
for (var i = 0; i <= $('.typ').children().size(); i++) {
$('.typ').children('span:eq('+i+')').delay(100*i).animate({'opacity':1},50);
};
});

$(function () {
  $("textarea").keyup(function(){
    var counter = $(this).val().length;
    $("#countUp").text(counter);

    if(counter == 0){
      $("#countUp").text("0");
    }
    if(counter >= 10){
      $("#countUp").css("color","red");
    } else {
      $("#countUp").css("color","#666");
    }
  });
});

$(document).ready(function () {
  $("#top-box").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類('div' or 'img')
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 3000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});
