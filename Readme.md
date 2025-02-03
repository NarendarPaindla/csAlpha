select * from users;

SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'leave_requests' AND COLUMN_NAME = 'employee_id';

ALTER TABLE leave_requests DROP FOREIGN KEY leave_requests_ibfk_1;
ALTER TABLE leave_requests DROP COLUMN employee_id;

ALTER TABLE leave_requests 
ADD COLUMN user_id INT NOT NULL, 
ADD COLUMN manager_id INT NOT NULL;

ALTER TABLE leave_requests 
ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES users(id);
desc leave_requests

drop database employee_leave_db;
create DATABASE employee_leave_db;
USE employee_leave_db;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('employee', 'manager', 'admin') NOT NULL,
  manager_id INT DEFAULT NULL
);

CREATE TABLE leaves (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  manager_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  reason VARCHAR(255) NOT NULL,
  status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
  FOREIGN KEY (employee_id) REFERENCES users(id),
  FOREIGN KEY (manager_id) REFERENCES users(id)
);
select * from users;
select * from leaves;

SHOW CREATE TABLE leaves;

ALTER TABLE leaves DROP FOREIGN KEY leaves_ibfk_1;
ALTER TABLE leaves DROP FOREIGN KEY leaves_ibfk_2;

ALTER TABLE leaves 
  ADD CONSTRAINT fk_leaves_employee 
  FOREIGN KEY (employee_id) 
  REFERENCES users(id) 
  ON DELETE CASCADE;

ALTER TABLE leaves 
  ADD CONSTRAINT fk_leaves_manager 
  FOREIGN KEY (manager_id) 
  REFERENCES users(id) 
  ON DELETE CASCADE;