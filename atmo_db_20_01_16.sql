# SQL Manager Lite for MySQL 5.3.1.3
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : atmo_db


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `atmo_db`
    CHARACTER SET 'cp1251'
    COLLATE 'cp1251_general_ci';

USE `atmo_db`;

#
# Структура для таблицы `ac_events`: 
#

CREATE TABLE `ac_events` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `ft_type` VARCHAR(30) COLLATE cp1251_general_ci DEFAULT NULL,
  `ft_title` TEXT COLLATE cp1251_general_ci,
  `ft_description` TEXT COLLATE cp1251_general_ci,
  `ft_keywords` TEXT COLLATE cp1251_general_ci,
  `fd_time_begin` DATETIME DEFAULT NULL,
  `fd_time_end` DATETIME DEFAULT NULL,
  `ft_provision` TEXT COLLATE cp1251_general_ci,
  `ft_comments` TEXT COLLATE cp1251_general_ci,
  `fn_author_id` INTEGER(11) DEFAULT NULL,
  `fn_max_members` INTEGER(3) DEFAULT NULL,
  `fn_min_members` INTEGER(3) DEFAULT NULL,
  `fc_vk_url` VARCHAR(50) COLLATE cp1251_general_ci DEFAULT NULL,
  `ff_active` TINYINT(1) DEFAULT NULL,
  `ff_public` TINYINT(1) DEFAULT NULL,
  `fn_fixed` FLOAT(8,2) DEFAULT NULL,
  `fn_maxed` FLOAT(8,2) DEFAULT NULL,
  `fn_unless` FLOAT(8,2) DEFAULT NULL,
  `fn_special_price` FLOAT(4,2) DEFAULT NULL,
  `ff_no_action_discount` TINYINT(1) DEFAULT NULL,
  `ff_no_personal_discount` TINYINT(1) DEFAULT NULL,
  `ff_no_friends_discount` TINYINT(1) DEFAULT NULL,
  `ff_no_coupon_discount` TINYINT(1) DEFAULT NULL,
  `ff_only_money` TINYINT(1) DEFAULT NULL,
  `fn_room_a` INTEGER(2) DEFAULT NULL,
  `fn_room_b` INTEGER(2) DEFAULT NULL,
  `fn_room_c` INTEGER(2) DEFAULT NULL,
  `fn_room_d` INTEGER(2) DEFAULT NULL,
  `fn_repeat_period` INTEGER(3) DEFAULT NULL,
  `fn_members` INTEGER(4) DEFAULT NULL,
  `fn_rooms` INTEGER(2) DEFAULT NULL,
  `ff_moderated` TINYINT(1) DEFAULT NULL,
  `fc_office` VARCHAR(20) COLLATE cp1251_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=32 AVG_ROW_LENGTH=8192 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `action_discounts`: 
#

CREATE TABLE `action_discounts` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_discount_num` INTEGER(11) DEFAULT NULL,
  `ft_description` TEXT COLLATE cp1251_general_ci,
  `ff_one_time` TINYINT(1) DEFAULT NULL,
  `fn_used_in_session` INTEGER(11) DEFAULT NULL,
  `fd_create_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `ff_active` TINYINT(1) DEFAULT NULL,
  `fn_discount_amount` INTEGER(3) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=2 AVG_ROW_LENGTH=16384 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `cash`: 
#

CREATE TABLE `cash` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_amount` FLOAT(9,2) DEFAULT NULL,
  `fn_person` INTEGER(11) DEFAULT NULL,
  `ft_basement` TEXT COLLATE cp1251_general_ci,
  `ft_comment` TEXT COLLATE cp1251_general_ci,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=4 AVG_ROW_LENGTH=20 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `event_discounts`: 
#

CREATE TABLE `event_discounts` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_event_id` INTEGER(11) DEFAULT NULL,
  `ft_event_type` VARCHAR(30) COLLATE cp1251_general_ci DEFAULT NULL,
  `fn_session_id` INTEGER(11) DEFAULT NULL,
  `fn_coupon_num` INTEGER(13) DEFAULT NULL,
  `fn_discount_amount_percent` INTEGER(3) DEFAULT NULL,
  `fn_discount_amount_time` INTEGER(3) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=1 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `leaders`: 
#

CREATE TABLE `leaders` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_leader_id` INTEGER(11) DEFAULT NULL,
  `fn_event_id` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=1 ROW_FORMAT=FIXED CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `lost_cards`: 
#

CREATE TABLE `lost_cards` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_card_num` INTEGER(13) DEFAULT NULL,
  `fn_cardholder` INTEGER(11) DEFAULT NULL,
  `fd_lostdate` DATETIME DEFAULT NULL,
  `ft_description` TEXT COLLATE cp1251_general_ci,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=1 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `members`: 
#

CREATE TABLE `members` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_member_id` INTEGER(11) DEFAULT NULL,
  `fn_prepaid_amount` FLOAT(8,2) DEFAULT NULL,
  `fn_event_id` INTEGER(11) DEFAULT NULL,
  `ff_active` TINYINT(1) DEFAULT NULL,
  `fn_money_paid` FLOAT(8,2) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=3 AVG_ROW_LENGTH=8192 ROW_FORMAT=FIXED CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `memos`: 
#

CREATE TABLE `memos` (
  `fk_id` INTEGER(11) DEFAULT NULL,
  `fn_author_id` INTEGER(11) DEFAULT NULL,
  `fd_timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `fn_urgent` INTEGER(3) DEFAULT NULL,
  `fn_attached_to` INTEGER(11) DEFAULT NULL,
  `ft_text` TEXT COLLATE cp1251_general_ci
)ENGINE=MyISAM
CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `operators`: 
#

CREATE TABLE `operators` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_operator_id` INTEGER(11) DEFAULT NULL,
  `fn_stavka_hour` FLOAT(7,2) DEFAULT NULL,
  `fn_stavka_proc` FLOAT(5,2) DEFAULT NULL,
  `fn_money` FLOAT(9,2) DEFAULT NULL,
  `fc_password` VARCHAR(20) COLLATE cp1251_general_ci DEFAULT NULL,
  `ft_memo` TEXT COLLATE cp1251_general_ci,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=1 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `person`: 
#

CREATE TABLE `person` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_card_num` INTEGER(13) DEFAULT NULL,
  `fc_surname` VARCHAR(20) COLLATE cp1251_general_ci DEFAULT NULL,
  `fc_name` VARCHAR(20) COLLATE cp1251_general_ci DEFAULT NULL,
  `fc_fathername` VARCHAR(20) COLLATE cp1251_general_ci DEFAULT NULL,
  `fd_birthday` DATE DEFAULT NULL,
  `fc_phone_num` VARCHAR(12) COLLATE cp1251_general_ci DEFAULT NULL,
  `fc_mail` VARCHAR(60) COLLATE cp1251_general_ci DEFAULT NULL,
  `fc_vk` VARCHAR(50) COLLATE cp1251_general_ci DEFAULT NULL,
  `fn_personal_disc` INTEGER(3) DEFAULT NULL,
  `fc_disc_basement` TEXT COLLATE cp1251_general_ci,
  `fn_money` FLOAT(9,2) DEFAULT NULL,
  `fn_time` INTEGER(6) DEFAULT NULL,
  `fb_photo_jpg` BINARY(1) DEFAULT NULL,
  `fd_register_date` DATE DEFAULT NULL,
  `ft_description` TEXT COLLATE cp1251_general_ci,
  `ff_blocked` TINYINT(1) DEFAULT NULL,
  `ft_block_reason` TEXT COLLATE cp1251_general_ci,
  `fn_affiliated_by` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=73 AVG_ROW_LENGTH=24 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `rekvizit`: 
