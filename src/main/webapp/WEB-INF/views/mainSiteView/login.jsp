<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootSite/header.jsp" %>

<section class="login-page">
    <h2>Login</h2>
    <form method="post">

        <div class="form-group">
            <div><label> <input type="text" name="username" placeholder="Email"/> </label></div>
        </div>
        <div class="form-group">
            <div><label> <input type="password" name="password" placeholder="Password"/> </label></div>

        <a href="${pageContext.request.contextPath}/passwordReset" class="btn btn--small btn--without-border reset-password">Forget password?</a>
        </div>
        <div class="form-group form-group--buttons">
            <a href="${pageContext.request.contextPath}/register" class="btn btn--without-border">Create account</a>
            <button class="btn" type="submit">Login</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</section>




<%@ include file="../headFootSite/footer.jsp" %>