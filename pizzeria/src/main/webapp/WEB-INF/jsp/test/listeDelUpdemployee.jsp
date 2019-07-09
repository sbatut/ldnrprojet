<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>liste employee </title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>id</th>
                    <th>lastName</th>
                    <th>FirstName</th>
                    <th>Company</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listeemployees}" var="employee">
                    <tr>
                        <td><c:out value="${employee.id}"/></td>
                        <td><c:out value="${employee.lastName}"/></td>
                        <td><c:out value="${employee.firstName}"/></td>
                        <td><c:out value="${employee.company.id}"/></td>
                        <td>
                          <c:url value="/employee/Deleteemployee" var="url">
                           <c:param name="id" value="${employee.id}"/>
                          </c:url>
                          <a href="${url}">Supprimer</a>
                        </td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>