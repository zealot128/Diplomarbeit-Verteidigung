$(function() {
	// Deck initialization
	$.deck('.slide');


  toc = $('<ul id="toc-ul"></ul>');
  $('h2').each(function(bla) {
    id = $(this).parent().attr("id")
    a = $('<a />').attr("href", "#" + id).html($(this).text())
    li = $('<li />').html(a)
    toc.append(li)
  });
  $('#toc').html(toc);

  author = $('#author').text()
  $('#author').remove();
  $('section').each(function() {
    span = $('<div class="slide-footer" />').html(author)
    $(this).append(span);
  });
});

