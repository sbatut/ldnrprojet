<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Affichage du panier</title>
	</head>
	<body>
	<form method="post" action="/client/panier/del" >
		<fieldset>
				<legend><h3>Les pizzas que vous avez selectionnées</h3></legend>
				<p> Vous pouver supprimer des pizzas de votre panier en les selectionnant</p>
				
				<c:forEach items="${listepizzas}" var="pizza">
					<fieldset>
						<b><c:out value="${pizza.libelle} "/>
						
						<c:out value="${ing.libelle}" /></b>
						<input type="checkbox" name="pizza_${pizza.id}" value="${pizza.id}">
						<c:forEach items="${pizza.compoIngredient}" var="ing">
						<c:out value="${ing.nom}" />
						</c:forEach>
						<b><c:out value="${pizza.prix} "/></b>
					</fieldset>	
				</c:forEach>
					</fieldset>
			<fieldset>
			
            <input type="submit" name="ok" value="Supprimer">
            
		</fieldset>
		<fieldset>
			<!-- Ajout des pizzas selectionnées-->
			<c:url value="/client/choix" var="url">
            </c:url>
            <a href="${url}">Retour à la selection</a>
            
            <!-- Ajout des pizzas selectionnées-->
			<c:url value="/client/panier/paiement" var="url">
            </c:url>
            <a href="${url}">Confirmer votre commande</a>

		</fieldset>
		</form>
	</body>
</html>