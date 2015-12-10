drop schema if exists PjsRecco ;
create schema PjsRecco;
use PjsRecco;

create table user(
	username varchar(25) not null primary key,
	password varchar(25) not null,
	type varchar(1) not null,
	trellokey varchar(100),
	trellotoken varchar(100),
	photo longblob
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
	description varchar(8000) not null,
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
	defectid int NOT NULL AUTO_INCREMENT,
	projectname varchar(500) not null,
	description varchar(8000),
    reportby varchar(25) not null,
    commitby varchar(25) not null,
    updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    severity varchar(10),
	constraint defects_pk primary key (defectid),
    constraint defects_fk1 foreign key (projectname) references project (projectname),
    constraint defects_fk2 foreign key (reportby) references user (username),
    constraint defects_fk3 foreign key (commitby) references developer (username)
);

create table defectscreenshot(
	defectid int not null,
	updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	photo longblob,
	constraint defects_pk primary key (defectid,updatetime),
    constraint defects_fk foreign key (defectid) references defect (defectid)
);


INSERT INTO `user` (`username`, `password`, `type`, `trellokey`, `trellotoken`, `photo`) VALUES
('admin', 'admin', 's', NULL, NULL, ''),
('kaiwen12', '1234', 'p', '7e35111227918de8a37f8c20844ed555', '6c2fb51f5d35f6663a07912efd643cb958ab452aef289620a538c409b7a1ee0b', ''),
('kianlam999', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', ''),
('maxchuams', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', ''),
('testaccount166','1234','c','f806c2eb70886448614862e25802b8e6','a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', '');

INSERT INTO `developer` (`username`, `employmentdate`, `nationality`) VALUES
('kianlam999', '2015-10-30', 'Thailand'),
('maxchuams', '2015-10-30', 'Singapore'),
('testaccount166', '2015-10-30', 'Singapore');

insert into project values
	("Fathership","","nil","2015-06-29","3", "Wordpress"), 
	("Recco", "", "nil", "2015-06-10","3", "eCommerce"), 
	("Candy", "", "nil", "2015-02-10","3", "eCommerce"),
	("LowPriority", "", "nil", "2015-02-10","1", "eCommerce");
insert into projectallocation values
	("Fathership", "testaccount166", "2015-06-12"),
	("Recco", "kianlam999","2015-05-10"), 
	("Candy", "kianlam999", "2015-01-10"), 
	("LowPriority", "maxchuams", "2014-03-03");

insert into developerskill values
	("testaccount166", "Wordpress"),
 ("testaccount166", "Custom"), 
 ("testaccount166", "eCommerce"), 
 ("kianlam999", "Wordpress"), 
 ("kianlam999", "Custom"), 
 ("kianlam999", "eCommerce"), 
("maxchuams", "Wordpress"),
("maxchuams", "eCommerce"); 