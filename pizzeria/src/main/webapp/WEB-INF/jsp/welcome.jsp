<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

<title>Bienvenue sur le site MIAM-MIAM</title>
</head>

<body>



<div id="framecontent">
<div class="innertube">

<jsp:include page="/WEB-INF/jsp/client/menuClient.jsp"></jsp:include>

</div>
</div>


<div id="maincontent">
<div class="innertube">

<h1>Bienvenue sur le site MIAM-MIAM</h1>

<p style="text-align: center">Les menus du jour</p>

</div>
</div>



</body>

</html>