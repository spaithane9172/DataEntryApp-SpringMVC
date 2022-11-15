<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-12 mb-3">
				<h1 class="text-center">Welcome to Product App</h1>
				<table class="table">
					<thead class="table-dark text-center">
					<td>Product ID</td>
					<td>Product Name</td>
					<td>Product Description</td>
					<td>Product Price</td>
					<td>Action</td>
					</thead>
					<tbody>
					<c:forEach items="${products }" var="p">
					<tr class="text-center">
						<td>PRODUCT-${p.id }</td>
						<td>${p.name }</td>
						<td>${p.description }</td>
						<td><strong>&#8377;</strong>${p.price }</td>
						<td><a class="me-3" href="delete/${p.id }"><i class="fa-solid fa-trash text-danger"></i></a><a href="update/${p.id }"><i class="fa-solid fa-pen-to-square"></i></a></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="container text-center">
					<a href="add-product" class="btn btn-primary">Add Product</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>