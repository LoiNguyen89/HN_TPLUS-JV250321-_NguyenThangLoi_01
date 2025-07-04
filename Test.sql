USE`HN_TPLUS-JV250321_NguyenThangLoi_01` ;

CREATE TABLE `course`(
`course_id` VARCHAR(10) PRIMARY KEY,
`course_name` VARCHAR(10),
`category` VARCHAR(100),
`start_date` DATE,
`end_date` DATE,
`fee` FLOAT
);

CREATE TABLE `student`(
`student_id` VARCHAR(10) PRIMARY KEY,
`student_full_name` VARCHAR(150) NOT NULL,
`student_email` VARCHAR(255) UNIQUE,
`student_phone` VARCHAR(15) UNIQUE,
`student_dob` DATE
);
ALTER TABLE `HN_TPLUS-JV250321_NguyenThangLoi_01`.`course` 
CHANGE COLUMN `course_name` `course_name` VARCHAR(100) NULL DEFAULT NULL ;


CREATE TABLE `enrollment`(
`enrollment_id` INT AUTO_INCREMENT PRIMARY KEY,
`student_id` VARCHAR(10) NOT NULL,
`course_id` VARCHAR(10) NOT NULL,
`enroll_date` DATE,
`enrollment_status` ENUM('Confirmed', 'Cancelled', 'Pending', 'E-wallet'),
CONSTRAINT `fk_enroll_student`
	FOREIGN KEY(`student_id`)
    REFERENCES `student`(`student_id`)
    ON DELETE CASCADE,
CONSTRAINT `fk_enroll_course`
	FOREIGN KEY(`course_id`)
    REFERENCES `course`(`course_id`)
    ON DELETE CASCADE
);

CREATE TABLE `payment`(
`payment_id` INT AUTO_INCREMENT PRIMARY KEY,
`enrollment_id` INT NOT NULL,
`payment_method` ENUM('Credit Card', 'Bank Transfer', 'Cash','E-wallet'),
`payment_amount` FLOAT,
`payment_date` DATE,
`payment_status` ENUM ('Success', 'Failed', 'Pending'),
CONSTRAINT `fk_enroll_payment`
	FOREIGN KEY(`enrollment_id`)
    REFERENCES `enrollment`(`enrollment_id`)
    ON DELETE CASCADE
);




-- 2. Thêm cột gender có kiểu dữ liệu là enum với các giá trị 'Nam', 'Nữ', 'Khác' trong bảng student.
ALTER TABLE `student`
ADD `gender` ENUM('Nam', 'nu', 'khac');

-- 3. Thêm cột slot_count trong bảng Enrollment có kiểu dữ liệu là integer,
-- có rằng buộc NOT NULL và giá trị mặc định là 1. Cột này thể hiện số lượng chỗ đã đặt trong khoá học online đăng ký


ALTER TABLE `enrollment`
ADD `slot_count` INT NOT NULL DEFAULT 1;



-- 4. Thêm rằng buộc cho cột payment_amount trong bảng Payment phải có giá trị lớn hơn 0 và có kiểu dữ liệu là DECIMAL(10, 2).
ALTER TABLE `payment`
MODIFY `payment_amount` DECIMAL(10,2)
CONSTRAINT `check_amount_positive` CHECK (`payment_amount` > 0);



INSERT INTO `student` (`student_id`, `student_full_name`, `student_email`, `student_phone`, `student_dob`, `gender`) 
VALUES
('S0001', 'Le Hoang Nam', 'nam.le@example.com', '0901001001', '1995-01-01', 'Nam'),
('S0002', 'Nguyen Minh Chau', 'chau.nguyen@example.com', '0902002002', '1996-02-02', 'Nu'),
('S0003', 'Pham Bao Anh', 'bao.pham@example.com', '0903003003', '1997-03-03', 'Nam'),
('S0004', 'Tran Kim Lien', 'lien.tran@example.com', '0904004004', '1998-04-04', 'Nu'),
('S0005', 'Hoang Tien Dat', 'dat.hoang@example.com', '0905005005', '1999-05-05', 'Nam'),
('S0006', 'Vo Thi Mai', 'mai.vo@example.com', '0906006006', '2000-06-06', 'Nu'),
('S0007', 'Doan Minh Tri', 'tri.doan@example.com', '0907007007', '2001-07-07', 'Nam'),
('S0008', 'Nguyen Thanh Ha', 'ha.nguyen@example.com', '0908008008', '2002-08-08', 'Nu'),
('S0009', 'Trinh Bao Vy', 'vy.trinh@example.com', '0909009009', '2003-09-09', 'Nu'),
('S0010', 'Bui Hoang Nam', 'nam.bui@example.com', '0910001010', '2004-10-10', 'Nam');




