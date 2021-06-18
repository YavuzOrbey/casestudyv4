<% String title = "Login"; %>
<%@include file="../inc/head.jsp" %>
<%@include file="../inc/nav.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  <div class="container d-flex justify-content-center ">
    <div id="form" class="p-5 shadow">
    <form method="POST" action="/login" class="form-signin">
            <h3>Login</h3>

            <div class="form-group ${error != null ? 'has-error' : ''}">
                <span>${message}</span>
                <input name="username" type="text" class="form-control" placeholder="Username"
                       autofocus="true"/>
                <input name="password" type="password" class="form-control" placeholder="Password"/>
                <span>${error}</span>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
                <h4 class="text-center"><a href="/register">Create an account</a></h4>
            </div>
          </form><%--
      <form:form action="login" method="POST" modelAttribute="user">
        <h3>Login</h3>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <form:input type="email" class="form-control" id="email" path="email" />
          <form:errors class='error' path="email" />
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <form:input type="password" class="form-control" id="password" path="password" />
          <form:errors class='error' path="password" />
        </div>
        <div class='row justify-content-between mb-3'>
          <div class="form-check col-md-6">
            <input class="form-check-input" type="checkbox" value="" >
            <label class="form-check-label" >
              Remember me
            </label>
          </div>
          <div class="col-md-6"><a href='#'>Forgot your password?</a></div>
        </div>
          <div class='row justify-content-between mb-3'>
            <div class="btn col-md-6"><a href='register'>Create an account</a> </div>
            <button type="submit" style="background: #4B042B; color: white" class="btn col-md-6">Log in</button>

          </div>
      </form:form>--%>
  </div>

  </div>
<%@include file="../inc/foot.jsp" %>