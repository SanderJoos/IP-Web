<%-- 
    Document   : addBookForm
    Created on : 8-apr-2016, 16:10:18
    Author     : Sander_2
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
    
    <h1><spring:message code="lbl.addBookFormH1" text="add a book to an author" /></h1>
        <jsp:include page="nav.jsp"/>
        <c:url var="url_addBook" value="/author/addBook/${author.id}.htm" />
        <form:form commandName="author" id="authorForm" role="form" method="POST" action="${url_addBook}"> 
            <form:input path="id" name="id" type="hidden" value="${author.id}" />
            <form:select id="slcRole" path="books">
                <form:option label="SELECT" value="${null}"/>
                <form:options items="${books}" itemValue="bookName" itemLabel="book" />
            </form:select>
            <p>
                <label for="save">&nbsp;</label>
                <input id="save" type="submit" value="save">
            </p>
        </form:form>
    
    <jsp:include page="footer.jsp"/>
</html>

