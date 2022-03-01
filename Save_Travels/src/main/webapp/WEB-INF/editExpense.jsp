<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Edit Expense</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	</head>
	<body>	
		<div class="newExpense">
		        <h1>Edit an expense</h1>	         
	           		            
	            <form:form method="POST" action="/expenses/edit" modelAttribute="expense">
	            	<input type="hidden" name="_method" value="PUT" />	
	            	<div>						
						<form:input path="id" class="form-control" type="hidden" name="id" id="id" required="True" value="${selectedExpense.id}"/>
						<form:errors path="id"/>
					</div>
					<div class="form-group">
						<form:label path="name" for="name">
							Expense name:
						</form:label>
						<form:input path="name" class="form-control" type="text" name="name" id="name" required="True" value="${selectedExpense.name}"/>
						<form:errors path="name"/>
					</div>
					<div class="form-group">
						<form:label path="vendor" for="vendor">
							Vendor:
						</form:label>
						<form:input path="vendor" class="form-control" type="text" name="vendor" id="vendor" required="True" value="${selectedExpense.vendor}"/>
						<form:errors path="vendor"/>
					</div>
					<div class="form-group">
						<form:label path="amount" for="amount">
							Amount:
						</form:label>
						<form:input path="amount" class="form-control" step=".01" type="number" name="amount" id="amount" required="True" value="${selectedExpense.amount}"/>
						<form:errors path="amount"/>
					</div>					
					<div class="form-group">
						<form:label path="description" for="description">
							Description:
						</form:label>
						<form:input path="description" class="form-control" name="description" id="description" value="${selectedExpense.description}" />
						<form:errors path="description"/>
					</div >
					<div class="form-group">
						<button type="submit">
							Save changes
						</button>
					</div>
				</form:form>
			</div>
	</body>
</html>