<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootAdmin/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Back to main site</a>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Users</h6>
                </div>


<div class="container">
    <h1>Edit User</h1>
    <form:form method="POST" modelAttribute="user">
        <label>Email:</label>
        <div>
            <form:input path="email"/>
            <form:errors path="email" cssClass="error"/>
        </div>
        <label>Enabled:</label>
        <div>
            <form:checkbox path="enabled" value="1"/>
            <form:errors path="enabled" cssClass="error"/>
        </div>
        <label>Password:</label>
        <div>
            <form:password path="password" value=""/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <label>Role:</label>
        <div>
            <form:select path="roles"
                         items="${roles}" itemLabel="name" itemValue="id"/>
            <form:errors path="roles" cssClass="error"/>
        </div>
        <input type="submit" value="Save"/>
    </form:form>
    <button class="cancel" onclick="location.href='/admin/users'" >Cancel</button>
</div>
                <%@ include file="../headFootAdmin/footer.jsp" %>

