-- Creating requested queries for PH-EmployeeDB Challenge

SELECT  s.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        s.salary
-- INTO num_retiring
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (de.emp_no = e.emp_no)
    INNER JOIN salaries AS s
        ON (de.emp_no = s.emp_no) AND (de.from_date = s.from_date)
	INNER JOIN 	titles as t
		ON (t.emp_no = e.emp_no) AND (t.to_date = de.to_date)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY emp_no;
 
SELECT COUNT(t.title), t.title, EXTRACT (YEAR FROM s.from_date) "year"
-- INTO retire_by_from_yr
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (de.emp_no = e.emp_no)
    INNER JOIN salaries AS s
        ON (de.emp_no = s.emp_no) AND (de.from_date = s.from_date)
	INNER JOIN 	titles as t
		ON (t.emp_no = e.emp_no) AND (t.to_date = de.to_date)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
GROUP BY EXTRACT (YEAR FROM s.from_date), t.title
ORDER BY EXTRACT (YEAR FROM s.from_date) DESC;

SELECT  de.emp_no,
        e.first_name,
        e.last_name,
        t.title,
		t.from_date,
		t.to_date
-- INTO mentor1965
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (de.emp_no = e.emp_no) AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	INNER JOIN salaries AS s
        ON (de.emp_no = s.emp_no) AND (de.from_date = s.from_date)
	INNER JOIN 	titles as t 
		ON (t.emp_no = e.emp_no) AND (t.to_date = de.to_date)
WHERE (de.to_date = '9999-01-01')
ORDER BY emp_no;
