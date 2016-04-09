<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 
	<meta http-equiv="refresh" content="2"> 
	-->


<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="assets/css/simple-sidebar.css" rel="stylesheet">

<link href="assets/css/trumbowyg.css" rel="stylesheet">
<link href="assets/css/editor.css" type="text/css" rel="stylesheet" />
<link href="assets/css/font-awesome.min.css" type="text/css"
	rel="stylesheet" />

<link href="assets/css/mnoteStyles.css" type="text/css" rel="stylesheet" />

<!-- jQuery -->
<script src="assets/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/js/trumbowyg.min.js"></script>
<script src="assets/js/trumbowyg.upload.min.js"></script>
<script src="assets/js/trumbowyg.base64.min.js"></script>

<script src="assets/js/editor.js"></script>

</head>

<body>
	<div id="wrapper" class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-2 col-sm-2 col-xs-4 sidebar-wrapper"
				id="sidebar-wrapper">
				<span class="sidebar-brand" id="userInfo" userId=<s:property value="user.getId()"/>><s:property value="user.getId()" />
				</span>
				<form id="input-form">
					<input class="newInput" placeholder="new notebook.." type="text"
						id="newNotebook"> <input class="newInput" value="Add"
						type="submit">
				</form>
				<ul class="sidebar-nav" id="notebooks">
					<s:iterator value="books" var="book">
						<li name=<s:property value="#book.getId()"/>><a href="#" class="menu-toggle" name=<s:property value="#book.getId()"/>>
						<s:property value="#book.getTitle()" /></a>
						</li>
					</s:iterator>
				</ul>
			</div>
			<!-- /#sidebar-wrapper -->

			<!-- Sidebar2 -->
			<div id="sidebar-wrapper2" class="sidebar-wrapper">
				<div id="sidebar-wrapper3">
					<span class="sidebar-brand" id="notebook_name"></span>
					<form id="input-form2">
					<input class="newInput" placeholder="new notebook.." type="text"
						id="newNote"> <input class="newInput" value="Add"
						type="submit">
					</form>
					<ul class="sidebar-nav" id="notes">
						<li class="menu-toggle2"><a href="" style="display:block">..</a>
						<hr class="list_line"/>
						</li>
					</ul>
				</div>
			</div>
			<!-- /#sidebar-wrapper -->

			<!-- Page Content -->
			<div class="col-md-10 col-sm-10 col-xs-7 tab-content"
				id="page-content-wrapper">
				<div class="container-fluid">
					<div class="row">
						<a class="btn col-md-1 col-sm-1 col-xs-2" id="submit">submit</a> <a
							class="btn col-md-1 col-sm-1 col-xs-2" id="refresh">refresh</a> <a
							class="btn col-md-1 col-sm-1 col-xs-2 " id="close">close</a>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<input value="" type="text" class="form-control" id="title"
								placeholder="Title">
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">

							<div class="col-lg-12 nopadding" id="txtEditor">
								<textarea class="editor" name="textEditor" id="txtEditor"></textarea>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- /#page-content-wrapper -->

		</div>
		<!-- $("#notes").empty(); 
