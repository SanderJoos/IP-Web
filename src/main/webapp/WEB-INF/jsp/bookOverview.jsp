<%-- 
    Document   : bookOverview
    Created on : 17-mrt-2016, 21:47:55
    Author     : Sander_2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" >
        <jsp:param name="title" value="books"/>
    </jsp:include>
    <body>
        <h1><spring:message code="lbl.bookOverviewH1" text="all books" /></h1>
        <jsp:include page="nav.jsp"/>
        <table>
            <tr>
                <th><spring:message code="lbl.title" text="title" /></th>
                <th><spring:message code="lbl.ISBN" text="ISBN" /></th>
                <th><spring:message code="lbl.score" text="score" /></th>
            </tr>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.ISBN}</td>
                    <td>${book.score}</td>
                    <td><a href="<c:url value="/book/${book.ISBN}.htm" />">edit</a></td>
                    <td><a href="<c:url value="/book/delete/${book.ISBN}.htm" />">delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <form method="GET" action="<c:url value="/book/new.htm"/>">
            <input type="submit" value="New"/>
        </form>
    </body>
    <jsp:include page="footer.jsp"/>
</html>
