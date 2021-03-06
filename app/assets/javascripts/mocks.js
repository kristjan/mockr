$(function() {

  var documentClicked = function(e) {
    if ($(e.target).parents('#mock').length == 0 ||
      ($(".next-comment-marker").is(":visible") &&
       $(e.target).parents('.comment-board').length == 0)) {
      clearNextCommentMarker();
    } else if ($(".next-comment-marker").is(":hidden")) {
      setNextCommentMarker(e);
    }
  };

  var commentingFinished = function(e) {
    e.stopPropagation();
    e.preventDefault();
    clearNextCommentMarker();
  };

  var clearNextCommentMarker = function() {
    $(".next-comment-marker").hide();
    $("#comment_left_offset_percentage").val("");
    $("#comment_top_offset_percentage").val("");
  };

  var setNextCommentMarker = function(e) {
    var mock = $("#mock");
    var image = mock.find("img");
    var dot = mock.find(".next-comment-marker");
    var offset = mock.offset();
    var leftOffsetPercentage =
      parseInt(e.pageX - offset.left) / image.width() * 100;
    var topOffsetPercentage =
      parseInt(e.pageY - offset.top) / image.height() * 100;

    dot.show().css(
      {top: topOffsetPercentage + "%", left: leftOffsetPercentage + "%"});

    $("#comment_left_offset_percentage").val(leftOffsetPercentage);
    $("#comment_top_offset_percentage").val(topOffsetPercentage);
  };

  $(".cancel-commenting").click(commentingFinished);
  $(document).click(documentClicked);
});
