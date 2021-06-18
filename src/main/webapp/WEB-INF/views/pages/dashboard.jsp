<% String title = "Dashboard";
%>
<%@include file="../inc/head.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <title>Calendar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/style.css">
    <style>
        body{

        }

        .main-area{
            background: #6D6262;
            padding: 10px;
        }
        .calendar-header{
            height: 50px;
            background: #D83E3E;
            text-align: center;
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .col-md{
            background: white;
            border: 1px solid black;
        }
        .out-of-month{
            background-color: gray;
        }
        h4 ~ p a {
            text-decoration: none;
            color: #4f67a9;
        }
    </style>
</head>
<body>
  <%@include file="../inc/nav.jsp" %>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

            <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
        </c:if>
    <div class="container">
        <div class="calendar-header">
            <i class="fas fa-arrow-circle-left" style="float: left; "></i>
            <h4>${month_name} 2021</h4>
            <i class="fas fa-arrow-circle-right" style="float: right;"></i>
        </div>
        <div class="main-area">
            <div class='container'>
            <% boolean start=false; %>
            <div class='row'>
            <c:forEach items="${daysOfWeek}" var="dayOfWeek" >
                <div class="col-12 col-md m-1">
                    <h4>${dayOfWeek}</h4>
                </div>
            </c:forEach>
            </div>
			<c:forEach begin="1" end="${numWeeks}" var="weekNumber" varStatus="row">
				<div class='row'>
				<c:forEach begin="1" end="7" var="dayOfWeek" varStatus="column">
	                <div class="col-12 col-md m-1 ${(dayOfWeek>=firstDay || weekNumber > 1) && (weekNumber < numWeeks  || dayOfWeek<=lastDay) ? "": "out-of-month"}">
	                    <h4>${(column.index+(row.index-1)*7)-(firstDay-1)}</h4>
	                    <p><a href='#'>Lorem</a></p>
	                    <p><a href='#'>Ipsum</a></p>
	                </div>
	            </c:forEach>
				</div>
            </c:forEach>
        </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>