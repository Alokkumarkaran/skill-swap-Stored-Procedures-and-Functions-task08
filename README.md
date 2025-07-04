# 📘 Task 08 – Stored Procedures and Functions (Skill-Swap E-learning Platform)

## 🎯 Objective

The goal of this task is to learn how to create and use **Stored Procedures** and **Stored Functions** in SQL. These help in making SQL code **reusable**, **modular**, and **easy to maintain**.

---

## 🛠 Tools Used

- MySQL Workbench
- Screenshot Tool (Snipping Tool / Lightshot)
- GitHub

---

## 🧱 Tables Used

We used these existing tables from our Skill-Swap project:

- `Users`
- `Courses`
- `Enrollments`
- `Payments`

---

## 🧪 What I Created

---

### 🔹 1. Stored Procedure: `GetUserEnrollments`

**🔧 Purpose**:  
This procedure takes a user ID as input and returns all the courses that user is enrolled in.

DELIMITER $$

CREATE PROCEDURE GetUserEnrollments(IN input_user_id INT)
BEGIN
    SELECT u.name AS user_name, c.title AS course_title, e.enrolled_at
    FROM Enrollments e
    JOIN Users u ON e.user_id = u.user_id
    JOIN Courses c ON e.course_id = c.course_id
    WHERE u.user_id = input_user_id;
END$$

DELIMITER ;

CALL GetUserEnrollments(1);
📸 Screenshot:
![Screenshot 2025-07-04 135302](https://github.com/user-attachments/assets/97b3a20e-d8e5-487b-a0ef-454bf7375aea)


🔹 2. Stored Function: TotalPaymentsByUser
🔧 Purpose:
This function returns the total amount paid by a user across all courses.

DELIMITER $$

CREATE FUNCTION TotalPaymentsByUser(input_user_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_amount DECIMAL(10,2);
    SELECT SUM(amount) INTO total_amount
    FROM Payments
    WHERE user_id = input_user_id;
    RETURN IFNULL(total_amount, 0);
END$$

DELIMITER ;

SELECT TotalPaymentsByUser(1) AS total_spent;
📸 Screenshot:
![Screenshot 2025-07-04 135423](https://github.com/user-attachments/assets/e7431752-fd37-45ba-ae5d-460edc2bfe94)


🧠 What I Learned
Concept	Explanation
Stored Procedure	A reusable SQL block that performs an action like a report
Stored Function	A SQL block that returns a value, like total or average
IN parameter	Used to pass a value into the procedure/function
CALL	Used to run a procedure
SELECT function()	Used to run a stored function
IFNULL()	Used to return 0 if the sum is NULL
DELIMITER	Required to define multi-line procedures in MySQL


👨‍💻 Submitted by
Name: Alok Kumar
Role: SQL Developer Intern
Email: alokkumarkaranraj@gmail.com
Project: Skill-Swap E-learning Platform
