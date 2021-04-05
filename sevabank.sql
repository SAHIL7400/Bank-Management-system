
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

USE Sevabank;

set global general_log = on;

CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL,
  `branchNo` varchar(111) NOT NULL,
  `branchName` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `branch` (`branchId`, `branchNo`, `branchName`) VALUES
(1, '100101', 'Pune'),
(2, '100102', 'Mumbai');



CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `message` text NOT NULL,
  `userId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT Current_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `feedback` (`feedbackId`, `message`, `userId`, `date`) VALUES
(1, 'This is testing message to admin or manager by fk', 1, '2020-12-15 04:30:48'),
(3, 'This is testing message to admin or manager by fk', 2, '2020-12-15 04:30:48'),
(4, 'this is help card for admin', 1, '2020-12-17 06:45:20');



CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(111) NOT NULL,
  `password` varchar(111) NOT NULL,
  `type` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT Current_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `login` (`id`, `email`, `password`, `type`, `date`) VALUES
(1, 'cashier@cashier.com', 'cashier', 'cashier', '2020-12-15 04:36:27'),
(2, 'manager@manager.com', 'manager', 'manager', '2020-12-15 04:36:27'),
(3, 'sadfas@gmail.com', 'sdfas', 'cashier', '2020-12-16 07:13:12'),
(4, 'cashier2@cashier.com', 'cashier2', 'cashier', '2020-12-16 07:14:47');



CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `notice` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT Current_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `notice` (`id`, `userId`, `notice`, `date`) VALUES
(1, 1, 'Dear Customer! <br> Our privacy policy is changed for account information get new prospectus from your nearest branch', '2020-12-14 13:11:46'),
(6, 2, 'Dear Ali,<br>\r\nOur privacy policy has been changed please visit nearest <kbd> SevaBank </kbd> branch for new prospectus.', '2020-12-16 06:29:23');



-- CREATE TABLE `otheraccounts` (
--   `id` int(11) NOT NULL,
--   `accountNo` varchar(111) NOT NULL,
--   `bankName` varchar(111) NOT NULL,
--   `holderName` varchar(111) NOT NULL,
--   `balance` varchar(111) NOT NULL,
--   `date` timestamp NOT NULL DEFAULT Current_TIMESTAMP
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- INSERT INTO `otheraccounts` (`id`, `accountNo`, `bankName`, `holderName`, `balance`, `date`) VALUES
-- (1, '12001122', 'UBL', 'Kareena Shetty', '40800', '2020-12-14 11:55:07'),
-- (2, '12001123', 'HBL', 'George Francis', '71000', '2020-12-14 11:55:07'),
-- (3, '12001124', 'HBL', 'George Francis', '71000', '2020-12-14 11:55:07');



CREATE TABLE `transaction` (
  `transactionId` int(11) NOT NULL,
  `action` varchar(111) NOT NULL,
  `credit` varchar(111) DEFAULT NULL,
  `debit` varchar(111) DEFAULT NULL,
  `beneficiaryAcc` varchar(111) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT Current_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `transaction` (`transactionId`, `action`, `credit`, `debit`, `beneficiaryAcc`, `userId`, `date`) VALUES
(4, 'transfer', NULL, '200', '10002', 1, '2020-12-14 12:33:40'),
(5, 'transfer', NULL, '200', '10002', 1, '2020-12-14 12:56:48'),
(6, 'transfer', NULL, '333', '10003', 1, '2020-12-14 12:57:20'),
(7, 'transfer', NULL, '222', '10004', 1, '2020-12-14 12:58:19'),
(8, 'transfer', NULL, '333', '10002', 1, '2020-12-14 13:00:23'),
(16, 'withdraw', NULL, '100', '10001', 1, '2020-12-15 08:31:59'),
(17, 'deposit', '1200', NULL, '10001', 1, '2020-12-15 08:32:17'),
(18, 'transfer', NULL, '467', '10004', 1, '2020-12-17 06:44:48'),
(22, 'deposit', '1200', NULL, '10002', 2, '2020-12-17 06:56:29'),
(23, 'withdraw', NULL, '12', '10002', 2, '2020-12-17 06:59:02'),
(24, 'deposit', '12', NULL, '10002', 2, '2020-12-17 06:59:20'),
(25, 'transfer', NULL, '1200', '10002', 1, '2020-12-17 07:01:37'),
(26, 'deposit', '600', NULL, '10002', 2, '2020-12-17 07:04:39'),
(27, 'withdraw', NULL, '1012', '10003', 6, '2020-12-17 07:04:58');



CREATE TABLE `useraccounts` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `aadhaar_number` varchar(111) NOT NULL,
  `phone` varchar(111) NOT NULL,
  `city` varchar(111) NOT NULL,
  `address` varchar(111) NOT NULL,
  `source_of_income` varchar(111) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `branch` int(11) NOT NULL,
  `accountType` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT Current_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `useraccounts` (`id`, `email`, `password`, `name`, `balance`, `aadhaar_number`, `phone`, `city`, `address`, `source_of_income`, `accountNo`, `branch`, `accountType`, `date`) VALUES
(1, 'someone@gmail.com', 'some', 'Manoj Gogu', '9800', '3210375555426', '9676751617', 'Mumbai', 'somewhere in Mubmai', 'Programmer', '10001', '1', 'Current', '2020-12-14 05:50:06'),
(2, 'anyone@gmail.com', 'some2', 'Jay Prakash', '16000', '3210375555343', '8919660667', 'Mumbai', 'somewhere in Mubmai', 'Programmer', '10002', '1', 'Savings', '2020-12-14 04:50:06'),
(6, 'realali@yahoo.com', 'real', 'Nadeem Ali', '234234', '3240338834902', '8080766645', 'Pune', 'Somewhere in Pune', 'Govt. job', '10003', '1', 'Savings', '2020-12-16 07:52:40'),
(7, 'realali@yahoo.com', 'real', 'Nadeem Ali', '12121', '3240338834902', '9392435452', 'Pune', 'Somewhere in Pune', 'Govt. job', '10004', '2', 'Current', '2020-12-16 07:54:18');
(8, 'sahil@gmail.com','sahil','sahil','100000','480384419345','9760872843','mathura','mathura','student',10005','1','saving','2020-11-17 08:00');


CREATE TABLE `sevabank`.`deletelogs`
( `logId` INT NOT NULL AUTO_INCREMENT ,
  `userId` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `aadhaar_number` varchar(111) NOT NULL,
  `phone` varchar(111) NOT NULL,
  `city` varchar(111) NOT NULL,
  `address` varchar(111) NOT NULL,
  `source_of_income` varchar(111) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `branch` int(11) NOT NULL,
  `accountType` varchar(111) NOT NULL,
  `dateOfCreation` timestamp NOT NULL,
  `deletionDate` DATETIME NOT NULL ,
PRIMARY KEY (`logid`)) ENGINE = InnoDB;

ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchId`);

ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`);

ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

-- ALTER TABLE `otheraccounts`
--   ADD PRIMARY KEY (`id`);

ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionId`);

ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `branch`
  MODIFY `branchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
-- ALTER TABLE `otheraccounts`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `transaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
ALTER TABLE `useraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `useraccounts`
  ADD FOREIGN KEY(`branch`) references branch(`branchId`);

ALTER TABLE `feedback`
  ADD FOREIGN KEY(`userId`) references useraccounts(`id`);

ALTER TABLE `notice`
  ADD FOREIGN KEY(`userId`) references useraccounts(`id`);

ALTER TABLE `transaction`
  ADD FOREIGN KEY(`userId`) references useraccounts(`id`);

CREATE TRIGGER `deletelogger`
AFTER delete ON `useraccounts`
FOR EACH ROW
INSERT INTO deletelogs
VALUES
(DEFAULT,
OLD.id,
OLD.email,
OLD.password,
OLD.name,
OLD.balance,
OLD.aadhaar_number,
OLD.phone,
OLD.city,
OLD.address,
OLD.source_of_income,
OLD.accountNo,
OLD.branch,
OLD.accountType,
OLD.date,
NOW());


CREATE PROCEDURE `allDetails`()
NOT DETERMINISTIC CONTAINS SQL
SQL SECURITY DEFINER
SELECT * FROM useraccounts
