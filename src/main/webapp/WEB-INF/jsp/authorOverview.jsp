<%-- 
    Document   : authorOverview
    Created on : 2-mrt-2016, 12:01:22
    Author     : Sander Joos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" >
        <jsp:param name="title" value="authors"/>
    </jsp:include>
    <body>
        <h1><spring:message code="lbl.authorOverviewH1" text="all authors" /></h1>
        <jsp:include page="nav.jsp"/>
        <table>
            <tr>
                <th><spring:message code="lbl.name" text="name" /></th>
                <th><spring:message code="lbl.lastName" text="lastName" /></th>
            </tr>
            <c:forEach var="author" items="${authors}">
                <tr>
                    <td>${author.name}</td>
                    <td>${author.lastName}</td>
                    <td>${author.id}</td>
                    <td>${author.averageScore}</td>
                    <td><a href="<c:url value="author/${author.id}.htm" />">edit</a></td>
                    <td><a href="<c:url value="author/delete/${author.id}.htm" />">delete</a></td>
                    <td><a href="<c:url value="author/books/${author.id}.htm" />">show books</a></td>
                    <td><a href="<c:url value="author/addBookForm/${author.id}.htm" />">add book </a></td>
                </tr>
            </c:forEach>
        </table>
        <form method="GET" action="<c:url value="/author/new.htm"/>">
            <input type="submit" value="New"/>
        </form>
    </body>
    <jsp:include page="footer.jsp"/>
</html>
