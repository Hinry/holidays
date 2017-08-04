<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 01.08.2017
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Авторизация</title>
</head>
<body>
<div class="container-fluid">
    <div class="row ">
        <div class="col-md-offset-4 col-md-3 forma_login">
            <form action="<c:url value="/login"/>" method="post" class="form-horizontal" role="form">

                <sec:authorize access="!isAuthenticated()">
                    <c:if test="${param.logout != null}">
                        <div class="alert alert-success">
                            <p>Вы успешно вышли.</p>
                        </div>
                    </c:if>
                    <h3>Авторизизация</h3>
                    <c:if test="${param.error != null}">
                        <div class="error-login">
                            <p>Неверный логин или пароль.</p>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Логин</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="j_username" id="inputEmail3"
                                   placeholder="Логин">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Пароль</label>
                        <div class="col-sm-10">
                            <input type="password" name="j_password" class="form-control" id="inputPassword3"
                                   placeholder="Пароль">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn">Войти</button>
                        </div>
                    </div>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
<span class="text-center">Привет : ${pageContext.request.userPrincipal.name} <br>

        <a href="<c:url value="/adminpage"/>">Админка</a> </span><br>
                        <c:url value="/logout" var="logoutUrl"/>
                        <button class="btn btn-lg btn-warning" href="${logoutUrl}">Выход</button>
                    </c:if>
                </sec:authorize>

            </form>
        </div>
    </div>
</div>
</body>
</html>
