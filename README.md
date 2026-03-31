# TrackMe — Study Productivity Tracker

A full-stack web app I built and use daily to track the 
**quality** of my study sessions, not just the hours.

> "3 hours of focused work is worth more than 6 hours of distracted work."

![Daily Study Chart]([https://github.com/your-username/TrackMe/blob/main/images/daily-study-chart.png](https://github.com/Eng-YasminKotb/TrackMe/blob/main/src/main/webapp/resources/image/img.png)?raw=true)

## What It Does
- Log study sessions with duration, focus score, productivity score, and achievement
- Calculates a combined quality score per session
- Visualizes progress with daily bar charts and productivity trend lines (Chart.js)
- Weekly and monthly stats (in progress)

## Why I Built It
I wanted to understand my study patterns, not just count hours.
This is my most-used personal tool — actively tracked 43+ sessions and 61+ hours.

## Tech Stack
- **Backend:** Java, Spring MVC (raw XML config — no Spring Boot)
- **ORM:** Hibernate + MySQL
- **Frontend:** JSP + Chart.js
- **Build:** Maven, Tomcat

## What Makes It Interesting Technically
Built with raw Spring MVC XML configuration instead of Spring Boot —
which means understanding DispatcherServlet, ViewResolver, and 
SessionFactory setup from scratch.
