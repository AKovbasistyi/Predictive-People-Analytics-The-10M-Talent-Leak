WITH EmployeeRiskAnalysis AS (
    SELECT 
        EmployeeNumber,
        JobRole,
        Department,
        MonthlyIncome,
        PerformanceRating,
        OverTime,
        YearsSinceLastPromotion,
        TotalWorkingYears,
        StockOptionLevel,
        -- 1. DEFINE POSITION CRITICALITY (Tier 1 = Highest Business Impact)
        CASE 
            WHEN JobRole IN ('Research Director', 'Manager', 'Manufacturing Director') THEN 'Tier 1 - Mission Critical'
            WHEN JobRole IN ('Sales Executive', 'Research Scientist', 'Healthcare Representative') THEN 'Tier 2 - High Impact'
            ELSE 'Tier 3 - Standard'
        END AS Position_Tier,

        -- 2. DEFINE PERFORMANCE STATUS (High Performers are the "Lynchpins")
        CASE 
            WHEN PerformanceRating >= 4 THEN 'Top Talent'
            WHEN PerformanceRating = 3 THEN 'Core Contributor'
            ELSE 'Development Needed'
        END AS Talent_Status,

        -- 3. REPLACEMENT COST (1.5x to 2.5x Annual Salary for Critical Roles)
        CASE 
            WHEN JobRole IN ('Research Director', 'Manager') THEN (MonthlyIncome * 12) * 2.5
            WHEN JobRole IN ('Sales Executive', 'Manufacturing Director') THEN (MonthlyIncome * 12) * 2.0
            ELSE (MonthlyIncome * 12) * 1.5
        END AS Estimated_Replacement_Cost_USD
    FROM HR_Employee_Attrition
)
SELECT 
    *,
    -- 4. RISK IDENTIFICATION (The "Red Zone" Logic)
    CASE 
        WHEN Position_Tier = 'Tier 1 - Mission Critical' 
             AND Talent_Status = 'Top Talent' 
             AND (OverTime = 'Yes' OR YearsSinceLastPromotion >= 3) THEN 'CRITICAL RETENTION RISK'
        WHEN Position_Tier = 'Tier 1 - Mission Critical' AND OverTime = 'Yes' THEN 'HIGH BURNOUT ALERT'
        WHEN Talent_Status = 'Top Talent' AND YearsSinceLastPromotion >= 3 THEN 'STAGNATION RISK'
        ELSE 'STABLE'
    END AS Retention_Strategy_Action
FROM EmployeeRiskAnalysis
ORDER BY Estimated_Replacement_Cost_USD DESC;