<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="/css/gerant.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>Liste des commandes</title>
	</head>
	<body>
		<fieldset>
				<legend>Commandes effectuées</legend>
				<table>
					<th>Id commande</th>
					<th>Date et heure</th>
					<th>Id client</th>
					<th>Nom</th>
					<th>Prénom</th>
					<!-- Itérations des éléments de la liste des commandes -->
					<c:forEach items="${listecommandes}" var="commande">
							<tr>
								<td><c:out value="${commande.numero}"/></td>
								<td><c:out value="${commande.date}"/></td>
								<td><c:out value="${commande.user_id.id}"/></td>
								<td><c:out value="${commande.user_id.nom}"/></td>
								<td><c:out value="${commande.user_id.prenom}"/></td>
							</tr>	
					</c:forEach>
				</table>
		</fieldset>
	</body>
</html>