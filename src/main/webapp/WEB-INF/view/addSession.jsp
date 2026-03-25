<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Session — Track Me</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body style="display:flex; align-items:center; justify-content:center; min-height:100vh; padding:2rem;">

    <div class="card" style="width:100%; max-width:460px;">

        <div class="page-title">Today's Session</div>

        <c:choose>
            <c:when test="${submitted != true}">
                <form:form action="${pageContext.request.contextPath}/addSession"
                           method="post"
                           modelAttribute="studySession">



                    <!--Study Area Text Area-->

                    <div class="form-group">
                         <label>Study Area</label>
                         <form:input path="studyArea" type="text" placeholder="What did you study?"/>
                    </div>

                    <!--Duration Text Area-->

                    <div class="form-group">
                        <label>Duration (minutes)</label>
                        <form:input path="durationMinutes" type="number" min="1" placeholder="e.g. 90"/>
                    </div>

                    <div class="form-group">
                        <label>Focus Score (1–5)</label>
                        <form:select path="focusScore">
                            <form:option value="" label="-- Select --"/>
                            <form:option value="1" label="1 — Very Low"/>
                            <form:option value="2" label="2 — Low"/>
                            <form:option value="3" label="3 — Medium"/>
                            <form:option value="4" label="4 — High"/>
                            <form:option value="5" label="5 — Very High"/>
                        </form:select>
                    </div>

                    <div class="form-group">
                        <label>Productivity Score (1–5)</label>
                        <form:select path="productivityScore">
                            <form:option value="" label="-- Select --"/>
                            <form:option value="1" label="1 — Very Low"/>
                            <form:option value="2" label="2 — Low"/>
                            <form:option value="3" label="3 — Medium"/>
                            <form:option value="4" label="4 — High"/>
                            <form:option value="5" label="5 — Very High"/>
                        </form:select>
                    </div>

                    <div class="form-group">
                        <label>Achievement</label>
                        <form:input path="achievement" type="text" placeholder="What did you achieve?"/>
                    </div>

                    <div class="btn-row">
                        <button type="submit" class="btn btn-green">Submit</button>
                        <a href="${pageContext.request.contextPath}/showDailyStats" class="btn btn-blue">Stats</a>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-red">Home</a>
                    </div>

                </form:form>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <label>Study Area</label>
                    <div class="readonly-field">${studySession.studyArea}</div>
                </div>
                <div class="form-group">
                    <label>Duration</label>
                    <div class="readonly-field">${studySession.durationMinutes} min</div>
                </div>
                <div class="form-group">
                    <label>Focus Score</label>
                    <div class="readonly-field">${studySession.focusScore}</div>
                </div>
                <div class="form-group">
                    <label>Productivity Score</label>
                    <div class="readonly-field">${studySession.productivityScore}</div>
                </div>
                <div class="form-group">
                    <label>Achievement</label>
                    <div class="readonly-field">${studySession.achievement}</div>
                </div>

                <div style="color:#349d00; font-weight:800; margin-top:1rem; text-align:center; font-size:1rem;">
                    ✅ Submitted successfully!
                </div>
                <div style="text-align:center; margin-top:1rem;">
                    <a href="${pageContext.request.contextPath}/addSession" class="btn btn-green">Add Another Session</a>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

</body>
</html>
