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
	assignby varchar(25) not null,
	duedate date not null,
	priority int not null,
    iscomplete int not null default 0,
	type varchar(25) not null,
	psize int not null default 1,
	constraint project_fk foreign key (assignby) references user (username)
);

create table projectallocation(
	projectname varchar(25) not null,
	developerusername varchar(25) not null,
    dateallocated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	planstart date,
    planend date,
    actualstart date,
    actualend date,
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
	defectname varchar(500) not null,
	description varchar(8000),
    reportby varchar(25) not null,
    updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    iscomplete int NOT NULL DEFAULT 0,
    severity int NOT NULL DEFAULT 2,
	constraint defects_pk primary key (defectid),
    constraint defects_fk1 foreign key (projectname) references project (projectname),
    constraint defects_fk2 foreign key (reportby) references user (username)
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


INSERT INTO `project` (`projectname`, `trellokey`, `description`, `assignby`, `duedate`, `priority`, `iscomplete`, `type`, `psize`) 
VALUES
	("Fathership","","nil","kaiwen12","2015-06-29","3",0 ,"Wordpress","1"), 
	("Recco", "", "nil", "kaiwen12","2015-06-10","3", 0,"eCommerce","1"), 
	("Candy", "", "nil","kaiwen12", "2015-02-10","3", 0,"eCommerce","1"),
	("LowPriority", "", "nil","kaiwen12", "2015-02-10","1", 1,"eCommerce","1");
    
    
INSERT INTO `projectallocation` (`projectname`, `developerusername`, `planstart`, `planend`, `actualstart`, `actualend`)
VALUES 
	("Fathership", "testaccount166", "2015-06-12","2015-06-12","2015-07-12","2015-08-12"),
	("Recco", "kianlam999","2015-05-10","2015-05-10","2015-06-10","2015-07-10"), 
	("Candy", "kianlam999", "2015-01-10", "2015-01-10", "2015-02-21", "2015-02-28"), 
	("LowPriority", "maxchuams", "2014-03-03", "2014-03-03", "2014-04-03", "2014-04-03");

insert into developerskill values
	("testaccount166", "Wordpress"),
 ("testaccount166", "Custom"), 
 ("testaccount166", "eCommerce"), 
 ("kianlam999", "Wordpress"), 
 ("kianlam999", "Custom"), 
 ("kianlam999", "eCommerce"), 
("maxchuams", "Wordpress"),
("maxchuams", "eCommerce"); 


INSERT INTO `defect` (`projectname`, `defectname`, `description`, `reportby`) VALUES 
('recco', 'nameless', 'No Description', 'kianlam999');