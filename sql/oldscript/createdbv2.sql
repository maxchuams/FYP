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