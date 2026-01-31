-- Overall KPIs
CREATE OR REPLACE VIEW lendingclub.v_portfolio_kpis AS
SELECT
  COUNT(*) AS total_loans,
  SUM(loan_amnt) AS total_amount_issued,
  AVG(int_rate) AS avg_interest_rate,
  AVG(dti) AS avg_dti,
  AVG(annual_inc) AS avg_annual_income,
  SUM(is_default) AS total_defaults,
  SAFE_DIVIDE(SUM(is_default), COUNT(*)) AS default_rate,
  SAFE_DIVIDE(SUM(is_fully_paid), COUNT(*)) AS fully_paid_rate
FROM lendingclub.loan_portfolio_clean;


-- Monthly trend KPIs (uses a real DATE field for time series charts)
CREATE OR REPLACE VIEW lendingclub.v_monthly_trends AS
SELECT
  DATE_TRUNC(issue_date, MONTH) AS issue_month,
  COUNT(*) AS loans_issued,
  SUM(loan_amnt) AS amount_issued,
  SAFE_DIVIDE(SUM(is_default), COUNT(*)) AS default_rate,
  SAFE_DIVIDE(SUM(is_fully_paid), COUNT(*)) AS fully_paid_rate
FROM lendingclub.loan_portfolio_clean
GROUP BY issue_month
ORDER BY issue_month;



-- Default rate by grade
CREATE OR REPLACE VIEW lendingclub.v_default_by_grade AS
SELECT
  grade,
  COUNT(*) AS total_loans,
  SUM(is_default) AS defaults,
  SAFE_DIVIDE(SUM(is_default), COUNT(*)) AS default_rate,
  AVG(int_rate) AS avg_interest_rate
FROM lendingclub.loan_portfolio_clean
GROUP BY grade
ORDER BY grade;


-- Default rate by purpose
CREATE OR REPLACE VIEW lendingclub.v_default_by_purpose AS
SELECT
  purpose,
  COUNT(*) AS total_loans,
  SUM(is_default) AS defaults,
  SAFE_DIVIDE(SUM(is_default), COUNT(*)) AS default_rate,
  AVG(int_rate) AS avg_interest_rate
FROM lendingclub.loan_portfolio_clean
GROUP BY purpose
ORDER BY total_loans DESC;


-- Default rate by term
CREATE OR REPLACE VIEW lendingclub.v_default_by_term AS
SELECT
  term,
  COUNT(*) AS total_loans,
  SUM(is_default) AS defaults,
  SAFE_DIVIDE(SUM(is_default), COUNT(*)) AS default_rate,
  AVG(int_rate) AS avg_interest_rate
FROM lendingclub.loan_portfolio_clean
GROUP BY term
ORDER BY term;
