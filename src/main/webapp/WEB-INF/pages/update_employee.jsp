<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.nit.model.Employee"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Update Employee Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .form-container input[type="text"],
        .form-container input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #218838;
        }

        .form-container input[type="hidden"] {
            display: none;
        }
    </style>
</head>
<body>
    <%
        Employee e = (Employee) request.getAttribute("employee");
    %>

    <div class="form-container">
        <h2>Update Employee</h2>
        <form action="updateEmployee" method="post">
            <input type="hidden" name="id" value="<%=e.getId()%>" />

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%=e.getName()%>" />

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%=e.getAddress()%>" />

            <label for="salary">Salary:</label>
            <input type="number" id="salary" name="salary" value="<%=e.getSalary()%>" />

            <input type="submit" name="Update" value="Update" />
        </form>
    </div>
</body>
</html>
