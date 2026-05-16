# Appointment No-Show Analysis in US Healthcare (RCM Focus)

**Project Overview**

This project analyzes patient appointment no-shows in a US healthcare environment with a focus on Revenue Cycle Management (RCM). The objective of the analysis is to identify key factors contributing to missed appointments and provide actionable recommendations to reduce revenue leakage and improve provider utilization.

The project was completed using:
* Microsoft Excel
* SQL Server (SSMS)
* Power BI

---

**Business Problem**

Patient appointment no-shows create major operational and financial challenges in healthcare systems.

Missed appointments lead to:

* Revenue leakage
* Underutilized provider schedules
* Operational inefficiencies
* Reduced appointment slot efficiency

The goal of this project is to identify the operational and patient-related drivers behind no-shows and recommend data-driven strategies to reduce them.

---

**Project Objectives**

* Analyze patient appointment attendance patterns
* Identify operational drivers contributing to no-shows
* Measure overall no-show rate and segment-level patterns
* Evaluate the impact of waiting time on attendance
* Provide actionable recommendations for healthcare providers

---

**Dataset Information**

* Source: Kaggle
* Dataset Size: ~16,000 healthcare appointment records
* Each row represents a scheduled healthcare appointment

## Key Features Used

* Patient demographics (Age, Gender)
* Scheduled Date
* Appointment Date
* SMS Reminder Status
* Appointment Outcome (Show / No-show)

---

**Data Cleaning & Preprocessing (Excel)**

The dataset was cleaned and prepared in Microsoft Excel.

## Key Steps Performed

1. Converted raw dataset into structured Excel tables
2. Standardized date formats
3. Validated data types
4. Checked missing/inconsistent values
5. Created derived columns:

   * waiting_days
   * waiting_bucket
   * age_group
6. Performed exploratory analysis using pivot tables

## Derived Features

### waiting_days

Difference between appointment date and scheduled date.

### waiting_bucket

Categorized waiting time into groups:

* Same Day
* 1–2 Days
* 3–7 Days
* 8+ Days

### age_group

Segmented patients into:

* Child
* Young Adults
* Middle Age
* Senior

---

**SQL Validation & Aggregation**

SQL Server was used to validate calculations and perform aggregation analysis.

## Example Analyses

* Total appointments
* Total no-shows
* Overall no-show rate
* No-show rate by waiting bucket
* No-show rate by age group
* No-show rate by weekday

---

**Power BI Dashboard**

An interactive Power BI dashboard was created to visualize key insights.

## Dashboard KPIs

* Total Appointments
* Total No-Shows
* No-Show Rate (%)
* Average Waiting Days

## Dashboard Analysis

* No-show rate by waiting bucket
* No-show rate by age group
* Appointment trends by weekday

## Interactive Filters

* Gender
* Age Group
* Waiting Bucket

---

**Key Insights**

* Overall no-show rate was approximately 20%
* Around 1 in every 5 appointments was missed
* Longer waiting times significantly increased no-show probability
* Appointments scheduled 8+ days in advance showed the highest risk
* Younger patients demonstrated relatively higher no-show behavior

---

**Recommendations**

Based on the analysis, the following recommendations were proposed:

* Implement shorter scheduling windows for long-wait appointments
* Apply multi-touch reminder strategies (SMS + Calls)
* Optimize reminder timing closer to appointment date
* Focus reminder efforts on high-risk patient segments
* Improve scheduling efficiency for higher-risk weekdays

---

**Expected Business Impact**

* Reduction in patient no-show rates
* Improved provider utilization
* Lower revenue leakage
* Better appointment slot efficiency
* Improved patient engagement and communication

---

**Tools Used**

| Tool       | Purpose                             |
| ---------- | ----------------------------------- |
| Excel      | Data Cleaning & Feature Engineering |
| SQL Server | Validation & Aggregation            |
| Power BI   | Dashboard & Visualization           |

---

Project Screenshots

<img width="1081" height="604" alt="image" src="https://github.com/user-attachments/assets/99603d73-3366-4795-814a-2e3a20c0768c" />
<img width="1085" height="606" alt="image" src="https://github.com/user-attachments/assets/156f398b-0c15-4f3e-be58-b00cd107b1c8" />
<img width="1074" height="603" alt="image" src="https://github.com/user-attachments/assets/456ff820-34f6-4456-afa1-5c01d671b643" />


----

**Future Improvements**

Future enhancements could include:

* Appointment type analysis
* Provider specialty analysis
* Cancellation/rescheduling behavior
* Appointment time analysis
* Predictive modeling for high-risk appointments

---

**Author**

Mohd Shaan Saifi

Data Analytics Project – Healthcare Appointment No-Show Analysis
