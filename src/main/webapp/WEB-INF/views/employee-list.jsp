<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>EmployeeHub | Employee Management</title>

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
        }

        .app {
            display: flex;
            min-height: 100vh;
        }


        /* ============================= */
        /* SIDEBAR                       */
        /* ============================= */

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            width: 245px;
            background: #111827;
            color: white;
            padding: 22px 16px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 10px 24px;
            border-bottom: 1px solid #293241;
        }

        .brand-logo {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: bold;
        }

        .brand-name {
            font-size: 17px;
            font-weight: bold;
        }

        .brand-subtitle {
            margin-top: 3px;
            color: #94a3b8;
            font-size: 10px;
            letter-spacing: 0.5px;
        }

        .navigation {
            margin-top: 28px;
        }

        .navigation-title {
            padding: 0 12px;
            margin-bottom: 10px;
            color: #6b7280;
            font-size: 10px;
            font-weight: bold;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .navigation a {
            display: flex;
            align-items: center;
            gap: 11px;
            padding: 12px 13px;
            margin-bottom: 5px;
            border-radius: 8px;
            color: #cbd5e1;
            text-decoration: none;
            font-size: 13px;
            transition: 0.2s ease;
        }

        .navigation a:hover {
            background: #1f2937;
            color: white;
        }

        .navigation a.active {
            background: #2563eb;
            color: white;
        }

        .nav-icon {
            width: 18px;
            text-align: center;
        }


        /* ============================= */
        /* MAIN                          */
        /* ============================= */

        .main {
            width: calc(100% - 245px);
            margin-left: 245px;
        }


        /* ============================= */
        /* TOPBAR                        */
        /* ============================= */

        .topbar {
            height: 68px;
            background: white;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .topbar-title {
            font-size: 18px;
            font-weight: bold;
            color: #111827;
        }

        .admin-area {
            display: flex;
            align-items: center;
            gap: 11px;
        }

        .admin-details {
            text-align: right;
        }

        .admin-name {
            font-size: 12px;
            font-weight: bold;
            color: #111827;
        }

        .admin-role {
            margin-top: 2px;
            font-size: 10px;
            color: #6b7280;
        }

        .admin-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: #dbeafe;
            color: #1d4ed8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            font-weight: bold;
        }


        /* ============================= */
        /* CONTENT                       */
        /* ============================= */

        .content {
            padding: 32px;
        }

        .page-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 25px;
            margin-bottom: 26px;
        }

        .page-title {
            font-size: 28px;
            font-weight: bold;
            color: #111827;
        }

        .page-description {
            margin-top: 7px;
            color: #6b7280;
            font-size: 13px;
        }


        /* ============================= */
        /* HEADER ACTIONS                */
        /* ============================= */

        .header-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .find-form {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .find-input {
            width: 155px;
            height: 40px;
            padding: 0 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            background: white;
            color: #111827;
            font-size: 12px;
            outline: none;
        }

        .find-input:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        .find-button {
            height: 40px;
            padding: 0 15px;
            border: none;
            border-radius: 7px;
            background: #111827;
            color: white;
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .find-button:hover {
            background: #1f2937;
            transform: translateY(-1px);
        }

        .add-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            height: 40px;
            padding: 0 16px;
            border-radius: 7px;
            background: #2563eb;
            color: #ffffff;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
            transition: 0.2s ease;
        }

        .add-button:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 6px 15px rgba(37, 99, 235, 0.2);
        }


        /* ============================= */
        /* STATS                         */
        /* ============================= */

        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 20px;
            transition: 0.2s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(0, 0, 0, 0.05);
        }

        .stat-label {
            color: #6b7280;
            font-size: 11px;
        }

        .stat-value {
            margin-top: 9px;
            font-size: 25px;
            font-weight: bold;
            color: #111827;
        }

        .stat-status {
            color: #059669;
        }


        /* ============================= */
        /* DIRECTORY                     */
        /* ============================= */

        .directory {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.04);
        }

        .directory-header {
            padding: 20px 24px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .directory-title {
            font-size: 16px;
            font-weight: bold;
            color: #111827;
        }

        .directory-description {
            margin-top: 4px;
            color: #6b7280;
            font-size: 11px;
        }

        .record-count {
            padding: 6px 10px;
            border-radius: 20px;
            background: #eff6ff;
            color: #2563eb;
            font-size: 10px;
            font-weight: bold;
        }


        /* ============================= */
        /* TABLE                         */
        /* ============================= */

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #f8fafc;
        }

        th {
            padding: 14px 18px;
            text-align: left;
            color: #64748b;
            font-size: 10px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            border-bottom: 1px solid #e5e7eb;
        }

        td {
            padding: 16px 18px;
            color: #374151;
            font-size: 12px;
            border-bottom: 1px solid #f1f5f9;
        }

        tbody tr {
            transition: 0.15s ease;
        }

        tbody tr:hover {
            background: #f8fbff;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .employee-id {
            color: #64748b;
            font-size: 11px;
            font-weight: bold;
        }

        .employee-name {
            color: #111827;
            font-size: 13px;
            font-weight: bold;
        }

        .employee-email {
            color: #2563eb;
        }

        .department {
            display: inline-block;
            padding: 5px 9px;
            border-radius: 20px;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 10px;
            font-weight: bold;
        }

        .salary {
            color: #111827;
            font-weight: bold;
        }


        /* ============================= */
        /* ACTIONS                       */
        /* ============================= */

        .actions {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .edit-button {
            padding: 7px 10px;
            border-radius: 6px;
            background: #eff6ff;
            color: #2563eb;
            border: 1px solid #dbeafe;
            text-decoration: none;
            font-size: 10px;
            font-weight: bold;
            transition: 0.2s ease;
        }

        .edit-button:hover {
            background: #dbeafe;
        }

        .delete-button {
            padding: 7px 10px;
            border-radius: 6px;
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
            font-size: 10px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .delete-button:hover {
            background: #fee2e2;
        }


        /* ============================= */
        /* EMPTY STATE                   */
        /* ============================= */

        .empty-state {
            min-height: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 40px;
        }

        .empty-icon {
            width: 76px;
            height: 76px;
            border-radius: 50%;
            background: #eff6ff;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2563eb;
            font-size: 30px;
            margin-bottom: 18px;
        }

        .empty-title {
            font-size: 20px;
            font-weight: bold;
            color: #111827;
            margin-bottom: 8px;
        }

        .empty-description {
            max-width: 390px;
            color: #6b7280;
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 22px;
        }


        /* ============================= */
        /* RESPONSIVE                    */
        /* ============================= */

        @media (max-width: 1000px) {

            .page-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .header-actions {
                width: 100%;
                justify-content: space-between;
            }

            .find-form {
                flex: 1;
            }

            .find-input {
                width: 100%;
            }

        }

        @media (max-width: 900px) {

            .sidebar {
                width: 205px;
            }

            .main {
                width: calc(100% - 205px);
                margin-left: 205px;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .content {
                padding: 22px;
            }

        }

        @media (max-width: 650px) {

            .sidebar {
                display: none;
            }

            .main {
                width: 100%;
                margin-left: 0;
            }

            .content {
                padding: 18px;
            }

            .topbar {
                padding: 0 18px;
            }

            .admin-details {
                display: none;
            }

            .header-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .find-form {
                width: 100%;
            }

            .add-button {
                justify-content: center;
            }

        }

    </style>

</head>


<body>

<div class="app">


    <!-- ============================= -->
    <!-- SIDEBAR                       -->
    <!-- ============================= -->

    <aside class="sidebar">

        <div class="brand">

            <div class="brand-logo">
                EM
            </div>

            <div>

                <div class="brand-name">
                    EmployeeHub
                </div>

                <div class="brand-subtitle">
                    MANAGEMENT PORTAL
                </div>

            </div>

        </div>


        <nav class="navigation">

            <div class="navigation-title">
                Management
            </div>


            <a
                    href="<c:url value='/employees'/>"
                    class="active">

                <span class="nav-icon">▦</span>

                Employees

            </a>


            <a
                    href="<c:url value='/employees/new'/>">

                <span class="nav-icon">＋</span>

                Add Employee

            </a>


            <a
                    href="#findEmployee">

                <span class="nav-icon">⌕</span>

                Find Employee

            </a>

              <a href="${pageContext.request.contextPath}/logout">

                            <span class="nav-icon">↪</span>

                            Logout

                        </a>


        </nav>

    </aside>


    <!-- ============================= -->
    <!-- MAIN                          -->
    <!-- ============================= -->

    <main class="main">


        <!-- TOPBAR -->

        <header class="topbar">

            <div class="topbar-title">
                Employee Management
            </div>


            <div class="admin-area">

                <div class="admin-details">

                    <div class="admin-name">
                        Administrator
                    </div>

                    <div class="admin-role">
                        System Admin
                    </div>

                </div>


                <div class="admin-avatar">
                    A
                </div>

            </div>

        </header>


        <!-- ============================= -->
        <!-- CONTENT                       -->
        <!-- ============================= -->

        <section class="content">


            <!-- PAGE HEADER -->

            <div class="page-header">

                <div>

                    <h1 class="page-title">
                        Employees
                    </h1>

                    <p class="page-description">
                        Manage employee records and organizational information.
                    </p>

                </div>


                <div class="header-actions">


                    <!-- FIND EMPLOYEE -->

                    <form
                            id="findEmployee"
                            class="find-form"
                            method="get"
                            action="<c:url value='/employees/find'/>">

                        <input
                                type="number"
                                name="id"
                                class="find-input"
                                placeholder="Enter Employee ID"
                                min="1"
                                required>

                        <button
                                type="submit"
                                class="find-button">

                            Find Employee

                        </button>

                    </form>


                    <!-- ADD EMPLOYEE -->

                    <a
                            href="<c:url value='/employees/new'/>"
                            class="add-button">

                        <span>+</span>

                        Add Employee

                    </a>

                </div>

            </div>


            <!-- ============================= -->
            <!-- STATS                         -->
            <!-- ============================= -->

            <div class="stats">


                <div class="stat-card">

                    <div class="stat-label">
                        Total Employees
                    </div>

                    <div class="stat-value">

                        <c:out value="${employees.size()}"/>

                    </div>

                </div>


                <div class="stat-card">

                    <div class="stat-label">
                        Employee Records
                    </div>

                    <div class="stat-value">

                        <c:out value="${employees.size()}"/>

                    </div>

                </div>


                <div class="stat-card">

                    <div class="stat-label">
                        System Status
                    </div>

                    <div class="stat-value stat-status">
                        Active
                    </div>

                </div>

            </div>


            <!-- ============================= -->
            <!-- DIRECTORY                     -->
            <!-- ============================= -->

            <div class="directory">


                <div class="directory-header">

                    <div>

                        <div class="directory-title">
                            Employee Directory
                        </div>

                        <div class="directory-description">
                            Employees currently registered in the system.
                        </div>

                    </div>


                    <div class="record-count">

                        <c:out value="${employees.size()}"/>

                        Records

                    </div>

                </div>


                <c:choose>


                    <c:when test="${not empty employees}">

                        <div class="table-wrapper">

                            <table>

                                <thead>

                                <tr>

                                    <th>ID</th>
                                    <th>Employee</th>
                                    <th>Email</th>
                                    <th>Department</th>
                                    <th>Salary</th>
                                    <th>Actions</th>

                                </tr>

                                </thead>


                                <tbody>

                                <c:forEach
                                        var="employee"
                                        items="${employees}">

                                    <tr>

                                        <td>

                                            <span class="employee-id">

                                                #<c:out value="${employee.id}"/>

                                            </span>

                                        </td>


                                        <td>

                                            <span class="employee-name">

                                                <c:out value="${employee.name}"/>

                                            </span>

                                        </td>


                                        <td>

                                            <span class="employee-email">

                                                <c:out value="${employee.email}"/>

                                            </span>

                                        </td>


                                        <td>

                                            <span class="department">

                                                <c:out value="${employee.department}"/>

                                            </span>

                                        </td>


                                        <td>

                                            <span class="salary">

                                                ₹ <c:out value="${employee.salary}"/>

                                            </span>

                                        </td>


                                        <td>

                                            <div class="actions">


                                                <a
                                                        href="<c:url value='/employees/edit/${employee.id}'/>"
                                                        class="edit-button">

                                                    Edit

                                                </a>


                                                <form
                                                        action="<c:url value='/employees/delete/${employee.id}'/>"
                                                        method="post"
                                                        style="display:inline;">

                                                    <button
                                                            type="submit"
                                                            class="delete-button"
                                                            onclick="return confirm('Delete this employee?');">

                                                        Delete

                                                    </button>

                                                </form>


                                            </div>

                                        </td>

                                    </tr>

                                </c:forEach>

                                </tbody>

                            </table>

                        </div>

                    </c:when>


                    <c:otherwise>

                        <div class="empty-state">

                            <div class="empty-icon">
                                👥
                            </div>

                            <div class="empty-title">
                                No Employees Yet
                            </div>

                            <div class="empty-description">
                                Your employee directory is currently empty.
                                Add your first employee to start managing
                                employee records.
                            </div>

                            <a
                                    href="<c:url value='/employees/new'/>"
                                    class="add-button">

                                <span>+</span>

                                Add First Employee

                            </a>

                        </div>

                    </c:otherwise>


                </c:choose>


            </div>

        </section>

    </main>

</div>

</body>

</html>