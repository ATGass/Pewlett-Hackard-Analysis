-- Starter, import into retirement_titles
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ti USING(emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no
;

-- Distinct Emp_no import into unique_titles
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC
;

-- Retiring Titles creation and import
SELECT title,
COUNT(title) as title_count
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY title_count DESC
;