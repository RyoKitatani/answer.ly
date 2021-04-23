$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      placeholder:"質問したい内容を記入しよう"
      height: 300

$(document).on 'turbolinks:load', ->
  $('[data-provider1="summernote"]').each ->
    $(this).summernote
      placeholder: 'あなたの回答で質問者の悩みを解決しましょう。'
      height: 100