#

CREATE TABLE `rekvizit` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_session_id` INTEGER(11) DEFAULT NULL,
  `fc_title` VARCHAR(20) COLLATE cp1251_general_ci DEFAULT NULL,
  `fn_count` INTEGER(3) DEFAULT NULL,
  `ft_comment` TEXT COLLATE cp1251_general_ci,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=10 AVG_ROW_LENGTH=32 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `session`: 
#

CREATE TABLE `session` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fn_cardholder` INTEGER(11) NOT NULL,
  `fn_cardnum` INTEGER(13) NOT NULL,
  `fd_time_open` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fd_time_close` DATETIME DEFAULT NULL,
  `fn_stavka` FLOAT(4,2) DEFAULT NULL,
  `fn_affiliated` INTEGER(2) DEFAULT NULL,
  `fn_affiliated_by` INTEGER(11) DEFAULT NULL,
  `ff_paid` TINYINT(1) DEFAULT NULL,
  `fn_action_disc` INTEGER(3) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=13 AVG_ROW_LENGTH=38 ROW_FORMAT=FIXED CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `temp_events`: 
#

CREATE TABLE `temp_events` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `ft_type` VARCHAR(30) COLLATE cp1251_general_ci DEFAULT NULL,
  `ft_title` TEXT COLLATE cp1251_general_ci,
  `fd_time_begin` DATETIME DEFAULT NULL,
  `fd_time_end` DATETIME DEFAULT NULL,
  `fn_author_id` INTEGER(11) DEFAULT NULL,
  `ff_active` TINYINT(1) DEFAULT NULL,
  `ff_public` TINYINT(1) DEFAULT NULL,
  `fn_room_a` INTEGER(2) DEFAULT NULL,
  `fn_room_b` INTEGER(2) DEFAULT NULL,
  `fn_room_c` INTEGER(2) DEFAULT NULL,
  `fn_room_d` INTEGER(2) DEFAULT NULL,
  `fn_repeat_period` INTEGER(3) DEFAULT NULL,
  `fn_members` INTEGER(4) DEFAULT NULL,
  `fn_rooms` INTEGER(2) DEFAULT NULL,
  `ff_moderated` TINYINT(1) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=31 AVG_ROW_LENGTH=8192 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Структура для таблицы `work_session`: 
#

CREATE TABLE `work_session` (
  `fk_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `fd_begin_session` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `fd_end_session` DATETIME DEFAULT NULL,
  `fn_operator_id` INTEGER(11) DEFAULT NULL,
  `fn_money_earned` FLOAT(8,2) DEFAULT NULL,
  `ft_memo` TEXT COLLATE cp1251_general_ci,
  PRIMARY KEY USING BTREE (`fk_id`)
)ENGINE=MyISAM
AUTO_INCREMENT=1 CHARACTER SET 'cp1251' COLLATE 'cp1251_general_ci'
COMMENT='';

#
# Definition for the `checkin` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `checkin`(
        `cardholder_id` INTEGER(11),
        `stavka` FLOAT(4,2),
        `affiliator_id` INTEGER(11)
    )
    RETURNS INTEGER(11)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
	DECLARE cardnum INT(11);
    SELECT fn_card_num INTO cardnum FROM person WHERE fk_id = cardholder_id;
	INSERT INTO session (fn_cardholder, fn_cardnum, fn_stavka, fn_affiliated_by) VALUES (cardholder_id, cardnum, stavka, affiliator_id);
  RETURN LAST_INSERT_ID() ;
END;

#
# Определение для процедуры `close_session`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `close_session`(
        IN `session_id` INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
UPDATE session SET fd_time_close = CURRENT_TIMESTAMP WHERE fk_id = session_id; 
END;

#
# Definition for the `checkout` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `checkout`(
        `session_id` INTEGER(11)
    )
    RETURNS TEXT CHARACTER SET cp1251
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
DECLARE rekvizit_amount, session_exists, session_opened_exists INT;
DECLARE checkout_message TEXT;
	SELECT COUNT(*) into rekvizit_amount FROM rekvizit WHERE fn_session_id = session_id AND fn_count > 0 ;
	IF rekvizit_amount = 0 THEN
		SELECT COUNT(*) into session_exists FROM session WHERE fk_id = session_id;
		IF session_exists = 1 THEN
        	SELECT COUNT(*) into session_opened_exists FROM session WHERE fk_id = session_id and fd_time_close IS NULL; 
        	IF session_opened_exists = 1 THEN
            	CALL close_session(session_id);
		    	SET checkout_message = CONCAT('ОК : Сессия ',session_id,' закрыта.');
            ELSE
		    	SET checkout_message = CONCAT('ОШИБКА 4 : Сессия ',session_id,' уже закрыта.');
            END IF;
        ELSEIF session_exists > 1 THEN
	    	SET checkout_message = CONCAT('ОШИБКА 3 : Сессия ',session_id,' существует в БД в нескольких экземплярах.');
		ELSE
	    	SET checkout_message = CONCAT('ОШИБКА 2 : Сессия ',session_id,' не существует в БД.');
        END IF;    
    ELSE SET checkout_message = CONCAT('ОШИБКА 1 : Не сдано позиций реквизита ', rekvizit_amount); 
    END IF;
  RETURN checkout_message;
END;

#
# Definition for the `time_to_min` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `time_to_min`(
        `time_to_minutes` TIME
    )
    RETURNS INTEGER(11)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN

  RETURN (SELECT TIME_TO_SEC(time_to_minutes)) DIV 60;
END;

#
# Definition for the `func_time_interval` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `func_time_interval`(
        `beg_session` DATETIME,
        `end_session` DATETIME,
        `beg_event` DATETIME,
        `end_event` DATETIME
    )
    RETURNS INTEGER(6)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE beg_time, end_time DATETIME;
DECLARE in_minutes INT;
IF beg_session < beg_event THEN
	SET beg_time = beg_event;
ELSE
	SET beg_time = beg_session;
END IF;

IF end_session < end_event THEN
	SET end_time = end_session;
ELSE
	SET end_time = end_event;
END IF;

SET in_minutes = time_to_min(TIMEDIFF(end_time,beg_time));

  RETURN in_minutes;
END;

#
# Definition for the `get_friends_time` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `get_friends_time`(
        `affiliator` INTEGER(11)
    )
    RETURNS INTEGER(3)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
DECLARE beg_time, end_time, now_time DATETIME;
DECLARE disc_time TIME;
DECLARE sum INT;
DECLARE done INT DEFAULT 0;
DECLARE disc_list TEXT;

DECLARE cur1 CURSOR FOR SELECT fd_time_open, fd_time_close
						FROM session
                        WHERE fn_affiliated_by = affiliator;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

SET sum = 0;
SET disc_list = '';
SET now_time = NOW();

OPEN cur1;

REPEAT
	FETCH cur1 INTO beg_time, end_time;
    IF done = 0 THEN   
	IF end_time IS NULL THEN SET end_time = now_time;
    END IF;
    SET disc_time = TIMEDIFF(end_time,beg_time);
    SET sum = sum + time_to_min(TIMEDIFF(end_time,beg_time));
	END IF;
UNTIL done
END REPEAT;

CLOSE cur1;

RETURN sum;
END;

#
# Definition for the `insert_person` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `insert_person`(
        `name_person` VARCHAR(20),
        `surname` VARCHAR(20),
        `fathername` VARCHAR(20),
        `birthday` DATE,
        `phone_num` VARCHAR(12),
        `mail` VARCHAR(60),
        `vk` VARCHAR(50),
        `personal_disc` INTEGER(3),
        `disc_basement` TEXT,
        `blocked` BOOLEAN,
        `block_reason` TEXT,
        `description` TEXT,
        `balance_time` INTEGER(6)
    )
    RETURNS TINYINT(4)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
