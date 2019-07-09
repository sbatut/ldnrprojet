<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form:form method="POST" modelAttribute="employeeForm">
   <spring:bind path="firstName">
	<div class="form-group ${status.error ? 'has-error' : ''}">
	  <label>firstname
	  <form:input type="text" path="firstName" class="form-control" placeholder="firstName"></form:input>
	  <form:errors path="firstName"></form:errors>
	  </label>
	</div>
   </spring:bind>
   
   <spring:bind path="lastName">
	<div class="form-group ${status.error ? 'has-error' : ''}">
	  <form:input type="text" path="lastName" class="form-control" placeholder="lastName"></form:input>
	  <form:errors path="lastName"></form:errors>
	</div>
   </spring:bind>
   
   <spring:bind path="company">
	<div class="form-group ${status.error ? 'has-error' : ''}">
	  <form:input type="text" path="company" class="form-control" placeholder="company"></form:input>
	  <form:errors path="company"></form:errors>
	</div>
   </spring:bind>

   <input type="submit" value="envoyer">
  </form:form>
</body>
</html>