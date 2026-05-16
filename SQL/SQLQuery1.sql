/*
Project: Revenue Cycle Management – Appointment No-Show Analysis
Domain: US Healthcare
Tool: SQL Server
Table: Healthcare

Objective:
Analyze patient appointment data to identify drivers of no-shows
and potential revenue leakage.

Key Assumptions:
- Showed_up = 1 means patient attended appointment
- Showed_up = 0 means no-show
- waiting_days represents days between scheduling and appointment
- SMS_received indicates whether reminder was sent
*/

-----------------------------------------------------------------------------------------------------------------------------

-- Step 1 - Understanding the dataframe

SELECT TOP 10 *
FROM Healthcare;

--------------------------------------------------------------------------------------------------------------

-- Checking data Volume

SELECT COUNT(*) AS total_rows
FROM Healthcare;

--------------------------------------------------------------------------------------------------------------

-- KPI 1: Overall No-Show Rate
-- Checking overall no-show rate
SELECT
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Showed_up = 'False' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(
        100.0 * SUM(CASE WHEN Showed_up = 'False' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_pct
FROM Healthcare;

----------------------------------------------------------------------------------------------------------------

-- Q1. - Do SMS reminders reduce no-shows

SELECT
    SMS_received,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Showed_up = 'False' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(
        100.0 * SUM(CASE WHEN Showed_up = 'False' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_pct
FROM Healthcare
GROUP BY SMS_received;

-----------------------------------------------------------------------------------------------------------------

-- Q2. - Does longer waiting time increase no-shows? 

SELECT
   Waiting_Bucket,
    COUNT(*) AS total_appointments,
    COUNT(CASE WHEN No_Show = 'False' THEN 1 END) AS no_shows,
    ROUND(
        100.0 * COUNT(CASE WHEN No_Show = 'False' THEN 1 END) / COUNT(*),
        2
    ) AS no_show_rate_pct
FROM Healthcare
GROUP BY Waiting_Bucket





----------------------------------------------------------------------------------------------------------

 -- Q3. Which age groups are most likely to miss appointments?

 SELECT
    age_group,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Showed_up = 'False' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(
        100. * SUM(CASE WHEN Showed_up = 'False' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_pct
FROM Healthcare
GROUP BY Age_Group
Order by no_shows desc;

-------------------------------------------------------------------------------------------------

-- Q4. Are certain days of the week riskier?

SELECT
    DATENAME(WEEKDAY, AppointmentDay) AS appointment_day,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Showed_up = 'False' THEN 1 
         ELSE 0 END) AS no_shows,
    ROUND(
        100.0 * SUM(CASE WHEN Showed_up = 'False' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_pct
FROM Healthcare
GROUP BY DATENAME(WEEKDAY, AppointmentDay);

----------------------------------------------------------------------------------------------------------

/*
Key Insights:
1. Overall no-show rate indicates significant revenue leakage.
2. SMS reminder group shows higher no-show rate, suggesting targeted reminders.
3. Longer waiting periods are associated with increased no-show rates.

Business Recommendation:
- Reduce scheduling gaps for outpatient visits.
- Use SMS reminders alongwith calls strategically for high-risk segments.
*/
