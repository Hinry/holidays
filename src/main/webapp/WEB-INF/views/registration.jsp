<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 04.08.2017
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
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
<div class="container">
    <form:form method="POST" modelAttribute="user" class="form-horizontal">

        <form:input type="hidden" path="id" id="id"/>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="text-white col-md-3 control-lable" for="login">Логин</label>
                <div class="col-md-5">
                    <form:input type="text" path="login" id="login" class="form-control input-sm"/>
                    <div class="has-error">
                        <form:errors path="login" class="help-inline text-warning"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="text-white col-md-3 control-lable" for="firstName">Имя</label>
                <div class="col-md-5">
                    <form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
                    <div class="has-error">
                        <form:errors path="firstName" class="help-inline text-warning"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="text-white col-md-3 control-lable" for="lastName">Фамилия</label>
                <div class="col-md-5">
                    <form:input type="text" path="lastName" id="lastName" class="form-control input-sm"/>
                    <div class="has-error">
                        <form:errors path="lastName" class="help-inline text-warning"/>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="form-group col-md-12">
                <label class="text-white col-md-3 control-lable" for="password">Пароль</label>
                <div class="col-md-5">
                    <form:input type="password" path="password" id="password" class="form-control input-sm"/>
                    <div class="has-error">
                        <form:errors path="password" class="help-inline text-warning"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-actions">
                <input type="submit" value="Регистрация" class="btn btn-primary btn-sm"/> или <a
                    href="<c:url value='/' />">Отмена</a>
            </div>
        </div>
    </form:form>
</div>
</body>
</html>
