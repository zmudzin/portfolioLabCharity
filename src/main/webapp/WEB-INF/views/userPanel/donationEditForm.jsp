<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootPanel/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="/" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
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
                    <h6 class="m-0 font-weight-bold text-primary">Donation</h6>
                </div>


<div class="container">
    <h1>Add User</h1>
    <form:form method="POST" modelAttribute="donation">
        <label>Quantity:</label>
        <div>
            <form:input type="number" path="quantity"/>>
        </div>
        <label>Categories:</label>
        <div>
            <c:forEach items="${categories}" var="category">
                <form:checkbox path="categories" value="${category.id}"
                               checked="${donation.categories.contains(category) ? 'true' : ''}"/>
                ${category.name}<br/>
            </c:forEach>
        </div>
        <label>Institution:</label>
        <div>
            <form:select path="institution.id">
                <c:forEach items="${institutions}" var="institution">
                    <form:option value="${institution.id}">${institution.name}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <label>Street:</label>
        <div>
            <form:input path="street"/>
        </div>
        <label>City:</label>
        <div>
            <form:input path="city"/>
        </div>
        <label>Zip Code:</label>
        <div>
            <form:input path="zipCode"/>
        </div>
        <label>Pick Up Date:</label>
        <div>
            <form:input type="date" path="pickUpDate"/>
        </div>
        <label>Pick Up Time:</label>
        <div>
            <form:input type="time" path="pickUpTime"/>
        </div>
        <label>Pick Up Comment:</label>
        <div>
            <form:textarea path="pickUpComment" rows="5" cols="25"/>
        </div>
        <label>Collected:</label>
        <div>
            <form:checkbox path="collected"/>
        </div>
        <form:input path="user.id" type="hidden" value="${userId}"/>
        <input type="submit" value="Save"/>
    </form:form>
    <button class="cancel" onclick="location.href='/userPanel/donations'" >Cancel</button>
</div>
                <%@ include file="../headFootAdmin/footer.jsp" %>

