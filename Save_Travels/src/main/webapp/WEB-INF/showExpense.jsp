<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Expense Details</title>
	</head>
	<body>
		<h1>Expense: ${selectedExpense.getName()}</h1>
		<h2>Name: ${selectedExpense.name}</h2>
		<h2>Vendor: ${selectedExpense.vendor}</h2>	
		<h2>Amount: <c:out value="${selectedExpense.amount}"/></h2>
		<h2>Description: <c:out value="${selectedExpense.description}"/></h2>		
	</body>
</html>