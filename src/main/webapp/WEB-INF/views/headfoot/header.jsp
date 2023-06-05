<!DOCTYPE html>
<html lang="pl">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="${pageContext.request.contextPath}/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="${pageContext.request.contextPath}/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="${pageContext.request.contextPath}/" class="btn btn--without-border active">Start</a></li>
            <li><a href="${pageContext.request.contextPath}/#stepsTarget" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="${pageContext.request.contextPath}/#aboutUsTarget" class="btn btn--without-border">O nas</a></li>
            <li><a href="${pageContext.request.contextPath}/#helpTarget" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="${pageContext.request.contextPath}/form#scrollTarget" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="${pageContext.request.contextPath}/#contactTarget" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

</header>

