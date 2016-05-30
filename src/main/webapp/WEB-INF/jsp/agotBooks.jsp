<%-- 
    Document   : agotBooks
    Created on : 10-mei-2016, 14:32:19
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
        <h1>AGOT Books</h1>
        <jsp:include page="nav.jsp"/>
        <c:forEach var="book" items="${agotBooks}">
                <tr>
                    <td>${book.name}</td>
                </tr>
            </c:forEach>
    </body>
    <jsp:include page="footer.jsp"/>
</html>

