drop schema if exists PjsRecco ;
create schema PjsRecco;
use PjsRecco;

create table user(
	username varchar(25) not null primary key,
	password varchar(25) not null,
	type varchar(1) not null,
	trellokey varchar(100),
	trellotoken varchar(100)
);

create table developer(
	username varchar(25) not null,
	employmentdate date not null,
	nationality varchar(25) not null,
	constraint developer_pk primary key (username),
	constraint developer_fk foreign key (username) references user(username) ON DELETE CASCADE
);

create table developerskill(
	username varchar(25) not null,
	skill varchar(25) not null,
	constraint dskill_pk primary key (username, skill),
	constraint dskill_fk foreign key(username) references user( username) ON DELETE CASCADE
);

create table project(
	projectname varchar(25) not null primary key,
	trellokey varchar(100) not null,
	description varchar(100) not null,
	duedate date not null,
	priority int not null,
	type varchar(25) not null
);

create table projectallocation(
	projectname varchar(25) not null,
	developerusername varchar(25) not null,
	dateallocated date not null,
	constraint pallo_pk primary key (projectname, developerusername, dateallocated), 
	constraint pallo_fk foreign key (projectname) references project(projectname) ,
	constraint pallo_fk2 foreign key (developerusername) references developer(username) ON DELETE CASCADE
);

create table projectfunction(
	projectname varchar(25) not null,
	function varchar(100) not null,
	constraint pfunction_pk primary key (projectname, function),
	constraint pfunction_fk foreign key (projectname) references project(projectname)
);

create table defect(
	defectid int not null,
	projectname varchar(100) not null,
	description varchar(100),
	constraint defects_fk foreign key (projectname) references project (projectname),
	constraint defects_pk primary key (projectname, defectid)
);

INSERT INTO `user` (`username`, `password`, `type`, `trellokey`, `trellotoken`, `photo`) VALUES
('admin', 'admin', 's', NULL, NULL, ''),
('kaiwen12', '1234', 'p', '7e35111227918de8a37f8c20844ed555', '65095ea4469fc51399471d010e58e2f6a95b2f15c83b9ddea167940939534b0f', ''),
('kianlam999', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', ''),
('maxchuams', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', ''),
('recom1', 'test', 'c', 'qweqe', 'qwads', ''),
('recom2', 'test', 'c', '', '', ''),
('recom3', 'test', 'c', '', '', '');

INSERT INTO `developer` (`username`, `employmentdate`, `nationality`) VALUES
('kianlam999', '2015-10-30', 'Singapore'),
('maxchuams', '2015-10-30', 'Singapore'),
('recom1', '2011-12-12', 'Thai'),
('recom2', '2012-12-12', 'Thai'),
('recom3', '2013-12-12', 'Thai');
insert into project values("Fathership","","nil","2015-06-29","3", "Wordpress"), ("Recco", "", "nil", "2015-06-10","3", "eCommerce"), ("Candy", "", "nil", "2015-02-10","3", "eCommerce"),("LowPriority", "", "nil", "2015-02-10","1", "eCommerce");
insert into projectallocation values("Fathership", "recom1", "2015-06-12"),("Recco", "recom2","2015-05-10"), ("Candy", "recom2", "2015-01-10"), ("LowPriority", "recom3", "2014-03-03");
insert into defect values("1", "Recco", "Login Issues");
insert into defect values("2", "Recco", "Client complain lag");
insert into developerskill values("recom1", "Wordpress"), ("recom1", "Custom"), ("recom1", "eCommerce"), ("recom2", "Wordpress"), ("recom2", "Custom"), ("recom2", "eCommerce"), ("recom3", "Wordpress"),("recom3", "eCommerce"); 