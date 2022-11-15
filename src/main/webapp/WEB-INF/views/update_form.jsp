<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="./base.jsp"%>
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center">Change Product Details</h1>
		<form action="${pageContext.request.contextPath}/handle-product" method="post">
			<div class="mb-3"><input type="hidden" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" name="id" value="${product.getId() }">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Product
					Name </label> <input type="text" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" name="name" value="${product.getName() }">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Product
					Description </label> <textarea rows=5 class="form-control"
					id="exampleInputPassword1" name="description">${product.getDescription() }</textarea>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Product
					Price </label> <input type="text" class="form-control"
					id="exampleInputPassword1" name="price" value="${product.getPrice() }">
			</div>

			<div class="text-center">
				<a href="${pageContext.request.contextPath }/"
					class="btn btn-primary me-2">Back</a>
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
	</div>

</body>
</html>