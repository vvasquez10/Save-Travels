<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style>
        *{
            padding: 0;
            margin: 0;
        }

        .container{
            display: flex;
            flex-direction: column;
        }     
        
        h1{
        	text-align: center;
        }
        .title{
            margin-bottom: 2%;
        }   
        .shows_table{
            text-align:left;

        }

        .footer{
            text-align: end;
        }
        .btn{
            font-size: 20px;
        }
        .btnGroup{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }
        .op_btn{
            margin-inline: 10px;
        }
        .boton{
        	text-align: right;
        }
    </style>  
	<title>Save Travels</title>
	</head>
	<body>
		<div class="container">
			<h1>Save Travels</h1>
			<div class="table">
				<table class="table">
	                <tbody>
	                    <tr>
	                        <th>Expense</th>
	                        <th>Vendor</th>
	                        <th>Amount</th>
	                        <th>Actions</th>                        
	                    </tr>
		  					<c:forEach var="expense" items="${expenseList}">        		
	                        <tr>
	                            <td><form action="/expenses/show/${expense.id}" method="get"><a onclick="this.parentNode.submit();"> <c:out value="${expense.name}"/> </a></form></td>
	                            <td><c:out value="${expense.vendor}"/></td>
	                            <td><c:out value="${expense.amount}"/></td>
	                            <td class="btnGroup">
	                                <form action="/expenses/edit/${expense.id}" method="get">
	                                    <input type="submit" class="btn-toolbar btn-sm op_btn" value="Edit"> 
	                                </form>   
	                                <form action="/expenses/delete/${expense.id}" method="POST">
	                                	<input type="hidden" name="_method" value="DELETE" />
	                                    <input type="submit" class="btn-danger btn-sm op_btn" value="Delete"> 
	                                </form>  
	                            </td>
	                        </tr>  
	                        </c:forEach>
	                </tbody>
	            </table>
			</div>
			<div class="newExpense">
		        <h1>Add an expense</h1>		         
	           		            
	            <form:form method="POST" action="/expenses/create" modelAttribute="expense">
					<div class="form-group">
						<form:label path="name" for="name">
							Expense name:
						</form:label>
						<form:input path="name" class="form-control" type="text" name="name" id="name" required="True"/>
						<form:errors path="name"/>
					</div>
					<div class="form-group">
						<form:label path="vendor" for="vendor">
							Vendor:
						</form:label>
						<form:input path="vendor" class="form-control" type="text" name="vendor" id="vendor" required="True"/>
						<form:errors path="vendor"/>
					</div>
					<div class="form-group">
						<form:label path="amount" for="amount">
							Amount:
						</form:label>
						<form:input path="amount" class="form-control" step=".01" type="number" name="amount" id="amount" required="True"/>
						<form:errors path="amount"/>
					</div>					
					<div class="form-group">
						<form:label path="description" for="description">
							Description:
						</form:label>
						<form:textarea path="description" class="form-control" name="description" id="description" placeholder="Type a brief description"/>
						<form:errors path="description"/>
					</div >
					<div class="form-group">
						<button type="submit">
							Add expense
						</button>
					</div>
				</form:form>
			</div>
		</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>