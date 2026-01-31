CREATE OR REPLACE TABLE lendingclub.loan_portfolio_clean AS
SELECT
  SAFE.PARSE_DATE('%b-%Y', issue_d) AS issue_date,
  EXTRACT(YEAR FROM SAFE.PARSE_DATE('%b-%Y', issue_d)) AS issue_year,
  FORMAT_DATE('%Y-%m', SAFE.PARSE_DATE('%b-%Y', issue_d)) AS issue_month,

  CAST(loan_amnt AS FLOAT64) AS loan_amnt,
  term,
  CAST(int_rate AS FLOAT64) AS int_rate,
  grade,
  sub_grade,
  purpose,
  CAST(annual_inc AS FLOAT64) AS annual_inc,
  CAST(dti AS FLOAT64) AS dti,
  emp_length,
  home_ownership,
  verification_status,
  addr_state,
  loan_status,

  CASE
    WHEN loan_status IN ('Charged Off', 'Default') THEN 1
    ELSE 0
  END AS is_default,

  CASE
    WHEN loan_status = 'Fully Paid' THEN 1
    ELSE 0
  END AS is_fully_paid

FROM lendingclub.accepted_loans_raw
WHERE issue_d IS NOT NULL
  AND loan_amnt IS NOT NULL
  AND loan_status IS NOT NULL;

