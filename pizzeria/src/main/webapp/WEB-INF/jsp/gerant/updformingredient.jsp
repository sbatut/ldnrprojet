<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modification ingredient</title>
</head>
<body>
  <h1>Modification d'un ingredient</h1>
  <form method="post" action="/gerant/ingredients/update" >
   <input type="hidden" name="action" value="update">
   <input type="hidden" name="id" value=${ingredient.id}>
   <label>Nom<input type="text" name="nom" value=${ingredient.nom}> </label>
   <label>Prix<input type="text" name="prix" value=${ingredient.prix}></label>
   <input type="submit" value="Ajouter">
  </form>
</body>
</html>