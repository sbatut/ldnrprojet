<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Paiement de votre commande</title>
	</head>
	<body>
	
	<p> Vous aves commandé <b>${nbPizza} pizzas</b> pour un montant total de ${montant}</b></p>
	<p> <b> Ci-dessous choisissez votre moyen de paiement</b></p>
	
	
	<form method="post" action="/client/panier/confirm" >
		<fieldset>
				<legend>Carte bleue </legend>
				<input name="cb" type="checkbox" value="1">
				<legend>Carte MasterCard </legend>
				<input name="mc" type="checkbox" value="2">
				<legend>PayPal </legend>
				<input name="pp" type="checkbox" value="3">
				
				
		</fieldset>
			<fieldset>
			
            <input type="submit" name="ok" value="Payer">
            
		</fieldset>
		</form>
		

	</body>
</html>