$("#txtEditor").Editor("setText", $(this).attr("name"));
$("#txtEditor").Editor("setText", target.getAttribute("name"));
				var jqxhr = $.post("getNote", {id: $(this).attr("name")}, function(data) {
				});
				
				$("#title").val(note.title);
						$("#txtEditor").Editor("setText", note.content);

			sidebar_width = $("#sidebar-wrapper").css("width");
			$("#sidebar-wrapper2").css("left", sidebar_width);

			$(".menu-toggle").each(
					function() {
						$(this).click(
								function(e) {
									e.preventDefault();
									sidebar_width = $("#sidebar-wrapper").css(
											"width");
									$.post("note", {notebookId: $(this).attr("name")}, function(data) {
										$("li").remove(".note")
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
			
			function getNote(target){
				$("#submit").attr("noteId", target.getAttribute("name"));
				$("#refresh").attr("noteId", target.getAttribute("name"));
				$.post("getNote", {id:target.getAttribute("name")}, function(data) {
					$.each(data, function(i, note) {
						$("#title").val(note.title);
						$("#txtEditor").Editor("setText", note.content);
					});
				});
				
			}

			$("#submit").click(
					function(e) {
						$.post("setNote", {
							"note.id":$(this).attr("noteId"),
							"note.title" : $("#title").val(),
							"note.notebookId":$(this).attr("bookId"),
							"note.content":$("#txtEditor").Editor("getText")
							}, function(data) {
							alert("submit completed!");
						});
					})

			$("#refresh").click(function(e) {
				$.post("getNote", {id:$(this).attr("noteId")}, function(data) {
					$.each(data, function(i, note) {
						$("#title").val(note.title);
						$("#txtEditor").Editor("setText", note.content);
					});
				});
			})

			$("#close").click(function(e) {
				$("#title").val("");
				$("#txtEditor").Editor("setText", "");
				$("#submit").removeAttr("noteId");
				$("#refresh").removeAttr("noteId");
			})

			$(document).ready(function() {
				$("#txtEditor").Editor();
			});
<script src="assets/js/mnoteScripts.js"></script>

									sidebar_width = $("#sidebar-wrapper").css(
											"width");
									$.post("note", {notebookId: $(this).attr("name")}, function(data) {
										$("li").remove(".note")
										$.each(data, function(i, note) {
											$("#notes").append(
													"<li class='note' name="+note.id+"><a name="+note.id+" onClick='getNote(this)' href='#'>" + note.title
															+ "</a></li>");
										});
										$("#notes .note").each(function(){
											$(this).attr("id","note"+$(this).attr("name"));
											addDeleteButton($(this).attr("id"));
											$(this).append('<hr class="list_line"/>');
										});
									});
									$("#notebook_name").html($(this).html());
									$("#notebook_name").attr("bookId",$(this).attr("name"));
									$("#sidebar-wrapper2").css("left", "0px");
									$("#sidebar-wrapper2").css("width",
											sidebar_width);
									$("#submit").attr("bookId", $(this).attr("name"));
-->

		<script>
		
			sidebar_width = $("#sidebar-wrapper").css("width");
			$("#sidebar-wrapper2").css("left", sidebar_width);
			
			$("#notebooks li").each(function(){
				$(this).attr("id","book"+$(this).attr("name"));
				addButton($(this).attr("id"));
				$(this).append('<hr class="list_line"/>');
			});
			
			$(".menu-toggle").each(
					function() {
						$(this).click(
								function(e) {
									e.preventDefault();
									getNotePanel($(this));
								});
					});
			
			function getNotePanel(target){
				sidebar_width = $("#sidebar-wrapper").css(
				"width");
				$.post("note", {notebookId: target.attr("name")}, function(data) {
				$("li").remove(".note")
				$.each(data, function(i, note) {
				$("#notes").append(
						"<li class='note' name="+note.id+"><a name="+note.id+" onClick='getNote(this)' href='#'>" + note.title
								+ "</a></li>");
				});
				$("#notes .note").each(function(){
					$(this).attr("id","note"+$(this).attr("name"));
					addDeleteButton($(this).attr("id"));
					$(this).append('<hr class="list_line"/>');
				});
			});
			$("#notebook_name").html(target.html());
			$("#notebook_name").attr("bookId",target.attr("name"));
			$("#sidebar-wrapper2").css("left", "0px");
			$("#sidebar-wrapper2").css("width",
				sidebar_width);
			$("#submit").attr("bookId", target.attr("name"));
			}

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
			
			function deleteNote(noteId) {
				$.post("deleteNote", {
					id : noteId
				});
			}
			
			function addNote(noteTitle, noteContent, bookId, target) {
				return $.post("addNote", {
					"note.title" : noteTitle,
					"note.content" : noteContent,
					"note.notebookId" : bookId
				},function(data) {
					console.log(data);
					$.each(data, function(i, note) {
						target.attr("name",note.id);
						target.find("a").attr("name",note.id);
						target.find("a").attr("onclick","getNote(this)");
					});
				});
			}
			
			function editBook(id, title) {
				$.post("updateNotebook", {
					"notebook.id" : id,
					"notebook.title" : title
				});
			}
			
			function deleteBook(notebookId) {
				$.post("deleteNotes", {
					"notebookId" : notebookId
				});
			}
			
			function addBook(bookTitle, userId, target) {
				$.post("addNotebook", {
					"notebook.title" : bookTitle,
					"notebook.userId" : userId
				}, function(data) {
					$.each(data, function(i, book) {
						target.attr("name", book.id);
						target.find("a").attr("name",book.id);
						target.find("a").addClass("menu-toggle");
						target.find("a").click(function(e){
							e.preventDefault();
							getNotePanel($(this));
						});
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
					createReminder(id,"new-item",value, "notebooks",true, 0);
					addBook(value, $("#userInfo").attr("userId"), $("#"+id));
					input.val('');
				}
			});
			
			$("#input-form2").on('submit', function(event) {
				var input = $('#newNote'), value = input.val();
				event.preventDefault();
				if (value) {
					var id = generateId();
					createReminder(id,"new-item note",value, "notes",false, 1);
					
					addNote(value, "", $("#notebook_name").attr("bookId"), $("#"+id));
					input.val('');
				}
			});

			function generateId() {
				return "reminder-" + Date.parse(new Date())/1000;
			}

			function createReminder(id, className, content, div_name, add_button, i) {
				var reminder = '<li id="' + id + '" class="'+ className +'"><a href="#">'
						+ content + '</a></li>';
				if (i == 0) {
					$('#'+ div_name).prepend(reminder);
				} else {
					$('#'+div_name+' li:nth-child(' + i + ')').after(reminder);
				}
				
				
				if (add_button) {
					addEditButton(id);
				}
				addDeleteButton(id);
				var createdItem = $('#' + id);
				createdItem.append('<hr class="list_line"/>');
			};
			function addButton(id){
				addEditButton(id);
				addDeleteButton(id);
			}
			
			function addDeleteButton(id){
				var createdItem = $('#' + id);
				createdItem.append($('<button />', {
					"class" : "fa fa-trash delete-button",
					"contenteditable" : "false",
					click : function() {
						var confirmation = confirm('Delete this item?');
						if (confirmation) {
							if ($('#' + id).hasClass('note')){
								deleteNote($('#' + id).attr("name"));
							} else {
								deleteBook($('#' + id).attr("name"));
							}
							$('#' + id).remove();
						}
						
					}
				}));
			}
			
			function addEditButton(id){
				var createdItem = $('#' + id);
				createdItem.append($('<button />', {
					"class" : "fa fa-pencil edit-button",
					"contenteditable" : "false",
					click : function() {
						createdItem.attr('contenteditable', 'true');
						
						editReminder(id);
						$(this).css("display", "none");
					}
				}));
			}
			

			function editReminder(id) {
				var $this = $('#' + id);
				$this.focus().find("hr").before($('<button />', {
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
							if ($this.hasClass('note')){	
							} else {
								editBook($('#' + id).attr("name"), $this.text());
							}
							$('.edit-button').css("display", "inline");
						}

					}

				}));
			};
			
			
		</script>
</body>

</html>
