$(function() {
  $('#books div.table-sortable div.sortable a, #books .pagination a').on({
    'click':function(){
      console.log("lalala")
      $.getScript(this.href);
      return false;
    }
  });    

  $("#books_search input").keyup(function() {
    $.get($("#books_search").attr("action"), $("#books_search").serialize(), null, "script");
    return false;
  });

});