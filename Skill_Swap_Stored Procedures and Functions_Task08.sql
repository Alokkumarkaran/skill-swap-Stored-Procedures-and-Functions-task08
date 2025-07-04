USE SkillSwapDB;

DELIMITER $$

CREATE PROCEDURE GetUserEnrollments (IN input_user_id INT)
BEGIN
    SELECT u.name AS user_name, c.title AS course_title, e.enrolled_at
    FROM Enrollments e
    JOIN Users u ON u.user_id = e.user_id
    JOIN Courses c ON c.course_id = e.course_id
    WHERE u.user_id = input_user_id;
END$$

DELIMITER ;
CALL GetUserEnrollments(1);

DELIMITER $$

CREATE FUNCTION TotalPaymentsByUser (input_user_id INT)
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


