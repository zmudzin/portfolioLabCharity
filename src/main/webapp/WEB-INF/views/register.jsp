<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="headfoot/header.jsp" %>
    <section class="login-page">
      <h2>Załóż konto</h2>
      <form>
        <div class="form-group">
          <input type="email" name="email" placeholder="Email" />
        </div>
        <div class="form-group">
          <input type="password" name="password" placeholder="Hasło" />
        </div>
        <div class="form-group">
          <input type="password" name="password2" placeholder="Powtórz hasło" />
        </div>
        <div class="form-group form-group--buttons">
          <a href="login.html" class="btn btn--without-border">Zaloguj się</a>
          <button class="btn" type="submit">Załóż konto</button>
        </div>
      </form>
    </section>

<%@ include file="headfoot/footer.jsp" %>