INSERT INTO person (fc_name, fc_surname, fc_fathername,fd_birthday, fc_phone_num, fc_mail, fc_vk,
fn_personal_disc,fc_disc_basement, ff_blocked, ft_block_reason, ft_description, fn_time)
VALUES
 (name_person, surname, fathername,birthday, phone_num, mail, vk,
personal_disc,disc_basement, blocked, block_reason, description, balance_time);
RETURN LAST_INSERT_ID();
END;

#
# Definition for the `oplata` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `oplata`(
        `tim_min` INTEGER(12),
        `stavka` DOUBLE(4,2)
    )
    RETURNS FLOAT(11,2)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN

  RETURN tim_min * stavka;
END;

#
# Definition for the `pay_cash` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `pay_cash`(
        `person_id` INTEGER(11),
        `topay` FLOAT(7,2),
        `cash` FLOAT(7,2),
        `no_change` BOOLEAN
    )
    RETURNS FLOAT(7,2)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
 	DECLARE person_money, change_amount FLOAT;
	SET change_amount = cash - topay;
	IF no_change THEN
  		SELECT fn_money INTO person_money FROM person WHERE fk_id=person_id;
		SET person_money = peron_money + change_amount;
        SET change_amount = 0;
        UPDATE person SET fn_money = person_money WHERE fk_id = person_id;
    END IF;
  RETURN change_amount;
END;

#
# Definition for the `session_interval` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `session_interval`(
        `session_id` INTEGER(11)
    )
    RETURNS TIME
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
DECLARE time_open, time_close DATETIME;
SELECT fd_time_open, fd_time_close INTO time_open, time_close FROM session WHERE fk_id = session_id;
  RETURN TIMEDIFF(time_close,time_open);
END;

#
# Definition for the `val_cash` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `val_cash`(
        `session_id` INTEGER(11)
    )
    RETURNS FLOAT(6,2)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
DECLARE stavka,cash_oplata float;
DECLARE ses_interval INTEGER;
SELECT fn_stavka INTO stavka FROM session WHERE fk_id = session_id;
set ses_interval = time_to_min(session_interval(session_id));
SET cash_oplata = oplata(ses_interval,stavka);
  RETURN cash_oplata;
END;

#
# Definition for the `personal_discont` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `personal_discont`(
        `session_id` INTEGER(11)
    )
    RETURNS FLOAT(6,2)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
	DECLARE personal_disc,cardholder integer;
    DECLARE person_cash Float;
    SELECT fn_cardholder INTO cardholder FROM session WHERE fk_id = session_id;
    SELECT fn_personal_disc INTO personal_disc FROM person WHERE fk_id = cardholder;
    set person_cash = val_cash(session_id);
    
  RETURN person_cash * personal_disc / 100;
END;

#
# Определение для процедуры `friends_time`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `friends_time`(
        IN `affiliator` INTEGER(11),
        OUT `disc_sum_out` INTEGER(6),
        OUT `disc_list_out` TEXT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
DECLARE beg_time, end_time, now_time DATETIME;
DECLARE disc_time TIME;
DECLARE disc_sum INTEGER(6);
DECLARE done_fetch, done_fetch_temp INT DEFAULT 0;
DECLARE disc_list TEXT;
DECLARE new_line VARCHAR(30);
DECLARE surname VARCHAR(20);
DECLARE friend_id INT(11);
DECLARE cardnum INT(13);

DECLARE cur1 CURSOR FOR SELECT fd_time_open, fd_time_close, fn_cardholder, fn_cardnum
						FROM session
                        WHERE fn_affiliated_by = affiliator ORDER BY 'fk_id';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_fetch = 1;
OPEN cur1;
SET disc_sum = 0;
SET disc_list = '';
SET now_time = DATE_FORMAT(NOW(),'%Y-%m-%d %T');



WHILE done_fetch = 0 DO
	SET new_line = '';
    SET surname = NULL;
	FETCH cur1 INTO beg_time, end_time, friend_id, cardnum;
	IF done_fetch = 0 THEN 
    	IF end_time IS NULL THEN SET end_time = now_time;
    	END IF;
    
/*    SELECT TIMEDIFF(end_time,beg_time) into disc_time;
*/		SET end_time = DATE_FORMAT(end_time,'%Y-%m-%d %T');
		SET beg_time = DATE_FORMAT(beg_time,'%Y-%m-%d %T');
		SET disc_time = TIMEDIFF(end_time,beg_time);
		SET disc_sum = disc_sum + time_to_min(TIMEDIFF(end_time,beg_time)); 

		SET done_fetch_temp = done_fetch;

    	SELECT fc_surname INTO surname FROM person WHERE fk_id = friend_id;

		SET done_fetch = done_fetch_temp;
   		IF surname IS NULL THEN SET surname = CONCAT('Гостевая карта ', cardnum);
    	END IF;
	    SET new_line = CONCAT(surname, ' - ', disc_time);
    	SET disc_list = CONCAT(disc_list, new_line, CHAR(13,10));
/*UNTIL done_fetch END REPEAT;*/
	END IF;
END WHILE;
CLOSE cur1;

SET disc_sum_out = disc_sum;
SET disc_list_out = disc_list;

END;

