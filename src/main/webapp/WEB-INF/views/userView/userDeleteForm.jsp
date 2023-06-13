<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../headFootAdmin/header.jsp" %>
<div class="container-fluid">

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Users</h6>
                </div>
                <%-- Komunikat sukcesu --%>
                <form method="post" action="/admin/users/delete/${user.id}">
                    <input type="hidden" name="email" value="${user.email}" />
                    <input type="hidden" name="password" value="${user.password}" />
                    <div class="confirmation-message">
                        Are you sure you want to delete this user?
                    </div>
                    <div class="confirmation-buttons">
                        <button type="submit">Yes</button>
                        <button class="cancel" onclick="location.href='/admin/users'">No</button>
                    </div>
                </form>
<%@ include file="../headFootAdmin/footer.jsp" %>