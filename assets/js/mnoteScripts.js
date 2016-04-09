sidebar_width = $("#sidebar-wrapper").css("width");
$("#sidebar-wrapper2").css("left", sidebar_width);

$(".menu-toggle").each(
		function() {
			$(this).click(
					function(e) {
						e.preventDefault();
						sidebar_width = $("#sidebar-wrapper").css("width");
						$.post("note", {notebookId: $(this).attr("name")}, function(data) {
							$("li").remove(".note");
							$.each(data, function(i, note) {
								$("#notes").append(
										"<li class='note' name="+note.id+" onClick='getNote(this)'><a href='#'>" + note.title
												+ "</a></li>");
							});
						});
						$("#notebook_name").html($(this).html());
						$("#sidebar-wrapper2").css("left", "0px");
						$("#sidebar-wrapper2").css("width",
								sidebar_width);
						$("#submit").attr("bookId", $(this).attr("name"));
					});
});

$(".menu-toggle2").each(function() {
	$(this).click(function(e) {
		e.preventDefault();
		sidebar_width = $("#sidebar-wrapper").css("width");
		$("#sidebar-wrapper2").css("left", sidebar_width);
		$("#sidebar-wrapper2").css("width", "0px");
	});
});

function getNote(target) {
	$("#submit").attr("noteId", target.getAttribute("name"));
	$("#refresh").attr("noteId", target.getAttribute("name"));
	$.post("getNote", {
		id : target.getAttribute("name")
	}, function(data) {
		$.each(data, function(i, note) {
			$("#title").val(note.title);
			$("#txtEditor").Editor("setText", note.content);
		});
	});

}

$("#submit").click(function(e) {
	$.post("setNote", {
		"note.id" : $(this).attr("noteId"),
		"note.title" : $("#title").val(),
		"note.notebookId" : $(this).attr("bookId"),
		"note.content" : $("#txtEditor").Editor("getText")
	}, function(data) {
		alert("submit completed!");
	});
});

$("#refresh").click(function(e) {
	$.post("getNote", {
		id : $(this).attr("noteId")
	}, function(data) {
		$.each(data, function(i, note) {
			$("#title").val(note.title);
			$("#txtEditor").Editor("setText", note.content);
		});
	});
});

$("#close").click(function(e) {
	$("#title").val("");
	$("#txtEditor").Editor("setText", "");
	$("#submit").removeAttr("noteId");
	$("#refresh").removeAttr("noteId");
});

$(document).ready(function() {
	$("#txtEditor").Editor();
});

$("#input-form").on('submit', function(event) {
	var input = $('#newNotebook'), value = input.val();
	event.preventDefault();
	if (value) {
		var id = generateId();
		createReminder(id, value);
		input.val('');
	}
});

function generateId() {
	return "reminder-" + +new Date();
}

function createReminder(id, content) {
	var reminder = '<li id="' + id + '" class="new-item"><a href="#">'
			+ content + '</a></li><hr class="list_line"/>';
	$('#bookList').prepend(reminder);
	var createdItem = $('#' + id);
	createdItem.append($('<button />', {
		"class" : "fa fa-trash delete-button",
		"contenteditable" : "false",
		click : function() {
			var confirmation = confirm('Delete this item?');
			if (confirmation) {
				$('#' + id).remove();
			}
		}
	}));

	createdItem.append($('<button />', {
		"class" : "fa fa-pencil edit-button",
		"contenteditable" : "false",
		click : function() {
			createdItem.attr('contenteditable', 'true');
			editReminder(id);
			$(this).css("display", "none");
		}
	}));
};

function editReminder(id) {
	var $this = $('#' + id);
	$this.focus().append($('<button />', {
		"class" : "fa fa-floppy-o save-button",
		click : function() {

			$this.attr('contenteditable', 'false');

			var newcontent = $this.text();

			if (!newcontent) {
				var confirmation = confirm('Delete this item?');
				if (confirmation) {
					$('#' + id).remove();
				}
			} else {
				$(this).remove();
				$('.edit-button').css("display", "inline");
			}

		}

	}));
};