#
# Определение для процедуры `event_calculate`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `event_calculate`(
        IN `event_interval_time` INTEGER,
        IN `event_id` INTEGER(11),
        IN `session_id` INTEGER(11),
        OUT `text_out` LONGTEXT,
        OUT `money_to_pay` FLOAT(6,2),
        OUT `time_to_pay` INTEGER(6),
        OUT `time_change` INTEGER(6)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
	DECLARE beg_time_session, end_time_session DATETIME;
    DECLARE beg_time_event, end_time_event DATETIME;
    DECLARE cardholder INT(11);
    DECLARE  personal_disc, friends_time_discount, action_disc_id, action_discount_amount, discount_amount_percent, discount_amount_time  INT(11);
	DECLARE titles, text_result TEXT;
    DECLARE popo, inter_time TEXT;
    DECLARE no_action_discount, no_personal_discount, no_friends_discount, no_coupon_discount BOOLEAN;
    DECLARE stavka, normal_stavka FLOAT;
	DECLARE money_fixed, money_maxed, money_unless, special_price FLOAT;
    DECLARE payment FLOAT;
    DECLARE event_type VARCHAR(30);

	
 
   
	SET text_result = '';
    
    SELECT fn_personal_disc
    	INTO personal_disc  
    	FROM person WHERE fk_id = cardholder;
        
    SELECT fd_time_open, fd_time_close, fn_cardholder, fn_stavka, fn_action_disc 
    	INTO beg_time_session, end_time_session, cardholder, stavka, action_disc_id  
    	FROM session WHERE fk_id = session_id;
        
    SELECT fn_discount_amount  
    	INTO action_discount_amount   
    	FROM action_discounts WHERE fk_id = action_disc_id;
       
    SELECT ft_title, fd_time_begin, fd_time_end, fn_fixed, fn_maxed, fn_unless,
    fn_special_price, ff_no_action_discount, ff_no_personal_discount,
    ff_no_friends_discount,ff_no_coupon_discount, ft_type 
    	INTO titles, beg_time_event, end_time_event, money_fixed, money_maxed, money_unless,
        special_price, no_action_discount, no_personal_discount, no_friends_discount,
        no_coupon_discount, event_type   
        FROM ac_events WHERE fk_id = event_id;

	SET normal_stavka = stavka;
    
    IF (event_id IS NOT NULL) AND (NOT no_coupon_discount) THEN
    	SELECT fn_discount_amount_percent, fn_discount_amount_time
	    INTO discount_amount_percent, discount_amount_time
	    FROM event_discounts WHERE 
        	(
            	(fn_event_id = event_id)
               OR
                (ft_event_type = event_type) 
               OR 
                ((fn_event_id IS NULL) AND (ft_event_type IS NULL))
            )
            AND
            (fn_session_id = session_id);
    END IF;
    
    IF event_id IS NULL THEN
    	SELECT fn_discount_amount_percent, fn_discount_amount_time
	    INTO discount_amount_percent, discount_amount_time
	    FROM event_discounts WHERE 
            	(fn_event_id IS NULL)
            AND 
	            (ft_event_type IS NULL)
            AND
	            (fn_session_id = session_id);
    END IF;

	IF titles IS NULL THEN
    	SET titles = 'Время freestyle';
    END IF;
    
    SET text_result = CONCAT(titles, CHAR(13,10)); /* запись о названии сегмента оплаты */

    IF money_fixed IS NULL THEN  /* ОПЛАТА НЕ ФИКСИРОВАННАЯ */

        SET text_result = CONCAT(text_result, 'базовое время сеанса ', event_interval_time ,
    	' минут', CHAR(13,10));
		
		IF NOT no_friends_discount THEN /*СКИДКА ЗА ДРУЗЕЙ - применяется всегда,
         кроме особенных случаев: фиксированные оплаты и прочее..*/
        	CALL friends_time(cardholder,friends_time_minutes, friends_time_details);
			SET friends_time_discount = friends_time_minutes / 10;
        	SET event_interval_time = event_interval_time - friends_time_discount;
        
        	IF event_interval_time < 0 THEN
            	SET time_change = ABS(event_interval_time);  /* Излишки времени сдачей на картсчёт */
            	SET event_interval_time = 0;
        	END IF; 
            
  
	        SET text_result = CONCAT(text_result, 'применяется скидка за друзей ', CHAR(13,10));
            SET text_result = CONCAT(text_result, 'скидка за друзей ',friends_time_discount,' минут', CHAR(13,10));
	    	SET text_result = CONCAT(text_result, 'оплата за время ',event_interval_time,' минут с учетом скидки ',CHAR(13,10));

		END IF; /*КОНЕЦ БЛОКА СКИДКИ ЗА ДРУЗЕЙ*/

		IF discount_amount_time IS NOT NULL THEN   /* КУПОННАЯ СКИДКА МИНУТАМИ */
        	SET event_interval_time = event_interval_time - discount_amount_time;
        	IF event_interval_time < 0 THEN
            	SET event_interval_time = 0; /* Излишки купонного времени сгорают */
        	END IF; 

            SET text_result = CONCAT(text_result, 'применяется купонная скидка', CHAR(13,10));
            SET text_result = CONCAT(text_result, 'купонная скидка ',discount_amount_time,' минут', CHAR(13,10));
	    	SET text_result = CONCAT(text_result, 'оплата за время ',event_interval_time,' минут с учетом скидки ',CHAR(13,10));

        END IF;
		
		IF discount_amount_percent IS NOT NULL THEN   /* КУПОННАЯ СКИДКА ПРОЦЕНТАМИ */
        	SET event_interval_time = event_interval_time * discount_amount_percent;

            SET text_result = CONCAT(text_result, 'применяется купонная скидка', CHAR(13,10));
            SET text_result = CONCAT(text_result, 'купонная скидка ',discount_amount_percent,'%', CHAR(13,10));
	    	SET text_result = CONCAT(text_result, 'оплата за время ',event_interval_time,' минут с учетом скидки ',CHAR(13,10));

        END IF;
				
					/* СКИДКИ ПЕРСОНАЛЬНАЯ И АКЦИОННАЯ */
        IF no_personal_discount THEN
        	SET personal_disc = 0;
        END IF;
        IF no_action_discount THEN
        	SET action_discount_amount = 0;
        END IF;
       
		IF  personal_disc > action_discount_amount THEN  	
								/* ПЕРСОНАЛЬНАЯ СКИДКА */
			IF (no_personal_discount IS NULL) AND (personal_disc > 0) THEN            
            	SET event_interval_time = event_interval_time * (100 - personal_disc)/100;

            	SET text_result = CONCAT(text_result, 'применяется персональная скидка ',
            	personal_disc,'%', CHAR(13,10));
	    		SET text_result = CONCAT(text_result, 'оплата за время ',
                		event_interval_time,' минут с учетом скидки ', CHAR(13,10));

			END IF;
		ELSE
									/* СКИДКА ПО АКЦИИ */
			IF (no_action_discount IS NULL) AND (action_discount_amount > 0) THEN            
            	SET event_interval_time = event_interval_time * (100 - action_discount_amount)/100;

	            SET text_result = CONCAT(text_result, 'применяется скидка ',
    	        action_discount_amount, '%', ' по акции', CHAR(13,10));
	    		SET text_result = CONCAT(text_result, 'оплата за время ',
                		event_interval_time,' минут с учетом скидки ', CHAR(13,10));

			END IF;
        END IF;

		SET time_to_pay = event_interval_time; /* Время к оплате балансом карты */

        IF special_price IS NOT NULL THEN /* СПЕЦСТАВКА ПРИМЕНЕНА */
 			SET stavka = special_price;
            SET text_result = CONCAT(text_result, 'Применена спецставка ', stavka, ' руб/мин', CHAR(13,10));
    	END IF;

        SET payment = event_interval_time * stavka;

        IF special_price IS NOT NULL THEN /* СПЕЦСТАВКА ПРИМЕНЕНА */
			SET time_to_pay = payment / normal_stavka; /* чтобы оплатить временем по нормальной ставке  */
			/*вывод о вертуальных минутах*/
    	    SET text_result = CONCAT(text_result, 'сумма к оплате временем ',time_to_pay,' мин.',  CHAR(13,10)); 
        END IF;

    	
        SET text_result = CONCAT(text_result, 'базовая оплата за время ', event_interval_time ,
    	' по ставке ', stavka, CHAR(13,10));
    	SET text_result = CONCAT(text_result, 'сумма ',payment,' руб.',  CHAR(13,10));

        
        IF (payment < money_unless) AND (money_unless IS NOT NULL) THEN
            SET payment = money_unless;
			SET time_to_pay = payment / normal_stavka; /* чтобы оплатить временем по нормальной ставке  */

	    	SET text_result = CONCAT(text_result, 'оплата по минимальному значению ', money_unless, CHAR(13,10));
    		SET text_result = CONCAT(text_result, 'сумма ',payment,' руб.',  CHAR(13,10));
    		SET text_result = CONCAT(text_result, 'либо ',time_to_pay,' минут по ставке ',stavka, CHAR(13,10));
			/*вывод о вертуальных минутах*/
	        SET text_result = CONCAT(text_result, 'сумма к оплате временем ',time_to_pay,' мин.',  CHAR(13,10)); 

        END IF;

        IF (payment > money_maxed) AND (money_maxed IS NOT NULL) THEN
    		SET payment = money_maxed;
			SET time_to_pay = payment / normal_stavka; /* чтобы оплатить временем по нормальной ставке */

	    	SET text_result = CONCAT(text_result, 'оплата по максимальному значению ', money_maxed, CHAR(13,10));
    		SET text_result = CONCAT(text_result, 'сумма ',payment,' руб.',  CHAR(13,10));
    		SET text_result = CONCAT(text_result, 'либо ',time_to_pay,' минут по ставке ',stavka, CHAR(13,10));
			/*вывод о вертуальных минутах*/
    	    SET text_result = CONCAT(text_result, 'сумма к оплате временем ',time_to_pay,' мин.',  CHAR(13,10)); 
	
        END IF;
          
    ELSE
    	SET payment = money_fixed;
		SET time_to_pay = payment / normal_stavka; /* чтобы оплатить временем по нормальной ставке  */

        SET text_result = CONCAT(text_result, 'время на мероприятии ', event_interval_time ,
    	'. оплата фиксированная',  CHAR(13,10)); 
		SET text_result = CONCAT(text_result, 'сумма ',payment,' руб.',  CHAR(13,10)); 
		/*вывод о вертуальных минутах*/
        SET text_result = CONCAT(text_result, 'сумма к оплате временем ',time_to_pay,' мин.',  CHAR(13,10)); 
	
    END IF;
  	
    SET money_to_pay = payment;
 	SET text_out = text_result;
