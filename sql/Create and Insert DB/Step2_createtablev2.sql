create table user(
	username varchar(200) not null primary key,
	password varchar(100) not null,
	type varchar(1) not null,
	trellokey varchar(100),
	trellotoken varchar(100),
	photo longblob,
	trelloId varchar(100)
);

create table developer(
	username varchar(200) not null,
	employmentdate date not null,
	nationality varchar(100) not null,
	constraint developer_pk primary key (username),
	constraint developer_fk foreign key (username) references user(username) ON DELETE CASCADE
);

create table developerskill(
	username varchar(200) not null,
	skill varchar(100) not null,
	constraint dskill_pk primary key (username, skill),
	constraint dskill_fk foreign key(username) references user( username) ON DELETE CASCADE
);


create table project(
	projectname varchar(200) not null primary key,
	trellokey varchar(100) not null,
	description varchar(8000) not null,
	assignby varchar(100) not null,
	duedate date not null,
	priority int not null,
    iscomplete int not null default 0,
	type varchar(100) not null,
	psize int not null default 1,
	trellophoto varchar(1000),
	constraint project_fk foreign key (assignby) references user (username)
);


create table projectallocation(
	projectname varchar(200) not null,
	developerusername varchar(200) not null,
    dateallocated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	planstart date,
    planend date,
    actualstart date,
    actualend date,
    iscomplete int NOT NULL DEFAULT 0,
    constraint pallo_pk primary key (projectname, developerusername, dateallocated), 
	constraint pallo_fk foreign key (projectname) references project(projectname) ON DELETE CASCADE  ,
	constraint pallo_fk2 foreign key (developerusername) references developer(username) ON DELETE CASCADE
);

create table projectfunction(
	projectname varchar(200) not null,
	function varchar(100) not null,
	manday int not null default 1,
	description varchar(8000),
	constraint pfunction_pk primary key (projectname, function),
	constraint pfunction_fk foreign key (projectname) references project(projectname)
);

create table defect(
	defectid int NOT NULL AUTO_INCREMENT,
	projectname varchar(500) not null,
	defectname varchar(500) not null,
	description varchar(8000),
    reportby varchar(200) not null,
    updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    iscomplete int NOT NULL DEFAULT 0,
    severity int NOT NULL DEFAULT 2,
    duedate DATE NOT NULL,
    assignto varchar(200) not null,
	constraint defects_pk primary key (defectid),
    constraint defects_fk1 foreign key (projectname) references project (projectname),
    constraint defects_fk2 foreign key (reportby) references user (username),
    constraint defects_fk3 foreign key (assignto) references user (username) 
);

create table defectscreenshot(
	defectid int not null,
	updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	photo longblob,
	constraint defects_pk primary key (defectid,updatetime),
    constraint defects_fk foreign key (defectid) references defect (defectid) ON DELETE CASCADE
);

create table defectcommitby(
	defectid int not null,
	committedby varchar(200) not null,
	constraint defectc_pk primary key (defectid,committedby),
	constraint defectc_fk2 foreign key (committedby) references user (username),
    constraint defectc_fk foreign key (defectid) references defect (defectid) ON DELETE CASCADE
);

CREATE TABLE ztable (
  zvalue DECIMAL(14,2) NOT NULL,
  pvalue DECIMAL(14,4) NULL,
  PRIMARY KEY (zvalue)
);

create table cron(
	cronid int NOT NULL AUTO_INCREMENT,
    updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    state int,
	constraint cron_pk primary key (cronid)
);

create table notifications(
  notificationid int not null primary key auto_increment,
    username varchar(200),
    notificationtype varchar(200),
    projectname varchar(200),
    status char(1),
    dateandtime datetime,
  constraint notifications_fk foreign key (username) references user (username),
  constraint notifications_fk2 foreign key (projectname) references project (projectname)
);

create table recommendationlog(
id int not null primary key auto_increment,
generated varchar(8000),
selected varchar(8000),
projectname varchar(1000),
choice int DEFAULT 0,
updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

create table trelloconfig(
mainboard varchar(100) not null primary key,
developmentlist varchar(100) not null,
postdevlist varchar(100) not null,
admin varchar(200) not null,
cronpause int(1) not null
);