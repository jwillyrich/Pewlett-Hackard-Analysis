-- Deliverable 1:
-- Create databes of employees to retire with titles.
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	tit.title, 
	tit.from_date, 
	tit.to_date,
	e.birth_date
INTO titles_for_retirement
FROM employees AS e
INNER JOIN titles AS tit
   on (e.emp_no = tit.emp_no)
WHERE (e.birth_date) BETWEEN ('1951-01-01')
	AND ('1955-12-31')
ORDER BY e.emp_no, e.birth_date DESC;

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- Retrieve number of retirement age employees by their most recent job
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY Count DESC;

