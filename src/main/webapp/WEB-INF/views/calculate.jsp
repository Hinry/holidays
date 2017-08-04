<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 04.08.2017
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap-datepicker/css/bootstrap-datepicker3.css"/>">
    <script src="<c:url value="/resources/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
    <script src="<c:url value="/resources/bootstrap-datepicker/locales/bootstrap-datepicker.ru.min.js"/>"></script>


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

    <form method="post" class="m-auto" style="width: 400px" action="/calculate">
        <div class="input-daterange input-group" id="datepicker">

            <div class="input-group-addon">дата с</div>
            <input name="startDate" type="text" readonly="true" class="form-control form-control-sm"
                   id="datestart"/>
            <div class="input-group-addon">по</div>
            <input name="endDate" type="text" readonly="true" class="form-control form-control-sm"
                   id="dateend"/>

        </div>
        <button type="submit" class="w-100 mt-5 btn btn-outline-success">Начать</button>
    </form>

    <script>
        $('#datepicker').datepicker({
            format: "yyyy-mm-dd",
            language: "ru",
            autoclose: true,
            todayHighlight: true
        });
        $('#resetDate').on('click', function () {
            var $btn = $(this).button('loading');
            // business logic...
            $btn.button('reset')
        })
    </script>


    <c:choose>
        <c:when test="${result!=null}">
            <div class="w-50 m-auto">
                <div class="result mt-lg-5">
                    <h5 class="text-center text-white">
                        Всего <span style="color: #2aabd2">${result.weekdays}</span> выходных.
                    </h5>
                    <h5 class="text-center text-white">
                        Из них <span style="color: #a94442">${result.holidays}</span> праздников.
                    </h5>
                </div>
            </div>
        </c:when>
    </c:choose>
    <div class="m-auto" style="width: 400px">
        <a class="mt-5 w-100 ml-auto btn btn-outline-danger" href="<c:url value="/"/>">Завершить</a>
    </div>

</div>
</body>
</html>