END;

#
# Определение для процедуры `event_insert`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `event_insert`(
        IN `type_event` VARCHAR(30),
        IN `title` TEXT,
        IN `description` TEXT,
        IN `keywords` TEXT,
        IN `time_begin` DATETIME,
        IN `time_end` DATETIME,
        IN `provision` TEXT,
        IN `comments` TEXT,
        IN `author_id` INTEGER(11),
        IN `max_members` INTEGER(3),
        IN `min_members` INTEGER(3),
        IN `vk_url` VARCHAR(50),
        IN `active` BOOLEAN,
        IN `public` BOOLEAN,
        IN `fixed` FLOAT(8,2),
        IN `maxed` FLOAT(8,2),
        IN `unless` FLOAT(8,2),
        IN `special_price` FLOAT(4,2),
        IN `no_action_discount` BOOLEAN,
        IN `no_personal_discount` BOOLEAN,
        IN `no_friends_discount` BOOLEAN,
        IN `no_coupon_discount` BOOLEAN,
        IN `only_money` BOOLEAN,
        IN `room_a` INTEGER(2),
        IN `room_b` INTEGER(2),
        IN `room_c` INTEGER(2),
        IN `room_d` INTEGER(2),
        IN `repeat_period` INTEGER(3),
        IN `members` INTEGER(4),
        IN `rooms` INTEGER(2),
        IN `moderated` BOOLEAN,
        IN `office` VARCHAR(20)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
INSERT INTO ac_events (ft_type, ft_title, ft_description, ft_keywords, fd_time_begin, fd_time_end, ft_provision,
 ft_comments, fn_author_id, fn_max_members, fn_min_members, fc_vk_url, ff_active, ff_public, fn_fixed,
  fn_maxed, fn_unless, fn_special_price, ff_no_action_discount, ff_no_personal_discount, ff_no_friends_discount,
  ff_no_coupon_discount, ff_only_money, fn_room_a, fn_room_b, fn_room_c, fn_room_d, fn_repeat_period, fn_members, 
   fn_rooms, ff_moderated, fc_office)
VALUES
 (type_event, title, description, keywords, time_begin, time_end, provision,
 comments, author_id, max_members, min_members, vk_url, active, public, fixed,
  maxed, unless, special_price, no_action_discount, no_personal_discount, no_friends_discount,
  no_coupon_discount, only_money, room_a, room_b, room_c, room_d, repeat_period, members, 
   rooms, moderated, office);
END;

#
# Определение для процедуры `event_select_to_table`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `event_select_to_table`(
        IN `event_time_begin` DATETIME,
        IN `event_time_end` DATETIME,
        IN `office` VARCHAR(20),
        IN `event_active` BOOLEAN,
        OUT `type_event` VARCHAR(30),
        OUT `title` TEXT,
        OUT `time_begin` DATETIME,
        OUT `time_end` DATETIME,
        OUT `author_id` INTEGER(11),
        OUT `active` BOOLEAN,
        OUT `public` BOOLEAN,
        OUT `room_a` INTEGER(2),
        OUT `room_b` INTEGER(2),
        OUT `room_c` INTEGER(2),
        OUT `room_d` INTEGER(2),
        OUT `repeat_period` INTEGER(3),
        OUT `members_count` INTEGER(4),
        OUT `rooms` INTEGER(2),
        OUT `moderated` BOOLEAN,
        OUT `id` INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
IF event_active IS NOT TRUE THEN
SELECT  fk_id, ft_type, ft_title, fd_time_begin, fd_time_end,
 fn_author_id, ff_active, ff_public,
 fn_room_a, fn_room_b, fn_room_c, fn_room_d, fn_repeat_period, fn_members, 
 fn_rooms, ff_moderated
 INTO id,
 type_event, title, time_begin, time_end, author_id, active, public, room_a, room_b, room_c, room_d,
 repeat_period, members_count, 
   rooms, moderated
   FROM ac_events WHERE ((event_time_begin <= fd_time_begin) and (event_time_end >= fd_time_begin)) and (office = fc_office);
ELSE
SELECT  fk_id, ft_type, ft_title, fd_time_begin, fd_time_end,
 fn_author_id, ff_active, ff_public,
 fn_room_a, fn_room_b, fn_room_c, fn_room_d, fn_repeat_period, fn_members, 
 fn_rooms, ff_moderated
 INTO id,
 type_event, title, time_begin, time_end, author_id, active, public, room_a, room_b, room_c, room_d,
 repeat_period, members_count, 
   rooms, moderated
   FROM ac_events WHERE ((event_time_begin <= fd_time_begin) and (event_time_end >= fd_time_begin)) and (office = fc_office) and (ff_active = true);
END IF;
END;

#
# Определение для процедуры `event_tbl_select`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `event_tbl_select`(
        OUT `type_event` VARCHAR(30),
        OUT `title` TEXT,
        OUT `description` TEXT,
        OUT `keywords` TEXT,
        OUT `time_begin` DATETIME,
        OUT `time_end` DATETIME,
        OUT `provision` TEXT,
        OUT `comments` TEXT,
        OUT `author_id` INTEGER(11),
        OUT `max_members` INTEGER(3),
        OUT `min_members` INTEGER(3),
        OUT `vk_url` VARCHAR(50),
        OUT `active` BOOLEAN,
        OUT `public` BOOLEAN,
        OUT `fixed` FLOAT(8,2),
        OUT `maxed` FLOAT(8,2),
        OUT `unless` FLOAT(8,2),
        OUT `special_price` FLOAT(4,2),
        OUT `no_action_discount` BOOLEAN,
        OUT `no_personal_discount` BOOLEAN,
        OUT `no_friends_discount` BOOLEAN,
        OUT `no_coupon_discount` BOOLEAN,
        OUT `only_money` BOOLEAN,
        OUT `room_a` INTEGER(2),
        OUT `room_b` INTEGER(2),
        OUT `room_c` INTEGER(2),
        OUT `room_d` INTEGER(2),
        OUT `repeat_period` INTEGER(3),
        OUT `members_count` INTEGER(4),
        OUT `rooms` INTEGER(2),
        OUT `moderated` BOOLEAN,
        OUT `office` VARCHAR(20),
        IN `id` INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SELECT  ft_type, ft_title, ft_description, ft_keywords, fd_time_begin, fd_time_end, ft_provision,
 ft_comments, fn_author_id, fn_max_members, fn_min_members, fc_vk_url, ff_active, ff_public, fn_fixed,
  fn_maxed, fn_unless, fn_special_price, ff_no_action_discount, ff_no_personal_discount, ff_no_friends_discount,
  ff_no_coupon_discount, ff_only_money, fn_room_a, fn_room_b, fn_room_c, fn_room_d, fn_repeat_period, fn_members, 
   fn_rooms, ff_moderated, fc_office
