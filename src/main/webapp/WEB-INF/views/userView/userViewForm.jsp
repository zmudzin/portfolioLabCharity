<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootAdmin/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Wróć na stronę główną</a>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Użytkownik</h6>
                </div>


                <div class="container">
                    <h1>User Details</h1>
                    <label>Email:</label>
                    <div>${user.email}</div>
                    <form action="/admin/updateEmail/${user.id}" method="post">
                        <input type="text" name="newEmail" placeholder="New Email" required>
                        <button type="submit">Update Email</button>
                    </form>
                    <label>Enabled:</label>
                    <form id="enabledForm" action="/admin/updateEnabled/${user.id}" method="post">
                        <select name="enabled" id="enabledSelect">
                            <option value="true" ${user.enabled ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!user.enabled ? 'selected' : ''}>No</option>
                        </select>
                        <button type="submit" >Potwierdź</button>
                    </form>
                    <label>Password:</label>
                    <div>********</div> <!-- Displaying asterisks to indicate password confidentiality -->
                    <form action="/admin/updatePassword/${user.id}" method="post">
                        <input type="text" name="newPassword" placeholder="New Password" required>
                        <button type="submit">Update Password</button>
                    </form>
                    <label>Role:</label>
                    <form id="roles" action="/admin/updateUserRole/${user.id}" method="post">
                        <select name="roleName"> <!-- Ustawiamy atrybut name na roleName -->
                            <c:forEach var="role" items="${roles}">
                                <option value="${role.name}">${role.name}</option>
                            </c:forEach>
                        </select>
                        <button type="submit">Change Role</button>
                    </form>

                    <button class="cancel" onclick="location.href='${pageContext.request.contextPath}/userPanel'">Back</button>
                </div>
                <%@ include file="../headFootAdmin/footer.jsp" %>

