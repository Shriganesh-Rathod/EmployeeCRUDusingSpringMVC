<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>EmployeeHub | Employee Form</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f7fb;
            color: #1f2937;
            min-height: 100vh;
        }

        .layout {
            display: flex;
            min-height: 100vh;
        }

        /* ============================= */
        /* SIDEBAR                        */
        /* ============================= */

        .sidebar {
            width: 240px;
            background: #111827;
            color: white;
            padding: 24px 18px;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 0 10px 30px;
            border-bottom: 1px solid #2b3342;
        }

        .brand-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: bold;
        }

        .brand h2 {
            font-size: 18px;
        }

        .nav {
            margin-top: 28px;
        }

        .nav-title {
            color: #6b7280;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0 12px;
            margin-bottom: 10px;
        }

        .nav a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 14px;
            color: #cbd5e1;
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 5px;
            font-size: 14px;
            transition: 0.25s ease;
        }

        .nav a:hover {
            background: #1f2937;
            color: white;
            transform: translateX(3px);
        }

        .nav a.active {
            background: #2563eb;
            color: white;
        }

        .nav-icon {
            width: 18px;
            text-align: center;
        }

        /* ============================= */
        /* MAIN                           */
        /* ============================= */

        .main {
            margin-left: 240px;
            width: calc(100% - 240px);
        }

        /* ============================= */
        /* TOP BAR                        */
        /* ============================= */

        .topbar {
            height: 70px;
            background: white;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 35px;
        }

        .topbar-title {
            font-size: 18px;
            font-weight: bold;
        }

        .user-area {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: #dbeafe;
            color: #1d4ed8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .user-info {
            line-height: 1.3;
            text-align: right;
        }

        .user-name {
            font-size: 13px;
            font-weight: bold;
        }

        .user-role {
            font-size: 11px;
            color: #6b7280;
        }

        /* ============================= */
        /* CONTENT                        */
        /* ============================= */

        .content {
            padding: 35px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 28px;
        }

        .page-header h1 {
            font-size: 28px;
            color: #111827;
            margin-bottom: 7px;
        }

        .page-header p {
            color: #6b7280;
            font-size: 14px;
        }

        .back-link {
            text-decoration: none;
            color: #374151;
            font-size: 14px;
            font-weight: bold;
            transition: 0.2s ease;
        }

        .back-link:hover {
            color: #2563eb;
        }

        /* ============================= */
        /* FORM PANEL                     */
        /* ============================= */

        .form-panel {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .form-panel-header {
            padding: 22px 28px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form-panel-title {
            font-size: 17px;
            font-weight: bold;
            color: #111827;
        }

        .form-panel-subtitle {
            color: #6b7280;
            font-size: 13px;
            margin-top: 4px;
        }

        .status-badge {
            padding: 6px 11px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }

        .status-new {
            background: #ecfdf5;
            color: #047857;
        }

        .status-edit {
            background: #eff6ff;
            color: #1d4ed8;
        }

        /* ============================= */
        /* FORM BODY                      */
        /* ============================= */

        .form-body {
            padding: 30px;
        }

        .section-title {
            font-size: 13px;
            font-weight: bold;
            color: #374151;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #f0f1f3;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 13px;
            font-weight: bold;
            color: #374151;
            margin-bottom: 8px;
        }

        .required {
            color: #dc2626;
            margin-left: 3px;
        }

        .form-group input {
            height: 44px;
            width: 100%;
            padding: 0 13px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            background: #ffffff;
            font-size: 14px;
            color: #111827;
            outline: none;
            transition: 0.25s ease;
        }

        .form-group input::placeholder {
            color: #9ca3af;
        }

        .form-group input:hover {
            border-color: #9ca3af;
        }

        .form-group input:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        .field-help {
            font-size: 11px;
            color: #9ca3af;
            margin-top: 6px;
        }

        /* ============================= */
        /* FORM FOOTER                    */
        /* ============================= */

        .form-footer {
            margin-top: 32px;
            padding-top: 22px;
            border-top: 1px solid #e5e7eb;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn {
            min-width: 120px;
            height: 42px;
            padding: 0 18px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: 0.25s ease;
        }

        .btn-secondary {
            background: white;
            color: #374151;
            border: 1px solid #d1d5db;
        }

        .btn-secondary:hover {
            background: #f9fafb;
            border-color: #9ca3af;
            transform: translateY(-1px);
        }

        .btn-primary {
            background: #2563eb;
            color: white;
            border: 1px solid #2563eb;
        }

        .btn-primary:hover {
            background: #1d4ed8;
            border-color: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 5px 12px rgba(37, 99, 235, 0.22);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        /* ============================= */
        /* RESPONSIVE                     */
        /* ============================= */

        @media (max-width: 800px) {

            .sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            .content {
                padding: 22px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {

            .sidebar {
                display: none;
            }

            .main {
                margin-left: 0;
                width: 100%;
            }

            .topbar {
                padding: 0 18px;
            }

            .user-info {
                display: none;
            }

            .content {
                padding: 18px;
            }

            .page-header {
                align-items: flex-start;
                gap: 15px;
                flex-direction: column;
            }

            .form-body {
                padding: 20px;
            }

            .form-footer {
                flex-direction: column-reverse;
            }

            .btn {
                width: 100%;
            }
        }

    </style>

</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->

    <aside class="sidebar">

        <div class="brand">

            <div class="brand-icon">
                EM
            </div>

            <h2>EmployeeHub</h2>

        </div>

        <div class="nav">

            <div class="nav-title">
                Management
            </div>

            <a href="<c:url value='/employees'/>">

                <span class="nav-icon">
                    ▦
                </span>

                Employees

            </a>

            <a href="<c:url value='/employees/new'/>"
               class="active">

                <span class="nav-icon">
                    ＋
                </span>

                Add Employee

            </a>

        </div>

    </aside>


    <!-- MAIN -->

    <main class="main">


        <!-- TOP BAR -->

        <header class="topbar">

            <div class="topbar-title">
                Employee Management
            </div>

            <div class="user-area">

                <div class="user-info">

                    <div class="user-name">
                        Administrator
                    </div>

                    <div class="user-role">
                        System Admin
                    </div>

                </div>

                <div class="avatar">
                    A
                </div>

            </div>

        </header>


        <!-- CONTENT -->

        <section class="content">


            <!-- PAGE HEADER -->

            <div class="page-header">

                <div>

                    <c:choose>
                        <c:when test="${employee.id == null}">
                            <h1>Add Employee</h1>
                            <p>
                                Create a new employee profile and add it to the organization.
                            </p>
                        </c:when>

                        <c:otherwise>
                            <h1>Edit Employee</h1>
                            <p>
                                Update the employee information and save the changes.
                            </p>
                        </c:otherwise>
                    </c:choose>

                </div>


                <a
                        href="<c:url value='/employees'/>"
                        class="back-link">

                    ← Back to Employees

                </a>

            </div>


            <!-- FORM PANEL -->

            <div class="form-panel">


                <div class="form-panel-header">

                    <div>

                        <div class="form-panel-title">
                            Employee Information
                        </div>

                        <div class="form-panel-subtitle">
                            Enter the employee's professional and contact details.
                        </div>

                    </div>


                    <c:choose>

                        <c:when test="${employee.id == null}">
                            <div class="status-badge status-new">
                                New Employee
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div class="status-badge status-edit">
                                Editing Employee #<c:out value="${employee.id}"/>
                            </div>
                        </c:otherwise>

                    </c:choose>

                </div>


                <!-- FORM -->

                <div class="form-body">

                    <form
                            action="<c:url value='/employees/save'/>"
                            method="post">


                        <!--
                            VERY IMPORTANT:
                            For a new employee this value is empty.
                            For an existing employee this contains the ID.
                            This is what allows the service/repository to
                            distinguish INSERT from UPDATE.
                        -->

                        <input
                                type="hidden"
                                name="id"
                                value="${employee.id}">


                        <div class="section-title">
                            Personal &amp; Professional Details
                        </div>


                        <div class="form-grid">


                            <!-- NAME -->

                            <div class="form-group">

                                <label for="name">

                                    Employee Name

                                    <span class="required">*</span>

                                </label>

                                <input
                                        type="text"
                                        id="name"
                                        name="name"
                                        value="${employee.name}"
                                        placeholder="Enter full name"
                                        required>

                                <span class="field-help">
                                    Enter the employee's full name.
                                </span>

                            </div>


                            <!-- EMAIL -->

                            <div class="form-group">

                                <label for="email">

                                    Email Address

                                    <span class="required">*</span>

                                </label>

                                <input
                                        type="email"
                                        id="email"
                                        name="email"
                                        value="${employee.email}"
                                        placeholder="name@company.com"
                                        required>

                                <span class="field-help">
                                    Use the official company email.
                                </span>

                            </div>


                            <!-- DEPARTMENT -->

                            <div class="form-group">

                                <label for="department">

                                    Department

                                    <span class="required">*</span>

                                </label>

                                <input
                                        type="text"
                                        id="department"
                                        name="department"
                                        value="${employee.department}"
                                        placeholder="e.g. Engineering"
                                        required>

                                <span class="field-help">
                                    Example: Engineering, HR, Finance.
                                </span>

                            </div>


                            <!-- SALARY -->

                            <div class="form-group">

                                <label for="salary">

                                    Annual Salary

                                    <span class="required">*</span>

                                </label>

                                <input
                                        type="number"
                                        id="salary"
                                        name="salary"
                                        value="${employee.salary}"
                                        placeholder="Enter salary"
                                        step="0.01"
                                        min="0"
                                        required>

                                <span class="field-help">
                                    Enter the annual salary amount.
                                </span>

                            </div>


                        </div>


                        <!-- FORM BUTTONS -->

                        <div class="form-footer">

                            <a
                                    href="<c:url value='/employees'/>"
                                    class="btn btn-secondary">

                                Cancel

                            </a>


                            <button
                                    type="submit"
                                    class="btn btn-primary">

                                <c:choose>

                                    <c:when test="${employee.id == null}">
                                        Save Employee
                                    </c:when>

                                    <c:otherwise>
                                        Update Employee
                                    </c:otherwise>

                                </c:choose>

                            </button>

                        </div>


                    </form>

                </div>

            </div>

        </section>

    </main>

</div>

</body>

</html>