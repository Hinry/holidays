<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 30.07.2017
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <title>Система расчета выходных и праздничных дней</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>" rel="script"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
            integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
            crossorigin="anonymous"></script>

    <script src="<c:url value="/resources/js/bootstrap.js"/>" rel="script"></script>


</head>
<body>
<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-3">Система расчетов</h1>
        <p class="lead">Сервис с помощью которго вы сможете расчитать выходные и праздничные дни в вашем рабочем
            календаре.</p>

    </div>
</div>
<div class="container main-container">
    <div class="m-auto w-50">
        <c:if test="${success != null}">
            <h3 class="text-success">${success}</h3>
        </c:if>

        <security:authorize access="!isAuthenticated()">

            <h4 class="text-white text-center mb-5">Для использования сервиса пройдите один из этапов:</h4>

            <sec:authorize access="!isAuthenticated()">
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">
                        <p>Вы успешно вышли.</p>
                    </div>
                </c:if>
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        <p>Неверный логин или пароль.</p>
                    </div>
                </c:if>
            </sec:authorize>

            <div class="btn-group btn-group-lg w-100" role="group" aria-label="Basic example">
                <a href="<c:url value="/registration"/>" class="btn btn-outline-primary btn-lg btn-w50">Регистрация</a>

                <button type="button" data-toggle="modal" data-target=".modal-authorize"
                        class="btn btn-outline-success btn-lg btn-w50">Авторизация
                </button>

                <!--  modal -->
                <div class="modal fade modal-authorize" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Авторизация</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <form action="<c:url value="/login"/>" method="post">
                                <div class="modal-body">


                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-2 control-label">Логин</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="j_username" id="inputEmail3"
                                                   placeholder="Логин">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label">Пароль</label>
                                        <div class="col-sm-10">
                                            <input type="password" name="j_password" class="form-control"
                                                   id="inputPassword3"
                                                   placeholder="Пароль">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">отмена</button>
                                    <button class="btn btn-outline-success">Войти</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </security:authorize>
        <security:authorize access="isAuthenticated()">

            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <h4 class="text-white text-center mb-5">Привет : <span style="color: #2aabd2;">
                        ${pageContext.request.userPrincipal.name} </span></h4>
            </c:if>

            <div class="btn-group btn-group-lg w-100" role="group" aria-label="Basic example">
                <a class="btn btn-outline-info btn-lg btn-w50" href="<c:url value="/calculate"/>">Перейти к расчетам</a>
                <a class="btn btn-outline-danger btn-lg btn-w50" href="<c:url value="/logout"/>">Завершить работу</a>
            </div>


        </security:authorize>
    </div>


</div>


</body>
</html>
