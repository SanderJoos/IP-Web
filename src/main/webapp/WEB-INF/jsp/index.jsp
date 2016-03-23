<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <jsp:include page="head.jsp">
	<jsp:param name="title" value="index.jsp" />
    </jsp:include>

    <body>
        <h1>Hello, welcome to your first real spring web mvc page</h1>
        <jsp:include page="nav.jsp"/>
    </body>
    <jsp:include page="footer.jsp">
        <jsp:param name="title" value="index.jsp"/>
    </jsp:include>
</html>
