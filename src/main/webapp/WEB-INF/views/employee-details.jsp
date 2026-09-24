<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>EmployeeHub | Employee Details</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f6f8fb;
            color: #1f2937;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 560px;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 14px;
            padding: 32px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
        }

        .header {
            border-bottom: 1px solid #e5e7eb;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #111827;
        }

        .subtitle {
            margin-top: 6px;
            color: #6b7280;
            font-size: 13px;
        }

        .details {
            display: flex;
            flex-direction: column;
        }

        .row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #f1f5f9;
        }

        .row:last-child {
            border-bottom: none;
        }

        .label {
            color: #6b7280;
            font-size: 12px;
            font-weight: bold;
        }

        .value {
            color: #111827;
            font-size: 13px;
            font-weight: 500;
        }

        .department {
            padding: 5px 10px;
            border-radius: 20px;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 11px;
            font-weight: bold;
        }

        .salary {
            font-weight: bold;
        }

        .actions {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .button {
            flex: 1;
            height: 42px;
            border-radius: 7px;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
        }

        .back-button {
            background: #111827;
            color: white;
        }

        .edit-button {
            background: #2563eb;
            color: white;
        }

        .back-button:hover {
            background: #1f2937;
        }

        .edit-button:hover {
            background: #1d4ed8;
        }

    </style>

</head>

<body>

<div class="card">

    <div class="header">

        <div class="title">
            Employee Details
        </div>

        <div class="subtitle">
            Employee record retrieved successfully.
        </div>

    </div>


    <div class="details">


        <div class="row">

            <span class="label">
                Employee ID
            </span>

            <span class="value">
                #${employee.id}
            </span>

        </div>


        <div class="row">

            <span class="label">
                Name
            </span>

            <span class="value">
                ${employee.name}
            </span>

        </div>


        <div class="row">

            <span class="label">
                Email
            </span>

            <span class="value">
                ${employee.email}
            </span>

        </div>


        <div class="row">

            <span class="label">
                Department
            </span>

            <span class="department">
                ${employee.department}
            </span>

        </div>


        <div class="row">

            <span class="label">
                Salary
            </span>

            <span class="value salary">
                ₹ ${employee.salary}
            </span>

        </div>


    </div>


    <div class="actions">

        <a
                href="${pageContext.request.contextPath}/employees"
                class="button back-button">

            Back to Employees

        </a>


        <a
                href="${pageContext.request.contextPath}/employees/edit/${employee.id}"
                class="button edit-button">

            Edit Employee

        </a>

    </div>

</div>

</body>

</html>