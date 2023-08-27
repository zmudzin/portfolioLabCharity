<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootAdmin/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Donations</h1>
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
                    <h6 class="m-0 font-weight-bold text-primary"></h6>
                    <!-- Topbar Search -->
                    <form action="${pageContext.request.contextPath}/admin/donations" method="get" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for user..." name="userEmail" aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <style>
                        table {
                            width: 100%;
                            border-collapse: collapse;
                            margin-bottom: 20px;
                        }

                        th, td {
                            padding: 10px;
                            text-align: left;
                        }

                        th {
                            background-color: #f2f2f2;
                        }

                        tbody tr:nth-child(even) {
                            background-color: #f9f9f9;
                        }
                        .filter-container {
                            display: inline-block;
                            vertical-align: middle;
                        }

                        .filter-form {
                            display: inline-block;
                        }

                        .show-all-button {
                            display: inline-block;
                            margin-left: 10px; /* Odstęp między formularzem a przyciskiem */
                        }
                        .page-link {
                            display: inline-block;
                            padding: 5px 10px;
                            margin: 2px;
                            border: 1px solid #ccc;
                            background-color: #f2f2f2;
                            color: #333;
                            text-decoration: none;
                        }

                        .current-page {
                            font-weight: bold;
                            background-color: #333;
                            color: #fff;
                        }
                    </style>
                    <th>
                        <div class="filter-container">
                            <form method="get" class="filter-form">
                                <label><input type="checkbox" name="collected" value="true"> true</label>
                                <label><input type="checkbox" name="collected" value="false"> false</label>
                                <input type="submit" value="Collected">
                            </form>
                            <a href="/admin/donations" class="show-all-button"><button>Pokaż wszystkie</button></a>
                        </div>
                    </th>
                    <table>
                        <thead>
                        <tr>

                            <th>
                                <a href="?sort=user&direction=asc">User ▲</a>
                                <a href="?sort=user&direction=desc">▼</a>
                            </th>
                            <th>Categories</th>
                            <th>
                                <a href="?sort=name&direction=asc">Institutions ▲</a>
                                <a href="?sort=name&direction=desc">▼</a>
                            </th>
                            <th>
                                <a href="?sort=quantity&direction=asc">Quantity▲</a>
                                <a href="?sort=quantity&direction=desc">▼</a>
                            </th>
                            <th>
                                <a href="?sort=pickUpDate&direction=asc">Pickup date▲</a>
                                <a href="?sort=pickUpDate&direction=desc">▼</a>
                            </th>
                            <th>
                                <a>Collected</a>
                            </th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${donations}" var="donation">
                            <tr>
                                <td>${donation.user.email}</td>
                                <td>${donation.categories}</td>
                                <td>${donation.institution}</td>
                                <td>${donation.quantity}</td>
                                <td>${donation.pickUpDate}</td>
                                <td>${donation.collected}</td>
                                <td>
                                    <form action="/admin/donations/${donation.id}" style="display: inline;">
                                        <button type="submit" class="edit-button">View</button>
                                    </form>
                                    <form action="/admin/donations/edit/${donation.id}" style="display: inline;">
                                        <button type="submit" class="edit-button">Edit</button>
                                    </form>
                                    <form action="/admin/donations/delete/${donation.id}" style="display: inline;">
                                        <button type="submit" class="delete-button">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="pagination">
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}&size=${pageSize}" class="page-link">Previous</a>
                </c:if>

                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                    <c:choose>
                        <c:when test="${loop.index == currentPage}">
                            <span class="current-page">${loop.index + 1}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${loop.index}&size=${pageSize}" class="page-link">${loop.index + 1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}&size=${pageSize}" class="page-link">Next</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
</div>
<!-- /.container-fluid -->
<%@ include file="../headFootAdmin/footer.jsp" %>