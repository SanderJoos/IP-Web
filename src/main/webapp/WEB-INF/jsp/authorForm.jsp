<%-- 
    Document   : authorForm
    Created on : 16-mrt-2016, 11:55:19
    Author     : Sander Joos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" >
        <jsp:param name="title" value="authorForm"/>
    </jsp:include>
    
    <h1><spring:message code="lbl.authorFormH1" text="author sign up" /></h1>
        <jsp:include page="nav.jsp"/>
        <spring:hasBindErrors name="authorForm">
            <c:forEach var="error" items="${errors.allErrors}">
		<b><spring:message message="${error}" /></b>
		<br />
            </c:forEach>
        </spring:hasBindErrors>
        <c:url var="url_newAuthor" value="/author.htm" />
        <form:form commandName="author" id="authorForm" role="form" method="POST" action="${url_newAuthor}"> 
            
            <p class="form-group">
                <label class="control-label" for="name"><spring:message code="lbl.name" text="name" />: </label>
                <form:input path="name" id="name" name="name" value="${author.name}"/>
                <form:errors path="name"/>
            </p>
            <p class="form-group">
                <label class="control-label" for="lastName"><spring:message code="lbl.lastName" text="lastName" />: </label>
                <form:input path="lastName" id="lastName" name="lastName" value="${author.lastName}"/>
                <form:errors path="lastName"/>
            </p>
            <p>
                <label for="save">&nbsp;</label>
                <input id="save" type="submit" value="save">
            </p>
        </form:form>
    
    <jsp:include page="footer.jsp"/>
</html>
