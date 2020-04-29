<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PS Bank: Search Account Holder</title>
<script>
	window.onload = function(){
		document.getElementById('divResults').style.display ='none';
		document.getElementById('divError').style.display ='none';
		console.log("Search Results Block Hidden");
	};
	function Search() {
		document.getElementById('divError').style.display ='block';
		fetch('http://localhost:8080/PSBankApp/account/0?accountNo=0')
			.then(response => response.json())
			.then(json => console.log(json))
		console.log("Search Results Displayed");
	}
</script>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<div class="row">
			<div class="col-12">
				<p class="h1">Search Form</p>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<form:form cssClass="form-horizontal" role="form" id="accForm">
					<div class="form-group row">
						<label for="accountNo" class="col-2 col-form-label">Account
							No:</label>
						<div class="col-8">
							<input type="text" class="form-control"
								placeholder="Enter Account Number" name="accountNo"
								id="accountNo">
						</div>
						<div class="col-2">
							<button type="submit" onclick="Search()" id="btn-search" class="btn btn-primary">Search</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>

		<div class="row" id="divResults">
			<div class="col-8 offset-2 self-centered">
				<div class="card">
					<div class="card-header bg-success text-white">
						<h3>Search Results</h3>
						
					</div>
					<div class="card-body">
						<p id="test"></p>
						<div id="accountNo"></div>
						<div id="accountHoldername"></div>
						<div id="accountType"></div>
						<div id="balance"></div>
						<div id="psCode"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="divError">
			<div class="col-8 offset-2 self-centered">
				<p class="alert alert-danger">AccountHolder Details Not Found</p>
			</div>
		</div>

		<%@include file="footer.jsp"%>
	</div>

</body>
</html>