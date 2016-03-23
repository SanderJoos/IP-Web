<%-- 
    Document   : updateAuthorForm
    Created on : 18-mrt-2016, 10:04:44
    Author     : Sander_2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" >
        <jsp:param name="title" value="author update"/>
    </jsp:include>
    
        <h1><spring:message code="lbl.updateAuthorFormH1" text="update your author" /></h1>
        <jsp:include page="nav.jsp"/>
        <c:url var="url_updateAuthor" value="/author/update.htm" />
        <form:form commandName="author" id="autherForm" method="POST" action="${url_updateAuthor}"> 
            <form:input path="id" name="id" type="hidden" value="${author.id}" />
            
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
