<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8" />
<c:url value="/css/main.css" var="jstlCss" />
<c:url value="/css/users.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

<title>Inscription page</title>
</head>
<body>
<div class="container">

  
  
<!-- Form-->
<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    
    <div class="form-header">
	<h1>Error !! Les informations fournies ne sont pas valides !</h1>
    </div>
    
    <div class="form-content">
			   
			<p>Nom: ${nom}</p>
			
			<p>Prénom: ${prenon}</p>
			
			<p>Email: ${email}</p>
			
			<p>Login: ${login }</p>
			<p>Pwd: ${pwd}</p>

    </div>
  </div>
  

</div>  
     
</div>   

</body>
</html>