INTO
 type_event, title, description, keywords, time_begin, time_end, provision,
 comments, author_id, max_members, min_members, vk_url, active, public, fixed,
  maxed, unless, special_price, no_action_discount, no_personal_discount, no_friends_discount,
  no_coupon_discount, only_money, room_a, room_b, room_c, room_d, repeat_period, members_count, 
   rooms, moderated, office
   FROM ac_events WHERE fk_id = id;
END;

#
# Определение для процедуры `oplacheno`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `oplacheno`(
        IN `session_id` INTEGER(11),
        IN `amount` FLOAT(9,2),
        IN `persona` INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
UPDATE session SET ff_paid = true   
	WHERE (fk_id = session_id);
INSERT INTO cash (fn_amount, fn_person)
VALUES
 (amount, persona);
END;

#
# Определение для процедуры `pay_of_time_balance`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `pay_of_time_balance`(
        IN `time_balance` INTEGER(6),
        IN `cardnum` INTEGER(13),
        IN `time_to_pay` INTEGER(8),
        INOUT `money_to_pay` FLOAT(8,2)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE time_pay, balance INTEGER;
SET time_pay = time_to_pay;
SET balance = time_balance;

SET balance = balance - time_pay;
SET money_to_pay = 0;
if balance < 0 THEN
	SET money_to_pay = ABS(balance) * 1.5;
    SET balance = 0; 
END IF;

UPDATE person SET fn_time = balance  
	WHERE fn_card_num = cardnum;

END;

#
# Определение для процедуры `search_id_session`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `search_id_session`(
        IN `cardnum` INTEGER(13),
        OUT `session_id` INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SELECT fk_id 
   	INTO session_id    
   	FROM session WHERE (fn_cardnum = cardnum) and (fd_time_close IS NULL);
END;

#
# Определение для процедуры `peredacha_rekvizita`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `peredacha_rekvizita`(
        IN `cardholder_out` INTEGER(11),
        IN `cardholder_in` INTEGER(11),
        IN `title` VARCHAR(20),
        IN `count_in` INTEGER(3)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE session_id_in, session_id_out, id INTEGER;
DECLARE count, count_max INTEGER(3);
DECLARE comment TEXT;
SET count = count_in;

CALL search_id_session(cardholder_in,session_id_in);
CALL search_id_session(cardholder_out,session_id_out);

SET id = NULL;

SELECT fk_id , fn_count
    	INTO id, count_max   
    	FROM rekvizit WHERE (fn_session_id = session_id_in) and (fc_title = title) and (fn_count > 0);

IF count > count_max THEN SET count = count_max;
END IF;	
 
IF id IS NOT NULL THEN
	UPDATE rekvizit SET fn_count = fn_count - count
    		WHERE fk_id = id;
END IF;

set id = NULL;

SELECT fk_id , ft_comment
    	INTO id, comment  
    	FROM rekvizit WHERE (fn_session_id = session_id_out) and (fc_title = title) and (fn_count > 0);

IF comment IS NULL THEN
	SET comment = '';
END IF;
IF id IS NOT NULL THEN
	UPDATE rekvizit SET fn_count = fn_count + count , ft_comment = CONCAT(comment, CHAR(13,10), 'принял от держателя карты № ', cardholder_in,'  ', count,' шт.')  
    		WHERE fk_id = id;
ELSE 
    INSERT INTO rekvizit (fn_session_id, fc_title, fn_count, ft_comment)
			VALUES (session_id_out, title, count, CONCAT('принял от держателя карты № ', cardholder_in,'  ' ,count,' шт.'));
END IF;

        
END;

#
# Определение для процедуры `person_info`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `person_info`(
        IN `card_num` INTEGER(13),
        OUT `name_person` VARCHAR(20),
        OUT `surname` VARCHAR(20),
        OUT `fathername` VARCHAR(20),
        OUT `birthday` DATE,
        OUT `phone_num` VARCHAR(12),
        OUT `mail` VARCHAR(60),
        OUT `vk` VARCHAR(50),
        OUT `personal_disc` INTEGER(3),
        OUT `disc_basement` TEXT,
        OUT `blocked` BOOLEAN,
        OUT `block_reason` TEXT,
        OUT `description` TEXT,
        OUT `balance_time` INTEGER(6),
        OUT `id` INTEGER(11),
        OUT `session_id_out` INTEGER(11),
        OUT `time_bal` INTEGER(6)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
DECLARE session_id INTEGER;
SELECT fk_id, fc_name, fc_surname, fc_fathername,fd_birthday, fc_phone_num, fc_mail, fc_vk,
fn_personal_disc,fc_disc_basement, ff_blocked, ft_block_reason, ft_description, fn_time 
   	INTO id, name_person, surname, fathername,birthday, phone_num, mail, vk,
personal_disc,disc_basement, blocked, block_reason, description, balance_time    
   	FROM person WHERE fn_card_num = card_num;
CALL search_id_session(card_num,session_id);
SET session_id_out =session_id;     
END;

#
# Определение для процедуры `person_insert`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `person_insert`(
        IN `name_person` VARCHAR(20),
        IN `surname` VARCHAR(20),
        IN `fathername` VARCHAR(20),
        IN `birthday` DATE,
        IN `phone_num` VARCHAR(12),
        IN `mail` VARCHAR(60),
        IN `vk` VARCHAR(50),
        IN `personal_disc` INTEGER(3),
        IN `disc_basement` TEXT,
        IN `blocked` BOOLEAN,
        IN `block_reason` TEXT,
        IN `description` TEXT,
        IN `balance_time` INTEGER(6),
        IN `card_num` INTEGER(13)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
SET birthday =DATE_FORMAT(birthday,'%Y-%m-%d %T');
INSERT INTO person (fc_name, fc_surname, fc_fathername,fd_birthday, fc_phone_num, fc_mail, fc_vk,
fn_personal_disc,fc_disc_basement, ff_blocked, ft_block_reason, ft_description, fn_time, fn_card_num)
VALUES
 (name_person, surname, fathername,birthday, phone_num, mail, vk,
personal_disc,disc_basement, blocked, block_reason, description, balance_time, card_num);
END;

#
# Определение для процедуры `priniat_rekvizit`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `priniat_rekvizit`(
        IN `title` TEXT,
        IN `count` INTEGER(3),
        IN `cardnum` INTEGER(13)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE session_id, id, count_max INTEGER;
SET id = NULL;

CALL search_id_session(cardnum, session_id);

SELECT fk_id , fn_count
    	INTO id, count_max   
    	FROM rekvizit WHERE (fn_session_id = session_id) and (fc_title = title) and (fn_count > 0);


IF count > count_max THEN SET count = count_max;
END IF;	
 
IF id IS NOT NULL THEN
	UPDATE rekvizit SET fn_count = fn_count - count
    		WHERE fk_id = id;
END IF;

END;

#
# Определение для процедуры `select_rekvizit`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `select_rekvizit`(
        IN `cardnum` INTEGER(13),
        OUT `title` VARCHAR(20),
        OUT `count` INTEGER(3),
        OUT `comment` TEXT,
        OUT `out_text` TEXT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE session_id integer(11);
DECLARE done_fetch BOOLEAN;
DECLARE text_result TEXT;

DECLARE cur1 CURSOR FOR SELECT fc_title, fn_count, ft_comment 
   						FROM rekvizit 
                        WHERE fn_session_id = session_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_fetch = 1;
CALL search_id_session(cardnum,session_id);
OPEN cur1;

SET done_fetch = 0;
SET text_result = CONCAT('================================', CHAR(13,10));

WHILE done_fetch = 0 DO
	FETCH cur1 INTO title, count, comment;
	IF (done_fetch = 0) and (count > 0) THEN 
		SET text_result = CONCAT(text_result, title,' - ' ,count,'шт.', CHAR(13,10));
        IF comment IS NOT NULL THEN
			SET text_result = CONCAT(text_result, 'Коментарии: ', comment,  CHAR(13,10));
    	END IF;
    SET text_result = CONCAT(text_result, '================================', CHAR(13,10));
    END IF;        
        	    
