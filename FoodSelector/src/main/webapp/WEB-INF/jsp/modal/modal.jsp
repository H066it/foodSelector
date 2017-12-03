<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="foodModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="background-color: white;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>이름</h3>
			<p id="myModalLabel"></p>
		</div>
		<div class="modal-body">
			<h4>재료</h4>
			<p id="ingredients"></p>
			<br>
			<h4>만드는 법</h4>
			<p id="recipe"></p>
		</div>
		<div class="modal-footer">
			<button class="btn btn-primary">Save changes</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
		</div>
		<form method="post" class="form-horizontal">			
			<input type="hidden" id="csrfParam" name="_csrf" value="${_csrf.token}"/>
			<input type="hidden" id="fId" name="fId" />
		</form>
	</div>
</body>
</html>