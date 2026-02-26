# Credit Risk Portfolio Monitoring Dashboard
### Lending Club Loan Book Analysis (2007–2018)

Link to dashboard: https://lookerstudio.google.com/reporting/ee6d2094-5908-404d-b453-d9917fa6d826

#### Business Context

This project simulates a credit risk monitoring dashboard used by a lending institution to oversee portfolio performance and identify emerging risk exposure.

Using historical Lending Club loan data, I built an interactive analytics solution to evaluate:

* Overall default rate of the loan portfolio
* Default rates by credit grade
* Risk differences between 36-month and 60-month loans
* Default rates by loan purpose
* Loan amounts issued over time

The objective was to replicate a risk analytics workflow commonly used in banking, fintech, and consumer lending environments.

#### Objective

To design a portfolio monitoring dashboard that enables risk and finance stakeholders to:

* Track overall default rate (11.93%)
* Identify high-risk borrower segments
* Assess whether interest rates reflect borrower risk
* Analyze risk by loan type
* Monitor performance trends across time periods

#### Technical Implementation
Data Engineering (BigQuery)

* Cleaned and transformed raw loan data (1.6GB dataset)

* Converted issue dates into structured DATE fields

* Created yes/no default flags

* Built summarized SQL reports for:

  * Monthly performance trends

  * Risk segmentation by grade, term, and purpose

  * Executive KPI reporting

Business Intelligence (Looker Studio)

* Built an interactive dashboard with:

  * Dynamic filters (grade, term, purpose)
  
  * Date range control for period analysis
  
  * Portfolio-level KPI summary
  
  * Risk breakdown visualizations

#### Portfolio Risk Metrics
Portfolio Default Rate

* Overall default rate: 11.93%

* Indicates moderate portfolio-level credit risk

Risk Segmentation by Grade

* Default rates increase progressively from Grade A to G

* Grade G shows the highest default rate

  Confirms effective risk-based pricing structure

Loan Term Risk Exposure

* 60-month loans show higher default rates than 36-month loans

  Demonstrates extended duration increases borrower default probability

Purpose-Based Risk Concentration

* Small business loans exhibit the highest default rates

  Indicates higher volatility in business-related borrowing compared to consumer categories

#### Analytical Insights

This analysis reveals clear structural risk drivers:

* Credit grade is the strongest predictor of default risk.

* Longer loan durations significantly increase portfolio risk.

* Business-purpose loans are associated with increased repayment risk.

* Defaults fluctuate by issuance period, suggesting economic influence.

These findings reflect core principles used in credit portfolio risk management.
