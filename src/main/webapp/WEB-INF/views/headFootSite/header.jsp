<!DOCTYPE html>
<html lang="pl">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <security:authorize access="isAuthenticated()">
             <li> Hello, <security:authentication property="name" /> </li>
                <li><form action="<c:url value="/logout"/>" method="post">
                    <input class="fa fa-id-badge" type="submit" value="Wyloguj">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form></li>
                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin" />Admin panel</a>
                    </li>
                </security:authorize>
                <security:authorize access="hasRole('ROLE_USER')" >
                    <li>
                        <a href="${pageContext.request.contextPath}/userPanel/userPanelIndex">User panel</a>
                    </li>
                </security:authorize>
            </security:authorize>
            <security:authorize access="!isAuthenticated()">
                <li><a href="${pageContext.request.contextPath}/login" class="btn btn--small btn--without-border">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/register" class="btn btn--small btn--highlighted">Create account</a></li>
            </security:authorize>
        </ul>

        <ul>
            <li><a href="${pageContext.request.contextPath}/" class="btn btn--without-border active">Start</a></li>
            <li><a href="${pageContext.request.contextPath}/#stepsTarget" class="btn btn--without-border">What is going on?</a></li>
            <li><a href="${pageContext.request.contextPath}/#aboutUsTarget" class="btn btn--without-border">About us</a></li>
            <li><a href="${pageContext.request.contextPath}/#helpTarget" class="btn btn--without-border">Foundations and organizations</a></li>
            <li><a href="${pageContext.request.contextPath}/form#scrollTarget" class="btn btn--without-border">Donate gifts</a></li>
            <li><a href="${pageContext.request.contextPath}/#contactTarget" class="btn btn--without-border">Contact</a></li>
        </ul>
    </nav>
</header>

