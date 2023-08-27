<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootPanel/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="/" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Back to Main Site</a>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary"></h6>
                </div>


                <div class="container">
                    <h1>User Details</h1>
                    <label>Email:</label>
                    <div>${user.email}</div>
                    <form action="/userPanel/updateEmail/${user.id}" method="post">
                        <input type="text" name="newEmail" placeholder="New Email" required>
                        <button type="submit">Update Email</button>
                    </form>
                    <label>Enabled:</label>
                    <div>${user.enabled ? 'Yes' : 'No'}</div>
                    <label>Password:</label>
                    <div>********</div> <!-- Displaying asterisks to indicate password confidentiality -->
                    <form action="/userPanel/updatePassword/${user.id}" method="post">
                        <input type="text" name="newPassword" placeholder="New Password" required>
                        <button type="submit">Update Password</button>
                    </form>
                    <label>Role:</label>
                    <div>
                        <c:forEach var="role" items="${user.roles}">
                            <div>${role.name}</div>
                        </c:forEach>
                    </div>
<%--                    <button class="cancel" onclick="location.href='${pageContext.request.contextPath}/userPanel'">Back</button>--%>
                </div>
                <%@ include file="../headFootAdmin/footer.jsp" %>