INSERT INTO `course` (`course_id`, `course_name`, `category`, `start_date`, `end_date`, `fee`) VALUES
('C001', 'Web Development', 'Programming', '2025-07-01', '2025-08-01', 120.0),
('C002', 'Data Analysis', 'Data Science', '2025-07-10', '2025-08-15', 150.0),
('C003', 'Basic Photoshop', 'Design', '2025-07-05', '2025-07-30', 90.0),
('C004', 'Intro to Marketing', 'Marketing', '2025-07-12', '2025-08-20', 110.0);



INSERT INTO `enrollment` VALUES
(1, 'S0001', 'C001', '2025-06-01', 'Confirmed', 1),
(2, 'S0002', 'C002', '2025-06-02', 'Pending', 2),
(3, 'S0003', 'C003', '2025-06-03', 'Cancelled', 3),
(4, 'S0004', 'C004', '2025-06-04', 'Confirmed', 1),
(5, 'S0005', 'C001', '2025-06-05', 'Pending', 2),
(6, 'S0006', 'C002', '2025-06-06', 'Cancelled', 3),
(7, 'S0007', 'C003', '2025-06-07', 'Confirmed', 1),
(8, 'S0008', 'C004', '2025-06-08', 'Pending', 2),
(9, 'S0009', 'C001', '2025-06-09', 'Cancelled', 3),
(10, 'S0010', 'C002', '2025-06-10', 'Confirmed', 1),
(11, 'S0001', 'C003', '2025-06-11', 'Pending', 2),
(12, 'S0002', 'C004', '2025-06-12', 'Cancelled', 3),
(13, 'S0003', 'C001', '2025-06-13', 'Confirmed', 1),
(14, 'S0004', 'C002', '2025-06-14', 'Pending', 2),
(15, 'S0005', 'C003', '2025-06-15', 'Cancelled', 3),
(16, 'S0006', 'C004', '2025-06-16', 'Confirmed', 1),
(17, 'S0007', 'C001', '2025-06-17', 'Pending', 2),
(18, 'S0008', 'C002', '2025-06-18', 'Cancelled', 3),
(19, 'S0009', 'C003', '2025-06-19', 'Confirmed', 1),
(20, 'S0010', 'C004', '2025-06-20', 'Pending', 2);

INSERT INTO `payment` (`enrollment_id`, `payment_method`, `payment_amount`, `payment_date`, `payment_status`) VALUES
( 1, 'Credit Card', 120.0, '2025-06-01', 'Success'),
( 2, 'Bank Transfer', 150.0, '2025-06-02', 'Failed'),
( 3, 'E-wallet', 90.0, '2025-06-03', 'Pending'),
( 4, 'Credit Card', 110.0, '2025-06-04', 'Success'),
( 5, 'Cash', 120.0, '2025-06-05', 'Pending'),
( 6, 'E-wallet', 150.0, '2025-06-06', 'Success'),
( 7, 'Credit Card', 90.0, '2025-06-07', 'Failed'),
( 8, 'Bank Transfer', 110.0, '2025-06-08', 'Pending'),
( 9, 'Cash', 120.0, '2025-06-09', 'Success'),
( 10, 'Credit Card', 150.0, '2025-06-10', 'Pending');




-- 2. Viết câu UPDATE cho phép cập nhật trạng thái thanh toán trong bảng Payment:
-- 	•	Cập nhật trạng thái thanh toán thành "Success" nếu số tiền thanh toán (payment_amount) > 0 và phương thức thanh toán là "Credit Card".
UPDATE `payment` 
SET `payment_status` = 'Success'
WHERE `payment_amount` > 0 AND `payment_method` = 'Credit Card' AND `payment_date` < CURRENT_DATE();


-- 	•	Cập nhật trạng thái thanh toán thành "Pending" nếu phương thức thanh toán là "Bank Transfer" và số tiền thanh toán nhỏ hơn 100.
UPDATE `payment`
SET `payment_status` = 'Pending'
WHERE `payment_method` = 'Bank Transfer' AND `payment_amount` < 100 AND `payment_date` < CURRENT_DATE();

-- 	•	Chỉ cập nhật trạng thái thanh toán cho những giao dịch có ngày thanh toán (payment_date) là trước ngày hiện tại (CURRENT_DATE)
-- 3. Thêm cột slot_count trong bảng Enrollment có kiểu dữ liệu là integer
-- , có rằng buộc NOT NULL và giá trị mặc định là 1. Cột này thể hiện số lượng chỗ đã đặt trong khoá học online đăng ký

-- 3. Xóa các bản ghi trong bảng Payment nếu trạng thái thanh toán là "Pending" và phương thức thanh toán là "Cash".
DELETE FROM `payment`
WHERE `payment_status` = 'Pending' AND `payment_method` = 'Cash';

