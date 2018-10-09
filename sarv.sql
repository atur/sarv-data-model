SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `sarv` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sarv`;

CREATE TABLE `accession` (
  `number` varchar(15) DEFAULT NULL,
  `date_signed` date DEFAULT '0000-00-00',
  `date_confirmed` date DEFAULT '0000-00-00',
  `agent_andis_id` int(11) NOT NULL DEFAULT '0',
  `agent_vottis_id` int(11) NOT NULL DEFAULT '0',
  `agent_kinnitas_id` int(11) NOT NULL DEFAULT '0',
  `number_items` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remarks` text,
  `database_id` tinyint(11) NOT NULL DEFAULT '1',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `agent` (
  `agent` varchar(100) NOT NULL DEFAULT '',
  `agent_en` varchar(100) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `forename` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `surename` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `profession_en` varchar(50) DEFAULT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `institution_name` varchar(255) DEFAULT NULL,
  `institution_name_en` varchar(255) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `http` varchar(100) DEFAULT NULL,
  `address_2` varchar(100) DEFAULT NULL,
  `address1_2` varchar(100) DEFAULT NULL,
  `address2_2` varchar(100) DEFAULT NULL,
  `country_2` varchar(50) DEFAULT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `fax_2` varchar(20) DEFAULT NULL,
  `email_2` varchar(20) DEFAULT NULL,
  `http_2` varchar(100) DEFAULT NULL,
  `old_name` varchar(50) DEFAULT NULL,
  `new_name` varchar(50) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `date_born` date DEFAULT NULL,
  `date_deceased` date DEFAULT NULL,
  `relation` varchar(100) DEFAULT NULL,
  `selected` tinyint(1) DEFAULT NULL,
  `remarks` text,
  `isikukood` decimal(11,0) DEFAULT NULL,
  `privileges` tinyint(4) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `agent_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `analysis` (
  `sample_id` int(11) DEFAULT NULL,
  `sample_id_temp` varchar(25) DEFAULT NULL,
  `specimen_id` int(11) DEFAULT NULL,
  `dataset_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `method_details` varchar(255) DEFAULT NULL,
  `method_details_en` varchar(255) DEFAULT NULL,
  `parent_analysis_id` int(11) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `mass` double(8,1) DEFAULT NULL,
  `mass_unit` varchar(10) DEFAULT NULL,
  `counts` int(11) DEFAULT NULL COMMENT 'individual counts, e.g., number of grains counted for mineralogical analysis',
  `date` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_free` varchar(25) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `lab_txt` varchar(255) DEFAULT NULL,
  `lab_sample_number` varchar(50) DEFAULT NULL,
  `lab_analysis_number` varchar(50) DEFAULT NULL,
  `instrument_id` int(11) DEFAULT NULL,
  `instrument_txt` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_txt` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL COMMENT 'analüüsi tellija / andmete omanik',
  `private` int(11) NOT NULL DEFAULT '0' COMMENT '0, 1 või 2; vaikimisi 0, st avalik',
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `location` varchar(20) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `id_sample_palaeontology` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `analysis_method` (
  `method` varchar(100) NOT NULL,
  `method_en` varchar(100) DEFAULT NULL,
  `parent_method` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `analysis_parameter` (
  `parameter` varchar(50) NOT NULL,
  `parameter_name` varchar(150) DEFAULT NULL,
  `parameter_name_en` varchar(150) DEFAULT NULL,
  `parent_parameter` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `analysis_results` (
  `analysis_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `parameter_id` int(11) DEFAULT NULL,
  `value` double(11,5) DEFAULT NULL,
  `value_min` double(11,5) DEFAULT NULL COMMENT 'use together with value max if numeric range is given',
  `value_max` double(11,5) DEFAULT NULL COMMENT 'use together with value value_min',
  `value_bin` tinyint(4) DEFAULT NULL COMMENT 'if 1, then parameter is measured qualitatively',
  `value_txt` varchar(100) DEFAULT NULL COMMENT 'value in free text',
  `unit_id` tinyint(11) DEFAULT NULL,
  `value_error` double(11,5) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `archive` (
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `volume` varchar(20) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_txt` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_free` varchar(100) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_created_free` varchar(50) DEFAULT NULL,
  `date_provided` date DEFAULT NULL,
  `date_provided_free` varchar(50) DEFAULT NULL,
  `agent_provided_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_en` varchar(255) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `remarks` text,
  `is_private` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'kolm taset: 0=avalik, 1=piiratud, 2=salajane',
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `database_id` int(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attachment` (
  `attachment_id` int(11) NOT NULL,
  `link_table` varchar(50) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `file` varchar(150) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `specimen_image_attachment` tinyint(1) NOT NULL DEFAULT '3',
  `type` tinyint(4) DEFAULT NULL,
  `format` tinyint(4) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_free` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_created_free` varchar(50) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `device_txt` varchar(255) DEFAULT NULL,
  `date_digitised` date DEFAULT NULL,
  `date_digitised_free` varchar(50) DEFAULT NULL,
  `agent_digitised_id` int(11) DEFAULT NULL,
  `device_digitised_id` int(11) DEFAULT NULL,
  `copyright_agent_id` int(11) DEFAULT NULL,
  `licence_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_en` varchar(255) DEFAULT NULL,
  `remarks` text,
  `tags` varchar(255) DEFAULT NULL,
  `stars` tinyint(4) DEFAULT NULL,
  `private` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'kolm taset: 0=avalik, 1=piiratud, 2=salajane',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_preferred` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `collection_id` int(11) DEFAULT NULL,
  `specimen_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `analysis_id` int(11) DEFAULT NULL,
  `dataset_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `preparation_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `drillcore_id` int(11) DEFAULT NULL,
  `drillcore_box_id` int(11) DEFAULT NULL,
  `drillcore_image_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `imageset_id` int(11) DEFAULT NULL,
  `specimen_image_id` int(11) DEFAULT NULL,
  `image_number` varchar(50) DEFAULT NULL,
  `image_type` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_category` int(11) DEFAULT NULL,
  `image_object` varchar(255) DEFAULT NULL,
  `image_place` varchar(255) DEFAULT NULL,
  `image_people` varchar(255) DEFAULT NULL,
  `image_latitude` double(10,6) DEFAULT NULL,
  `image_longitude` double(10,6) DEFAULT NULL,
  `image_altitude` float(6,2) DEFAULT NULL,
  `image_scalebar` varchar(20) DEFAULT NULL,
  `image_description` text,
  `image_description_en` text,
  `storage` varchar(20) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `database_id` int(11) NOT NULL DEFAULT '1',
  `uuid` char(36) DEFAULT NULL,
  `uuid_filename` varchar(50) DEFAULT NULL,
  `filename_old` varchar(255) DEFAULT NULL,
  `upload` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attachment_link` (
  `attachment_id` int(11) NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `specimen_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `sample_series_id` int(11) DEFAULT NULL,
  `analysis_id` int(11) DEFAULT NULL,
  `dataset_id` int(11) DEFAULT NULL,
  `doi_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `drillcore_id` int(11) DEFAULT NULL,
  `drillcore_box_id` int(11) DEFAULT NULL,
  `preparation_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `archive_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `classification_rock` (
  `name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `class` varchar(100) NOT NULL DEFAULT '',
  `class_en` varchar(100) DEFAULT NULL,
  `class_synonym` varchar(100) DEFAULT NULL,
  `class_en_synonym` varchar(100) DEFAULT NULL,
  `hierarchy_string` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `node_editor` varchar(20) DEFAULT NULL COMMENT 'kasutaja kellel on õigused muutmiseks',
  `description` text,
  `description_en` text,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `collection` (
  `acronym` varchar(5) NOT NULL DEFAULT 'GIT',
  `number` varchar(10) DEFAULT NULL,
  `collection_id` smallint(11) DEFAULT NULL,
  `collection_number` varchar(15) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `name_long` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_long_en` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `stratigraphy_id` int(11) DEFAULT NULL,
  `number_objects` int(11) DEFAULT NULL,
  `number_types` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `remarks` text,
  `publication_exists` tinyint(4) DEFAULT NULL,
  `is_private` bit(1) NOT NULL DEFAULT b'0',
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `permissions` tinyint(1) NOT NULL DEFAULT '29',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `id_tug` int(11) DEFAULT NULL,
  `id_elm` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `database` (
  `acronym` varchar(5) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dataset` (
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `description` text,
  `description_en` text,
  `dataset_html` longtext,
  `date` date DEFAULT NULL,
  `date_txt` varchar(25) DEFAULT NULL,
  `is_private` int(11) NOT NULL DEFAULT '0',
  `owner_id` int(11) DEFAULT NULL,
  `owner_txt` varchar(255) DEFAULT NULL,
  `copyright_agent_id` int(11) DEFAULT NULL,
  `licence_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `dataset_analysis` (
  `dataset_id` int(11) NOT NULL DEFAULT '0',
  `analysis_id` int(11) NOT NULL DEFAULT '0',
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dataset_author` (
  `dataset_id` int(11) NOT NULL DEFAULT '0',
  `agent_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dataset_reference` (
  `dataset_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `deaccession` (
  `number` varchar(15) DEFAULT NULL,
  `date_signed` date DEFAULT '0000-00-00',
  `date_confirmed` date DEFAULT '0000-00-00',
  `agent_kandis_id` int(11) DEFAULT '0',
  `agent_kinnitas_id` int(11) NOT NULL DEFAULT '0',
  `number_items` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remarks` text,
  `database_id` tinyint(11) NOT NULL DEFAULT '1',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `device` (
  `name` varchar(50) DEFAULT NULL,
  `name_long` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `device_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `doi` (
  `identifier` varchar(100) NOT NULL,
  `creators` varchar(1000) NOT NULL,
  `title` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `publication_year` varchar(4) NOT NULL,
  `subjects` varchar(255) DEFAULT NULL,
  `language` tinyint(4) DEFAULT NULL,
  `resource_type` int(11) DEFAULT NULL,
  `resource` varchar(100) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `description` text,
  `abstract` text,
  `methods` text,
  `sizes` varchar(255) DEFAULT NULL,
  `formats` varchar(255) DEFAULT NULL,
  `dataset_html` longtext,
  `dataset_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_txt` varchar(25) DEFAULT NULL,
  `is_private` int(11) DEFAULT '0',
  `owner_id` int(11) DEFAULT NULL,
  `owner_txt` varchar(255) DEFAULT NULL,
  `copyright_agent_id` int(11) DEFAULT NULL,
  `licence_id` int(11) DEFAULT NULL,
  `remarks` text,
  `datacite_created` timestamp NULL DEFAULT NULL,
  `datacite_updated` timestamp NULL DEFAULT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(36) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `doi_agent` (
  `doi_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `agent_type` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `doi_agent_type` (
  `value` varchar(50) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `doi_date` (
  `doi_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `date_type` int(11) NOT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `doi_date_type` (
  `value` varchar(50) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `doi_geolocation` (
  `doi_id` int(11) NOT NULL,
  `point` varchar(255) DEFAULT NULL,
  `box` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `doi_related_identifier` (
  `doi_id` int(11) NOT NULL,
  `identifier_type` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `doi_related_identifier_type` (
  `value` varchar(50) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `doi_relation_type` (
  `value` varchar(50) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `doi_resource_type` (
  `value` varchar(50) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `drillcore` (
  `locality_id` int(11) DEFAULT NULL,
  `drillcore` varchar(150) NOT NULL,
  `drillcore_en` varchar(150) NOT NULL,
  `year` varchar(10) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `storage` tinyint(4) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `boxes` int(11) DEFAULT NULL,
  `box_numbers` varchar(25) DEFAULT NULL,
  `number_meters` tinyint(4) DEFAULT NULL,
  `direction_lr` int(11) NOT NULL DEFAULT '0',
  `depth` varchar(25) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(11) NOT NULL DEFAULT '1',
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `drillcore_box` (
  `drillcore_id` int(11) NOT NULL DEFAULT '0',
  `number` varchar(10) DEFAULT NULL,
  `number_meters` tinyint(4) DEFAULT NULL,
  `diameter` int(11) DEFAULT NULL,
  `depth_start` double(8,2) DEFAULT NULL,
  `depth_end` double(8,2) DEFAULT NULL,
  `depth_other` varchar(255) DEFAULT NULL,
  `stratigraphy_base` int(11) DEFAULT NULL,
  `stratigraphy_base_free` varchar(100) DEFAULT NULL,
  `stratigraphy_top` int(11) DEFAULT NULL,
  `stratigraphy_top_free` varchar(100) DEFAULT NULL,
  `stratigraphy_free` varchar(255) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information on collections';

CREATE TABLE `drillcore_image` (
  `drillcore_box_id` int(11) DEFAULT '0',
  `drillcore_id` int(11) DEFAULT '0',
  `drillcore_box_number` varchar(4) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '5',
  `agent_id` int(11) DEFAULT NULL,
  `image_date` date DEFAULT NULL,
  `view` varchar(50) DEFAULT NULL,
  `camera` varchar(50) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `remarks` text,
  `is_preferred` tinyint(4) NOT NULL DEFAULT '1',
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `uuid` char(36) DEFAULT NULL,
  `uuid_filename` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `drillcore_study` (
  `drillcore_id` int(11) NOT NULL DEFAULT '0',
  `depth_start` double(8,2) DEFAULT NULL,
  `depth_end` double(8,2) DEFAULT NULL,
  `stratigraphy_free` varchar(50) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `other_persons` varchar(150) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `observation` tinyint(1) DEFAULT NULL,
  `description` tinyint(1) DEFAULT NULL,
  `sampling` tinyint(1) DEFAULT NULL,
  `number_samples` int(11) DEFAULT NULL,
  `photography` tinyint(1) DEFAULT NULL,
  `ordering` tinyint(1) DEFAULT NULL,
  `planned_analyses` varchar(150) DEFAULT NULL,
  `aim` varchar(150) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` int(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `imageset` (
  `imageset_number` varchar(45) NOT NULL DEFAULT '',
  `imageset_number_old` varchar(45) DEFAULT NULL,
  `imageset_series` varchar(10) DEFAULT NULL COMMENT 'siia sisestada sama autori prefiks, näit Udo Veske filmide puhul UV',
  `num_images` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `color` tinyint(4) DEFAULT NULL COMMENT 'värvipilt = 1, mv = 0',
  `size_x` int(11) DEFAULT NULL COMMENT 'laius pikslites',
  `size_y` int(11) DEFAULT NULL COMMENT 'kõrgus pikslites',
  `lens` varchar(45) DEFAULT NULL,
  `image_category` int(11) NOT NULL DEFAULT '0',
  `object` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_free` varchar(100) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_free` varchar(50) DEFAULT NULL,
  `date_digitised` date DEFAULT NULL,
  `date_digitised_free` varchar(50) DEFAULT NULL,
  `device_digitised_id` int(11) DEFAULT NULL,
  `agent_digitised_id` int(11) DEFAULT NULL,
  `file_source` varchar(10) DEFAULT NULL COMMENT 'extension of the original digital file: tif, raw, nef, jpg etc',
  `location` varchar(20) DEFAULT NULL,
  `remarks` text,
  `classified` tinyint(4) NOT NULL DEFAULT '0',
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `imageset_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journal` (
  `journal` varchar(150) NOT NULL DEFAULT '',
  `journal_short` varchar(150) DEFAULT NULL,
  `journal_abbr` varchar(100) DEFAULT NULL,
  `journal_long` varchar(255) DEFAULT NULL,
  `journal_original` varchar(255) DEFAULT NULL,
  `issn` varchar(25) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `publisher_place` varchar(50) DEFAULT NULL,
  `http` varchar(100) DEFAULT NULL,
  `former_journal_id` int(11) DEFAULT NULL,
  `following_journal_id` int(11) DEFAULT NULL,
  `oldname` varchar(150) DEFAULT NULL,
  `newname` varchar(150) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lab` (
  `id` int(11) NOT NULL,
  `lab` varchar(150) NOT NULL,
  `lab_en` varchar(150) DEFAULT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `year_started` varchar(10) DEFAULT NULL,
  `year_ended` varchar(10) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lab_instrument` (
  `id` int(11) NOT NULL,
  `instrument` varchar(150) NOT NULL,
  `instrument_en` varchar(150) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `year_started` varchar(10) DEFAULT NULL,
  `year_ended` varchar(10) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_acquisition_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_agent_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_asustusyksus` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `asustusyksus` varchar(50) NOT NULL DEFAULT '',
  `asustusyksus_en` varchar(50) DEFAULT NULL,
  `mkood` varchar(10) NOT NULL DEFAULT '',
  `vkood` varchar(10) DEFAULT NULL,
  `akood` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_attachment_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_classification_rank` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `value_lat` varchar(20) DEFAULT NULL,
  `rank_short` varchar(10) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL,
  `id` int(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_collection_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_coordinate_method` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_coordinate_precision` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `precision_numeric` int(11) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_country` (
  `value` varchar(50) DEFAULT NULL,
  `value_en` varchar(50) DEFAULT NULL,
  `ISO_code` char(2) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_drillcore_storage` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_history_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_identification_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_image_category` (
  `value` varchar(50) DEFAULT NULL,
  `value_en` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_image_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_language` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `iso_639_1` char(2) DEFAULT NULL,
  `iso_639_2t` char(3) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_licence` (
  `licence` varchar(50) DEFAULT NULL,
  `licence_en` varchar(50) DEFAULT NULL,
  `licence_long` varchar(255) DEFAULT NULL,
  `licence_long_en` varchar(255) DEFAULT NULL,
  `licence_url` varchar(100) DEFAULT NULL,
  `licence_url_en` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_loan_delivery_method` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_loan_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_locality_extent` (
  `value` varchar(50) DEFAULT NULL,
  `value_en` varchar(50) DEFAULT NULL,
  `area_numeric` bigint(20) DEFAULT NULL COMMENT 'area ',
  `remarks` varchar(255) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_locality_reference_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_locality_type` (
  `value` varchar(50) DEFAULT NULL,
  `value_en` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_maakond` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maakond` varchar(50) NOT NULL DEFAULT '',
  `maakond_en` varchar(50) DEFAULT NULL,
  `mkood` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_mime_type` (
  `value` varchar(150) DEFAULT NULL,
  `file_extension` varchar(150) DEFAULT NULL,
  `software` varchar(100) NOT NULL,
  `id` tinyint(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_palaeontology_method` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_reference_type` (
  `value` varchar(50) DEFAULT NULL,
  `value_en` varchar(50) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_sample_purpose` (
  `value` varchar(100) DEFAULT NULL,
  `value_en` varchar(100) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_specimen_kind` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `value_biocase` varchar(100) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_specimen_original_status` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_specimen_presence` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_specimen_status` (
  `value` varchar(50) DEFAULT NULL,
  `value_en` varchar(50) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_specimen_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_stratigraphy_rank` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_stratigraphy_scope` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_stratigraphy_status` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_stratigraphy_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_stratotype_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_unit` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_vald` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vald` varchar(50) NOT NULL DEFAULT '',
  `vald_en` varchar(50) DEFAULT NULL,
  `vkood` varchar(4) NOT NULL DEFAULT '',
  `mkood` varchar(4) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `list_visibility` (
  `value` varchar(50) DEFAULT NULL,
  `value_en` varchar(50) DEFAULT NULL,
  `id` tinyint(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `loan` (
  `loan_number` varchar(15) NOT NULL DEFAULT '',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `project` varchar(150) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `borrower_institution_id` int(11) DEFAULT NULL,
  `loaner_id` int(11) DEFAULT NULL,
  `date_signed` date DEFAULT NULL,
  `delivery_method` int(11) DEFAULT NULL,
  `deliverer_id` int(11) DEFAULT NULL,
  `delivery_remarks` varchar(255) DEFAULT NULL,
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  `date_returned` date DEFAULT NULL,
  `special` varchar(255) DEFAULT NULL,
  `remarks` text,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `loan_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 45056 kB; (`loan_number`) REFER `sarv/location`';

CREATE TABLE `loan_sample` (
  `loan_id` int(11) DEFAULT NULL,
  `sample_id` int(11) NOT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 45056 kB';

CREATE TABLE `loan_specimen` (
  `loan_id` int(11) DEFAULT NULL,
  `specimen_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 45056 kB';

CREATE TABLE `locality` (
  `locality` varchar(100) NOT NULL DEFAULT '',
  `locality_en` varchar(100) NOT NULL DEFAULT '',
  `number` varchar(20) DEFAULT '',
  `code` varchar(10) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'if is within another locality',
  `coord_x` int(11) DEFAULT NULL,
  `coord_y` int(11) DEFAULT NULL,
  `coord_system` varchar(50) DEFAULT '',
  `x` int(11) DEFAULT NULL COMMENT 'x (north) coordinate using L-EST system',
  `y` int(11) DEFAULT NULL COMMENT 'y (east) coordinate using L-EST system',
  `latitude` double(10,6) DEFAULT NULL,
  `longitude` double(10,6) DEFAULT NULL,
  `elevation` double(8,1) DEFAULT NULL,
  `coord_det_precision` tinyint(4) DEFAULT NULL,
  `coord_det_method` tinyint(4) DEFAULT NULL,
  `coord_det_agent` int(11) DEFAULT NULL,
  `extent` tinyint(4) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `maakond_id` int(10) UNSIGNED DEFAULT NULL,
  `vald_id` int(10) UNSIGNED DEFAULT NULL,
  `asustusyksus_id` int(10) UNSIGNED DEFAULT NULL,
  `remarks_location` text,
  `depth` double(8,2) DEFAULT NULL,
  `stratigraphy_base` int(11) DEFAULT NULL,
  `stratigraphy_top` int(11) DEFAULT NULL,
  `stratigraphy_base_free` varchar(100) DEFAULT NULL,
  `stratigraphy_top_free` varchar(100) DEFAULT NULL,
  `stratigraphy_start` varchar(50) DEFAULT '',
  `stratigraphy_end` varchar(50) DEFAULT '',
  `stratigraphy_id_start` int(11) DEFAULT NULL,
  `stratigraphy_id_end` int(11) DEFAULT NULL,
  `stratigraphy_free_start` varchar(50) DEFAULT '',
  `stratigraphy_free_end` varchar(50) DEFAULT '',
  `eelis` varchar(100) DEFAULT NULL,
  `maaamet_pa_id` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` text,
  `user_added` varchar(10) DEFAULT '',
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `user_changed` varchar(10) DEFAULT '',
  `date_changed` datetime DEFAULT '0000-00-00 00:00:00',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locality_description` (
  `locality_id` int(11) NOT NULL,
  `depth_base` double(8,2) NOT NULL,
  `depth_base_min` double(8,2) DEFAULT NULL,
  `depth_base_max` double(8,2) DEFAULT NULL,
  `depth_top` double(8,2) DEFAULT NULL,
  `depth_top_min` double(8,2) DEFAULT NULL,
  `depth_top_max` double(8,2) DEFAULT NULL,
  `depth` double(8,2) DEFAULT NULL,
  `thickness` varchar(10) DEFAULT NULL,
  `zero_level` varchar(100) DEFAULT NULL,
  `has_reversed_scale` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'measured reversed to time vector',
  `rock_id` int(11) DEFAULT NULL,
  `rock_name` varchar(100) DEFAULT NULL,
  `rock_name_en` varchar(100) DEFAULT NULL,
  `description` text,
  `keywords` varchar(255) DEFAULT NULL,
  `language_id` tinyint(11) DEFAULT NULL,
  `stratigraphy_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `author_free` varchar(150) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `locality_image` (
  `locality_id` int(11) NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `sort` int(4) DEFAULT '1000',
  `title` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locality_parameter` (
  `locality_id` int(11) NOT NULL,
  `parameter` varchar(100) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locality_reference` (
  `locality_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `figures` varchar(20) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `locality_stratigraphy` (
  `locality_id` int(11) NOT NULL DEFAULT '0',
  `depth_base` double(8,2) NOT NULL,
  `depth_base_min` double(8,2) DEFAULT NULL,
  `depth_base_max` double(8,2) DEFAULT NULL,
  `depth_top` double(8,2) DEFAULT NULL,
  `depth_top_min` double(8,2) DEFAULT NULL,
  `depth_top_max` double(8,2) DEFAULT NULL,
  `depth` double(8,2) DEFAULT NULL,
  `thickness` varchar(10) DEFAULT NULL,
  `stratigraphy_id` int(11) NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL DEFAULT '1',
  `agent_id` int(11) DEFAULT NULL,
  `author_free` varchar(150) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `remarks` text,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `locality_summary` (
  `id` int(11) NOT NULL DEFAULT '0',
  `locality` varchar(100) NOT NULL DEFAULT '',
  `locality_en` varchar(100) NOT NULL DEFAULT '',
  `number` varchar(20) DEFAULT '',
  `country` varchar(50) DEFAULT NULL,
  `country_en` varchar(50) DEFAULT NULL,
  `latitude` double(10,6) DEFAULT NULL,
  `longitude` double(10,6) DEFAULT NULL,
  `extent_m` double(8,2) DEFAULT NULL,
  `extent_strat` varchar(150) DEFAULT '',
  `extent_ma` double(8,2) DEFAULT NULL,
  `coord_det_precision` tinyint(4) DEFAULT NULL,
  `coord_accuracy` varchar(25) DEFAULT NULL,
  `egk_id` int(11) DEFAULT NULL,
  `locality_type` tinyint(4) DEFAULT NULL,
  `url` varchar(41) NOT NULL DEFAULT '',
  `specimens` bigint(21) DEFAULT NULL,
  `samples` bigint(21) DEFAULT NULL,
  `drillcores` bigint(21) DEFAULT NULL,
  `taxon_occurrences` bigint(21) DEFAULT NULL,
  `analyses` bigint(21) DEFAULT NULL,
  `citing_references` bigint(21) DEFAULT NULL,
  `stratotypes` bigint(21) DEFAULT NULL,
  `images` bigint(21) DEFAULT NULL,
  `total_related_records` int(1) NOT NULL DEFAULT '0',
  `user_created` varchar(10) DEFAULT '',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locality_synonym` (
  `locality_id` int(11) NOT NULL DEFAULT '0',
  `synonym` varchar(100) NOT NULL DEFAULT '',
  `language` tinyint(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `locality_taxon` (
  `locality_id` int(11) NOT NULL,
  `taxon_id` int(11) DEFAULT NULL,
  `taxon` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `location` (
  `location` varchar(20) DEFAULT NULL,
  `location_new` varchar(20) DEFAULT NULL,
  `location_old` varchar(20) DEFAULT NULL,
  `location_location` varchar(20) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `date_collected_free` varchar(10) DEFAULT NULL,
  `stratigraphy_free` varchar(25) DEFAULT NULL,
  `number_items` int(11) DEFAULT NULL,
  `selected` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` text,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `preparation` (
  `preparation_number` varchar(25) NOT NULL DEFAULT '',
  `sample_number` varchar(25) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `sample_palaeontology_id` int(11) DEFAULT NULL,
  `analysis_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL COMMENT 'prepared by',
  `agent_txt` varchar(255) DEFAULT NULL COMMENT 'prepared by txt',
  `date_prepared` date DEFAULT NULL,
  `date_prepared_txt` varchar(25) DEFAULT NULL,
  `identification_agent_id` int(11) DEFAULT NULL,
  `identification_date` date DEFAULT NULL,
  `identification_remarks` varchar(255) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `reference` (
  `reference` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `language` tinyint(4) DEFAULT NULL,
  `title_original` varchar(512) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `book` varchar(512) DEFAULT NULL,
  `book_original` varchar(512) DEFAULT NULL,
  `publisher` varchar(150) DEFAULT NULL,
  `publisher_place` varchar(150) DEFAULT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `journal` varchar(255) DEFAULT NULL,
  `journal_additional` varchar(255) DEFAULT NULL,
  `volume` varchar(10) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `page_start` int(11) DEFAULT NULL,
  `page_end` int(11) DEFAULT NULL,
  `figures` varchar(20) DEFAULT NULL,
  `issn` varchar(20) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `doi` varchar(100) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `abstract` text,
  `tags` varchar(255) DEFAULT NULL,
  `remarks` text,
  `is_oa` tinyint(1) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `copy_exists` tinyint(4) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reference_keyword` (
  `reference_id` int(11) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `language_id` tinyint(4) DEFAULT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock` (
  `name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `rock_type_id` int(11) NOT NULL,
  `rock_rank_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` text,
  `description_en` text,
  `description_in_estonia` text,
  `description_in_estonia_en` text,
  `description_usage` text,
  `description_usage_en` text,
  `in_estonia` tinyint(1) NOT NULL,
  `is_resource` tinyint(1) NOT NULL,
  `stratigraphy_id` int(11) DEFAULT NULL,
  `lithostratigraphy_id` int(11) DEFAULT NULL,
  `mindat_id` int(11) DEFAULT NULL,
  `link_wikipedia` varchar(100) DEFAULT NULL,
  `link_wikipedia_en` varchar(100) DEFAULT NULL,
  `ima_status` int(11) DEFAULT NULL,
  `formula` varchar(100) DEFAULT NULL,
  `formula_html` varchar(150) DEFAULT NULL,
  `mineral_id` int(11) DEFAULT NULL,
  `remarks` text,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `in_portal` tinyint(1) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_classification` (
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_long` varchar(255) DEFAULT NULL,
  `name_long_en` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `hierarchy_top_rock_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_image` (
  `rock_id` int(11) NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `image_id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `sort` int(4) DEFAULT '1000',
  `title` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_locality` (
  `rock_id` int(11) NOT NULL,
  `locality_id` int(11) NOT NULL,
  `sort` int(4) DEFAULT NULL,
  `description` text,
  `description_en` text,
  `remarks` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_mineral` (
  `rock_id` int(11) NOT NULL,
  `mineral_id` int(11) NOT NULL,
  `mineral_type_id` int(11) DEFAULT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `description_en` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `remarks` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_mineral_type` (
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `remarks` text,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_property` (
  `rock_id` int(11) NOT NULL,
  `property_type_id` int(11) DEFAULT NULL,
  `property` varchar(100) NOT NULL,
  `property_en` varchar(100) DEFAULT NULL,
  `value_min` double DEFAULT NULL,
  `value_max` double DEFAULT NULL,
  `value_txt` varchar(50) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_property_type` (
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `remarks` text,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_rank` (
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `remarks` text,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_reference` (
  `rock_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `figures` varchar(20) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `rock_synonym` (
  `rock_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `language_id` tinyint(11) DEFAULT NULL,
  `is_preferred` tinyint(4) NOT NULL DEFAULT '1',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `reference_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_tree` (
  `rock_classification_id` int(11) NOT NULL,
  `rock_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_string` varchar(100) DEFAULT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '1',
  `remarks` text,
  `id` int(11) NOT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rock_type` (
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `remarks` text,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sample` (
  `number` varchar(25) DEFAULT NULL,
  `number_additional` varchar(50) DEFAULT NULL,
  `number_field` varchar(50) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `parent_sample_id` int(11) DEFAULT NULL COMMENT 'fill if this is a sub-sample',
  `parent_specimen_id` int(11) DEFAULT NULL COMMENT 'specimen from which the sample derives',
  `sample_purpose` tinyint(4) DEFAULT NULL COMMENT 'purpose of the initial sampling (e.g. micropaleontology, isotope geochemistry etc)',
  `locality_id` int(11) DEFAULT NULL,
  `locality_free` varchar(100) DEFAULT NULL,
  `soil_site_id` int(11) DEFAULT NULL,
  `latitude1` double(10,6) DEFAULT NULL,
  `longitude1` double(10,6) DEFAULT NULL,
  `x1` int(11) DEFAULT NULL COMMENT 'LEST97',
  `y1` int(11) DEFAULT NULL COMMENT 'LEST97',
  `epsg` int(11) DEFAULT NULL COMMENT 'coordinate reference system by EPSG numeric code',
  `coordinate_accuracy` int(11) DEFAULT NULL COMMENT 'accuracy of coordinate determination in meters',
  `depth` double(8,2) DEFAULT NULL,
  `depth_interval` double(8,2) DEFAULT NULL,
  `stratigraphy_id` int(11) DEFAULT NULL,
  `lithostratigraphy_id` int(11) DEFAULT NULL COMMENT 'Lithostratigraphic unit from the stratigraphy table',
  `stratigraphy_free` varchar(100) DEFAULT NULL,
  `stratigraphy_bed` varchar(100) DEFAULT NULL,
  `stratigraphy_bed_thickness` decimal(10,1) DEFAULT NULL COMMENT 'bed thickness in cm (especially for bentonites etc)',
  `soil_horizon` varchar(20) DEFAULT NULL,
  `agent_collected_id` int(11) DEFAULT NULL,
  `agent_collected_free` varchar(255) DEFAULT NULL,
  `date_collected` date DEFAULT NULL,
  `date_collected_free` varchar(10) DEFAULT NULL,
  `sample_type` varchar(100) DEFAULT NULL,
  `classification_rock_id` int(11) DEFAULT NULL,
  `rock_id` int(11) DEFAULT NULL,
  `rock` text,
  `rock_en` varchar(255) DEFAULT NULL,
  `fossils` text,
  `palaeontology` tinyint(1) DEFAULT '0',
  `analysis` tinyint(1) DEFAULT '0',
  `mass` int(11) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `location_additional` varchar(20) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `storage_additional_id` int(11) DEFAULT NULL,
  `remarks` text,
  `remarks_en` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `user_created_id` int(11) DEFAULT NULL,
  `user_updated_id` int(11) DEFAULT NULL,
  `timestamp_created` timestamp NULL DEFAULT NULL,
  `timestamp_updated` timestamp NULL DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `owner_id` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_temp` varchar(25) DEFAULT NULL COMMENT 'for bulk inserts with user-unique IDs, to match samples and analysis without knowing unique sample ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB; InnoDB free: 51200 kB; (`stratigraphy';

CREATE TABLE `sample_permissions` (
  `sample_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_editable` bit(1) NOT NULL DEFAULT b'1',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sample_reference` (
  `sample_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `pages` varchar(30) DEFAULT NULL,
  `sample_number` varchar(20) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sample_series` (
  `name` varchar(150) NOT NULL DEFAULT '',
  `sampling_purpose` varchar(50) DEFAULT NULL,
  `sample_count` int(11) DEFAULT NULL,
  `sample_numbers` varchar(50) DEFAULT NULL,
  `number_prefix` varchar(10) DEFAULT NULL,
  `number_start` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `locality_free` varchar(100) DEFAULT NULL,
  `zero_level` varchar(100) DEFAULT NULL,
  `depth_top` double(8,2) DEFAULT NULL,
  `depth_base` double(8,2) DEFAULT NULL,
  `stratigraphy_top_id` int(11) DEFAULT NULL,
  `stratigraphy_top_free` varchar(100) DEFAULT NULL,
  `stratigraphy_base_id` int(11) DEFAULT NULL,
  `stratigraphy_base_free` varchar(50) DEFAULT NULL,
  `agent_collected_id` int(11) DEFAULT NULL,
  `date_collected` date DEFAULT NULL,
  `date_collected_free` varchar(10) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `remarks` text,
  `owner_id` int(11) DEFAULT NULL,
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sample_series_reference` (
  `sample_series_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `pages` varchar(30) DEFAULT NULL,
  `sample_numbers` varchar(50) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `sarv_fields` (
  `table_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `indeks` varchar(15) DEFAULT NULL,
  `default_value` varchar(25) DEFAULT '0',
  `is_null` int(11) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `length` varchar(10) DEFAULT NULL,
  `description` text,
  `description_en` text,
  `example` varchar(255) DEFAULT NULL,
  `relationships` varchar(50) DEFAULT NULL,
  `fk_table` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `search` (
  `search_table` varchar(100) NOT NULL,
  `search_field` varchar(100) NOT NULL,
  `search_id` int(11) NOT NULL,
  `search_string` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `section_log` (
  `parameter` varchar(100) NOT NULL,
  `parameter_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `method_details` varchar(255) DEFAULT NULL,
  `method_details_en` varchar(255) DEFAULT NULL,
  `counts` int(11) DEFAULT NULL COMMENT 'individual counts, e.g., number of grains counted for mineralogical analysis',
  `date` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_free` varchar(25) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `lab_txt` varchar(255) DEFAULT NULL,
  `instrument_id` int(11) DEFAULT NULL,
  `instrument_txt` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_txt` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL COMMENT 'analüüsi tellija / andmete omanik',
  `private` int(11) NOT NULL DEFAULT '0' COMMENT '0, 1 või 2; vaikimisi 0, st avalik',
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `section_log_results` (
  `section_log_id` int(11) DEFAULT NULL,
  `depth` double(11,5) NOT NULL,
  `value` double(11,5) DEFAULT NULL,
  `value_min` double(11,5) DEFAULT NULL COMMENT 'use together with value max if numeric range is given',
  `value_max` double(11,5) DEFAULT NULL COMMENT 'use together with value value_min',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `selection` (
  `selection_id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `database_id` tinyint(11) NOT NULL DEFAULT '1',
  `utility_id` int(11) DEFAULT NULL,
  `utility_txt` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `selection_series` (
  `name` varchar(100) DEFAULT NULL,
  `tablename` varchar(25) NOT NULL DEFAULT '',
  `database_id` int(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `soil_horizon` (
  `soil_site_id` int(11) DEFAULT NULL,
  `horizon_number` varchar(2) DEFAULT NULL,
  `horizon` varchar(10) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `transition_a` int(11) DEFAULT NULL,
  `transition_b` int(11) DEFAULT NULL,
  `korese_tyyp_a` int(11) DEFAULT NULL,
  `korese_tyyp_b` int(11) DEFAULT NULL,
  `korese_aste_1` int(11) DEFAULT NULL,
  `korese_aste_2` int(11) DEFAULT NULL,
  `granulometry_1` varchar(5) DEFAULT NULL,
  `granulometry_2` varchar(5) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT '',
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `user_changed` varchar(10) DEFAULT '',
  `date_changed` datetime DEFAULT '0000-00-00 00:00:00',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `soil_site` (
  `site` varchar(100) NOT NULL DEFAULT '',
  `site_en` varchar(100) DEFAULT NULL,
  `number` varchar(20) DEFAULT '',
  `code` varchar(10) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'if is within another locality',
  `coord_system` varchar(50) DEFAULT '',
  `x` int(11) DEFAULT NULL COMMENT 'x (north) coordinate using L-EST system',
  `y` int(11) DEFAULT NULL COMMENT 'y (east) coordinate using L-EST system',
  `latitude` double(10,6) DEFAULT NULL,
  `longitude` double(10,6) DEFAULT NULL,
  `elevation` double(8,1) DEFAULT NULL,
  `coord_det_precision` tinyint(4) DEFAULT NULL,
  `coord_det_method` tinyint(4) DEFAULT NULL,
  `coord_det_agent` int(11) DEFAULT NULL,
  `extent` tinyint(4) DEFAULT NULL,
  `depth` double(4,2) DEFAULT NULL,
  `transect` varchar(10) DEFAULT NULL,
  `transect_point` int(11) DEFAULT NULL,
  `remarks_location` varchar(255) DEFAULT '',
  `is_deep` tinyint(4) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `date_free` varchar(10) DEFAULT NULL,
  `area_name` varchar(100) DEFAULT NULL,
  `land_use` varchar(255) DEFAULT NULL,
  `agro_group` varchar(25) DEFAULT NULL,
  `soil` varchar(10) DEFAULT NULL,
  `k_aste_a` varchar(1) DEFAULT NULL,
  `k_aste_b` varchar(1) DEFAULT NULL,
  `k_size_a` varchar(1) DEFAULT NULL,
  `k_size_b` varchar(1) DEFAULT NULL,
  `description_link` varchar(255) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT '',
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `user_changed` varchar(10) DEFAULT '',
  `date_changed` datetime DEFAULT '0000-00-00 00:00:00',
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specimen` (
  `acronym` char(3) DEFAULT NULL,
  `collection_number` varchar(10) DEFAULT NULL,
  `coll_id` int(11) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `specimen_id` varchar(20) DEFAULT NULL,
  `collection_id` smallint(11) DEFAULT NULL,
  `specimen_nr` varchar(25) DEFAULT NULL,
  `number_field` varchar(25) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'to record parent specimen',
  `type` tinyint(4) DEFAULT NULL,
  `fossil` tinyint(4) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `part` varchar(100) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `locality_free` varchar(100) DEFAULT NULL,
  `locality_free_en` varchar(255) DEFAULT NULL,
  `locality_is_private` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'leiukoht mitteavalik (looduskaitse vms)',
  `depth` double(8,2) DEFAULT NULL,
  `depth_interval` double(8,2) DEFAULT NULL,
  `sample_number` varchar(20) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `remarks_collecting` varchar(255) DEFAULT NULL,
  `stratigraphy_id` int(11) DEFAULT NULL,
  `lithostratigraphy_id` int(11) DEFAULT NULL COMMENT 'for lithostratigraphica units only, these come from the stratigraphy table',
  `stratigraphy_free` varchar(100) DEFAULT NULL,
  `agent_collected_id` int(11) DEFAULT NULL,
  `agent_collected_free` varchar(255) DEFAULT NULL,
  `date_collected` date DEFAULT NULL,
  `date_collected_free` varchar(10) DEFAULT NULL,
  `acquisition_type` tinyint(4) DEFAULT NULL,
  `date_acquired` date DEFAULT NULL,
  `date_acquired_free` varchar(10) DEFAULT NULL,
  `agent_acquired_id` int(11) DEFAULT NULL,
  `inventariraamat` varchar(50) DEFAULT NULL,
  `koguregister` varchar(50) DEFAULT NULL,
  `registreeritud` date DEFAULT NULL,
  `remarks` text,
  `remarks_internal` text,
  `tags` varchar(255) DEFAULT NULL,
  `presence` tinyint(4) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `original_status` tinyint(4) DEFAULT NULL,
  `selected` tinyint(4) DEFAULT NULL,
  `classified` tinyint(4) DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `akt_vastuvott_id` int(11) DEFAULT NULL,
  `akt_mahakandmine_id` int(11) DEFAULT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `permissions` tinyint(1) NOT NULL DEFAULT '23',
  `id_tug` int(11) DEFAULT NULL,
  `id_elm` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB; (`collection_id`) REFER `sarv/collect';

CREATE TABLE `specimen_description` (
  `specimen_id` int(11) NOT NULL DEFAULT '0',
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `mass` double(8,2) DEFAULT NULL,
  `description` text,
  `agent_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specimen_history` (
  `specimen_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `value_old` varchar(255) DEFAULT NULL,
  `value_new` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specimen_identification` (
  `specimen_id` int(11) NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '1',
  `class` varchar(50) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `species_id` int(11) DEFAULT NULL,
  `taxon_id` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `date_identified` date DEFAULT NULL,
  `date_identified_free` varchar(10) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specimen_identification_geology` (
  `specimen_id` int(11) NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '1',
  `class_id` int(11) DEFAULT NULL,
  `mineral_id` int(11) DEFAULT NULL,
  `rock_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `date_identified` date DEFAULT NULL,
  `date_identified_free` varchar(10) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specimen_image` (
  `specimen_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `mime_type` varchar(20) NOT NULL DEFAULT 'image/jpeg',
  `agent_id` int(11) DEFAULT NULL,
  `author_free` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_taken_free` varchar(50) DEFAULT NULL,
  `date_digitised` date DEFAULT NULL,
  `date_digitised_free` varchar(50) DEFAULT NULL,
  `device_digitised_id` int(11) DEFAULT NULL,
  `agent_digitised_id` int(11) DEFAULT NULL,
  `magnification` int(11) DEFAULT NULL,
  `scalebar` varchar(10) DEFAULT NULL,
  `camera` varchar(50) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `view` varchar(50) DEFAULT NULL,
  `description` text,
  `description_en` text,
  `location` varchar(20) DEFAULT NULL,
  `remarks` text,
  `remarks_en` text,
  `tags` varchar(255) DEFAULT NULL,
  `stars` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'relative quality and aesthetical value of the image; generally from 0 to 5, exceptionally 100. Helps to sort images for galleries.',
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `copyright_agent_id` int(11) NOT NULL,
  `licence_id` int(11) NOT NULL DEFAULT '1',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `database_id` tinyint(4) DEFAULT '1',
  `uuid` char(36) DEFAULT NULL,
  `uuid_filename` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image_url` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specimen_location` (
  `specimen_id` int(11) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `type` tinyint(11) DEFAULT NULL,
  `part` varchar(100) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specimen_reference` (
  `specimen_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `pages` varchar(30) DEFAULT NULL,
  `figures` varchar(30) DEFAULT NULL,
  `specimen_number` varchar(20) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `static_info` (
  `institution_et` varchar(150) NOT NULL,
  `institution_en` varchar(150) NOT NULL,
  `acronym` varchar(10) NOT NULL,
  `collection_source_institution_id` varchar(50) NOT NULL,
  `collection_source_id` varchar(50) NOT NULL,
  `collection_acronym` varchar(10) DEFAULT NULL,
  `collection_delimiter` char(1) DEFAULT NULL,
  `collection_title_en` varchar(255) DEFAULT NULL,
  `collection_title_et` varchar(255) DEFAULT NULL,
  `collection_title_geocase` varchar(255) DEFAULT NULL,
  `collection_coverage_geocase` varchar(255) DEFAULT NULL,
  `collection_details_geocase` varchar(255) DEFAULT NULL,
  `collection_description_en` text,
  `collection_description_et` text,
  `biocase_collection_source_id` varchar(50) DEFAULT NULL,
  `biocase_record_basis` varchar(50) DEFAULT NULL,
  `geocase_record_basis` varchar(50) DEFAULT NULL,
  `geocase_acknowledgement` varchar(255) DEFAULT NULL,
  `geocase_citation` varchar(255) DEFAULT NULL,
  `geocase_copyright` varchar(255) DEFAULT NULL,
  `geocase_disclaimer` varchar(255) DEFAULT NULL,
  `geocase_license` varchar(255) DEFAULT NULL,
  `geocase_license_details` varchar(255) DEFAULT NULL,
  `geocase_license_url` varchar(100) DEFAULT NULL,
  `geocase_termsofuse` varchar(255) DEFAULT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_position` varchar(50) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_address` varchar(250) DEFAULT NULL,
  `contact_phone` varchar(12) DEFAULT NULL,
  `technical_contact_name` varchar(50) DEFAULT NULL,
  `technical_contact_position` varchar(50) DEFAULT NULL,
  `technical_contact_email` varchar(100) DEFAULT NULL,
  `technical_contact_address` varchar(250) DEFAULT NULL,
  `technical_contact_phone` varchar(12) DEFAULT NULL,
  `logo_url` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) NOT NULL,
  `welcome_text` varchar(255) NOT NULL,
  `version` varchar(10) NOT NULL,
  `remarks` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `database_id` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stratigraphy` (
  `stratigraphy` varchar(150) NOT NULL DEFAULT '',
  `stratigraphy_en` varchar(150) DEFAULT NULL,
  `stratigraphy_ru` varchar(150) DEFAULT NULL,
  `stratigraphy_lv` varchar(150) DEFAULT NULL,
  `stratigraphy_original` varchar(50) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_free` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `etymon` varchar(255) DEFAULT NULL,
  `etymon_en` varchar(255) DEFAULT NULL,
  `original_locality` varchar(255) DEFAULT NULL,
  `original_rank` varchar(100) DEFAULT NULL,
  `index_main` varchar(40) DEFAULT NULL,
  `index_main_html` varchar(50) DEFAULT NULL,
  `index_additional` varchar(40) DEFAULT NULL,
  `index_additional_html` varchar(50) DEFAULT NULL,
  `color_code_cgmw` varchar(10) DEFAULT NULL,
  `color_code_usgs` varchar(10) DEFAULT NULL,
  `color_code_additional` varchar(10) DEFAULT NULL,
  `hierarchy_code` varchar(20) DEFAULT NULL,
  `hierarchy_string` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `rank` tinyint(4) DEFAULT NULL,
  `level` int(11) DEFAULT NULL COMMENT 'primarily for using in section logs, smaller number units go to left',
  `scope` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_en` varchar(255) DEFAULT NULL,
  `lithology` varchar(255) DEFAULT NULL,
  `lithology_en` varchar(255) DEFAULT NULL,
  `max_thickness` float(6,1) DEFAULT NULL COMMENT 'maximum thickenss for lithostratigraphic units and regional chronostratigraphy in meters',
  `biostratigraphy_group_id` int(11) DEFAULT NULL,
  `description` text,
  `description_en` text,
  `definition` text,
  `definition_en` text,
  `synonym_id` int(11) DEFAULT NULL,
  `synonym` varchar(100) DEFAULT NULL,
  `age_base` double(8,2) DEFAULT NULL,
  `age_top` double(8,2) DEFAULT NULL,
  `age_precision` double(8,5) DEFAULT NULL,
  `age_reference_id` int(11) DEFAULT NULL,
  `age_chronostratigraphy` int(11) DEFAULT NULL,
  `sort_within_parent` tinyint(4) DEFAULT NULL,
  `approved_ics` int(11) NOT NULL DEFAULT '0' COMMENT 'for global units - approved by ICS?',
  `approved_esk` int(11) NOT NULL DEFAULT '0' COMMENT 'for regional units - approved by ESK?',
  `has_paleomap` int(1) DEFAULT NULL,
  `paleomap_layers` varchar(255) DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '0' COMMENT 'to be shown on website?',
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 41984 kB';

CREATE TABLE `stratigraphy_reference` (
  `stratigraphy_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `figures` varchar(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `content_en` varchar(255) DEFAULT NULL,
  `age_base` double(10,4) DEFAULT NULL,
  `age_top` double(10,4) DEFAULT NULL,
  `age_base_error` double(10,4) DEFAULT NULL,
  `is_preferred_age` tinyint(1) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `stratigraphy_stratotype` (
  `stratigraphy_id` int(11) NOT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `depth_top` double(8,2) DEFAULT NULL,
  `depth_base` double(8,2) DEFAULT NULL,
  `stratotype_type` tinyint(4) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 50176 kB';

CREATE TABLE `stratigraphy_synonym` (
  `synonym` varchar(100) DEFAULT NULL,
  `synonym_en` varchar(100) DEFAULT NULL,
  `stratigraphy_id` int(11) NOT NULL,
  `language` tinyint(4) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon` (
  `id` int(11) NOT NULL COMMENT 'Taxon ID',
  `taxon` varchar(255) NOT NULL COMMENT 'Taxon name in Latin',
  `author_year` varchar(255) DEFAULT NULL,
  `taxon_epithet` varchar(255) DEFAULT NULL,
  `is_recombined` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'is species recombined into new genus',
  `taxon_full_name` varchar(255) DEFAULT NULL,
  `taxon_original_name` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `fossil_group_id` int(11) DEFAULT NULL,
  `synonym_of` int(11) DEFAULT NULL,
  `synonym_of_reference_id` int(11) DEFAULT NULL,
  `hierarchy_string` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `rank_original` int(11) DEFAULT NULL,
  `type_taxon_id` int(11) DEFAULT NULL,
  `type_taxon` varchar(100) DEFAULT NULL,
  `stratigraphy_base` int(11) DEFAULT NULL,
  `stratigraphy_top` int(11) DEFAULT NULL,
  `in_estonia` tinyint(4) NOT NULL DEFAULT '0',
  `in_baltoscandia` tinyint(11) NOT NULL DEFAULT '0',
  `is_fossil` tinyint(4) NOT NULL DEFAULT '1',
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `is_valid` tinyint(4) NOT NULL DEFAULT '1',
  `is_fossil_group` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `taxon_id_pbdb` int(11) DEFAULT NULL,
  `taxon_id_nrm` varchar(40) DEFAULT NULL,
  `taxon_id_plutof` int(11) DEFAULT NULL,
  `taxon_id_tol` int(11) DEFAULT NULL,
  `taxon_id_eol` int(11) DEFAULT NULL,
  `species_id` int(11) DEFAULT NULL,
  `genus_id` int(11) DEFAULT NULL,
  `remarks` text,
  `owner` varchar(100) DEFAULT NULL,
  `is_authorized` tinyint(4) NOT NULL DEFAULT '0',
  `user_authorized` varchar(25) DEFAULT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='classification of fossils and living things';

CREATE TABLE `taxon_character` (
  `character` varchar(255) DEFAULT NULL,
  `character_en` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_character_key` (
  `taxon_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `character_state_id` int(11) NOT NULL,
  `sample_taxon_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `sort` int(4) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_character_state` (
  `character_id` int(11) NOT NULL,
  `character_state` varchar(255) DEFAULT NULL,
  `character_state_en` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_common_name` (
  `taxon_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` char(2) NOT NULL,
  `language_id` tinyint(4) NOT NULL,
  `is_preferred` tinyint(4) NOT NULL DEFAULT '1',
  `remarks` text,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_description` (
  `taxon_id` int(11) NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `author_free` varchar(255) DEFAULT NULL,
  `date_free` varchar(20) DEFAULT NULL,
  `language_id` tinyint(11) DEFAULT NULL,
  `description` text NOT NULL,
  `remarks` text,
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_image` (
  `taxon_id` int(11) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `link_id` int(11) NOT NULL,
  `sort` int(4) DEFAULT '1000',
  `diagnosis` varchar(255) DEFAULT NULL,
  `diagnosis_en` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_list` (
  `preparation_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `taxon_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `extra` tinyint(1) DEFAULT NULL,
  `agent_identified` int(11) DEFAULT NULL,
  `date_identified` date DEFAULT NULL,
  `date_identified_free` varchar(20) DEFAULT NULL,
  `remarks` text,
  `taxon` varchar(255) DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_occurrence` (
  `taxon_id` int(11) NOT NULL,
  `species_id` int(11) DEFAULT NULL,
  `genus_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `locality_free` varchar(255) DEFAULT NULL,
  `depth` float(8,2) DEFAULT NULL,
  `depth_interval` float(8,2) DEFAULT NULL,
  `geographic_distribution` varchar(255) DEFAULT NULL,
  `geographic_distribution_en` varchar(255) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `stratigraphy_base` int(11) DEFAULT NULL,
  `stratigraphy_base_free` varchar(100) DEFAULT NULL,
  `stratigraphy_top` int(11) DEFAULT NULL,
  `stratigraphy_top_free` varchar(100) DEFAULT NULL,
  `stratigraphic_distribution` varchar(255) DEFAULT NULL,
  `stratigraphic_distribution_en` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `pages` varchar(50) DEFAULT NULL,
  `figures` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_page` (
  `taxon_id` int(11) NOT NULL,
  `language` char(2) NOT NULL,
  `on_frontpage` tinyint(4) NOT NULL DEFAULT '0',
  `frontpage` varchar(100) DEFAULT NULL,
  `frontpage_title` varchar(255) DEFAULT NULL,
  `frontpage_order` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `author` int(11) DEFAULT NULL,
  `author_txt` varchar(255) DEFAULT NULL,
  `date_txt` varchar(25) DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `link_wikipedia` varchar(50) DEFAULT NULL,
  `link_eol` varchar(50) DEFAULT NULL,
  `link_tolweb` varchar(50) DEFAULT NULL,
  `link_plutof` int(11) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_pbdb` (
  `authorizer` varchar(255) DEFAULT NULL,
  `enterer` varchar(255) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `reference_no` int(11) DEFAULT NULL,
  `taxon_no` int(11) NOT NULL,
  `taxon_name` varchar(255) NOT NULL,
  `spelling_reason` varchar(255) DEFAULT NULL,
  `common_name` varchar(255) DEFAULT NULL,
  `taxon_rank` varchar(255) DEFAULT NULL,
  `original_taxon_no` int(11) DEFAULT NULL,
  `original_taxon_name` varchar(255) DEFAULT NULL,
  `original_taxon_rank` varchar(255) DEFAULT NULL,
  `author1init` varchar(255) DEFAULT NULL,
  `author1last` varchar(255) DEFAULT NULL,
  `author2init` varchar(255) DEFAULT NULL,
  `author2last` varchar(255) DEFAULT NULL,
  `otherauthors` varchar(255) DEFAULT NULL,
  `pubyr` varchar(255) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `figures` varchar(255) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `extant` varchar(255) DEFAULT NULL,
  `preservation` varchar(255) DEFAULT NULL,
  `type_taxon` varchar(255) DEFAULT NULL,
  `type_specimen` varchar(255) DEFAULT NULL,
  `type_body_part` varchar(255) DEFAULT NULL,
  `part_details` varchar(255) DEFAULT NULL,
  `comments` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_rank` (
  `rank` varchar(25) NOT NULL,
  `rank_en` varchar(25) DEFAULT NULL,
  `rank_sv` varchar(25) DEFAULT NULL,
  `rank_fi` varchar(25) DEFAULT NULL,
  `rank_la` varchar(25) DEFAULT NULL,
  `rank_short` varchar(10) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL,
  `id` int(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_search` (
  `taxon_id` int(11) NOT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `locality_en` varchar(255) DEFAULT NULL,
  `locality_free` varchar(255) DEFAULT NULL,
  `depth` float(8,2) DEFAULT NULL,
  `depth_interval` float(8,2) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `country_en` varchar(100) DEFAULT NULL,
  `maakond` varchar(100) DEFAULT NULL,
  `vald` varchar(100) DEFAULT NULL,
  `asustusyksus` varchar(100) DEFAULT NULL,
  `stratigraphy_base` int(11) DEFAULT NULL,
  `stratigraphy_top` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `specimen_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `has_images` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_synonym` (
  `taxon_id` int(11) NOT NULL,
  `taxon_synonym` varchar(255) DEFAULT NULL,
  `synonym_id` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `author_year` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `pages` varchar(50) DEFAULT NULL,
  `figures` varchar(50) DEFAULT NULL,
  `remarks` text,
  `id` int(11) NOT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_type_specimen` (
  `taxon_id` int(11) NOT NULL,
  `type_type` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `repository` varchar(100) DEFAULT NULL COMMENT 'use institutional abbreviation where possible (GIT, TUG, ELM in Estonia)',
  `specimen_id` int(11) DEFAULT NULL COMMENT 'fill only if specimen is registered in SARV',
  `specimen_number` varchar(25) DEFAULT NULL COMMENT 'tüüpeksemplari unikaalne number',
  `locality_id` int(11) DEFAULT NULL,
  `locality_free` varchar(255) DEFAULT NULL,
  `locality_free_en` varchar(255) DEFAULT NULL,
  `stratigraphy_id` int(11) DEFAULT NULL COMMENT 'type horizon (formal)',
  `stratigraphy_free` varchar(255) DEFAULT NULL,
  `stratigraphy_free_en` varchar(255) DEFAULT NULL,
  `remarks` text,
  `id` int(11) NOT NULL,
  `user_added` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(10) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxon_type_type` (
  `value` varchar(25) DEFAULT NULL,
  `value_en` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `visit` (
  `visitor_id` int(11) DEFAULT NULL,
  `visitor_free` varchar(255) DEFAULT NULL,
  `visitor_institution_id` int(11) DEFAULT NULL,
  `visitor_country_id` int(11) DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL,
  `date_arrived` date DEFAULT NULL,
  `date_left` date DEFAULT NULL,
  `purpose` text,
  `collections_studied` varchar(255) DEFAULT NULL,
  `items_studied` int(11) DEFAULT NULL,
  `remarks` text,
  `database_id` tinyint(4) NOT NULL DEFAULT '1',
  `user_created_id` int(11) DEFAULT NULL,
  `timestamp_created` timestamp NULL DEFAULT NULL,
  `user_modified_id` int(11) DEFAULT NULL,
  `timestamp_modified` timestamp NULL DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to store information on visitors who have used or stud';

CREATE TABLE `web_fossilgroups` (
  `classification_id` int(11) NOT NULL,
  `primary_fossilgroup` tinyint(4) NOT NULL DEFAULT '0',
  `frontpage_et` varchar(100) DEFAULT NULL,
  `frontpage_title_et` varchar(255) DEFAULT NULL,
  `title_et` varchar(100) DEFAULT NULL,
  `content_et` text,
  `link_et` varchar(100) DEFAULT NULL,
  `frontpage_en` varchar(100) DEFAULT NULL,
  `frontpage_title_en` varchar(255) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `content_en` text,
  `link_en` varchar(100) DEFAULT NULL,
  `frontpage_se` varchar(100) DEFAULT NULL,
  `frontpage_title_se` varchar(255) DEFAULT NULL,
  `title_se` varchar(100) DEFAULT NULL,
  `content_se` text,
  `link_se` varchar(100) DEFAULT NULL,
  `frontpage_fi` varchar(100) DEFAULT NULL,
  `frontpage_title_fi` varchar(255) DEFAULT NULL,
  `title_fi` varchar(100) DEFAULT NULL,
  `content_fi` text,
  `link_fi` varchar(100) DEFAULT NULL,
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `menu` tinyint(4) NOT NULL DEFAULT '0',
  `menu_fold` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `parent` int(11) DEFAULT '0',
  `link_wikipedia_et` varchar(50) DEFAULT NULL,
  `link_wikipedia_en` varchar(50) DEFAULT NULL,
  `link_eol` varchar(50) DEFAULT NULL,
  `link_tolweb` varchar(50) DEFAULT NULL,
  `link_plutof` int(11) DEFAULT NULL,
  `user_added` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_changed` varchar(20) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `accession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_andis_id` (`agent_andis_id`),
  ADD KEY `agent_vottis_id` (`agent_vottis_id`),
  ADD KEY `agent_kinnitas_id` (`agent_kinnitas_id`),
  ADD KEY `database_id` (`database_id`);

ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agent` (`agent`),
  ADD UNIQUE KEY `agent_en` (`agent_en`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `type` (`type`),
  ADD KEY `isikukood` (`isikukood`),
  ADD KEY `privileges` (`privileges`),
  ADD KEY `country_id` (`country_id`);

ALTER TABLE `agent_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_id` (`sample_id`),
  ADD KEY `owner_id` (`owner_id`,`private`),
  ADD KEY `specimen_id` (`specimen_id`),
  ADD KEY `lab_id` (`lab_id`,`instrument_id`),
  ADD KEY `lab_analysis_number` (`lab_analysis_number`),
  ADD KEY `material` (`material`),
  ADD KEY `sample_id_temp` (`sample_id_temp`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `instrument_id` (`instrument_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `method` (`method`),
  ADD KEY `dataset_id` (`dataset_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `parent_analysis_id` (`parent_analysis_id`),
  ADD KEY `counts` (`counts`),
  ADD KEY `location` (`location`),
  ADD KEY `sample_palaeontology_id` (`id_sample_palaeontology`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `is_private` (`is_private`);

ALTER TABLE `analysis_method`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`method`),
  ADD UNIQUE KEY `value_en` (`method_en`),
  ADD KEY `parent_method` (`parent_method`);

ALTER TABLE `analysis_parameter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parameter` (`parameter`),
  ADD UNIQUE KEY `value` (`parameter_name`),
  ADD UNIQUE KEY `value_en` (`parameter_name_en`),
  ADD KEY `parent_method` (`parent_parameter`);

ALTER TABLE `analysis_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preparation_id` (`analysis_id`),
  ADD KEY `frequency` (`value`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `value_binary` (`value_bin`,`value_txt`),
  ADD KEY `value_min` (`value_min`),
  ADD KEY `value_max` (`value_max`),
  ADD KEY `parameter_id` (`parameter_id`),
  ADD KEY `value_error` (`value_error`);

ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classified` (`is_private`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `agent_digitised_id` (`agent_provided_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `name` (`name`),
  ADD KEY `name_en` (`name_en`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `parent_id` (`parent_id`);

ALTER TABLE `attachment`
  ADD PRIMARY KEY (`attachment_id`),
  ADD UNIQUE KEY `filename` (`filename`) USING BTREE,
  ADD UNIQUE KEY `uuid_filename` (`uuid_filename`) USING BTREE,
  ADD KEY `author_id` (`author_id`),
  ADD KEY `type` (`type`),
  ADD KEY `agent_digitised_id` (`agent_digitised_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `specimen_id` (`specimen_id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `format` (`format`),
  ADD KEY `old_filename` (`original_filename`),
  ADD KEY `tags` (`tags`),
  ADD KEY `copyright_agent_id` (`copyright_agent_id`),
  ADD KEY `licence_id` (`licence_id`),
  ADD KEY `drillcore_id` (`drillcore_id`),
  ADD KEY `drillcore_image_id` (`drillcore_image_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `device_digitised_id` (`device_digitised_id`),
  ADD KEY `imageset_id` (`imageset_id`),
  ADD KEY `image_category` (`image_category`),
  ADD KEY `image_type` (`image_type`),
  ADD KEY `specimen_image_id` (`specimen_image_id`),
  ADD KEY `specimen_image_attachment` (`specimen_image_attachment`),
  ADD KEY `title` (`title`),
  ADD KEY `title_en` (`title_en`);

ALTER TABLE `attachment_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_id` (`attachment_id`),
  ADD KEY `collection_id` (`collection_id`),
  ADD KEY `specimen_id` (`specimen_id`),
  ADD KEY `sample_id` (`sample_id`),
  ADD KEY `analysis_id` (`analysis_id`),
  ADD KEY `dataset_id` (`dataset_id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `preparation_id` (`preparation_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `doi_id` (`doi_id`),
  ADD KEY `archive_id` (`archive_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `sample_series_id` (`sample_series_id`),
  ADD KEY `drillcore_id` (`drillcore_id`),
  ADD KEY `drillcore_box_id` (`drillcore_box_id`);

ALTER TABLE `classification_rock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class` (`class`),
  ADD UNIQUE KEY `class_en` (`class_en`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `rank` (`rank`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `hierarchy_string` (`hierarchy_string`),
  ADD KEY `sort` (`sort`),
  ADD KEY `class_lat` (`class_synonym`,`class_en_synonym`),
  ADD KEY `node_editor` (`node_editor`),
  ADD KEY `name_en` (`name_en`);

ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Index_6` (`name`),
  ADD UNIQUE KEY `number` (`number`),
  ADD UNIQUE KEY `collection_id` (`collection_id`,`database_id`),
  ADD UNIQUE KEY `id_elm` (`id_elm`),
  ADD UNIQUE KEY `id_tug` (`id_tug`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `stratigraphy_id` (`stratigraphy_id`),
  ADD KEY `name_long` (`name_long`),
  ADD KEY `name_en` (`name_en`),
  ADD KEY `name_long_en` (`name_long_en`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `acronym` (`acronym`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `permissions` (`permissions`),
  ADD KEY `gid` (`gid`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `database`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acronym_UNIQUE` (`acronym`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `name_en_UNIQUE` (`name_en`);

ALTER TABLE `dataset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `private` (`is_private`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `name_en` (`name_en`),
  ADD KEY `copyright_agent_id` (`copyright_agent_id`,`licence_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `licence_id` (`licence_id`);

ALTER TABLE `dataset_analysis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dataset_analysis` (`dataset_id`,`analysis_id`),
  ADD KEY `analysis_id` (`analysis_id`),
  ADD KEY `dataset_id` (`dataset_id`);

ALTER TABLE `dataset_author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dataset_reference` (`dataset_id`,`agent_id`),
  ADD KEY `reference_id` (`agent_id`);

ALTER TABLE `dataset_reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dataset_reference` (`dataset_id`,`reference_id`),
  ADD KEY `reference_id` (`reference_id`);

ALTER TABLE `deaccession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_andis_id` (`agent_kandis_id`),
  ADD KEY `agent_kinnitas_id` (`agent_kinnitas_id`),
  ADD KEY `database_id` (`database_id`);

ALTER TABLE `device`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `database_id` (`database_id`);

ALTER TABLE `doi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `private` (`is_private`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `copyright_agent_id` (`copyright_agent_id`,`licence_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `licence_id` (`licence_id`),
  ADD KEY `creators` (`creators`(255)),
  ADD KEY `dataset_id` (`dataset_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `language` (`language`),
  ADD KEY `resource_type` (`resource_type`),
  ADD KEY `resource` (`resource`),
  ADD KEY `datacite_created` (`datacite_created`),
  ADD KEY `datacite_updated` (`datacite_updated`);

ALTER TABLE `doi_agent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doi_id` (`doi_id`),
  ADD KEY `name` (`name`),
  ADD KEY `affiliation` (`affiliation`),
  ADD KEY `agent_type` (`agent_type`),
  ADD KEY `agent_id` (`agent_id`);

ALTER TABLE `doi_agent_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`value`);

ALTER TABLE `doi_date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`doi_id`),
  ADD KEY `date` (`date`),
  ADD KEY `date_type` (`date_type`);

ALTER TABLE `doi_date_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`value`);

ALTER TABLE `doi_geolocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`doi_id`),
  ADD KEY `point` (`point`,`box`,`place`),
  ADD KEY `locality_id` (`locality_id`);

ALTER TABLE `doi_related_identifier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier_type` (`identifier_type`),
  ADD KEY `relation_type` (`relation_type`),
  ADD KEY `value` (`value`),
  ADD KEY `identifier` (`doi_id`);

ALTER TABLE `doi_related_identifier_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`value`);

ALTER TABLE `doi_relation_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`value`);

ALTER TABLE `doi_resource_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`value`);

ALTER TABLE `drillcore`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drillcore` (`drillcore`),
  ADD UNIQUE KEY `drillcore_en` (`drillcore_en`),
  ADD UNIQUE KEY `locality_id` (`locality_id`),
  ADD KEY `storage` (`storage`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `direction_lr` (`direction_lr`),
  ADD KEY `location` (`location`),
  ADD KEY `uid` (`uid`),
  ADD KEY `gid` (`gid`),
  ADD KEY `permissions` (`is_private`),
  ADD KEY `storage_id` (`storage_id`);

ALTER TABLE `drillcore_box`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drillcore_id` (`drillcore_id`),
  ADD KEY `number` (`number`),
  ADD KEY `stratigraphy_base` (`stratigraphy_base`,`stratigraphy_top`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `location` (`location`),
  ADD KEY `stratigraphy_top` (`stratigraphy_top`),
  ADD KEY `storage_id` (`storage_id`);

ALTER TABLE `drillcore_image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image` (`image`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `drillcore_box_id` (`drillcore_box_id`),
  ADD KEY `drillcore_id` (`drillcore_id`),
  ADD KEY `drillcore_box_number` (`drillcore_box_number`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `location` (`location`),
  ADD KEY `public` (`public`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `is_preferred` (`is_preferred`);

ALTER TABLE `drillcore_study`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drillcore_id` (`drillcore_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `database_id` (`database_id`);

ALTER TABLE `imageset`
  ADD PRIMARY KEY (`imageset_id`),
  ADD UNIQUE KEY `number` (`imageset_number`),
  ADD KEY `device` (`device_id`),
  ADD KEY `keywords` (`keywords`),
  ADD KEY `FK_imageset_1` (`author_id`),
  ADD KEY `type` (`type`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `location` (`location`),
  ADD KEY `image_category` (`image_category`),
  ADD KEY `imageset_series` (`imageset_series`),
  ADD KEY `device_digitised_id` (`device_digitised_id`,`agent_digitised_id`),
  ADD KEY `public` (`classified`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `device_digitised_id_2` (`device_digitised_id`),
  ADD KEY `agent_digitised_id` (`agent_digitised_id`),
  ADD KEY `object` (`object`),
  ADD KEY `place` (`place`),
  ADD KEY `location_2` (`location`),
  ADD KEY `is_private` (`is_private`);

ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `journal` (`journal`),
  ADD KEY `journal_short` (`journal_short`),
  ADD KEY `journal_previous_name` (`former_journal_id`),
  ADD KEY `following_journal_id` (`following_journal_id`),
  ADD KEY `journal_abbr` (`journal_abbr`),
  ADD KEY `journal_original` (`journal_original`);

ALTER TABLE `lab`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lab` (`lab`,`lab_en`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `user_added` (`user_added`,`user_changed`);

ALTER TABLE `lab_instrument`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lab` (`instrument`,`instrument_en`),
  ADD KEY `institution_id` (`lab_id`),
  ADD KEY `user_added` (`user_added`,`user_changed`);

ALTER TABLE `list_acquisition_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_agent_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_asustusyksus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index_2` (`asustusyksus`),
  ADD KEY `Index_3` (`asustusyksus_en`),
  ADD KEY `Index_4` (`mkood`),
  ADD KEY `vkood` (`vkood`,`akood`);

ALTER TABLE `list_attachment_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_classification_rank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD UNIQUE KEY `value_en` (`value_en`);

ALTER TABLE `list_collection_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_coordinate_method`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_coordinate_precision`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD UNIQUE KEY `value_en` (`value_en`);

ALTER TABLE `list_drillcore_storage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_history_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_identification_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_image_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`),
  ADD KEY `parent_id` (`parent_id`);

ALTER TABLE `list_image_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`),
  ADD UNIQUE KEY `iso639_1` (`iso_639_1`),
  ADD UNIQUE KEY `iso_639_2t` (`iso_639_2t`);

ALTER TABLE `list_licence`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`licence`),
  ADD UNIQUE KEY `value_en` (`licence_en`);

ALTER TABLE `list_loan_delivery_method`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_loan_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_locality_extent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_locality_reference_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_locality_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_maakond`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index_2` (`maakond`),
  ADD KEY `Index_3` (`maakond_en`),
  ADD KEY `Index_4` (`mkood`);

ALTER TABLE `list_mime_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`file_extension`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_palaeontology_method`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_reference_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_sample_purpose`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_specimen_kind`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`),
  ADD UNIQUE KEY `value_biocase` (`value_biocase`);

ALTER TABLE `list_specimen_original_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_specimen_presence`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_specimen_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_specimen_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_stratigraphy_rank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_stratigraphy_scope`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_stratigraphy_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_stratigraphy_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_stratotype_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `list_vald`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index_2` (`vald`),
  ADD KEY `Index_3` (`vald_en`),
  ADD KEY `Index_4` (`vkood`),
  ADD KEY `vkood` (`mkood`);

ALTER TABLE `list_visibility`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD UNIQUE KEY `value_en` (`value_en`);

ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`),
  ADD UNIQUE KEY `loan_number` (`loan_number`),
  ADD KEY `type` (`type`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `loaner_id` (`loaner_id`),
  ADD KEY `delivery_method` (`delivery_method`,`deliverer_id`),
  ADD KEY `FK_loan_4` (`deliverer_id`),
  ADD KEY `date_returned` (`date_returned`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `borrower_institution_id` (`borrower_institution_id`);

ALTER TABLE `loan_sample`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_id` (`loan_id`,`sample_id`),
  ADD KEY `FK_loan_specimen_2` (`sample_id`),
  ADD KEY `database_id` (`database_id`);

ALTER TABLE `loan_specimen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_id` (`loan_id`,`specimen_id`),
  ADD KEY `FK_loan_specimen_2` (`specimen_id`),
  ADD KEY `database_id` (`database_id`);

ALTER TABLE `locality`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locality` (`locality`),
  ADD UNIQUE KEY `locality_en` (`locality_en`),
  ADD KEY `number` (`number`),
  ADD KEY `stratigraphy_id_start` (`stratigraphy_id_start`,`stratigraphy_id_end`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `maakond_id` (`maakond_id`),
  ADD KEY `vald_id` (`vald_id`),
  ADD KEY `asustusyksus_id` (`asustusyksus_id`),
  ADD KEY `keskkonnaregister` (`eelis`),
  ADD KEY `maaamet_pa_id` (`maaamet_pa_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `stratigraphy_base` (`stratigraphy_base`,`stratigraphy_top`),
  ADD KEY `x` (`x`,`y`),
  ADD KEY `type` (`type`),
  ADD KEY `latitude` (`latitude`),
  ADD KEY `longitude` (`longitude`),
  ADD KEY `coord_system` (`coord_system`),
  ADD KEY `y` (`y`),
  ADD KEY `x_2` (`x`),
  ADD KEY `stratigraphy_top` (`stratigraphy_top`),
  ADD KEY `stratigraphy_top_free` (`stratigraphy_top_free`),
  ADD KEY `stratigraphy_base_free` (`stratigraphy_base_free`),
  ADD KEY `extent` (`extent`),
  ADD KEY `coord_det_precision` (`coord_det_precision`),
  ADD KEY `coord_det_method` (`coord_det_method`),
  ADD KEY `coord_det_agent` (`coord_det_agent`),
  ADD KEY `elevation` (`elevation`),
  ADD KEY `depth` (`depth`);

ALTER TABLE `locality_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `stratigraphy_id` (`stratigraphy_id`),
  ADD KEY `depth_base` (`depth_base`,`depth_top`),
  ADD KEY `thickness` (`thickness`),
  ADD KEY `rock_id` (`rock_id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `rock_name` (`rock_name`),
  ADD KEY `rock_name_en` (`rock_name_en`),
  ADD KEY `keywords` (`keywords`);

ALTER TABLE `locality_image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rock_id` (`locality_id`,`attachment_id`),
  ADD KEY `taxon_id` (`locality_id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `attachment_id` (`attachment_id`);

ALTER TABLE `locality_parameter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `parameter` (`parameter`);

ALTER TABLE `locality_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `type` (`type`);

ALTER TABLE `locality_stratigraphy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `stratigraphy_id` (`stratigraphy_id`),
  ADD KEY `depth_base` (`depth_base`,`depth_top`),
  ADD KEY `thickness` (`thickness`),
  ADD KEY `is_private` (`is_private`);

ALTER TABLE `locality_synonym`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `publication_id` (`reference_id`),
  ADD KEY `synonym` (`synonym`),
  ADD KEY `language` (`language`);

ALTER TABLE `locality_taxon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `taxon_2` (`taxon`);

ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location_2` (`location`,`database_id`),
  ADD UNIQUE KEY `location_new` (`location_new`),
  ADD UNIQUE KEY `location` (`location`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `location_location` (`location_location`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `location_old` (`location_old`);

ALTER TABLE `preparation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `preparation_number` (`preparation_number`),
  ADD KEY `sample_id` (`sample_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `identification_agent_id` (`identification_agent_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `public` (`public`),
  ADD KEY `sample_palaeontology_id` (`sample_palaeontology_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `location` (`location`),
  ADD KEY `analysis_id` (`analysis_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `is_private` (`is_private`);

ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `author` (`author`),
  ADD KEY `type` (`type`),
  ADD KEY `journal` (`journal`),
  ADD KEY `title` (`title`(255)),
  ADD KEY `doi` (`doi`),
  ADD KEY `journal_id` (`journal_id`),
  ADD KEY `year` (`year`),
  ADD KEY `language` (`language`),
  ADD KEY `title_original` (`title_original`(255)),
  ADD KEY `tags` (`tags`),
  ADD KEY `is_oa` (`is_oa`),
  ADD KEY `is_private` (`is_private`);

ALTER TABLE `reference_keyword`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference_id_2` (`reference_id`,`keyword`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `user_added` (`user_added`),
  ADD KEY `user_changed` (`user_changed`);

ALTER TABLE `rock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `name_en` (`name_en`),
  ADD KEY `is_resource` (`is_resource`),
  ADD KEY `type_id` (`rock_type_id`),
  ADD KEY `stratigraphy_id` (`stratigraphy_id`),
  ADD KEY `lithostratigraphy_id` (`lithostratigraphy_id`),
  ADD KEY `formula` (`formula`),
  ADD KEY `ima_status` (`ima_status`),
  ADD KEY `rock_rank_id` (`rock_rank_id`),
  ADD KEY `mineral_id` (`mineral_id`);

ALTER TABLE `rock_classification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hierarchy_top_rock_id` (`hierarchy_top_rock_id`),
  ADD KEY `reference_id` (`reference_id`);

ALTER TABLE `rock_image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rock_id` (`rock_id`,`attachment_id`,`link_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `taxon_id` (`rock_id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `attachment_id` (`attachment_id`);

ALTER TABLE `rock_locality`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bbb` (`rock_id`,`locality_id`),
  ADD UNIQUE KEY `eee` (`rock_id`,`locality_id`),
  ADD KEY `image_id` (`locality_id`),
  ADD KEY `taxon_id` (`rock_id`),
  ADD KEY `sort` (`sort`);

ALTER TABLE `rock_mineral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rock_id` (`rock_id`),
  ADD KEY `mineral_id` (`mineral_id`),
  ADD KEY `is_primary` (`is_primary`),
  ADD KEY `mineral_type_id` (`mineral_type_id`);

ALTER TABLE `rock_mineral_type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rock_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rock_id` (`rock_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `property_type_id` (`property_type_id`);

ALTER TABLE `rock_property_type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rock_rank`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rock_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`rock_id`),
  ADD KEY `reference_id` (`reference_id`);

ALTER TABLE `rock_synonym`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`language_id`),
  ADD KEY `taxon_id` (`rock_id`),
  ADD KEY `is_preferred` (`is_preferred`),
  ADD KEY `language` (`language_id`),
  ADD KEY `reference` (`reference_id`);

ALTER TABLE `rock_tree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rock_id` (`rock_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `rock_classification_id` (`rock_classification_id`);

ALTER TABLE `rock_type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sample`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_temp` (`id_temp`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `depth` (`depth`),
  ADD KEY `agent_collected_id` (`agent_collected_id`),
  ADD KEY `number` (`number`),
  ADD KEY `stratigraphy_id` (`stratigraphy_id`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `public` (`public`),
  ADD KEY `FK_sample_location` (`location`),
  ADD KEY `sample_purpose` (`sample_purpose`),
  ADD KEY `lithostratigraphy_id` (`lithostratigraphy_id`),
  ADD KEY `parent_sample_id` (`parent_sample_id`),
  ADD KEY `parent_specimen_id` (`parent_specimen_id`),
  ADD KEY `stratigraphy_bed` (`stratigraphy_bed`),
  ADD KEY `epsg` (`epsg`,`coordinate_accuracy`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `classification_rock_id` (`classification_rock_id`),
  ADD KEY `number_additional` (`number_additional`),
  ADD KEY `number_field` (`number_field`),
  ADD KEY `location_additional` (`location_additional`),
  ADD KEY `soil_locality_id` (`soil_site_id`),
  ADD KEY `soil_horizon_id` (`soil_horizon`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `storage_additional_id` (`storage_additional_id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `locality_free` (`locality_free`),
  ADD KEY `user_added_id` (`user_created_id`),
  ADD KEY `user_changed_id` (`user_updated_id`),
  ADD KEY `timestamp_added` (`timestamp_created`),
  ADD KEY `timestamp_changed` (`timestamp_updated`),
  ADD KEY `rock_id` (`rock_id`);

ALTER TABLE `sample_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_id` (`sample_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `is_editable` (`is_editable`);

ALTER TABLE `sample_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `sample_id` (`sample_id`);

ALTER TABLE `sample_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `depth` (`depth_top`),
  ADD KEY `agent_collected_id` (`agent_collected_id`),
  ADD KEY `number` (`sample_count`),
  ADD KEY `stratigraphy_id` (`stratigraphy_top_id`),
  ADD KEY `name` (`name`),
  ADD KEY `number_prefix` (`number_prefix`),
  ADD KEY `number_start` (`number_start`),
  ADD KEY `stratigraphy_base_id` (`stratigraphy_base_id`),
  ADD KEY `location` (`location`),
  ADD KEY `owner_id` (`owner_id`,`public`),
  ADD KEY `database_id` (`database_id`);

ALTER TABLE `sample_series_reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key1` (`sample_series_id`,`reference_id`),
  ADD KEY `FK_sample_series_reference_2` (`reference_id`);

ALTER TABLE `sarv_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_id` (`table_id`),
  ADD KEY `fk_table` (`fk_table`),
  ADD KEY `sortorder` (`sortorder`);

ALTER TABLE `search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table` (`search_table`),
  ADD KEY `search` (`search_string`),
  ADD KEY `id` (`search_id`),
  ADD KEY `field` (`search_field`);

ALTER TABLE `section_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`,`private`),
  ADD KEY `lab_id` (`lab_id`,`instrument_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `instrument_id` (`instrument_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `method` (`method`),
  ADD KEY `dataset_id` (`locality_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `counts` (`counts`),
  ADD KEY `parameter_id` (`parameter_id`),
  ADD KEY `parameter` (`parameter`);

ALTER TABLE `section_log_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preparation_id` (`section_log_id`),
  ADD KEY `frequency` (`value`),
  ADD KEY `value_min` (`value_min`),
  ADD KEY `value_max` (`value_max`),
  ADD KEY `depth` (`depth`);

ALTER TABLE `selection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `row_id` (`row_id`),
  ADD KEY `selection_id` (`selection_id`);

ALTER TABLE `selection_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablename` (`tablename`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `name` (`name`),
  ADD KEY `remarks` (`remarks`);

ALTER TABLE `soil_horizon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `soil_locality_id` (`soil_site_id`);

ALTER TABLE `soil_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locality` (`site`),
  ADD KEY `number` (`number`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `x` (`x`,`y`),
  ADD KEY `type` (`type`),
  ADD KEY `latitude` (`latitude`),
  ADD KEY `longitude` (`longitude`),
  ADD KEY `coord_system` (`coord_system`),
  ADD KEY `y` (`y`),
  ADD KEY `x_2` (`x`),
  ADD KEY `extent` (`extent`),
  ADD KEY `coord_det_precision` (`coord_det_precision`),
  ADD KEY `coord_det_method` (`coord_det_method`),
  ADD KEY `coord_det_agent` (`coord_det_agent`),
  ADD KEY `elevation` (`elevation`),
  ADD KEY `locality_en` (`site_en`),
  ADD KEY `is_deep` (`is_deep`);

ALTER TABLE `specimen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `specimen_id` (`specimen_id`,`database_id`) USING BTREE,
  ADD KEY `stratigraphy_id` (`stratigraphy_id`),
  ADD KEY `sample_number` (`sample_number`),
  ADD KEY `depth` (`depth`),
  ADD KEY `type` (`type`),
  ADD KEY `specimen_nr` (`specimen_nr`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `original_status` (`original_status`),
  ADD KEY `collection_id` (`collection_id`),
  ADD KEY `agent_collected_id` (`agent_collected_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `status` (`status`),
  ADD KEY `presence` (`presence`),
  ADD KEY `agent_acquired_id` (`agent_acquired_id`),
  ADD KEY `fossil` (`fossil`),
  ADD KEY `FK_specimen_aquisition_type` (`acquisition_type`),
  ADD KEY `sample_id` (`sample_id`),
  ADD KEY `FK_specimen_mahakandmine` (`akt_mahakandmine_id`),
  ADD KEY `akt_vastuvott_id` (`akt_vastuvott_id`),
  ADD KEY `locality_free` (`locality_free`),
  ADD KEY `agent_collected_free` (`agent_collected_free`),
  ADD KEY `lithostratigraphy_id` (`lithostratigraphy_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `classified` (`classified`),
  ADD KEY `coll_id` (`coll_id`),
  ADD KEY `number` (`number`),
  ADD KEY `permissions` (`permissions`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `locality_free_2` (`locality_free`),
  ADD KEY `locality_is_private` (`locality_is_private`),
  ADD KEY `is_private` (`is_private`);

ALTER TABLE `specimen_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `specimen_id` (`specimen_id`);

ALTER TABLE `specimen_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specimen_id` (`specimen_id`);

ALTER TABLE `specimen_identification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `name` (`name`),
  ADD KEY `specimen_id` (`specimen_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `current` (`current`),
  ADD KEY `type` (`type`);

ALTER TABLE `specimen_identification_geology`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `current` (`current`),
  ADD KEY `rock_id` (`rock_id`),
  ADD KEY `name_en` (`name_en`),
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `specimen` (`specimen_id`) USING BTREE,
  ADD KEY `type` (`type`);

ALTER TABLE `specimen_image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `specimen_id` (`specimen_id`),
  ADD KEY `public` (`public`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `stars` (`stars`),
  ADD KEY `device_digitised_id` (`device_digitised_id`,`agent_digitised_id`),
  ADD KEY `tags` (`tags`),
  ADD KEY `copyright_agent_id` (`copyright_agent_id`,`licence_id`),
  ADD KEY `copyright_agent_id_2` (`copyright_agent_id`),
  ADD KEY `licence_id` (`licence_id`),
  ADD KEY `agent_digitised_id` (`agent_digitised_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `image` (`image`);

ALTER TABLE `specimen_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specimen_id` (`specimen_id`),
  ADD KEY `number` (`number`),
  ADD KEY `location` (`location`),
  ADD KEY `type` (`type`),
  ADD KEY `storage_id` (`storage_id`);

ALTER TABLE `specimen_reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key1` (`specimen_id`,`reference_id`),
  ADD KEY `FK_specimen_reference_1` (`reference_id`);

ALTER TABLE `static_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `homepage` (`homepage`),
  ADD UNIQUE KEY `institution_en` (`institution_en`),
  ADD UNIQUE KEY `institution_et` (`institution_et`),
  ADD UNIQUE KEY `acro` (`acronym`),
  ADD UNIQUE KEY `database_id` (`database_id`),
  ADD KEY `collection_source_id` (`collection_source_id`);

ALTER TABLE `stratigraphy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stratigraphy` (`stratigraphy`),
  ADD UNIQUE KEY `hierarchy_code` (`hierarchy_code`),
  ADD UNIQUE KEY `hierarchy_string` (`hierarchy_string`),
  ADD KEY `type` (`type`),
  ADD KEY `rank` (`rank`),
  ADD KEY `scope` (`scope`),
  ADD KEY `status` (`status`),
  ADD KEY `stratigraphy_synonym_id` (`synonym_id`),
  ADD KEY `biostratigraphy_group_id` (`biostratigraphy_group_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `age_chronostratigraphy` (`age_chronostratigraphy`),
  ADD KEY `synonym` (`synonym`),
  ADD KEY `sort_within_parent` (`sort_within_parent`),
  ADD KEY `approved_ics` (`approved_ics`,`approved_esk`,`private`),
  ADD KEY `has_paleomap` (`has_paleomap`),
  ADD KEY `max_thickenss` (`max_thickness`),
  ADD KEY `index_main_html` (`index_main_html`),
  ADD KEY `index_additional_html` (`index_additional_html`),
  ADD KEY `level` (`level`),
  ADD KEY `is_private` (`is_private`);

ALTER TABLE `stratigraphy_reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stratigraphy_reference` (`stratigraphy_id`,`reference_id`),
  ADD KEY `locality_id` (`stratigraphy_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `type` (`type`),
  ADD KEY `is_preferred_age` (`is_preferred_age`),
  ADD KEY `age_base_error` (`age_base_error`),
  ADD KEY `age_base` (`age_base`),
  ADD KEY `age_top` (`age_top`);

ALTER TABLE `stratigraphy_stratotype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`stratigraphy_id`),
  ADD KEY `reference_id` (`locality_id`),
  ADD KEY `type` (`stratotype_type`),
  ADD KEY `FK_stratigraphy_stratotype_3` (`reference_id`);

ALTER TABLE `stratigraphy_synonym`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index_2` (`stratigraphy_id`),
  ADD KEY `Index_3` (`synonym`),
  ADD KEY `language` (`language`,`reference_id`),
  ADD KEY `synonym_en_2` (`synonym_en`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `user_added` (`user_added`,`user_changed`);

ALTER TABLE `taxon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxon_2` (`taxon`),
  ADD UNIQUE KEY `hierarchy_string_UNIQUE` (`hierarchy_string`),
  ADD UNIQUE KEY `species_id_UNIQUE` (`species_id`),
  ADD UNIQUE KEY `taxon_full_name_UNIQUE` (`taxon_full_name`),
  ADD UNIQUE KEY `taxon_id_plutof_UNIQUE` (`taxon_id_plutof`),
  ADD UNIQUE KEY `taxon_id_nrm` (`taxon_id_nrm`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `genus_id_UNIQUE` (`genus_id`),
  ADD KEY `species_epithet` (`taxon_epithet`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `is_fossil_group` (`is_fossil_group`),
  ADD KEY `type_taxon_id` (`type_taxon_id`),
  ADD KEY `synonym_of_reference_id` (`synonym_of_reference_id`),
  ADD KEY `synonym_of` (`synonym_of`),
  ADD KEY `taxon_original_name` (`taxon_original_name`),
  ADD KEY `rank_original` (`rank_original`),
  ADD KEY `taxon_id_pbdb_UNIQUE` (`taxon_id_pbdb`),
  ADD KEY `in_baltoscandia` (`in_baltoscandia`),
  ADD KEY `strat1` (`stratigraphy_base`),
  ADD KEY `strat2` (`stratigraphy_top`),
  ADD KEY `author_year` (`author_year`),
  ADD KEY `is_recombined` (`is_recombined`),
  ADD KEY `taxon_id_tol` (`taxon_id_tol`,`taxon_id_eol`),
  ADD KEY `in_estonia` (`in_estonia`),
  ADD KEY `is_fossil` (`is_fossil`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `is_valid` (`is_valid`),
  ADD KEY `fossil_group_id` (`fossil_group_id`),
  ADD KEY `rank` (`rank`);

ALTER TABLE `taxon_character`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character` (`character`),
  ADD KEY `character_en` (`character_en`);

ALTER TABLE `taxon_character_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eee` (`taxon_id`,`character_id`,`character_state_id`),
  ADD KEY `image_id` (`character_id`),
  ADD KEY `link_id` (`character_state_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `image_id_2` (`image_id`),
  ADD KEY `sample_taxon_id` (`sample_taxon_id`);

ALTER TABLE `taxon_character_state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_state` (`character_state`),
  ADD KEY `character_state_en` (`character_state_en`),
  ADD KEY `eee` (`character_id`);

ALTER TABLE `taxon_common_name`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`language`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `is_preferred` (`is_preferred`),
  ADD KEY `language` (`language`),
  ADD KEY `language_id` (`language_id`);

ALTER TABLE `taxon_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `taxon_id` (`taxon_id`);

ALTER TABLE `taxon_image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eee` (`taxon_id`,`image_id`,`link_id`),
  ADD UNIQUE KEY `bbb` (`taxon_id`,`image_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `attachment_id` (`attachment_id`);

ALTER TABLE `taxon_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preparation_id` (`preparation_id`),
  ADD KEY `agent_id` (`agent_identified`),
  ADD KEY `frequency` (`frequency`),
  ADD KEY `sample_id` (`sample_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `name` (`name`),
  ADD KEY `taxon` (`taxon`);

ALTER TABLE `taxon_occurrence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `species_id` (`species_id`),
  ADD KEY `genus_id` (`genus_id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `stratigraphy_base` (`stratigraphy_base`),
  ADD KEY `stratigraphy_top` (`stratigraphy_top`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `geographic_distribution` (`geographic_distribution`,`geographic_distribution_en`),
  ADD KEY `country` (`country`),
  ADD KEY `stratigraphic_distribution` (`stratigraphic_distribution`,`stratigraphic_distribution_en`);

ALTER TABLE `taxon_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxon_lang` (`taxon_id`,`language`),
  ADD KEY `link_plutof` (`link_plutof`),
  ADD KEY `language` (`language`),
  ADD KEY `author` (`author`),
  ADD KEY `frontpage` (`frontpage`),
  ADD KEY `title` (`title`),
  ADD KEY `frontpage_title` (`frontpage_title`),
  ADD KEY `author_txt` (`author_txt`),
  ADD KEY `frontpage_order` (`frontpage_order`);

ALTER TABLE `taxon_pbdb`
  ADD UNIQUE KEY `taxon_no` (`taxon_no`),
  ADD KEY `taxon_name` (`taxon_name`,`parent_name`),
  ADD KEY `parent_id` (`parent_id`);

ALTER TABLE `taxon_rank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`rank`),
  ADD UNIQUE KEY `value_en` (`rank_en`),
  ADD KEY `rank_sv` (`rank_sv`,`rank_fi`);

ALTER TABLE `taxon_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`),
  ADD KEY `stratigraphy_base` (`stratigraphy_base`),
  ADD KEY `stratigraphy_top` (`stratigraphy_top`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `locality` (`locality`),
  ADD KEY `locality_en` (`locality_en`),
  ADD KEY `locality_free` (`locality_free`),
  ADD KEY `country` (`country`),
  ADD KEY `country_en` (`country_en`),
  ADD KEY `maakond` (`maakond`),
  ADD KEY `vald` (`vald`),
  ADD KEY `asustusyksus` (`asustusyksus`),
  ADD KEY `has_images` (`has_images`);

ALTER TABLE `taxon_synonym`
  ADD PRIMARY KEY (`id`),
  ADD KEY `synonym_id` (`synonym_id`),
  ADD KEY `synonym` (`taxon_synonym`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `author_year` (`author_year`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `author` (`author`,`year`);

ALTER TABLE `taxon_type_specimen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reerence_id` (`reference_id`),
  ADD KEY `type_specimen_id` (`specimen_id`),
  ADD KEY `type_speciemn_repository` (`repository`),
  ADD KEY `type_specimen_number` (`specimen_number`),
  ADD KEY `type_locality` (`locality_free`,`stratigraphy_free`),
  ADD KEY `type_locality_id` (`locality_id`),
  ADD KEY `taxon_id` (`taxon_id`),
  ADD KEY `type_type` (`type_type`),
  ADD KEY `stratigraphy_id` (`stratigraphy_id`);

ALTER TABLE `taxon_type_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_en` (`value_en`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_origin` (`visitor_country_id`),
  ADD KEY `database_id` (`database_id`),
  ADD KEY `visitor_institution_id` (`visitor_institution_id`),
  ADD KEY `visitor_id` (`visitor_id`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `user_created_id` (`user_created_id`),
  ADD KEY `timestamp_created` (`timestamp_created`),
  ADD KEY `user_modified_id` (`user_modified_id`),
  ADD KEY `timestamp_modified` (`timestamp_modified`),
  ADD KEY `items_studied` (`items_studied`);

ALTER TABLE `web_fossilgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classification_id` (`classification_id`),
  ADD UNIQUE KEY `title_et` (`title_et`),
  ADD UNIQUE KEY `frontpage_et` (`frontpage_et`),
  ADD KEY `primary_fossilgroup` (`primary_fossilgroup`),
  ADD KEY `frontpage_en` (`frontpage_en`),
  ADD KEY `frontpage_se` (`frontpage_se`),
  ADD KEY `frontpage_fi` (`frontpage_fi`),
  ADD KEY `link_plutof` (`link_plutof`);


ALTER TABLE `accession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `agent_type`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

ALTER TABLE `analysis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `analysis_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `analysis_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `analysis_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `attachment`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `attachment_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `classification_rock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `database`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT;

ALTER TABLE `dataset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `dataset_analysis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `dataset_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `dataset_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `deaccession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `device`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_agent_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_date_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_geolocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_related_identifier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_related_identifier_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_relation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `doi_resource_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `drillcore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `drillcore_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `drillcore_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `drillcore_study`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `imageset`
  MODIFY `imageset_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lab_instrument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_agent_type`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_attachment_type`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_licence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_loan_delivery_method`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_mime_type`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_specimen_presence`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

ALTER TABLE `loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `loan_sample`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `loan_specimen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality_stratigraphy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality_synonym`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `locality_taxon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `preparation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `reference_keyword`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_classification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_locality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_mineral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_mineral_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_property_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_rank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_synonym`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rock_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sample`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sample_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sample_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sample_series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sample_series_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sarv_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `section_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `section_log_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `selection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `selection_series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `soil_horizon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `soil_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen_identification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen_identification_geology`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `specimen_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `static_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `stratigraphy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `stratigraphy_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `stratigraphy_stratotype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `stratigraphy_synonym`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Taxon ID';

ALTER TABLE `taxon_character`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_character_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_character_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_common_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_occurrence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_synonym`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_type_specimen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taxon_type_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `web_fossilgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `accession`
  ADD CONSTRAINT `accession_ibfk_1` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `accession_ibfk_2` FOREIGN KEY (`agent_andis_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `accession_ibfk_3` FOREIGN KEY (`agent_vottis_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `accession_ibfk_4` FOREIGN KEY (`agent_kinnitas_id`) REFERENCES `agent` (`id`);

ALTER TABLE `agent`
  ADD CONSTRAINT `agent_ibfk_2` FOREIGN KEY (`type`) REFERENCES `agent_type` (`id`),
  ADD CONSTRAINT `agent_ibfk_3` FOREIGN KEY (`institution_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `agent_ibfk_4` FOREIGN KEY (`country_id`) REFERENCES `list_country` (`id`);

ALTER TABLE `analysis`
  ADD CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `analysis_ibfk_10` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `analysis_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`),
  ADD CONSTRAINT `analysis_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `analysis_ibfk_4` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `analysis_ibfk_5` FOREIGN KEY (`instrument_id`) REFERENCES `lab_instrument` (`id`),
  ADD CONSTRAINT `analysis_ibfk_6` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `analysis_ibfk_7` FOREIGN KEY (`method`) REFERENCES `analysis_method` (`id`),
  ADD CONSTRAINT `analysis_ibfk_8` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  ADD CONSTRAINT `analysis_ibfk_9` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `analysis_results`
  ADD CONSTRAINT `analysis_results_ibfk_1` FOREIGN KEY (`analysis_id`) REFERENCES `analysis` (`id`);

ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_ibfk_10` FOREIGN KEY (`format`) REFERENCES `list_mime_type` (`id`),
  ADD CONSTRAINT `attachment_ibfk_11` FOREIGN KEY (`licence_id`) REFERENCES `list_licence` (`id`),
  ADD CONSTRAINT `attachment_ibfk_12` FOREIGN KEY (`copyright_agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `attachment_ibfk_13` FOREIGN KEY (`type`) REFERENCES `list_attachment_type` (`id`),
  ADD CONSTRAINT `attachment_ibfk_4` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `attachment_ibfk_7` FOREIGN KEY (`author_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `attachment_ibfk_8` FOREIGN KEY (`agent_digitised_id`) REFERENCES `agent` (`id`);

ALTER TABLE `attachment_link`
  ADD CONSTRAINT `attachment_link_ibfk_1` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`),
  ADD CONSTRAINT `attachment_link_ibfk_10` FOREIGN KEY (`sample_series_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_11` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_12` FOREIGN KEY (`archive_id`) REFERENCES `archive` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_13` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_14` FOREIGN KEY (`drillcore_id`) REFERENCES `drillcore` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_15` FOREIGN KEY (`drillcore_box_id`) REFERENCES `drillcore_box` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_2` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_3` FOREIGN KEY (`preparation_id`) REFERENCES `preparation` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_4` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_5` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_6` FOREIGN KEY (`analysis_id`) REFERENCES `analysis` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_7` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_8` FOREIGN KEY (`doi_id`) REFERENCES `doi` (`id`),
  ADD CONSTRAINT `attachment_link_ibfk_9` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`);

ALTER TABLE `classification_rock`
  ADD CONSTRAINT `classification_rock_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `classification_rock` (`id`);

ALTER TABLE `collection`
  ADD CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `collection_ibfk_3` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `collection_ibfk_4` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `collection_ibfk_5` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `collection_ibfk_6` FOREIGN KEY (`class_id`) REFERENCES `classification` (`id`);

ALTER TABLE `dataset`
  ADD CONSTRAINT `dataset_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `dataset_ibfk_2` FOREIGN KEY (`copyright_agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `dataset_ibfk_3` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `dataset_ibfk_4` FOREIGN KEY (`licence_id`) REFERENCES `list_licence` (`id`);

ALTER TABLE `dataset_analysis`
  ADD CONSTRAINT `dataset_analysis_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  ADD CONSTRAINT `dataset_analysis_ibfk_2` FOREIGN KEY (`analysis_id`) REFERENCES `analysis` (`id`);

ALTER TABLE `dataset_reference`
  ADD CONSTRAINT `dataset_reference_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  ADD CONSTRAINT `dataset_reference_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `deaccession`
  ADD CONSTRAINT `deaccession_ibfk_1` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `deaccession_ibfk_2` FOREIGN KEY (`agent_kandis_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `deaccession_ibfk_3` FOREIGN KEY (`agent_kinnitas_id`) REFERENCES `agent` (`id`);

ALTER TABLE `device`
  ADD CONSTRAINT `device_ibfk_1` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`);

ALTER TABLE `doi`
  ADD CONSTRAINT `doi_ibfk_1` FOREIGN KEY (`language`) REFERENCES `list_language` (`id`),
  ADD CONSTRAINT `doi_ibfk_2` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  ADD CONSTRAINT `doi_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `doi_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `doi_ibfk_5` FOREIGN KEY (`copyright_agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `doi_ibfk_7` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `doi_ibfk_8` FOREIGN KEY (`resource_type`) REFERENCES `doi_resource_type` (`id`),
  ADD CONSTRAINT `doi_ibfk_9` FOREIGN KEY (`licence_id`) REFERENCES `list_licence` (`id`);

ALTER TABLE `doi_agent`
  ADD CONSTRAINT `doi_agent_ibfk_1` FOREIGN KEY (`doi_id`) REFERENCES `doi` (`id`),
  ADD CONSTRAINT `doi_agent_ibfk_2` FOREIGN KEY (`agent_type`) REFERENCES `doi_agent_type` (`id`),
  ADD CONSTRAINT `doi_agent_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

ALTER TABLE `doi_date`
  ADD CONSTRAINT `doi_date_ibfk_1` FOREIGN KEY (`doi_id`) REFERENCES `doi` (`id`),
  ADD CONSTRAINT `doi_date_ibfk_2` FOREIGN KEY (`date_type`) REFERENCES `doi_date_type` (`id`);

ALTER TABLE `doi_related_identifier`
  ADD CONSTRAINT `doi_related_identifier_ibfk_2` FOREIGN KEY (`identifier_type`) REFERENCES `doi_related_identifier_type` (`id`),
  ADD CONSTRAINT `doi_related_identifier_ibfk_3` FOREIGN KEY (`relation_type`) REFERENCES `doi_relation_type` (`id`),
  ADD CONSTRAINT `doi_related_identifier_ibfk_4` FOREIGN KEY (`doi_id`) REFERENCES `doi` (`id`);

ALTER TABLE `drillcore`
  ADD CONSTRAINT `drillcore_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `drillcore_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `drillcore_ibfk_3` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `drillcore_ibfk_4` FOREIGN KEY (`location`) REFERENCES `location` (`location`) ON UPDATE CASCADE,
  ADD CONSTRAINT `drillcore_ibfk_5` FOREIGN KEY (`storage`) REFERENCES `list_drillcore_storage` (`id`),
  ADD CONSTRAINT `drillcore_ibfk_6` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`);

ALTER TABLE `drillcore_box`
  ADD CONSTRAINT `drillcore_box_ibfk_1` FOREIGN KEY (`drillcore_id`) REFERENCES `drillcore` (`id`),
  ADD CONSTRAINT `drillcore_box_ibfk_2` FOREIGN KEY (`location`) REFERENCES `location` (`location`) ON UPDATE CASCADE,
  ADD CONSTRAINT `drillcore_box_ibfk_3` FOREIGN KEY (`stratigraphy_base`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `drillcore_box_ibfk_4` FOREIGN KEY (`stratigraphy_top`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `drillcore_box_ibfk_5` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `drillcore_box_ibfk_6` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`);

ALTER TABLE `drillcore_image`
  ADD CONSTRAINT `drillcore_image_ibfk_1` FOREIGN KEY (`drillcore_box_id`) REFERENCES `drillcore_box` (`id`),
  ADD CONSTRAINT `drillcore_image_ibfk_2` FOREIGN KEY (`drillcore_id`) REFERENCES `drillcore` (`id`),
  ADD CONSTRAINT `drillcore_image_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `drillcore_image_ibfk_4` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`);

ALTER TABLE `drillcore_study`
  ADD CONSTRAINT `drillcore_study_ibfk_1` FOREIGN KEY (`drillcore_id`) REFERENCES `drillcore` (`id`),
  ADD CONSTRAINT `drillcore_study_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

ALTER TABLE `imageset`
  ADD CONSTRAINT `imageset_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`),
  ADD CONSTRAINT `imageset_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `imageset_ibfk_3` FOREIGN KEY (`device_digitised_id`) REFERENCES `device` (`device_id`),
  ADD CONSTRAINT `imageset_ibfk_4` FOREIGN KEY (`client_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `imageset_ibfk_5` FOREIGN KEY (`agent_digitised_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `imageset_ibfk_6` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `imageset_ibfk_7` FOREIGN KEY (`location`) REFERENCES `location` (`location`) ON UPDATE CASCADE;

ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`former_journal_id`) REFERENCES `journal` (`id`),
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`following_journal_id`) REFERENCES `journal` (`id`);

ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `agent` (`id`);

ALTER TABLE `lab_instrument`
  ADD CONSTRAINT `lab_instrument_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`);

ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`type`) REFERENCES `list_loan_type` (`id`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`deliverer_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`loaner_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `loan_ibfk_4` FOREIGN KEY (`borrower_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `loan_ibfk_5` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `loan_ibfk_6` FOREIGN KEY (`borrower_institution_id`) REFERENCES `agent` (`id`);

ALTER TABLE `loan_sample`
  ADD CONSTRAINT `loan_sample_ibfk_2` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `loan_sample_ibfk_3` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`),
  ADD CONSTRAINT `loan_sample_ibfk_4` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`);

ALTER TABLE `loan_specimen`
  ADD CONSTRAINT `loan_specimen_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`),
  ADD CONSTRAINT `loan_specimen_ibfk_2` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`);

ALTER TABLE `locality`
  ADD CONSTRAINT `locality_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `locality_ibfk_10` FOREIGN KEY (`coord_det_precision`) REFERENCES `list_coordinate_precision` (`id`),
  ADD CONSTRAINT `locality_ibfk_11` FOREIGN KEY (`coord_det_method`) REFERENCES `list_coordinate_method` (`id`),
  ADD CONSTRAINT `locality_ibfk_12` FOREIGN KEY (`coord_det_agent`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `locality_ibfk_2` FOREIGN KEY (`maakond_id`) REFERENCES `list_maakond` (`id`),
  ADD CONSTRAINT `locality_ibfk_3` FOREIGN KEY (`vald_id`) REFERENCES `list_vald` (`id`),
  ADD CONSTRAINT `locality_ibfk_4` FOREIGN KEY (`asustusyksus_id`) REFERENCES `list_asustusyksus` (`id`),
  ADD CONSTRAINT `locality_ibfk_5` FOREIGN KEY (`country_id`) REFERENCES `list_country` (`id`),
  ADD CONSTRAINT `locality_ibfk_6` FOREIGN KEY (`type`) REFERENCES `list_locality_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `locality_ibfk_7` FOREIGN KEY (`stratigraphy_base`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `locality_ibfk_8` FOREIGN KEY (`stratigraphy_top`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `locality_ibfk_9` FOREIGN KEY (`extent`) REFERENCES `list_locality_extent` (`id`);

ALTER TABLE `locality_description`
  ADD CONSTRAINT `locality_description_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `locality_description_ibfk_2` FOREIGN KEY (`rock_id`) REFERENCES `classification_rock` (`id`),
  ADD CONSTRAINT `locality_description_ibfk_3` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `locality_description_ibfk_4` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `locality_description_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `locality_description_ibfk_6` FOREIGN KEY (`language_id`) REFERENCES `list_language` (`id`);

ALTER TABLE `locality_image`
  ADD CONSTRAINT `locality_image_ibfk_2` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`),
  ADD CONSTRAINT `locality_image_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`);

ALTER TABLE `locality_reference`
  ADD CONSTRAINT `locality_reference_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `locality_reference_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `locality_stratigraphy`
  ADD CONSTRAINT `locality_stratigraphy_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `locality_stratigraphy_ibfk_2` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `locality_stratigraphy_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `locality_stratigraphy_ibfk_4` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

ALTER TABLE `locality_synonym`
  ADD CONSTRAINT `locality_synonym_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `locality_synonym_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `locality_synonym_ibfk_3` FOREIGN KEY (`language`) REFERENCES `list_language` (`id`);

ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `location_ibfk_3` FOREIGN KEY (`location_location`) REFERENCES `location` (`location`) ON UPDATE CASCADE;

ALTER TABLE `preparation`
  ADD CONSTRAINT `preparation_ibfk_10` FOREIGN KEY (`analysis_id`) REFERENCES `analysis` (`id`),
  ADD CONSTRAINT `preparation_ibfk_11` FOREIGN KEY (`class_id`) REFERENCES `classification` (`id`),
  ADD CONSTRAINT `preparation_ibfk_12` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `preparation_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `preparation_ibfk_4` FOREIGN KEY (`identification_agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `preparation_ibfk_5` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `preparation_ibfk_7` FOREIGN KEY (`owner_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `preparation_ibfk_8` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`);

ALTER TABLE `reference`
  ADD CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`type`) REFERENCES `list_reference_type` (`id`),
  ADD CONSTRAINT `reference_ibfk_2` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`id`),
  ADD CONSTRAINT `reference_ibfk_3` FOREIGN KEY (`language`) REFERENCES `list_language` (`id`);

ALTER TABLE `reference_keyword`
  ADD CONSTRAINT `language` FOREIGN KEY (`language_id`) REFERENCES `list_language` (`id`),
  ADD CONSTRAINT `reference` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `rock`
  ADD CONSTRAINT `rock_ibfk_1` FOREIGN KEY (`rock_type_id`) REFERENCES `rock_type` (`id`),
  ADD CONSTRAINT `rock_ibfk_2` FOREIGN KEY (`rock_rank_id`) REFERENCES `rock_rank` (`id`),
  ADD CONSTRAINT `rock_ibfk_3` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `rock_ibfk_4` FOREIGN KEY (`lithostratigraphy_id`) REFERENCES `stratigraphy` (`id`);

ALTER TABLE `rock_classification`
  ADD CONSTRAINT `rock_classification_ibfk_1` FOREIGN KEY (`hierarchy_top_rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_classification_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `rock_image`
  ADD CONSTRAINT `rock_image_ibfk_1` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_image_ibfk_3` FOREIGN KEY (`link_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_image_ibfk_4` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`);

ALTER TABLE `rock_locality`
  ADD CONSTRAINT `rock_locality_ibfk_1` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_locality_ibfk_2` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`);

ALTER TABLE `rock_mineral`
  ADD CONSTRAINT `rock_mineral_ibfk_1` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_mineral_ibfk_2` FOREIGN KEY (`mineral_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_mineral_ibfk_3` FOREIGN KEY (`mineral_type_id`) REFERENCES `rock_mineral_type` (`id`);

ALTER TABLE `rock_property`
  ADD CONSTRAINT `rock_property_ibfk_1` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_property_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `rock_property_ibfk_3` FOREIGN KEY (`property_type_id`) REFERENCES `rock_property_type` (`id`);

ALTER TABLE `rock_reference`
  ADD CONSTRAINT `rock_reference_ibfk_1` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_reference_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `rock_synonym`
  ADD CONSTRAINT `rock_synonym_ibfk_1` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_synonym_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `rock_synonym_ibfk_3` FOREIGN KEY (`language_id`) REFERENCES `list_language` (`id`);

ALTER TABLE `rock_tree`
  ADD CONSTRAINT `rock_tree_ibfk_1` FOREIGN KEY (`rock_classification_id`) REFERENCES `rock_classification` (`id`),
  ADD CONSTRAINT `rock_tree_ibfk_2` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `rock_tree_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `rock` (`id`);

ALTER TABLE `sample`
  ADD CONSTRAINT `sample_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `sample_series` (`id`),
  ADD CONSTRAINT `sample_ibfk_10` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `sample_ibfk_11` FOREIGN KEY (`classification_rock_id`) REFERENCES `classification_rock` (`id`),
  ADD CONSTRAINT `sample_ibfk_14` FOREIGN KEY (`soil_site_id`) REFERENCES `soil_site` (`id`),
  ADD CONSTRAINT `sample_ibfk_15` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `sample_ibfk_16` FOREIGN KEY (`storage_additional_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `sample_ibfk_17` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sample_ibfk_18` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sample_ibfk_19` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `sample_ibfk_2` FOREIGN KEY (`parent_sample_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `sample_ibfk_3` FOREIGN KEY (`sample_purpose`) REFERENCES `list_sample_purpose` (`id`),
  ADD CONSTRAINT `sample_ibfk_4` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `sample_ibfk_5` FOREIGN KEY (`lithostratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `sample_ibfk_6` FOREIGN KEY (`agent_collected_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `sample_ibfk_7` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `sample_ibfk_8` FOREIGN KEY (`owner_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `sample_ibfk_9` FOREIGN KEY (`parent_specimen_id`) REFERENCES `specimen` (`id`);

ALTER TABLE `sample_reference`
  ADD CONSTRAINT `sample_reference_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `sample_reference_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `sample_series`
  ADD CONSTRAINT `sample_series_ibfk_1` FOREIGN KEY (`stratigraphy_top_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `sample_series_ibfk_2` FOREIGN KEY (`stratigraphy_base_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `sample_series_ibfk_3` FOREIGN KEY (`agent_collected_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `sample_series_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `sample_series_ibfk_5` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `sample_series_ibfk_6` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`);

ALTER TABLE `sample_series_reference`
  ADD CONSTRAINT `sample_series_reference_ibfk_1` FOREIGN KEY (`sample_series_id`) REFERENCES `sample_series` (`id`),
  ADD CONSTRAINT `sample_series_reference_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `sarv_fields`
  ADD CONSTRAINT `sarv_fields_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `sarv_tables` (`id`),
  ADD CONSTRAINT `sarv_fields_ibfk_2` FOREIGN KEY (`fk_table`) REFERENCES `sarv_tables` (`id`);

ALTER TABLE `section_log`
  ADD CONSTRAINT `section_log_ibfk_1` FOREIGN KEY (`parameter_id`) REFERENCES `analysis_parameter` (`id`),
  ADD CONSTRAINT `section_log_ibfk_2` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `section_log_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `section_log_ibfk_4` FOREIGN KEY (`instrument_id`) REFERENCES `lab_instrument` (`id`),
  ADD CONSTRAINT `section_log_ibfk_5` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`);

ALTER TABLE `section_log_results`
  ADD CONSTRAINT `section_log_results_ibfk_1` FOREIGN KEY (`section_log_id`) REFERENCES `section_log` (`id`);

ALTER TABLE `selection`
  ADD CONSTRAINT `selection_ibfk_2` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `selection_ibfk_3` FOREIGN KEY (`selection_id`) REFERENCES `selection_series` (`id`);

ALTER TABLE `soil_horizon`
  ADD CONSTRAINT `soil_horizon_ibfk_1` FOREIGN KEY (`soil_site_id`) REFERENCES `soil_site` (`id`);

ALTER TABLE `specimen`
  ADD CONSTRAINT `specimen_ibfk_10` FOREIGN KEY (`presence`) REFERENCES `list_specimen_presence` (`id`),
  ADD CONSTRAINT `specimen_ibfk_11` FOREIGN KEY (`status`) REFERENCES `list_specimen_status` (`id`),
  ADD CONSTRAINT `specimen_ibfk_12` FOREIGN KEY (`original_status`) REFERENCES `list_specimen_original_status` (`id`),
  ADD CONSTRAINT `specimen_ibfk_13` FOREIGN KEY (`akt_vastuvott_id`) REFERENCES `accession` (`id`),
  ADD CONSTRAINT `specimen_ibfk_14` FOREIGN KEY (`akt_mahakandmine_id`) REFERENCES `deaccession` (`id`),
  ADD CONSTRAINT `specimen_ibfk_15` FOREIGN KEY (`class_id`) REFERENCES `classification` (`id`),
  ADD CONSTRAINT `specimen_ibfk_16` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `specimen_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `specimen_ibfk_20` FOREIGN KEY (`coll_id`) REFERENCES `collection` (`id`),
  ADD CONSTRAINT `specimen_ibfk_21` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `specimen_ibfk_3` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `specimen_ibfk_4` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `specimen_ibfk_5` FOREIGN KEY (`lithostratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `specimen_ibfk_6` FOREIGN KEY (`agent_collected_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `specimen_ibfk_7` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `specimen_ibfk_8` FOREIGN KEY (`type`) REFERENCES `list_specimen_type` (`id`),
  ADD CONSTRAINT `specimen_ibfk_9` FOREIGN KEY (`fossil`) REFERENCES `list_specimen_kind` (`id`);

ALTER TABLE `specimen_description`
  ADD CONSTRAINT `specimen_description_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `specimen_description_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

ALTER TABLE `specimen_history`
  ADD CONSTRAINT `specimen_history_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`);

ALTER TABLE `specimen_identification`
  ADD CONSTRAINT `specimen_identification_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `specimen_identification_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `specimen_identification_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `specimen_identification_ibfk_4` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `specimen_identification_ibfk_5` FOREIGN KEY (`type`) REFERENCES `list_identification_type` (`id`);

ALTER TABLE `specimen_identification_geology`
  ADD CONSTRAINT `specimen_identification_geology_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `specimen_identification_geology_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `specimen_identification_geology_ibfk_3` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `specimen_identification_geology_ibfk_5` FOREIGN KEY (`rock_id`) REFERENCES `rock` (`id`),
  ADD CONSTRAINT `specimen_identification_geology_ibfk_6` FOREIGN KEY (`type`) REFERENCES `list_identification_type` (`id`);

ALTER TABLE `specimen_image`
  ADD CONSTRAINT `specimen_image_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `specimen_image_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `specimen_image_ibfk_3` FOREIGN KEY (`device_digitised_id`) REFERENCES `device` (`device_id`),
  ADD CONSTRAINT `specimen_image_ibfk_4` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`),
  ADD CONSTRAINT `specimen_image_ibfk_5` FOREIGN KEY (`copyright_agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `specimen_image_ibfk_6` FOREIGN KEY (`agent_digitised_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `specimen_image_ibfk_7` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `specimen_image_ibfk_8` FOREIGN KEY (`licence_id`) REFERENCES `list_licence` (`id`);

ALTER TABLE `specimen_location`
  ADD CONSTRAINT `specimen_location_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `specimen_location_ibfk_2` FOREIGN KEY (`storage_id`) REFERENCES `location` (`id`);

ALTER TABLE `specimen_reference`
  ADD CONSTRAINT `specimen_reference_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`),
  ADD CONSTRAINT `specimen_reference_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `stratigraphy`
  ADD CONSTRAINT `stratigraphy_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `stratigraphy_ibfk_2` FOREIGN KEY (`type`) REFERENCES `list_stratigraphy_type` (`id`),
  ADD CONSTRAINT `stratigraphy_ibfk_3` FOREIGN KEY (`rank`) REFERENCES `list_stratigraphy_rank` (`id`),
  ADD CONSTRAINT `stratigraphy_ibfk_4` FOREIGN KEY (`scope`) REFERENCES `list_stratigraphy_scope` (`id`),
  ADD CONSTRAINT `stratigraphy_ibfk_5` FOREIGN KEY (`status`) REFERENCES `list_stratigraphy_status` (`id`),
  ADD CONSTRAINT `stratigraphy_ibfk_6` FOREIGN KEY (`age_chronostratigraphy`) REFERENCES `stratigraphy` (`id`);

ALTER TABLE `stratigraphy_reference`
  ADD CONSTRAINT `stratigraphy_reference_ibfk_2` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `stratigraphy_reference_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `stratigraphy_stratotype`
  ADD CONSTRAINT `stratigraphy_stratotype_ibfk_1` FOREIGN KEY (`stratotype_type`) REFERENCES `list_stratotype_type` (`id`),
  ADD CONSTRAINT `stratigraphy_stratotype_ibfk_2` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `stratigraphy_stratotype_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `stratigraphy_stratotype_ibfk_4` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`);

ALTER TABLE `stratigraphy_synonym`
  ADD CONSTRAINT `stratigraphy_synonym_ibfk_1` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `stratigraphy_synonym_ibfk_2` FOREIGN KEY (`language`) REFERENCES `list_language` (`id`),
  ADD CONSTRAINT `stratigraphy_synonym_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `taxon`
  ADD CONSTRAINT `taxon_ibfk_1` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `taxon_ibfk_2` FOREIGN KEY (`rank_original`) REFERENCES `taxon_rank` (`id`),
  ADD CONSTRAINT `taxon_ibfk_3` FOREIGN KEY (`stratigraphy_base`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `taxon_ibfk_4` FOREIGN KEY (`stratigraphy_top`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `taxon_ibfk_5` FOREIGN KEY (`parent_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_ibfk_8` FOREIGN KEY (`rank`) REFERENCES `taxon_rank` (`id`);

ALTER TABLE `taxon_character_key`
  ADD CONSTRAINT `taxon_character_key_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_character_key_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `taxon_character` (`id`),
  ADD CONSTRAINT `taxon_character_key_ibfk_3` FOREIGN KEY (`character_state_id`) REFERENCES `taxon_character_state` (`id`),
  ADD CONSTRAINT `taxon_character_key_ibfk_4` FOREIGN KEY (`sample_taxon_id`) REFERENCES `taxon` (`id`);

ALTER TABLE `taxon_character_state`
  ADD CONSTRAINT `taxon_character_state_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `taxon_character` (`id`);

ALTER TABLE `taxon_common_name`
  ADD CONSTRAINT `taxon_common_name_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_common_name_ibfk_3` FOREIGN KEY (`language_id`) REFERENCES `list_language` (`id`);

ALTER TABLE `taxon_description`
  ADD CONSTRAINT `taxon_description_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_description_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `taxon_description_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `taxon_description_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `list_language` (`id`);

ALTER TABLE `taxon_image`
  ADD CONSTRAINT `taxon_image_ibfk_1` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`),
  ADD CONSTRAINT `taxon_image_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_image_ibfk_3` FOREIGN KEY (`link_id`) REFERENCES `taxon` (`id`);

ALTER TABLE `taxon_list`
  ADD CONSTRAINT `taxon_list_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  ADD CONSTRAINT `taxon_list_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_list_ibfk_3` FOREIGN KEY (`preparation_id`) REFERENCES `preparation` (`id`);

ALTER TABLE `taxon_occurrence`
  ADD CONSTRAINT `taxon_occurrence_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_occurrence_ibfk_2` FOREIGN KEY (`stratigraphy_base`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `taxon_occurrence_ibfk_3` FOREIGN KEY (`stratigraphy_top`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `taxon_occurrence_ibfk_4` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `taxon_page`
  ADD CONSTRAINT `taxon_page_ibfk_1` FOREIGN KEY (`language`) REFERENCES `list_language` (`iso_639_1`),
  ADD CONSTRAINT `taxon_page_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`);

ALTER TABLE `taxon_synonym`
  ADD CONSTRAINT `taxon_synonym_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_synonym_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`);

ALTER TABLE `taxon_type_specimen`
  ADD CONSTRAINT `taxon_type_specimen_ibfk_1` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `taxon_type_specimen_ibfk_2` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  ADD CONSTRAINT `taxon_type_specimen_ibfk_3` FOREIGN KEY (`stratigraphy_id`) REFERENCES `stratigraphy` (`id`),
  ADD CONSTRAINT `taxon_type_specimen_ibfk_4` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`),
  ADD CONSTRAINT `taxon_type_specimen_ibfk_5` FOREIGN KEY (`type_type`) REFERENCES `taxon_type_type` (`id`),
  ADD CONSTRAINT `taxon_type_specimen_ibfk_6` FOREIGN KEY (`specimen_id`) REFERENCES `specimen` (`id`);

ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`visitor_country_id`) REFERENCES `list_country` (`id`),
  ADD CONSTRAINT `visit_ibfk_3` FOREIGN KEY (`host_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `visit_ibfk_4` FOREIGN KEY (`database_id`) REFERENCES `database` (`id`),
  ADD CONSTRAINT `visit_ibfk_5` FOREIGN KEY (`visitor_institution_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `visit_ibfk_6` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `visit_ibfk_7` FOREIGN KEY (`user_modified_id`) REFERENCES `user` (`id`);

ALTER TABLE `web_fossilgroups`
  ADD CONSTRAINT `web_fossilgroups_ibfk_1` FOREIGN KEY (`classification_id`) REFERENCES `classification` (`id`);
USE `phpmyadmin`;

SET FOREIGN_KEY_CHECKS=1;
COMMIT;
