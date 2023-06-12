<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div class="container">
    <h1>Add User</h1>
    <form:form method="POST" modelAttribute="user">
        <label>email:</label>
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
            <form:password path="password"/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <label>Role:</label>
        <div>
            <form:select path="roles"
                         items="${roles}" itemLabel="name" itemValue="id"/>
            <form:errors path="roles" cssClass="error"/>
        </div>
        <input type="submit" value="Add"/>
    </form:form>
    <button class="cancel" onclick="location.href='/users'" >Cancel</button>
</div>
</body>

</html>
