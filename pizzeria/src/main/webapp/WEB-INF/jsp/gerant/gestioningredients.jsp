<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Gestion des ingredients</title>
    </head>
    <body>
        <h1>Gestion des ingredients</h1>
        
        <div class="ajout">
          <form method="post" action="ingredients/add" >
		   <input type="hidden" name="action" value="creer">
		   <label>Nom<input type="text" name="nom"> </label>
		   <label>Prix<input type="text" name="prix"></label>
		   <input type="submit" value="Ajouter">
		  </form>
		</div>
    
        <h2>liste des ingredients</h2>	
    
        <table border="1">
            <thead>
                <tr>
                    <th>id</th>
                    <th>nom</th>
                    <th>prix</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listeingredients}" var="ingredient">
                    <tr>
                        <td><c:out value="${ingredient.id}"/></td>
                        <td><c:out value="${ingredient.nom}"/></td>
                        <td><c:out value="${ingredient.prix}"/></td>
                        <td>
                          <c:url value="ingredients/del" var="url">
                           <c:param name="id" value="${ingredient.id}"/>
                          </c:url>
                          <a href="${url}">Supprimer</a>
                        </td>
                        <td>
                          <c:url value="ingredients/update/${ingredient.id}" var="url">
                          </c:url>
                          <a href="${url}">Modifier</a>
                        </td>                        

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>