<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ajout de pizza dans le panier</title>
		<c:url value="/css/main.css" var="jstlCss" />
		<link href="${jstlCss}" rel="stylesheet" />
	</head>
	<body>
	
    <div id="framecontent">
	<div class="innertube">
	
	<jsp:include page="/WEB-INF/jsp/client/menuClient.jsp"></jsp:include>
	
	</div>
	</div>
	
	<div id="maincontent">
	<div class="innertube">
	
	<form method="post" action="/client/panier/add" >
		<fieldset>
				<legend>Les pizzas</legend>
				<!-- Itérations des éléments de la carte -->
				<c:forEach items="${listepizzas}" var="pizza">
					<fieldset>
						<b><c:out value="${pizza.libelle}"/></b>
						<input type="checkbox" name="pizza_${pizza.id}" value="${pizza.id}">
						<c:out value="(" />
						
						<c:forEach items="${pizza.compoIngredient}" var="ing">
						
						<c:out value="${ing.nom}, " />
						</c:forEach>
						<c:out value=")" />
					</fieldset>	
				</c:forEach>
					</fieldset>
			<fieldset>
			
            <input type="submit" name="ok" value="Ajouter au Panier">
            
		</fieldset>
		</form>
		<fieldset>
			<!-- Ajout des pizzas selectionnées-->
			<c:url value="panier/confirm" var="url">
            </c:url>
            <!-- <a href="${url}">Valider votre commande</a> -->
            
            <!-- Ajout des pizzas selectionnées-->
			<c:url value="/client/panier/afficher" var="url">
            </c:url>
            <!-- <a href="${url}">Afficher votre panier</a>-->

		</fieldset>
		</div> </div>
	</body>
</html>