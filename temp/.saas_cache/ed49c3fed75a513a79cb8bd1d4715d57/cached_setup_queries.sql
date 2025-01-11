CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}activity_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `staffid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}activity_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}announcements` (
  `announcementid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `showtousers` int NOT NULL,
  `showtostaff` int NOT NULL,
  `showname` int NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}announcements` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}clients` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int NOT NULL DEFAULT '0',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `leadid` int DEFAULT NULL,
  `billing_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` int DEFAULT '0',
  `shipping_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` int DEFAULT '0',
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_language` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` int NOT NULL DEFAULT '0',
  `show_primary_contact` int NOT NULL DEFAULT '0',
  `stripe_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_confirmed` int NOT NULL DEFAULT '1',
  `addedfrom` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `country` (`country`),
  KEY `leadid` (`leadid`),
  KEY `company` (`company`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}clients` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}consents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL DEFAULT '0',
  `lead_id` int NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `opt_in_purpose_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `purpose_id` int NOT NULL,
  `staff_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purpose_id` (`purpose_id`),
  KEY `contact_id` (`contact_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}consents` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}consent_purposes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}consent_purposes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `is_primary` int NOT NULL DEFAULT '1',
  `firstname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_pass_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT '1',
  `estimate_emails` tinyint(1) NOT NULL DEFAULT '1',
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT '1',
  `contract_emails` tinyint(1) NOT NULL DEFAULT '1',
  `task_emails` tinyint(1) NOT NULL DEFAULT '1',
  `project_emails` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_emails` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `email` (`email`),
  KEY `is_primary` (`is_primary`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contacts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contact_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_id` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contact_permissions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client` int NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `contract_type` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `dateadded` datetime NOT NULL,
  `isexpirynotified` int NOT NULL DEFAULT '0',
  `contract_value` decimal(15,2) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  `not_visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signed` tinyint(1) NOT NULL DEFAULT '0',
  `signature` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marked_as_signed` tinyint(1) NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  `contacts_sent_to` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_sign_reminder_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `contract_type` (`contract_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contracts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contracts_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contracts_types` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contract_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contract_id` int NOT NULL,
  `staffid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contract_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contract_renewals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contractid` int NOT NULL,
  `old_start_date` date NOT NULL,
  `new_start_date` date NOT NULL,
  `old_end_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `old_value` decimal(15,2) DEFAULT NULL,
  `new_value` decimal(15,2) DEFAULT NULL,
  `date_renewed` datetime NOT NULL,
  `renewed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renewed_by_staff_id` int NOT NULL DEFAULT '0',
  `is_on_old_expiry_notified` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contract_renewals` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `iso2` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `long_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iso3` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `un_member` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calling_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cctld` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}countries` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}creditnotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientid` int NOT NULL,
  `deleted_customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int NOT NULL,
  `prefix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_format` int NOT NULL DEFAULT '1',
  `formatted_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `adminnote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `clientnote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `currency` int NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `project_id` int NOT NULL DEFAULT '0',
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_credit_note` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `reference_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `formatted_number` (`formatted_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}creditnotes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}creditnote_refunds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_note_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `refunded_on` date NOT NULL,
  `payment_mode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}creditnote_refunds` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}credits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `credit_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `date` date NOT NULL,
  `date_applied` datetime NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}credits` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousand_separator` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placement` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}currencies` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customers_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customers_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customer_admins` (
  `staff_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `date_assigned` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customer_admins` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customer_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupid` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customer_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldto` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `display_inline` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` int DEFAULT '0',
  `active` int NOT NULL DEFAULT '1',
  `show_on_pdf` int NOT NULL DEFAULT '0',
  `show_on_ticket_form` tinyint(1) NOT NULL DEFAULT '0',
  `only_admin` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_client_portal` int NOT NULL DEFAULT '0',
  `disalow_client_to_edit` int NOT NULL DEFAULT '0',
  `bs_column` int NOT NULL DEFAULT '12',
  `default_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customfields` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customfieldsvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relid` int NOT NULL,
  `fieldid` int NOT NULL,
  `fieldto` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`),
  KEY `fieldto` (`fieldto`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customfieldsvalues` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}departments` (
  `departmentid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imap_username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_header` tinyint(1) NOT NULL DEFAULT '0',
  `host` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `encryption` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INBOX',
  `delete_after_import` int NOT NULL DEFAULT '0',
  `calendar_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hidefromclient` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`departmentid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}departments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}dismissed_announcements` (
  `dismissedannouncementid` int NOT NULL AUTO_INCREMENT,
  `announcementid` int NOT NULL,
  `staff` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`dismissedannouncementid`),
  KEY `announcementid` (`announcementid`),
  KEY `staff` (`staff`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}dismissed_announcements` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}emailtemplates` (
  `emailtemplateid` int NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromemail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plaintext` int NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '0',
  `order` int NOT NULL,
  PRIMARY KEY (`emailtemplateid`)
) ENGINE=InnoDB AUTO_INCREMENT=2223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}emailtemplates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int NOT NULL,
  `deleted_customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `number` int NOT NULL,
  `prefix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_format` int NOT NULL DEFAULT '0',
  `formatted_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `clientnote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `adminnote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceid` int DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_agent` int NOT NULL DEFAULT '0',
  `billing_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `pipeline_order` int DEFAULT '1',
  `is_expiry_notified` int NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `status` (`status`),
  KEY `formatted_number` (`formatted_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimate_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `date_estimated` datetime DEFAULT NULL,
  `from_form_id` int DEFAULT NULL,
  `assigned` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `default_language` int NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimate_requests` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimate_request_forms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `recaptcha` int DEFAULT NULL,
  `status` int NOT NULL,
  `submit_btn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submit_btn_bg_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#84c529',
  `submit_btn_text_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#ffffff',
  `success_submit_msg` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `submit_action` int DEFAULT '0',
  `submit_redirect_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `notify_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responsible` int DEFAULT NULL,
  `notify_request_submitted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimate_request_forms` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimate_request_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusorder` int DEFAULT NULL,
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimate_request_status` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}events` (
  `eventid` int NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` int NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `public` int NOT NULL DEFAULT '0',
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isstartnotified` tinyint(1) NOT NULL DEFAULT '0',
  `reminder_before` int NOT NULL DEFAULT '0',
  `reminder_before_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}events` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `currency` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` int DEFAULT NULL,
  `tax2` int NOT NULL DEFAULT '0',
  `reference_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expense_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientid` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `billable` int DEFAULT '0',
  `invoiceid` int DEFAULT NULL,
  `paymentmode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `recurring_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat_every` int DEFAULT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `cycles` int NOT NULL DEFAULT '0',
  `total_cycles` int NOT NULL DEFAULT '0',
  `custom_recurring` int NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `create_invoice_billable` tinyint(1) DEFAULT NULL,
  `send_invoice_to_customer` tinyint(1) NOT NULL,
  `recurring_from` int DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `addedfrom` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `category` (`category`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}expenses` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}expenses_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}expenses_categories` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_to_customer` int NOT NULL DEFAULT '0',
  `attachment_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail_link` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'For external usage',
  `staffid` int NOT NULL,
  `contact_id` int DEFAULT '0',
  `task_comment_id` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}files` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}filters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `builder` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int unsigned NOT NULL,
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shared` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}filters` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}filter_defaults` (
  `filter_id` int unsigned NOT NULL,
  `staff_id` int NOT NULL,
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `filter_id` (`filter_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `{TENANT_SLUG_PLACEHOLDER}filter_defaults_ibfk_1` FOREIGN KEY (`filter_id`) REFERENCES `tblfilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `{TENANT_SLUG_PLACEHOLDER}filter_defaults_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `tblstaff` (`staffid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}filter_defaults` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_questions` (
  `questionid` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `question_order` int NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_questions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_question_box` (
  `boxid` int NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `questionid` int NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_question_box` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_question_box_description` (
  `questionboxdescriptionid` int NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `boxid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `questionid` int NOT NULL,
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_question_box_description` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_results` (
  `resultid` int NOT NULL AUTO_INCREMENT,
  `boxid` int NOT NULL,
  `boxdescriptionid` int DEFAULT NULL,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionid` int NOT NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resultsetid` int NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_results` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}gdpr_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientid` int NOT NULL DEFAULT '0',
  `contact_id` int NOT NULL DEFAULT '0',
  `lead_id` int NOT NULL DEFAULT '0',
  `request_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `request_from` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}gdpr_requests` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}invoicepaymentrecords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoiceid` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentmethod` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transactionid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `paymentmethod` (`paymentmethod`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}invoicepaymentrecords` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int NOT NULL,
  `deleted_customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int NOT NULL,
  `prefix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_format` int NOT NULL DEFAULT '0',
  `formatted_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `currency` int NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int DEFAULT '1',
  `clientnote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `adminnote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_overdue_reminder` date DEFAULT NULL,
  `last_due_reminder` date DEFAULT NULL,
  `cancel_overdue_reminders` int NOT NULL DEFAULT '0',
  `allowed_payment_modes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `cycles` int NOT NULL DEFAULT '0',
  `total_cycles` int NOT NULL DEFAULT '0',
  `is_recurring_from` int DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `terms` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sale_agent` int NOT NULL DEFAULT '0',
  `billing_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_invoice` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `project_id` int DEFAULT '0',
  `subscription_id` int NOT NULL DEFAULT '0',
  `perfex_saas_packageid` int DEFAULT NULL,
  `short_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `total` (`total`),
  KEY `status` (`status`),
  KEY `formatted_number` (`formatted_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}invoices` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}itemable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` decimal(15,2) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `unit` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `qty` (`qty`),
  KEY `rate` (`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}itemable` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rate` decimal(15,2) NOT NULL,
  `tax` int DEFAULT NULL,
  `tax2` int DEFAULT NULL,
  `unit` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tax` (`tax`),
  KEY `tax2` (`tax2`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}items` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}items_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}items_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}item_tax` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemid` int NOT NULL,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  `taxname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}item_tax` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}knowedge_base_article_feedback` (
  `articleanswerid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `answer` int NOT NULL,
  `ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}knowedge_base_article_feedback` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}knowledge_base` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `articlegroup` int NOT NULL,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int NOT NULL DEFAULT '0',
  `staff_article` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}knowledge_base` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}knowledge_base_groups` (
  `groupid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_slug` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL,
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#28B8DA',
  `group_order` int DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}knowledge_base_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` int NOT NULL DEFAULT '0',
  `zip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `from_form_id` int NOT NULL DEFAULT '0',
  `status` int NOT NULL,
  `source` int NOT NULL,
  `lastcontact` datetime DEFAULT NULL,
  `dateassigned` date DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leadorder` int DEFAULT '1',
  `phonenumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `lost` tinyint(1) NOT NULL DEFAULT '0',
  `junk` int NOT NULL DEFAULT '0',
  `last_lead_status` int NOT NULL DEFAULT '0',
  `is_imported_from_email_integration` tinyint(1) NOT NULL DEFAULT '0',
  `email_integration_uid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `default_language` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `lead_value` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `company` (`company`),
  KEY `email` (`email`),
  KEY `assigned` (`assigned`),
  KEY `status` (`status`),
  KEY `source` (`source`),
  KEY `lastcontact` (`lastcontact`),
  KEY `dateadded` (`dateadded`),
  KEY `leadorder` (`leadorder`),
  KEY `from_form_id` (`from_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads_email_integration` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'the ID always must be 1',
  `active` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imap_server` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_every` int NOT NULL DEFAULT '5',
  `responsible` int NOT NULL,
  `lead_source` int NOT NULL,
  `lead_status` int NOT NULL,
  `encryption` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_run` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_lead_imported` tinyint(1) NOT NULL DEFAULT '1',
  `notify_lead_contact_more_times` tinyint(1) NOT NULL DEFAULT '1',
  `notify_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mark_public` int NOT NULL DEFAULT '0',
  `only_loop_on_unseen_emails` tinyint(1) NOT NULL DEFAULT '1',
  `delete_after_import` int NOT NULL DEFAULT '0',
  `create_task_if_customer` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads_email_integration` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads_sources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads_sources` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusorder` int DEFAULT NULL,
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#28B8DA',
  `isdefault` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads_status` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}lead_activity_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leadid` int NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` datetime NOT NULL,
  `staffid` int NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_activity` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}lead_activity_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}lead_integration_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dateadded` datetime NOT NULL,
  `leadid` int NOT NULL,
  `emailid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}lead_integration_emails` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}mail_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `engine` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bcc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','sending','sent','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}mail_queue` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}migrations` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}milestones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_visible_to_customer` tinyint(1) DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `project_id` int NOT NULL,
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milestone_order` int NOT NULL DEFAULT '0',
  `datecreated` date NOT NULL,
  `hide_from_customer` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}milestones` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `installed_version` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}modules` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_comment_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postid` int NOT NULL,
  `commentid` int NOT NULL,
  `userid` int NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_comment_likes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_posts` (
  `postid` int NOT NULL AUTO_INCREMENT,
  `creator` int NOT NULL,
  `datecreated` datetime NOT NULL,
  `visibility` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinned` int NOT NULL,
  `datepinned` datetime DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_posts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` int NOT NULL,
  `postid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postid` int NOT NULL,
  `userid` int NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_likes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_contacted` datetime DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}notes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isread` int NOT NULL DEFAULT '0',
  `isread_inline` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromuserid` int NOT NULL,
  `fromclientid` int NOT NULL DEFAULT '0',
  `from_fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `touserid` int NOT NULL,
  `fromcompany` int DEFAULT NULL,
  `link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}notifications` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=542 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}options` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}payment_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` int NOT NULL,
  `amount` double NOT NULL,
  `fee` double NOT NULL,
  `payment_gateway` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}payment_attempts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}payment_modes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `show_on_pdf` int NOT NULL DEFAULT '0',
  `invoices_only` int NOT NULL DEFAULT '0',
  `expenses_only` int NOT NULL DEFAULT '0',
  `selected_by_default` int NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}payment_modes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}pinned_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}pinned_projects` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}projectdiscussioncomments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discussion_id` int NOT NULL,
  `discussion_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int NOT NULL,
  `contact_id` int DEFAULT '0',
  `fullname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_mime_type` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}projectdiscussioncomments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}projectdiscussions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` tinyint(1) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `staff_id` int NOT NULL DEFAULT '0',
  `contact_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}projectdiscussions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `clientid` int NOT NULL,
  `billing_type` int NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `project_created` date NOT NULL,
  `date_finished` datetime DEFAULT NULL,
  `progress` int DEFAULT '0',
  `progress_from_tasks` int NOT NULL DEFAULT '1',
  `project_cost` decimal(15,2) DEFAULT NULL,
  `project_rate_per_hour` decimal(15,2) DEFAULT NULL,
  `estimated_hours` decimal(15,2) DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `contact_notification` int DEFAULT '1',
  `notify_contacts` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}projects` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `staff_id` int NOT NULL DEFAULT '0',
  `contact_id` int NOT NULL DEFAULT '0',
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_to_customer` int NOT NULL DEFAULT '0',
  `description_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Language file key',
  `additional_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_activity` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_file_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filetype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `project_id` int NOT NULL,
  `visible_to_customer` tinyint(1) DEFAULT '0',
  `staffid` int NOT NULL,
  `contact_id` int NOT NULL DEFAULT '0',
  `external` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail_link` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_files` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_members` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_notes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_settings` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}proposals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `addedfrom` int NOT NULL,
  `datecreated` datetime NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `adjustment` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `discount_total` decimal(15,2) NOT NULL,
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `currency` int NOT NULL,
  `open_till` date DEFAULT NULL,
  `date` date NOT NULL,
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned` int DEFAULT NULL,
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `proposal_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `country` int NOT NULL DEFAULT '0',
  `zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `status` int NOT NULL,
  `estimate_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `pipeline_order` int DEFAULT '1',
  `is_expiry_notified` int NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}proposals` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}proposal_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `proposalid` int NOT NULL,
  `staffid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}proposal_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}related_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}related_items` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}reminders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` datetime NOT NULL,
  `isnotified` int NOT NULL DEFAULT '0',
  `rel_id` int NOT NULL,
  `staff` int NOT NULL,
  `rel_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_by_email` int NOT NULL DEFAULT '1',
  `creator` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `staff` (`staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}reminders` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}roles` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}roles` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}sales_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rel_id` int NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staffid` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}sales_activity` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}scheduled_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `contacts` varchar(197) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attach_pdf` tinyint(1) NOT NULL DEFAULT '1',
  `template` varchar(197) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}scheduled_emails` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}services` (
  `serviceid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}services` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}sessions` (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}sessions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}shared_customer_files` (
  `file_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}shared_customer_files` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}spam_filters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rel_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}spam_filters` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}staff` (
  `staffid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phonenumber` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datecreated` datetime NOT NULL,
  `profile_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `new_pass_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `admin` int NOT NULL DEFAULT '0',
  `role` int DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `default_language` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_path_slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_not_staff` int NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `two_factor_auth_enabled` tinyint(1) DEFAULT '0',
  `two_factor_auth_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_auth_code_requested` datetime DEFAULT NULL,
  `email_signature` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `google_auth_secret` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`staffid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}staff` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}staff_departments` (
  `staffdepartmentid` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `departmentid` int NOT NULL,
  PRIMARY KEY (`staffdepartmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}staff_departments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}staff_permissions` (
  `staff_id` int NOT NULL,
  `feature` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}staff_permissions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_in_item` tinyint(1) NOT NULL DEFAULT '0',
  `clientid` int NOT NULL,
  `date` date DEFAULT NULL,
  `terms` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `currency` int NOT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `stripe_tax_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id_2` int NOT NULL DEFAULT '0',
  `stripe_tax_id_2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_plan_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stripe_subscription_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_billing_cycle` bigint DEFAULT NULL,
  `ends_at` bigint DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `project_id` int NOT NULL DEFAULT '0',
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_from` int NOT NULL,
  `date_subscribed` datetime DEFAULT NULL,
  `in_test_environment` int DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `tax_id` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}subscriptions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}taggables` (
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int NOT NULL,
  `tag_order` int NOT NULL DEFAULT '0',
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}taggables` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tags` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `priority` int DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `startdate` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `datefinished` datetime DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `is_added_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat_every` int DEFAULT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `is_recurring_from` int DEFAULT NULL,
  `cycles` int NOT NULL DEFAULT '0',
  `total_cycles` int NOT NULL DEFAULT '0',
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `billable` tinyint(1) NOT NULL DEFAULT '0',
  `billed` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_id` int NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `milestone` int DEFAULT '0',
  `kanban_order` int DEFAULT '1',
  `milestone_order` int NOT NULL DEFAULT '0',
  `visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `deadline_notified` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `milestone` (`milestone`),
  KEY `kanban_order` (`kanban_order`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tasks` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}taskstimers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `start_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` int NOT NULL,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `note` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}taskstimers` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tasks_checklist_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tasks_checklist_templates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_assigned` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `taskid` int NOT NULL,
  `assigned_from` int NOT NULL DEFAULT '0',
  `is_assigned_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_assigned` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_checklist_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskid` int NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `addedfrom` int NOT NULL,
  `finished_from` int DEFAULT '0',
  `list_order` int NOT NULL DEFAULT '0',
  `assigned` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_checklist_items` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskid` int NOT NULL,
  `staffid` int NOT NULL,
  `contact_id` int NOT NULL DEFAULT '0',
  `file_id` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_followers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `taskid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_followers` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}taxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}taxes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addedfrom` int NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}templates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets` (
  `ticketid` int NOT NULL AUTO_INCREMENT,
  `adminreplying` int NOT NULL DEFAULT '0',
  `userid` int NOT NULL,
  `contactid` int NOT NULL DEFAULT '0',
  `merged_ticket_id` int DEFAULT NULL,
  `email` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `department` int NOT NULL,
  `priority` int NOT NULL,
  `status` int NOT NULL,
  `service` int DEFAULT NULL,
  `ticketkey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin` int DEFAULT NULL,
  `date` datetime NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `lastreply` datetime DEFAULT NULL,
  `clientread` int NOT NULL DEFAULT '0',
  `adminread` int NOT NULL DEFAULT '0',
  `assigned` int NOT NULL DEFAULT '0',
  `staff_id_replying` int DEFAULT NULL,
  `cc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ticketid`),
  KEY `service` (`service`),
  KEY `department` (`department`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `priority` (`priority`),
  KEY `project_id` (`project_id`),
  KEY `contactid` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_pipe_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `email_to` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_pipe_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_predefined_replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_predefined_replies` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_priorities` (
  `priorityid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`priorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_priorities` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_status` (
  `ticketstatusid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdefault` int NOT NULL DEFAULT '0',
  `statuscolor` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statusorder` int DEFAULT NULL,
  PRIMARY KEY (`ticketstatusid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_status` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}ticket_attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticketid` int NOT NULL,
  `replyid` int DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}ticket_attachments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}ticket_replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticketid` int NOT NULL,
  `userid` int DEFAULT NULL,
  `contactid` int NOT NULL DEFAULT '0',
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` datetime NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` int DEFAULT NULL,
  `admin` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}ticket_replies` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}todos` (
  `todoid` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staffid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `datefinished` datetime DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  PRIMARY KEY (`todoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}todos` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tracked_mails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rel_id` int NOT NULL,
  `rel_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT '0',
  `date_opened` datetime DEFAULT NULL,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tracked_mails` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}twocheckout_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` int NOT NULL,
  `amount` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `attempt_reference` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `{TENANT_SLUG_PLACEHOLDER}twocheckout_log_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `tblinvoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}twocheckout_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}user_auto_login` (
  `key_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `user_agent` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}user_auto_login` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}user_meta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint unsigned NOT NULL DEFAULT '0',
  `client_id` bigint unsigned NOT NULL DEFAULT '0',
  `contact_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}user_meta` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}vault` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `server_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `creator` int NOT NULL,
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `share_in_projects` tinyint(1) NOT NULL DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `last_updated_from` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}vault` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}views_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}views_tracking` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}web_to_lead` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lead_source` int NOT NULL,
  `lead_status` int NOT NULL,
  `notify_lead_imported` int NOT NULL DEFAULT '1',
  `notify_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responsible` int NOT NULL DEFAULT '0',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `recaptcha` int NOT NULL DEFAULT '0',
  `submit_btn_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submit_btn_text_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#ffffff',
  `submit_btn_bg_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#84c529',
  `success_submit_msg` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `submit_action` int DEFAULT '0',
  `lead_name_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submit_redirect_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `language` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_duplicate` int NOT NULL DEFAULT '1',
  `mark_public` int NOT NULL DEFAULT '0',
  `track_duplicate_field` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_task_on_duplicate` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}web_to_lead` AUTO_INCREMENT = 1