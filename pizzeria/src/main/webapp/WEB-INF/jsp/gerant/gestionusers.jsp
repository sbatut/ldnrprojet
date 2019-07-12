<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="/css/gerant.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>Liste des Clients</title>
	</head>
	<body>
		<fieldset>
				<legend>Clients</legend>
				<table>
					<th>Id User</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Adresse</th>
					<!-- Itérations des éléments de la liste des commandes -->
					<c:forEach items="${listeusers}" var="user">
							<tr>
								<td><c:out value="${user.id}"/></td>
								<td><c:out value="${user.nom}"/></td>
								<td><c:out value="${user.prenom}"/></td>
								<td><c:out value="${user.adresse}"/></td>
							</tr>	
					</c:forEach>
				</table>
		</fieldset>
	</body>
</html>