END WHILE;
SET out_text = text_result;





END;

#
# Определение для процедуры `session_events`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `session_events`(
        IN `session_id` INTEGER(11),
        OUT `out_text` TEXT,
        OUT `out_money_to_pay` FLOAT(8,2),
        OUT `out_time_to_pay` INTEGER(8),
        OUT `out_time_change` INTEGER(8),
        OUT `out_end_session` DATETIME,
        OUT `out_begin_session` DATETIME,
        OUT `interval_time_out` TIME
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN

DECLARE beg_time_session,end_time_session, event_time_begin, event_time_end DATETIME;
DECLARE freestyle_time INTEGER;
DECLARE	cardholder, action_disc_id, ac_events_id, time_unix_beg, event_id_members INT;
DECLARE stavka FLOAT;
DECLARE done_fetch, only_money BOOLEAN;
DECLARE text_result,event_text_result, event_title TEXT;
DECLARE time_to_pay, time_change INT;
DECLARE money_to_pay FLOAT;
DECLARE event_time_to_pay, event_time_change, event_time_interval, event_count, summ_time INT;
DECLARE event_money_to_pay FLOAT;
DECLARE name_client, surname_client, fathername_client VARCHAR(20);

DECLARE cur1 CURSOR FOR SELECT fk_id, ft_title, fd_time_begin,fd_time_end, ff_only_money  
						FROM ac_events 
                        WHERE 
					            NOT((fd_time_begin >= end_time_session)
                        	OR  (fd_time_end <= beg_time_session))
			                AND (ff_active IS NOT NULL);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_fetch = 1;

SELECT fd_time_open, fd_time_close, fn_cardholder, fn_stavka, fn_action_disc 
   	INTO beg_time_session, end_time_session, cardholder, stavka, action_disc_id  
   	FROM session WHERE fk_id = session_id;

IF end_time_session IS NULL THEN  /* если сессия не закрыта - считаем по текущий момент */
	SET end_time_session =DATE_FORMAT(NOW(),'%Y-%m-%d %T');
END IF;

SELECT fc_name, fc_surname,fc_fathername 
   	INTO name_client, surname_client, fathername_client  
   	FROM person WHERE fk_id = cardholder;


OPEN cur1;

SET done_fetch = 0;
SET text_result = CONCAT('================================', CHAR(13,10));
SET text_result = CONCAT(text_result, 'Детализация сеанса посещения', CHAR(13,10));
SET text_result = CONCAT(text_result, 'Клиент: ',surname_client,' ', name_client,' ', fathername_client, CHAR(13,10));
SET text_result = CONCAT(text_result, 'Начало сеанса: ', beg_time_session, CHAR(13,10));
SET text_result = CONCAT(text_result, 'Окончание сеанса: '  , end_time_session, CHAR(13,10));
SET text_result = CONCAT(text_result, '--------------------------', CHAR(13,10));
SET money_to_pay = 0;
SET time_change = 0;
SET time_to_pay = 0;
SET event_count = 0;
SET summ_time = 0;

WHILE done_fetch = 0 DO
	FETCH cur1 INTO ac_events_id, event_title, event_time_begin, event_time_end, only_money;
	IF done_fetch = 0 THEN 
	    SET event_time_interval = func_time_interval(beg_time_session, end_time_session,event_time_begin,event_time_end );
    	SELECT fn_event_id into event_id_members FROM leaders WHERE (fn_leader_id=cardholder) AND (fn_event_id = ac_events_id);
        IF event_id_members IS NOT NULL THEN

			SET text_result = CONCAT(text_result, event_title, CHAR(13,10));
			SET text_result = CONCAT(text_result, 'Зарегистрирован на событии как организатор.', CHAR(13,10));
			SET text_result = CONCAT(text_result, 'Оплата не взымается.', CHAR(13,10));

			SET event_count = event_count + 1;
			SET summ_time = summ_time + event_time_interval;             

			SET text_result = CONCAT(text_result, '----------------------', CHAR(13,10));
        END IF;       
        
		
    	SELECT fn_event_id into event_id_members FROM members WHERE (fn_member_id=1) AND (ff_active IS NOT NULL) AND (fn_event_id = ac_events_id);
       	 
        IF event_id_members IS NOT NULL THEN
            CALL event_calculate(event_time_interval,event_id_members,session_id,event_text_result,event_money_to_pay,event_time_to_pay,event_time_change);
        	
            IF only_money IS NOT NULL THEN
            SET text_result = CONCAT(text_result,'событие оплачивается только наличными!!!',CHAR(13,10));
            END IF;
   
            SET text_result = CONCAT(text_result, event_text_result); 
        	SET money_to_pay = money_to_pay + event_money_to_pay;
			IF event_time_change IS NOT NULL THEN
				SET time_change = time_change + event_time_change;	
            END IF;
   	
            
			IF only_money IS NULL THEN              
            SET time_to_pay = time_to_pay + event_time_to_pay;
			END IF;

			SET event_count = event_count + 1;
			SET summ_time = summ_time + event_time_interval;             

			SET text_result = CONCAT(text_result, '----------------------', CHAR(13,10));
        END IF; 
        SET done_fetch = 0;
        
    END IF;

END WHILE;

       SET freestyle_time = time_to_min(TIMEDIFF(end_time_session, beg_time_session));
       SET freestyle_time = freestyle_time - summ_time - event_count*10;
       
		IF freestyle_time < 0 THEN
       		SET freestyle_time = 0;
		END IF;   

       CALL event_calculate(freestyle_time,NULL,session_id,event_text_result,event_money_to_pay,event_time_to_pay,event_time_change);

       
       SET text_result = CONCAT(text_result, event_text_result); 
       SET money_to_pay = money_to_pay + event_money_to_pay;
       IF event_time_change IS NOT NULL THEN
			SET time_change = time_change + event_time_change;	
       END IF;
       SET time_to_pay = time_to_pay + event_time_to_pay;

	IF time_change > 0 THEN
		SET text_result = CONCAT(text_result, 'За друзей начисленно бонусных минут: ', time_change, CHAR(13,10));
	    SET text_result = CONCAT(text_result, 'Бонусные минуты будут зачислены на карточный счет', CHAR(13,10));
		SET text_result = CONCAT(text_result, '----------------------', CHAR(13,10));
	END IF;

SET text_result = CONCAT(text_result, 'Из общего времени пребывания было вычтено', CHAR(13,10));
SET text_result = CONCAT(text_result, 'установочное время событий в размере ', event_count*10 ,' мин.', CHAR(13,10));
SET text_result = CONCAT(text_result, '----------------------', CHAR(13,10));
SET text_result = CONCAT(text_result, 'Итого к оплате: ',CHAR(13,10));
SET text_result = CONCAT(text_result, money_to_pay, ' руб. либо ', time_to_pay,' минут с карточного счета' ,CHAR(13,10));
SET text_result = CONCAT(text_result, '================================', CHAR(13,10));

SET out_text = text_result;
SET out_money_to_pay = money_to_pay;
SET out_time_to_pay = time_to_pay;
SET out_end_session = end_time_session;
SET out_begin_session = beg_time_session;
SET interval_time_out = TIMEDIFF(end_time_session, beg_time_session);
END;

#
# Определение для процедуры `start_session`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `start_session`(
        IN `cardholder` INTEGER(11),
        IN `cardnum` INTEGER(13),
        IN `stavka` FLOAT(4,2),
        IN `affiliated` INTEGER(2),
        IN `affiliated_by` INTEGER(11),
        IN `action_disc` INTEGER(3),
        IN `paid` TINYINT(1)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE id INTEGER(11);
