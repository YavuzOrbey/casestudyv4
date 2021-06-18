<% String title = "Ingredients"; %>
<%@include file="../inc/head.jsp" %>
<%@include file="../inc/nav.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  <div class="container  ">
        <h1>Admin View</h1>
        <a href="create"><button id="addEntityBtn">Add New Ingredient</button></a>
        <table class='table'>
            <thead>
                <tr>
                    <th>Ingredient</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${ingredients}" var="ingredient">
                <tr>
                    <td><a href="${ingredient.id}">${ingredient.name}</a></td>
                    <td><a href="edit/${ingredient.id}"><button ><i class="fas fa-edit text-primary"></i></button></a></td>
                     <td><a href="delete/${ingredient.id}"><button ><i class="fas fa-trash text-danger"></i></button></a></td>
                </tr>
            </c:forEach>
                <%--<tr>
                    <td><a href="showRecipe.html">Measurement 1</td>
                    <td><button onclick="alert('You deleted this entity....Well not really but you will soon! Under Construction!')"><i class="fas fa-trash"></i></button></td>
                    <td><button onclick="alert('You deleted this entity....Well not really but you will soon! Under Construction!')"><i class="fas fa-trash"></i></button></td>
                </tr>
                <tr>
                    <td>Nutrient 2</td>
                    <td><button onclick="alert('You deleted this entity....Well not really but you will soon! Under Construction!')"><i class="fas fa-trash"></i></button></td>
                	<td><button onclick="alert('You deleted this entity....Well not really but you will soon! Under Construction!')"><i class="fas fa-trash"></i></button></td>
                </tr>--%>

            </tbody>
        </table>
  </div>
<%@include file="../inc/foot.jsp" %>