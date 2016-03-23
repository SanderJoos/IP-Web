<%-- 
    Document   : bookForm
    Created on : 17-mrt-2016, 22:00:39
    Author     : Sander_2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" >
        <jsp:param name="title" value="book sign up"/>
    </jsp:include>
    
        <h1><spring:message code="lbl.bookFormH1" text="book form" /></h1>
        <jsp:include page="nav.jsp"/>
        <spring:hasBindErrors name="bookForm">
            <c:forEach var="error" items="${errors.allErrors}">
		<b><spring:message message="${error}" /></b>
		<br />
            </c:forEach>
        </spring:hasBindErrors>
        <c:url var="url_newBook" value="/book.htm" />
        <form:form commandName="book" id="bookForm" role="form" method="POST" action="${url_newBook}">             
            <p class="form-group">
                <label class="control-label" for="title"><spring:message code="lbl.title" text="title" /></label>
                <form:input path="title" id="title" name="title" value="${book.title}"/>
                <form:errors path="title"/>
            </p>
            <p class="form-group">
                <label class="control-label" for="ISBN"><spring:message code="lbl.ISBN" text="ISBN" />: </label>
                <form:input path="ISBN" id="ISBN" name="ISBN" value="${book.ISBN}"/>
                <form:errors path="ISBN" />
            </p>
             <p class="form-group">
                <label class="control-label" for="score"><spring:message code="lbl.score" text="score" />: </label>
                <form:input path="score" id="score" name="score" value="${book.score}"/>
                <form:errors path="score" />
            </p>
            <p>
                <label for="save">&nbsp;</label>
                <input id="save" type="submit" value="save">
            </p>
        </form:form>
    
    <jsp:include page="footer.jsp"/>
</html>
