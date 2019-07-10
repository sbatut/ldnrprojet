<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form method="post" action="newemployee" >
   <input type="hidden" name="action" value="creer">
   <input type="hidden" name="id" value="${employee.id}">
   <label>firstName<input type="text" name="firstName" value="${employee.firstName}"></label>
   <label>lastName<input type="text" name="lastName" value="${employee.lastName}"></label>
   <label>company<input type="text" name="company" value="${employee.company.id}"></label>
   <input type="submit" value="envoyer">
  </form>
</body>
</html>