Predictive People Analytics: The $10M Talent Leak

Quantifying Financial Exposure through Attrition Risk Modeling

Project Overview
In many organizations, employee turnover is viewed as a standard HR metric. This project reframes attrition as a significant financial risk. By integrating behavioral triggers (Overtime, Stagnation) with business-criticality tiers, this model identifies "Mission-Critical Lynchpins" and calculates the Total Economic Impact (TEI) of their potential exit.
The goal is to shift from Reactive Hiring (filling holes) to Proactive Asset Protection (securing revenue).

Data Source & Synthetic Enhancement
The foundation of this analysis is the IBM HR Analytics Employee Attrition & Performance dataset, publicly available via Kaggle.

The "Lynchpin" Methodology
Not all turnover is equal. This analysis uses a custom Position Tiering logic to isolate the most expensive "Single Points of Failure" in the company.
The Attrition Triggers
Through exploratory data analysis, two primary "Flight Zones" were identified:
1.	The 3-Year Stagnation Cliff: Top talent entering their 3rd year without a promotion or title change shifts from "Stable" to "Stagnation Risk," regardless of salary level.
2.	The Burnout Multiplier: In Tier 1 roles, Overtime is a more accurate predictor of attrition than compensation. High earners (~$20k/month) were still flagged as "Critical Risk" when workload exceeded sustainable thresholds.

Financial Modeling: The Cost of a Vacancy
I engineered a Total Economic Impact (TEI) metric with 2-decimal precision to provide a boardroom-ready financial statement.
TEI = Replacement Cost + Revenue Leakage
•	Replacement Cost: Calculated at 2.5x Annual Salary for Tier 1 roles (covering executive search, signing bonuses, and onboarding lag).
•	Revenue Leakage: Quantifies the value lost during a 90-day vacancy (stalled R&D projects or empty sales territories).

Visualizing the Risk
The project utilizes advanced visualizations to segment risk effectively:
•	Risk Segmentation (Swarmplot): Identifies the "Vulnerable Cluster"—employees who are underpaid relative to their Tier 1 peers while working high overtime.
•	Promotion Lag (Density Plot): Visualizes the probability of stagnation, highlighting the 3-year window where retention efforts are most critical.
•	Departmental Exposure (Bar Chart): Reveals that Research & Development carries a $5.8M total exposure, justifying a surgical allocation of the retention budget.

Strategic ROI & Recommendations
This model allows HR to act as a Profit Center by calculating the ROI of retention:
•	Proactive Intervention: Preventing the exit of a single Research Director via a $50k retention bonus yields a 3,500% ROI compared to the $1.8M replacement cost.
•	Surgical Career Pathing: Triggering "Stay Interviews" at the 30-month mark for Tier 1 roles to reset the "Stagnation Clock."
•	Capacity Load Balancing: Offloading admin tasks from $1M+ "Manager" assets to lower-cost support roles to mitigate the Burnout Trigger.
