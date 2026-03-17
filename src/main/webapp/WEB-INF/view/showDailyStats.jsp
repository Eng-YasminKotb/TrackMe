<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daily Stats — Track Me</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body style="padding:2rem;">

<div style="max-width:820px; margin:0 auto;">

    <div class="page-title">Today's Study Sessions</div>

    <c:choose>
        <c:when test="${empty sessions}">
            <div class="card">
                <div class="empty-msg">No sessions recorded yet. Add your first session!</div>
            </div>
        </c:when>
        <c:otherwise>

            <%-- Summary boxes --%>
            <div class="summary-row">
                <div class="summary-box">
                    <c:set var="totalMins" value="0"/>
                    <c:forEach var="s" items="${sessions}">
                        <c:set var="totalMins" value="${totalMins + s.durationMinutes}"/>
                    </c:forEach>
                    <div class="summary-value">${totalMins} min (${totalMins / 60}h)</div>
                    <div class="summary-label">Total Time</div>
                </div>
                <div class="summary-box">
                    <div class="summary-value">${fn:length(sessions)}</div>
                    <div class="summary-label">Sessions</div>
                </div>
            </div>

            <%-- Sessions table --%>
            <div class="card mb-2">
                <div class="card-title">Sessions Table</div>
                <div class="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>Study Area</th>
                                <th>Duration</th>
                                <th>Focus</th>
                                <th>Productivity</th>
                                <th>Achievement</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="s" items="${sessions}">
                                <tr>
                                    <td>${s.studyArea}</td>
                                    <td>${s.durationMinutes} min</td>
                                    <td><span class="badge badge-${s.focusScore}">${s.focusScore}</span></td>
                                    <td><span class="badge badge-${s.productivityScore}">${s.productivityScore}</span></td>
                                    <td>${s.achievement}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <%-- Chart --%>
            <div class="card mb-2">
                <div class="card-title">Daily Study Chart</div>
                <div class="chart-wrapper">
                    <canvas id="dailyChart"></canvas>
                </div>
            </div>

            <script>
                const sessions = [
                    <c:forEach var="s" items="${sessions}" varStatus="loop">
                    {
                        label: "${s.studyArea}",
                        duration: ${s.durationMinutes},
                        quality: (${s.focusScore} + ${s.productivityScore}) / 2.0
                    }<c:if test="${!loop.last}">,</c:if>
                    </c:forEach>
                ];

                new Chart(document.getElementById('dailyChart'), {
                    data: {
                        labels: sessions.map(s => s.label),
                        datasets: [
                            {
                                type: 'bar',
                                label: 'Duration (min)',
                                data: sessions.map(s => s.duration),
                                backgroundColor: 'rgba(27,108,168,0.75)',
                                borderRadius: 6,
                                yAxisID: 'y'
                            },
                            {
                                type: 'line',
                                label: 'Quality Score',
                                data: sessions.map(s => s.quality),
                                borderColor: '#df2233',
                                backgroundColor: 'rgba(223,34,51,0.08)',
                                pointBackgroundColor: '#df2233',
                                pointRadius: 5,
                                tension: 0.3,
                                yAxisID: 'y2'
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: { legend: { position: 'top' } },
                        scales: {
                            y:  { position: 'left',  title: { display: true, text: 'Minutes' }, beginAtZero: true },
                            y2: { position: 'right', title: { display: true, text: 'Score'   }, min: 0, max: 5, grid: { drawOnChartArea: false } }
                        }
                    }
                });
            </script>

        </c:otherwise>
    </c:choose>

    <div class="btn-center">
        <a href="${pageContext.request.contextPath}/addSession" class="btn btn-green">+ Add Session</a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-red">Home</a>
    </div>

</div>
</body>
</html>
