<% String title = "Upload File"; %>
<%@include file="../inc/head.jsp" %>
<%@include file="../inc/nav.jsp" %>






<h1>Spring Boot file upload example</h1>

<form method="POST" action="/upload?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="file" name="file" /><br/><br/>
   <input type="hidden" name="recipe" value="recipe-${recipe}">
    <input type="submit" value="Submit" />
</form>

<%@include file="../inc/foot.jsp" %>