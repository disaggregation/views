CREATE TABLE IF NOT EXISTS loads (date datetime, 
	lowtarif_demand real, 
	hightarif_demand real, 
	lowtarif_supply real, 
	hightarif_supply real, 
	demand_power real, 
	supply_power real, 
	gas_demand real, 
	demand_power_L1 real, 
	demand_power_L2 real, 
	demand_power_L3 real, 
	supply_power_L1 real, 
	supply_power_L2 real, 
	supply_power_L3 real, 
	voltage real, 
	current real);
	
CREATE VIEW IF NOT EXISTS loadsonly (datetime,demand) AS SELECT date,demand_power FROM loads;

drop table if exists user;
create table user (
  user_id integer primary key autoincrement,
  username text not null,
  email text not null,
  pw_hash text not null
);

drop table if exists follower;
create table follower (
  who_id integer,
  whom_id integer
);

drop table if exists message;
create table message (
  message_id integer primary key autoincrement,
  author_id integer not null,
  text text not null,
  pub_date integer
);

drop table if exists device_types;
create table device_types (
  device_type_id integer primary key autoincrement,
  title text not null,
  name text not null,
  image_url text);
INSERT INTO `device_types` VALUES (1,'coffe_machine','Coffe machine','https://portal.plugwise.net/3/img/devices/coffee_maker.png');
INSERT INTO `device_types` VALUES (2,'computer_desktop','Desktop','https://portal.plugwise.net/3/img/devices/computer_desktop.png');
INSERT INTO `device_types` VALUES (3,'computer_laptop','Laptop','https://portal.plugwise.net/3/img/devices/computer_desktop.png');
INSERT INTO `device_types` VALUES (4,'freezer','Freezer','https://portal.plugwise.net/3/img/devices/freezer.png');
INSERT INTO `device_types` VALUES (5,'Heater','Heater','');
INSERT INTO `device_types` VALUES (6,'Oven','Oven','https://portal.plugwise.net/3/img/devices/computer_desktop.png');
INSERT INTO `device_types` VALUES (7,'Router','Router','https://portal.plugwise.net/3/img/devices/computer_desktop.png');
INSERT INTO `device_types` VALUES (8,'Television','Television','https://portal.plugwise.net/3/img/devices/tv.png');
INSERT INTO `device_types` VALUES (9,'washshing_machine','Washshing Machine','https://portal.plugwise.net/3/img/devices/washingmachine.png');
INSERT INTO `device_types` VALUES (10,'water_cooker','Water Cooker','https://portal.plugwise.net/3/img/devices/watercooker.png');
-- https://portal.plugwise.net/3/img/devices/water_bed.png
-- https://portal.plugwise.net/3/img/devices/oven_microwave.png
-- https://portal.plugwise.net/3/img/devices/heater_central.png	
-- https://portal.plugwise.net/3/img/devices/hometheater.png
-- https://portal.plugwise.net/3/img/devices/pump_heater.png
-- https://portal.plugwise.net/3/img/devices/vcr.png
-- https://portal.plugwise.net/3/img/devices/dryer.png

drop table if exists devices;
create table devices (
  device_id integer primary key autoincrement,
  author_id integer not null,
  name text not null,
  type text not null,
  confirm_datetime timestamp,
  power integer,
  energy integer,
  first_datetime timestamp,
  last_datetime timestamp
);

drop table if exists disaggregated_loads;
create table disaggregated_loads (
  loads_id integer primary key autoincrement,
  device_id integer,
  power integer,
  energy integer,
  first_seen_datetime timestamp,
  last_seen_datetime timestamp
);


