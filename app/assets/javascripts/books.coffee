

class Book
  @_timer: null
  
$(document).on 'change', '#book_index_form select#sort_on,#book_index_form select#sort_by', ->
  ur = new Book
  $('#books_list').html ' '
  $.get($("#book_index_form").prop('action'), $("#book_index_form").serialize(), null, "script")
  return false 