SELECT fk_id
INTO id 
FROM session WHERE (fn_cardnum = cardnum) and (fd_time_close IS NULL);
if id IS NULL THEN
	INSERT INTO session (fn_cardholder, fn_cardnum, fn_stavka,
    fn_affiliated, fn_affiliated_by, ff_paid, fn_action_disc)
	VALUES
 	(cardholder, cardnum, stavka, affiliated,
    affiliated_by, paid, action_disc);
END IF;  
END;

#
# Определение для процедуры `stop_session`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `stop_session`(
        IN `cardnum` INTEGER(13)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE session_id INTEGER;
CALL search_id_session(cardnum,session_id);
UPDATE session SET fd_time_close = DATE_FORMAT(NOW(),'%Y-%m-%d %T')   
	WHERE fk_id = session_id;

END;

#
# Определение для процедуры `temp_proc_select_tbl`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `temp_proc_select_tbl`(
        IN `event_time_begin` DATETIME,
        IN `event_time_end` DATETIME,
        IN `office` INTEGER(3)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY INVOKER
    COMMENT ''
BEGIN
DECLARE done_fetch, Active, public, moderated  BOOLEAN;
DECLARE id,author_id,  room_a, room_b, room_c, room_d, repeat_period, members_count, rooms  INTEGER;
DECLARE type_event VARCHAR(30);
DECLARE title TEXT;
DECLARE time_begin, time_end DATETIME;

DECLARE cur1 CURSOR FOR SELECT fk_id, ft_type, ft_title, fd_time_begin, fd_time_end,
 fn_author_id, ff_active, ff_public,
 fn_room_a, fn_room_b, fn_room_c, fn_room_d, fn_repeat_period, fn_members, 
 fn_rooms, ff_moderated  
						FROM ac_events 
                        WHERE 
					         ((event_time_begin <= fd_time_begin) and (event_time_end >= fd_time_begin)) and (office = fc_office);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_fetch = 1;
TRUNCATE TABLE temp_events;
OPEN cur1;
SET done_fetch = 0;
WHILE done_fetch = 0 DO
	FETCH cur1 INTO id,
 type_event, title, time_begin, time_end, author_id, active, public, room_a, room_b, room_c, room_d,
 repeat_period, members_count, 
   rooms, moderated;
	IF done_fetch = 0 THEN 
	
    INSERT INTO temp_events (fk_id, ft_type, ft_title, fd_time_begin, fd_time_end, fn_author_id, ff_active,
    ff_public, fn_room_a, fn_room_b, fn_room_c, fn_room_d, fn_repeat_period, fn_members, 
   	fn_rooms, ff_moderated)
	VALUES
 	(id, type_event, title, time_begin, time_end, author_id, active,
    public, room_a, room_b, room_c, room_d, repeat_period, members_count, 
   	rooms, moderated);     
   
           
        
		
       
       SET done_fetch = 0;
        
    END IF;
END WHILE;
END;

#
# Определение для процедуры `vidacha_rekvizita`: 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `vidacha_rekvizita`(
        IN `cardnum` INTEGER(13),
        IN `count` INTEGER(3),
        IN `title` VARCHAR(20),
        IN `comment` TEXT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE session_id, id INTEGER;

CALL search_id_session(cardnum,session_id);

SELECT fk_id , ft_comment
    	INTO id, comment  
    	FROM rekvizit WHERE (fn_session_id = session_id) and (fn_count > 0) and (fc_title = title);

IF id IS NOT NULL THEN
	UPDATE rekvizit SET fn_count = fn_count + count
    	WHERE fk_id = id;
ELSE 
    INSERT INTO rekvizit (fn_session_id, fc_title, fn_count, ft_comment)
			VALUES (session_id, title, count, NULL);
END IF;
END;

#
# Data for the `action_discounts` table  (LIMIT -498,500)
#

INSERT INTO `action_discounts` (`fk_id`, `fn_discount_num`, `ft_description`, `ff_one_time`, `fn_used_in_session`, `fd_create_date`, `ff_active`, `fn_discount_amount`) VALUES

  (1,100,NULL,NULL,7,NULL,NULL,10);
COMMIT;

#
# Data for the `cash` table  (LIMIT -496,500)
#

INSERT INTO `cash` (`fk_id`, `fn_amount`, `fn_person`, `ft_basement`, `ft_comment`) VALUES

  (1,10000.00,61,NULL,NULL),
  (2,120.00,3,NULL,NULL),
  (3,0.00,70,NULL,NULL);
COMMIT;

#
# Data for the `person` table  (LIMIT -492,500)
#

INSERT INTO `person` (`fk_id`, `fn_card_num`, `fc_surname`, `fc_name`, `fc_fathername`, `fd_birthday`, `fc_phone_num`, `fc_mail`, `fc_vk`, `fn_personal_disc`, `fc_disc_basement`, `fn_money`, `fn_time`, `fb_photo_jpg`, `fd_register_date`, `ft_description`, `ff_blocked`, `ft_block_reason`, `fn_affiliated_by`) VALUES

  (1,200101,'Палий','Владимир','Геннадьеви',NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,1,'\r\n',NULL),
  (2,200102,'Петров','Сергей','Дмитриевич',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3,200103,'Кучугура','Александр','Валерьевич',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4,200104,'Верещагин','Дмитрий','Юрьевич',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (69,111,'','','','1899-12-30',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),
  (70,200105,'Палий','Владимир','Геннадьеви','1899-12-30','9525608747','zik_Archangel@mail.ru','la2saraf',100,NULL,NULL,100500,NULL,NULL,NULL,0,NULL,NULL),
  (72,123131,'','','','2014-04-25',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
COMMIT;

#
# Data for the `rekvizit` table  (LIMIT -492,500)
#

INSERT INTO `rekvizit` (`fk_id`, `fn_session_id`, `fc_title`, `fn_count`, `ft_comment`) VALUES

  (1,3,'Джойстик XBo',2,'\r\nпринял от держателя карты № 200105  2 шт.'),
  (2,3,'XBox DVD',0,'Взяли'),
  (5,9,'XBox DVD',0,'принял от держателя карты № 2001012 шт.\r\nпринял от держателя карты № 200101  3 шт.'),
  (6,9,'Джойстик XBo',0,NULL),
  (7,3,'XBox DVD',0,'принял от держателя карты № 200105  2 шт.'),
  (8,3,'XBox DVD',3,NULL),
  (9,11,'???????? XBox',11,NULL);
COMMIT;

#
# Data for the `session` table  (LIMIT -493,500)
#

INSERT INTO `session` (`fk_id`, `fn_cardholder`, `fn_cardnum`, `fd_time_open`, `fd_time_close`, `fn_stavka`, `fn_affiliated`, `fn_affiliated_by`, `ff_paid`, `fn_action_disc`) VALUES

  (3,1,200101,'2013-01-10 11:12:36',NULL,NULL,NULL,NULL,NULL,NULL),
  (4,2,12,'2013-01-10 11:14:17','2013-01-10 14:14:17',1.50,NULL,1,NULL,NULL),
  (8,5,14214,'2013-01-10 11:14:18','2013-01-12 09:45:12',NULL,NULL,NULL,NULL,NULL),
  (9,61,200105,'2013-01-31 10:00:00','2013-01-31 14:00:00',1.50,NULL,NULL,NULL,NULL),
  (11,3,200103,'2014-02-17 15:00:00',NULL,1.50,NULL,3,1,NULL),
  (12,4,200104,'2013-03-20 15:58:55',NULL,1.50,NULL,3,NULL,NULL);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;