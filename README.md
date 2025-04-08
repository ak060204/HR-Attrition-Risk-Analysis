# HR-Attrition-Risk-Analysis

**HR Attrition Risk Analysis & Predictive Insights**  

**Project Overview**  
This data analytics project identifies key drivers of employee attrition in a 1,470-employee dataset. Using SQL and Power BI, I uncovered high-risk employee segments and proposed data-backed retention strategies. While the dataset lacked salary figures, I applied industry-standard cost assumptions to quantify the financial impact of attrition.  

**Key Findings**  
- **Attrition Crisis**: 16.12% attrition rate (237 employees), 30% higher than the tech industry average.  
- **High-Risk Groups**:  
  - R&D department accounted for 56.12% of all attrition.  
  - Male employees had higher attrition rates (17.01% vs. 14.8% for females).  
  - Life Sciences females represented 43.7% of female attritions (overrepresented).  
- **Financial Impact**:  
  - Using the Society for HR Management (SHRM) benchmark of $10K average replacement cost per employee, total projected attrition costs reached $2.37M annually.  
  - R&D turnover alone projected at $1.33M/year.  

**Technical Implementation**  
<a href = "https://github.com/ak060204/HR-Attrition-Risk-Analysis/blob/main/HR_Attrition_Analysis_with_Risk_Model.sql">**SQL Analysis**:</a>
  - Developed a risk-scoring model to classify employees into High/Medium/Low risk categories.  
  - Calculated department-wise attrition rates and demographic trends.  
<a href = "https://github.com/ak060204/HR-Attrition-Risk-Analysis/blob/main/HR_Attrition_Dashboard.pbix">**Power BI Dashboard**:</a>
  - Interactive visualizations of attrition patterns by department, gender, and age.  
  - Risk score distribution charts to prioritize interventions.  

**Business Recommendations**  
1. **R&D Retention Plan**: Targeted career development programs for high-risk employees (25-34 years old, low job satisfaction).  
2. **Life Sciences Female Mentorship**: 6-month pilot mentorship program to address overrepresentation in attrition.  
3. **Cost Savings**: These interventions could potentially reduce attrition costs by $565K annually (based on SHRM benchmarks).  

**Repository Structure**  
- **/SQL**: Contains all SQL scripts for data cleaning, analysis, and risk modeling.  
- **/PowerBI**: Power BI dashboard files with interactive visualizations.  
- **/Documentation**: Business recommendations and project methodology.  

**Getting Started**  
1. Clone the repository.  
2. Run SQL scripts to perform the analysis.  
3. Open the Power BI file to explore the interactive dashboard.  

**Note on Cost Projections**  
Financial impact calculations use the industry-standard SHRM benchmark of $10K average replacement cost per employee. With actual salary data, these projections could be further refined.  
