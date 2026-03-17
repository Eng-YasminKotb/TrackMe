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

        <form:form action="${pageContext.request.contextPath}/addSession"
                   method="post"
                   modelAttribute="studySession">

            <div class="form-group">
                <label>Study Area</label>
                <form:select path="studyArea"  disabled="${submitted}">
                    <form:option value=""               label="-- Select --"/>
                    <form:option value="Backend"        label="Backend"/>
                    <form:option value="Problem Solving" label="Problem Solving"/>
                    <form:option value="Open-source"    label="Open-source"/>
                    <form:option value="English"        label="English"/>
                    <form:option value="Reading"        label="Reading"/>
                </form:select>
            </div>

            <div class="form-group">
                <label>Duration (minutes)</label>
                <form:input path="durationMinutes" type="number" min="1" readonly="${submitted}" placeholder="e.g. 90"/>
            </div>

            <div class="form-group">
                <label>Focus Score (1–5)</label>
                <form:select path="focusScore"  disabled="${submitted}">
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
                <form:select path="productivityScore"  disabled="${submitted}">
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
                <form:input path="achievement" type="text"  placeholder="What did you achieve?" readonly="${submitted}"/>
            </div>

            <div class="btn-row">
                <button type="submit" class="btn btn-green">Submit</button>
                <a href="${pageContext.request.contextPath}/showDailyStats" class="btn btn-blue">Stats</a>
                <a href="${pageContext.request.contextPath}/" class="btn btn-red">Home</a>
            </div>

        </form:form>
     <c:if test="${submitted}">
         <div style="color:green; font-weight:bold; margin-top:15px; text-align:center;">
             Submitted successfully!
         </div>

         <div style="text-align:center; margin-top:10px;">
             <a href="${pageContext.request.contextPath}/addSession" class="btn btn-green">
                 Add Another Session
             </a>
         </div>
     </c:if>
    </div>

</body>
</html>
