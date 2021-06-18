<% String title = "Create Ingredient"; %>
<%@include file="../inc/head.jsp" %>
<%@include file="../inc/nav.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form method="POST">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="text" name="a" >
<input type="text" name="b" >
<input type="text" name="c" >
<input type="text" name="d" >
<button>Submit</button>
</form>
<%@include file="../inc/foot.jsp" %>