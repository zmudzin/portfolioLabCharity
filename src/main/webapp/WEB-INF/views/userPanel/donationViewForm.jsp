<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootPanel/header.jsp" %>
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
                    <h6 class="m-0 font-weight-bold text-primary">Donations</h6>
                </div>


                <div class="container">
                    <h1>Donation Details</h1>
                    <label>Quantity:</label>
                    <div>${donation.quantity}</div>
                    <label>Categories:</label>
                    <div>
                        <c:forEach items="${donation.categories}" var="category">
                            <div>${category.name}</div>
                        </c:forEach>
                    </div>
                    <label>Institution:</label>
                    <div>${donation.institution.name}</div>
                    <label>Street:</label>
                    <div>${donation.street}</div>
                    <label>City:</label>
                    <div>${donation.city}</div>
                    <label>Zip Code:</label>
                    <div>${donation.zipCode}</div>
                    <label>Pick Up Date:</label>
                    <div>${donation.pickUpDate}</div>
                    <label>Pick Up Time:</label>
                    <div>${donation.pickUpTime}</div>
                    <label>Pick Up Comment:</label>
                    <div>${donation.pickUpComment}</div>
                    <label>Collected:</label>
                    <div>${donation.collected}</div>
                    <button class="cancel" onclick="location.href='/userPanel/donations'">Back</button>
                </div>
                <%@ include file="../headFootAdmin/footer.jsp" %>

