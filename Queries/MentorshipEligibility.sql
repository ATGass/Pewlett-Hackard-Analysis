SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_emp as de USING(emp_no)
JOIN titles as ti USING(emp_no)
WHERE de.to_date = '9999-01-01' 
    AND birth_date BETWEEN '1965-01-01' AND '1966-01-01'
ORDER BY e.emp_no
;