<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Me</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body style="display:flex; align-items:center; justify-content:center; min-height:100vh; padding:2rem;">

    <div class="card" style="width:100%; max-width:420px;">

        <div class="page-title">Track Me</div>

        <div class="menu-item">
            <span class="menu-label">Today's Session</span>
            <a href="${pageContext.request.contextPath}/addSession" class="btn btn-green">Add</a>
        </div>

        <div class="menu-item">
            <span class="menu-label">Weekly Stats</span>
            <a href="${pageContext.request.contextPath}/chooseWeek" class="btn btn-red">View</a>
        </div>

        <div class="menu-item">
            <span class="menu-label">Monthly Stats</span>
            <a href="${pageContext.request.contextPath}/chooseMonth" class="btn btn-red">View</a>
        </div>

        <div class="menu-item">
            <span class="menu-label">All Sessions</span>
            <a href="${pageContext.request.contextPath}/allSessions" class="btn btn-blue">View</a>
        </div>

    </div>

</body>
</html>