-- 1. Lấy 5 học viên gồm mã, tên, email, ngày sinh, giới tính, sắp xếp theo tên tăng dần.
SELECT * FROM (
SELECT * FROM `student` 
LIMIT 5
) AS name
ORDER BY `student_full_name` ASC;

-- 2. . Lấy thông tin các khóa học gồm mã, tên, danh mục, sắp xếp theo học phí giảm dần.
 
SELECT c.`course_id`, c.`course_name`, c.`category` FROM `course` AS c
JOIN `enrollment` AS e
ON e.`course_id` = c.`course_id`
JOIN `payment` AS p
ON p.`enrollment_id` = e.`enrollment_id`
ORDER BY p.`payment_amount`;

-- 3. Lấy thông tin các học viên gồm mã học viên, tên học viên, khoá học đã đăng ký và trạng thái Enrollment là "Cancelled"
SELECT s.`student_id`, s.`student_full_name`, c.`category` FROM `student` AS s
JOIN `enrollment` AS e
ON e.`student_id` = s.`student_id`
JOIN `payment` AS p
ON p.`enrollment_id` = e.`enrollment_id`
JOIN `course` AS c
ON e.`course_id` = c.`course_id`
WHERE e.`enrollment_status` = 'Cancelled';

-- 4. Lấy danh sách các khoá học gồm mã khoá học, mã học viên, khoá học đã đặt, 
-- và số lượng slot_count cho các khoá học có trạng thái "Confirmed", sắp xếp theo số lượng slot_count giảm dần

SELECT e.`course_id`,e.`student_id`,c.`course_name`,e.`slot_count` FROM `enrollment` AS e
JOIN `course` AS c 
ON e.`course_id` = c.`course_id`
WHERE e.`enrollment_status` = 'Confirmed'
ORDER BY e.`slot_count` DESC;

-- 5  Lấy danh sách các học viên gồm mã khoá học, tên học viên, khoá học đã đăng ký,
-- và số lượng slot_count cho các học viên có số lượng slot_count trong khoảng từ 2 đến 3, sắp xếp theo tên học viên
SELECT e.`course_id`,e.`student_id`,c.`course_name` FROM `enrollment` AS e
JOIN `course` AS c 
ON e.`course_id` = c.`course_id`
JOIN `student` AS s
ON s.`student_id` = e.`student_id`
WHERE e.`slot_count` >= 2 AND e.`slot_count` <= 3
ORDER BY s.`student_full_name`;

-- 6. Lấy danh sách các học viên có ít nhất 2 slot và thanh toán ở trạng thái 'Pending'.

SELECT s.`student_id`, s.`student_full_name`, COUNT(p.`payment_id`) AS pending_payments, SUM(e.`slot_count`) AS total_slots
FROM `payment` AS p
JOIN `enrollment` AS e 
ON p.`enrollment_id` = e.`enrollment_id`
JOIN `student` AS s 
ON s.`student_id` = e.`student_id`
WHERE p.`payment_status` = 'Pending'
GROUP BY s.`student_id`, s.`student_full_name`
HAVING total_slots >= 2;

-- 7. Lấy danh sách các học viên và số tiền đã thanh toán với trạng thái 'Success'.
SELECT s.`student_full_name` FROM `student` AS s
JOIN `enrollment` AS e
ON e.`student_id` = s.`student_id`
JOIN `payment` AS p
ON p.`enrollment_id` = e.`enrollment_id`
WHERE p.`payment_status` = 'Success';

-- 8. Lấy danh sách 5 học viên đầu tiên có số lượng slot_count lớn hơn 1,
-- sắp xếp theo số lượng slot_count giảm dần, gồm mã học viên, tên học viên, số lượng slot_count và trạng thái enrollment
SELECT * FROM `student` AS s
JOIN `enrollment` AS e
ON e.`student_id` = s.`student_id`
WHERE e.`slot_count` > 1
ORDER BY e.`slot_count` DESC
LIMIT 5;

-- 9. Lấy thông tin khoá học có số lượng đăng ký nhiều nhất

SELECT c.`course_id`, c.`course_name`, SUM(e.`slot_count`) AS total  FROM `course` AS c
JOIN `enrollment` AS e
ON e.`course_id` = c.`course_id`
GROUP BY c.`course_id`, c.`course_name` 
HAVING total = (
    SELECT MAX(total_tickets)
    FROM (
        SELECT SUM(e2.`slot_count`) AS total_tickets
        FROM `enrollment` AS e2
        GROUP BY e2.`course_id`
    ) AS sub
);


-- 10. Lấy danh sách các học viên có ngày sinh trước năm 2000 và đã thanh toán thành công.
SELECT s.`student_full_name`, s.`student_dob`, p.`payment_amount`, p.`payment_status` FROM `student` AS s
JOIN `enrollment` AS e
ON e.`student_id` = s.`student_id`
JOIN `payment` AS p
ON p.`enrollment_id` = e.`enrollment_id`
WHERE s.`student_dob` < '2000-01-01' AND p.`payment_status` = 'Success';


