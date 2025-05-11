-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2022 at 11:12 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smsci`
--

-- --------------------------------------------------------

--
-- Table structure for table `running_session`
--

CREATE TABLE `running_session` (
  `id` int(11) NOT NULL,
  `session` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `running_session`
--

INSERT INTO `running_session` (`id`, `session`, `active`) VALUES
(1, '2024-2025', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_account_fees`
--

CREATE TABLE `sms_account_fees` (
  `id` int(11) NOT NULL,
  `ac_type` mediumint(9) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_account_fees`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_account_month`
--

CREATE TABLE `sms_account_month` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_account_month`
--

INSERT INTO `sms_account_month` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `sms_account_monthly_payment`
--

CREATE TABLE `sms_account_monthly_payment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `month` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_account_monthly_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_account_type`
--

CREATE TABLE `sms_account_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_account_type`
--

INSERT INTO `sms_account_type` (`id`, `name`, `session_id`) VALUES
(1, 'Admission', 1),
(2, 'Monthly', 1),
(3, 'Examination', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_attendance`
--

CREATE TABLE `sms_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `dt` date NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `sms_class`
--

CREATE TABLE `sms_class` (
  `name` varchar(20) NOT NULL,
  `id` int(2) NOT NULL,
  `num` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_class`
--



-- --------------------------------------------------------

--
-- Table structure for table `sms_class_section`
--

CREATE TABLE `sms_class_section` (
  `id` int(11) NOT NULL,
  `name` varchar(5) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_class_section`
--

-- --------------------------------------------------------

--
-- Table structure for table `sms_exam_marks`
--

CREATE TABLE `sms_exam_marks` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_exam_marks`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_exam_routine`
--

CREATE TABLE `sms_exam_routine` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `name` text,
  `routine` text,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_exam_routine`
--

-- --------------------------------------------------------

--
-- Table structure for table `sms_exam_type`
--

CREATE TABLE `sms_exam_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_exam_type`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_groups`
--

CREATE TABLE `sms_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_groups`
--

INSERT INTO `sms_groups` (`id`, `name`, `definition`) VALUES
(1, 'Admin', 'Super Admin Group'),
(2, 'Teacher', 'Teacher Access Group'),
(3, 'Student', 'Student Access Group'),
(4, 'Parent', 'Parent Access Group');

-- --------------------------------------------------------

--
-- Table structure for table `sms_group_to_group`
--

CREATE TABLE `sms_group_to_group` (
  `group_id` int(11) UNSIGNED NOT NULL,
  `subgroup_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_library`
--

CREATE TABLE `sms_library` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `publication` varchar(30) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_library`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_notice`
--

CREATE TABLE `sms_notice` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `body` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_notice`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_perms`
--

CREATE TABLE `sms_perms` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_perms`
--

INSERT INTO `sms_perms` (`id`, `name`, `definition`) VALUES
(1, 'Admin', 'Administration only'),
(2, 'Teacher', 'teacher'),
(3, 'Student', NULL),
(4, 'Parent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_perm_to_group`
--

CREATE TABLE `sms_perm_to_group` (
  `perm_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_perm_to_group`
--

INSERT INTO `sms_perm_to_group` (`perm_id`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sms_perm_to_user`
--

CREATE TABLE `sms_perm_to_user` (
  `perm_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_perm_to_user`
--

INSERT INTO `sms_perm_to_user` (`perm_id`, `user_id`) VALUES
(1, 71);

-- --------------------------------------------------------

--
-- Table structure for table `sms_pms`
--

CREATE TABLE `sms_pms` (
  `id` int(11) UNSIGNED NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `receiver_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_pms`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_security`
--

CREATE TABLE `sms_security` (
  `user_id` int(11) NOT NULL,
  `warning` int(11) DEFAULT '0',
  `log` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_security`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_student`
--

CREATE TABLE `sms_student` (
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `roll` int(11) NOT NULL,
  `transport_id` int(11) DEFAULT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_student`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_student_account`
--

CREATE TABLE `sms_student_account` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `month` varchar(15) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms_studycomments`
--

CREATE TABLE `sms_studycomments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms_studymaterial`
--

CREATE TABLE `sms_studymaterial` (
  `id` int(11) NOT NULL,
  `name` text,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `detail` text,
  `file` text NOT NULL,
  `count` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_studymaterial`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_subject`
--

CREATE TABLE `sms_subject` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT '0',
  `class_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_subject`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_syllabus`
--

CREATE TABLE `sms_syllabus` (
  `id` int(11) NOT NULL,
  `name` text,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `file` text NOT NULL,
  `count` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_syllabus`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_system_variables`
--

CREATE TABLE `sms_system_variables` (
  `id` int(11) UNSIGNED NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_transport`
--

CREATE TABLE `sms_transport` (
  `id` int(11) NOT NULL,
  `driver` varchar(30) DEFAULT NULL,
  `bus` varchar(10) DEFAULT NULL,
  `route` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_transport`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_users`
--

CREATE TABLE `sms_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(7) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `dob` text NOT NULL,
  `pro_pic` text NOT NULL,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_login_attempt` datetime DEFAULT NULL,
  `forgot_exp` text,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text,
  `verification_code` text,
  `totp_secret` varchar(16) DEFAULT NULL,
  `ip_address` text,
  `login_attempts` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_users`
--

INSERT INTO `sms_users` (`id`, `email`, `pass`, `name`, `role`, `gender`, `full_name`, `contact`, `address`, `dob`, `pro_pic`, `banned`, `last_login`, `last_activity`, `last_login_attempt`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `totp_secret`, `ip_address`, `login_attempts`) VALUES
(71, 'admin@mail.com', '5822e5fadbb0afc731207069f450cd7657e669ce15e4183cb7551913d94e1584', 'admin', 'Admin', 'male', 'Admin Phuc', '+(84) 123456789', '78 Cau Giay', '01/01/2004', 'admin-icn.png', 0, NULL, '2022-08-03 10:49:00', '2022-08-03 10:00:00', NULL, NULL, NULL, '', NULL, '::1', NULL);
-- --------------------------------------------------------

--
-- Table structure for table `sms_user_to_group`
--

CREATE TABLE `sms_user_to_group` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_user_to_group`
--

INSERT INTO `sms_user_to_group` (`user_id`, `group_id`) VALUES

(71, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_user_variables`
--

CREATE TABLE `sms_user_variables` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_sessions`
--

CREATE TABLE `system_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_sessions`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `running_session`
--
ALTER TABLE `running_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_account_fees`
--
ALTER TABLE `sms_account_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_account_month`
--
ALTER TABLE `sms_account_month`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_account_monthly_payment`
--
ALTER TABLE `sms_account_monthly_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_account_type`
--
ALTER TABLE `sms_account_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_attendance`
--
ALTER TABLE `sms_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_class`
--
ALTER TABLE `sms_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_class_section`
--
ALTER TABLE `sms_class_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_exam_marks`
--
ALTER TABLE `sms_exam_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_exam_routine`
--
ALTER TABLE `sms_exam_routine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_exam_type`
--
ALTER TABLE `sms_exam_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_groups`
--
ALTER TABLE `sms_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_group_to_group`
--
ALTER TABLE `sms_group_to_group`
  ADD PRIMARY KEY (`group_id`,`subgroup_id`);

--
-- Indexes for table `sms_library`
--
ALTER TABLE `sms_library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_notice`
--
ALTER TABLE `sms_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_perms`
--
ALTER TABLE `sms_perms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_perm_to_group`
--
ALTER TABLE `sms_perm_to_group`
  ADD PRIMARY KEY (`perm_id`,`group_id`);

--
-- Indexes for table `sms_perm_to_user`
--
ALTER TABLE `sms_perm_to_user`
  ADD PRIMARY KEY (`perm_id`,`user_id`);

--
-- Indexes for table `sms_pms`
--
ALTER TABLE `sms_pms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `full_index` (`id`,`sender_id`,`receiver_id`,`date_read`);

--
-- Indexes for table `sms_student`
--
ALTER TABLE `sms_student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `id` (`student_id`);

--
-- Indexes for table `sms_student_account`
--
ALTER TABLE `sms_student_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_studycomments`
--
ALTER TABLE `sms_studycomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_studymaterial`
--
ALTER TABLE `sms_studymaterial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_subject`
--
ALTER TABLE `sms_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_syllabus`
--
ALTER TABLE `sms_syllabus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_system_variables`
--
ALTER TABLE `sms_system_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_transport`
--
ALTER TABLE `sms_transport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_users`
--
ALTER TABLE `sms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_user_to_group`
--
ALTER TABLE `sms_user_to_group`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `sms_user_variables`
--
ALTER TABLE `sms_user_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_index` (`user_id`);

--
-- Indexes for table `system_sessions`
--
ALTER TABLE `system_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `running_session`
--
ALTER TABLE `running_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sms_account_fees`
--
ALTER TABLE `sms_account_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `sms_account_month`
--
ALTER TABLE `sms_account_month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sms_account_monthly_payment`
--
ALTER TABLE `sms_account_monthly_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `sms_account_type`
--
ALTER TABLE `sms_account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sms_attendance`
--
ALTER TABLE `sms_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `sms_class`
--
ALTER TABLE `sms_class`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `sms_class_section`
--
ALTER TABLE `sms_class_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `sms_exam_marks`
--
ALTER TABLE `sms_exam_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `sms_exam_routine`
--
ALTER TABLE `sms_exam_routine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sms_exam_type`
--
ALTER TABLE `sms_exam_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `sms_groups`
--
ALTER TABLE `sms_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sms_library`
--
ALTER TABLE `sms_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sms_notice`
--
ALTER TABLE `sms_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sms_perms`
--
ALTER TABLE `sms_perms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sms_pms`
--
ALTER TABLE `sms_pms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sms_student_account`
--
ALTER TABLE `sms_student_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sms_studycomments`
--
ALTER TABLE `sms_studycomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sms_studymaterial`
--
ALTER TABLE `sms_studymaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sms_subject`
--
ALTER TABLE `sms_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `sms_syllabus`
--
ALTER TABLE `sms_syllabus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sms_system_variables`
--
ALTER TABLE `sms_system_variables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sms_transport`
--
ALTER TABLE `sms_transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sms_users`
--
ALTER TABLE `sms_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `sms_user_variables`
--
ALTER TABLE `sms_user_variables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
