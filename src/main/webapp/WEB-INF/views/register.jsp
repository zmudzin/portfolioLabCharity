<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="headfoot/header.jsp" %>
<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="POST" modelAttribute="user" id="registerForm">
        <div class="form-group">
            <form:label path="email"> email </form:label>
            <form:input path="email" type="text"/>
            <form:errors path="email" cssClass="error"/>
        </div>
        <div class="form-group">
            <form:label path="password"> password </form:label>
            <form:input id="password" path="password" type="text"/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <div class="form-group">
            <form:label path="passwordConfirm"> password </form:label>
            <form:input id="passwordConfirm" path="passwordConfirm" type="text"/>
            <form:errors path="passwordConfirm" cssClass="error"/>
        </div>
        <div class="form-group form-group--buttons">
            <a href="login.jsp" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>


<%@ include file="headfoot/footer.jsp" %>