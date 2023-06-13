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
                    <h6 class="m-0 font-weight-bold text-primary">Donations</h6>
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
                    </style>

                    <table>
                        <thead>
                        <tr>
                            <th>Kategorie</th>
                            <th>Instytucja</th>
                            <th>Ilość</th>
                            <th>Data odbioru</th>
                            <th>Zbierane</th>
                            <th>Akcje</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${donations}" var="donation">
                            <tr>
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
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- /.container-fluid -->
<%@ include file="../headFootAdmin/footer.jsp" %>