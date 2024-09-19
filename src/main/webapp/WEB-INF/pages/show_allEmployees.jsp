<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.nit.model.Employee"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .add-employee {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 15px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .add-employee:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .action-btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .btn-edit {
            background-color: #28a745;
        }

        .btn-edit:hover {
            background-color: #218838;
        }

    </style>
    <script>
        function deleteEmployee(str) {
            if (confirm("Are You Sure?")) {
                document.frm.id.value = str;
                document.frm.action = "deleteEmp";
                document.frm.submit();
            }
        }

        function updateEmployee(str) {
            document.frm.id.value = str;
            document.frm.action = "updatePage";
            document.frm.submit();
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Employee Management</h1>
        <a href="addEmployee" class="add-employee">Add Employee</a>
        <form name="frm" action="" method="post">
            <input type="hidden" name="id">
            <%
                List<Employee> employees = (List<Employee>) request.getAttribute("employees");
            %>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Salary</th>
                    <th colspan="2">Operations</th>
                </tr>
                <%
                if (employees.isEmpty()) {
                %>
                <tr>
                    <td colspan="6" style="text-align: center;">No Employees Found...</td>
                </tr>
                <%
                } else {
                    for (Employee e : employees) {
                %>
                <tr>
                    <td><%= e.getId() %></td>
                    <td><%= e.getName() %></td>
                    <td><%= e.getAddress() %></td>
                    <td><%= e.getSalary() %></td>
                    <td>
                        <button type="button" class="action-btn btn-delete" onclick="deleteEmployee('<%= e.getId() %>')">Delete</button>
                    </td>
                    <td>
                        <button type="button" class="action-btn btn-edit" onclick="updateEmployee('<%= e.getId() %>')">Edit</button>
                    </td>
                </tr>
                <%
                    }
                }
                %>
            </table>
        </form>
    </div>
</body>
</html>
