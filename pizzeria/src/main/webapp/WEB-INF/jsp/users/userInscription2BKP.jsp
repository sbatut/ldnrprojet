<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8" />
<c:url value="/css/main.css" var="jstlCss" />
<c:url value="/css/users.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

<title>Inscription page</title>
</head>
<body>
<div class="container">

<p>
${name}
&nbsp;
${prenon}
</p>
        
  
<!-- Form-->
<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    
    <div class="form-header">
	<h1>Espace d'inscription</h1>
    </div>
    
    <div class="form-content">
     
  		<form>  
  		
 		  <div class="form-group">
          <label for="userlastname">Nom</label>
          <input type="text" id="userlastname" name="userlastname" required="required"/>
        </div>
              
        <div class="form-group">
          <label for="userfirstname">Prénom</label>
          <input type="text" id="userfirstname" name="userfirstname" required="required"/>
        </div>
        


          <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" required="required"/>
        </div>
        
          <div class="form-group">
          <label for="username">Choisir un login</label>
          <input type="text" id="username" name="username" required="required"/>
        </div>
        
        <div class="form-group">
          <label for="password">Choisir un mot de passe</label>
          <input type="password" id="password" name="password" required="required"/>
        </div>
        <div class="form-group">
          <label for="cpassword">Confirmer le mot de passe</label>
          <input type="password" id="cpassword" name="cpassword" required="required"/>
        </div>

        <div class="form-group">
          <button type="submit">Valider</button>
        </div>
      </form>
      
    </div>
  </div>
  

</div>  
     
</div>   

</body>
</html>