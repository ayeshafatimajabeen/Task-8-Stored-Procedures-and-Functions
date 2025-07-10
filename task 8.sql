CREATE DATABASE HOSPITALDB1;
USE HOSPITALDB1;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Disease VARCHAR(100)
);
-- Insert a patient only if age is greater than 0
DELIMITER $$

CREATE PROCEDURE AddPatient (
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_gender VARCHAR(10),
    IN p_disease VARCHAR(100)
)
BEGIN
    IF p_age > 0 THEN
        INSERT INTO Patients (Name, Age, Gender, Disease)
        VALUES (p_name, p_age, p_gender, p_disease);
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Age must be greater than 0';
    END IF;
END$$

DELIMITER ;
CALL AddPatient('Ayesha', 25, 'Female', 'Flu');

DELIMITER $$

CREATE FUNCTION GetDiseaseCategory(p_disease VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(100);

    IF p_disease IN ('Flu', 'Cold', 'COVID-19') THEN
        SET category = 'Infectious';
    ELSEIF p_disease IN ('Diabetes', 'Hypertension') THEN
        SET category = 'Chronic';
    ELSE
        SET category = 'Unknown';
    END IF;

    RETURN category;
END$$

DELIMITER ;
SELECT GetDiseaseCategory('Flu');  -- Returns 'Infectious'

