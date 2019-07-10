<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ajouter une pizza</title>
	</head>
	<body>
		<div class="ajout">
          <form method="post" action="/gerant/carte/pizza/add" >
		   <input type="hidden" name="action" value="creer">
		   <label>Nom<input type="text" name="libelle"> </label>
		   
		   <!-- Choix des ingrédients à ajouter -->
		   <ul>
				<c:forEach items="${listeingredients}" var="ingredient">
					<li><input type="checkbox" name="ingre${ingredient.id}" value="${ingredient.id}">${ingredient.nom}</li>
				</c:forEach>	
		   </ul>
		   
		   <label>Prix<input type="text" name="prix"></label>
		   <input type="submit" value="Ajouter">
		  </form>
		</div>
	</body>
</html>