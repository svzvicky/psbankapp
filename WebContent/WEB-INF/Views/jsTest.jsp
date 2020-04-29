<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<title>Vicky's Test Page</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 ">
				<p class="jumbotron display-4">Welcome to Vicky's Test Page</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="col-6">
					<button class="btn btn-primary" id="fetchUserDataBtn">Get Account Details</button>
				</div>
				<div id="response" class="col-6 offset-3">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<footer class="footer">
				<p class="text-center">
					<br /> Copyright &copy; - Test
					<%=new java.util.Date().getYear() + 1900%>
				</p>
				</footer>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	document
    .getElementById("fetchUserDataBtn")
    .addEventListener("click", testRESTAPI);
	function fetchUserData() {
		  fetch("https://jsonplaceholder.typicode.com/users")
		    .then(response => response.json())
		    .then(users => {
		      let output = "<h3>List Of Users</h3>";
		      output += "<ul>";
		      users.forEach(function(user) {
		        
		        output += "<li>";
		        console.log(user.email);
		        output += user.name;
		        output += "</li>";
		      });
		      output += "<ul>";

		      document.getElementById("response").innerHTML = output;
		    });
		}
function testRESTAPI(){
	fetch("http://localhost:8080/PSBankApp/account/0?accountNo=101")
	.then(response => response.json())
	.then(account => {
		let output = "<h2>Account Details</h2>";
		
		output += "<p>";
		output += "Account Number:" +account.accountNo;
		console.log("Account Id"+account.accountNo);
		output += "</p>";
		output += "<p>";
		output += "Accountholder Name:" + account.accountHolderName;
		output += "</p>";
		output += "<p>";
		output += "Balance:"+account.balance;
		output += "</p>";
		output += "<p>";
		output += "Account Type:"+account.accountType;
		output += "</p>";
		document.getElementById("response").innerHTML = output;
	});
		
}
	
	</script>
</body>
</html>