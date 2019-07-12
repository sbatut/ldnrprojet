<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<div id="menu1">
	<ul>
		<li><a href="/login">Connexion</a></li>
		<li><a href="/exit">Déconnexion</a></li>			
		<li><a href="/inscription">Inscription</a></li>
		<li class="lmenu"><a href="/client/choix">Pizzas</a></li>
		<li class="lmenu"><a href="/client/panier/afficher">Afficher panier</a></li>
		
		<c:if test = "${SESSION_ADMIN.role.equals(\"ADMINISTRATOR\")}">
			<li class="lmenu"><a href="/gerant/carte">Menu Gérant</a></li>
		</c:if>
	</ul>
</div>

</body>
</html>



