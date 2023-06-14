<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootSite/header.jsp" %>

<section class="login-page">
    <h2>Zaloguj się</h2>
    <form method="post">

        <div class="form-group">
            <div><label> <input type="text" name="email" placeholder="Email"/> </label></div>
        </div>

        <div class="form-group form-group--buttons">
            <a href="${pageContext.request.contextPath}/passwordReset" class="btn btn--without-border">Wyślij nowe hasło</a>
            <button class="btn" type="submit">Wyślij</button>
        </div>
    </form>
</section>




<%@ include file="../headFootSite/footer.jsp" %>