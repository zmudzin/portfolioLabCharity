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
                    <h6 class="m-0 font-weight-bold text-primary">Institution</h6>
                </div>


                <div class="container">
                    <div class="container">
                        <h1>Delete Institution</h1>
                        <div class="confirmation-message">
                            Are you sure you want to delete this institution?
                        </div>
                        <div class="confirmation-buttons">
                            <form method="POST" action="/admin/institutions/delete/${institution.id}">
                                <button type="submit">Yes</button>
                            </form >
                            <button class="cancel" onclick="location.href='/admin/institutions'">No</button>
                        </div>
                    </div>
                </div>
<%@ include file="../headFootAdmin/footer.jsp" %>