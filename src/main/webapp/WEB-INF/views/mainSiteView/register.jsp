<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootSite/header.jsp" %>
<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="POST" modelAttribute="user" id="registerForm">
        <div class="form-group">
            <form:label path="email"> </form:label>
            <form:input path="email" type="text" placeholder="Email"/>
            <form:errors path="email" cssClass="error"/>
        </div>
        <div class="form-group">
            <form:label path="password"></form:label>
            <form:input id="password" path="password" type="password" placeholder="Hasło"/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <div class="form-group">
            <form:label path="passwordConfirm"></form:label>
            <form:input id="passwordConfirm" path="passwordConfirm" type="password" placeholder="Powtórz Hasło"/>
            <form:errors path="passwordConfirm" cssClass="error"/>
        </div>
        <div class="form-group form-group--buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>


<%@ include file="../headFootSite/footer.jsp" %>