-- PHẦN 5: Tạo View
-- 1. Tạo view view_all_student_enrollment để lấy danh sách tất cả các học viên và khoá học đã đăng ký
-- gồm mã học viên, tên học viên, mã khoá học, tên khoá học và số lượng slot_count đã đăng ký
CREATE VIEW `view_all_student_enrollment1` AS
SELECT s.`student_id`,s.`student_full_name`,c.`course_id`,c.`course_name`,e.`slot_count` FROM `enrollment` AS e
JOIN `student` AS s 
ON e.`student_id` = s.`student_id`
JOIN `course` AS c 
ON e.`course_id`= c.`course_id`;

SELECT * FROM `view_all_student_enrollment1`;

-- 2. Tạo view view_successful_payment để lấy danh sách các học viên đã thanh toán thành công
-- gồm mã học viên, tên học viên và số tiền thanh toán, chỉ lấy các giao dịch có trạng thái thanh toán "Success"
CREATE VIEW `view_successful_payment` AS
SELECT s.`student_id`, s.`student_full_name`, p.`payment_amount` FROM `student` AS s
JOIN `enrollment` AS e
ON e.`student_id` = s.`student_id`
JOIN `payment` AS p
ON p.`enrollment_id` = e.`enrollment_id`
WHERE p.`payment_status` = 'Success';

SELECT * FROM `view_successful_payment`;


-- PHẦN 6: Tạo Trigger
-- 1. Tạo một trigger để kiểm tra và đảm bảo rằng số slot_count trong bảng Enrollment không bị giảm xuống dưới 1
-- khi có sự thay đổi. Nếu số slot_count nhỏ hơn 1, trigger sẽ thông báo lỗi SIGNAL SQLSTATE và không cho phép cập nhật.

DELIMITER $$

CREATE TRIGGER `check_ticket_quantity_before_update`
BEFORE UPDATE ON `enrollment`
FOR EACH ROW
BEGIN
    IF NEW.`slot_count`< 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Số lượng vé (slot_count) không được nhỏ hơn 1.';
    END IF;
END$$

DELIMITER ;


-- 2. Tạo một trigger để khi thực hiện chèn dữ liệu vào bảng Payment,
--  sẽ tự động kiểm tra trạng thái thanh toán,
-- nếu như trạng thái thanh toán là “Success” 
-- thì tiến hành cập nhật trạng thái enrollment_status của ở bảng Enrollment 
-- tương ứng với đơn đăng ký đó thành “Confirmed”

DELIMITER $$
CREATE TRIGGER `check_status`
BEFORE INSERT ON `payment`
FOR EACH ROW
BEGIN 
	IF NEW.`payment_status` = 'Success' THEN
    UPDATE `enrollment`
    SET `enrollment_status` = 'Confirmed'
    WHERE `payment_id` = NEW.`payment_id`;
    END IF;
END $$
DELIMITER ;




-- PHẦN 7: Tạo Store Procedure
-- 1. Tạo một stored procedure có tên GetAllStudentEnrollments 
-- để lấy thông tin tất cả các sinh viên và khoá học họ đã đăng ký
DELIMITER $$
	 CREATE PROCEDURE GetAllStudentEnrollments()
     BEGIN
		SELECT s.`student_id`, s.`student_full_name`, e.`enrollment_id`, e.`course_id`, e.`slot_count`  FROM `enrollment` AS e
        JOIN `payment` AS p
        ON e.`enrollment_id` = p.`enrollment_id`;
	END$$
DELIMITER ;
 
 
CALL GetAllStudentEnrollments()


-- 2. Tạo một stored procedure có tên UpdateEnrollment để thực hiện thao tác cập nhật một bản ghi trong vào bảng Enrollment dựa theo khóa chính.
-- Các tham số đầu vào:
-- 	•	p_enrollment_id: Mã đăng ký.
-- 	•	p_student_id: Mã học viên.
-- 	•	p_course_id: Mã khoá học.
-- 	•	p_slot_count: Số lượng slot đăng ký.

DELIMITER $$
	CREATE PROCEDURE `UpdateEnrollment`(IN `p_enrollment_id` INT, IN `p_student_id` VARCHAR(10),IN `p_course_id` VARCHAR(10),IN `p_slot_count` INT)
    BEGIN
    UPDATE `enrollment` 
    SET `student_id` = `p_student_id`,
		`course_id` = `p_course_id`,
		`slot_count` = `p_slot_count`
    WHERE `enrollment_id` = `p_enrollment_id`;
    END$$
DELIMITER  ;







