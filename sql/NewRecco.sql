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
	constraint developer_fk foreign key (username) references user(username)
);

create table developerskill(
	username varchar(25) not null,
	skill varchar(25) not null,
	constraint dskill_pk primary key (username, skill),
	constraint dskill_fk foreign key(username) references user( username)
);

create table project(
	projectname varchar(25) not null primary key,
	trellokey varchar(100) not null,
	description varchar(100) not null,
	duedate date not null,
	priority varchar(15) not null
);

create table projectallocation(
	projectname varchar(25) not null,
	developerusername varchar(25) not null,
	dateallocated date not null,
	constraint pallo_pk primary key (projectname, developerusername, dateallocated),
	constraint pallo_fk foreign key (projectname) references project(projectname),
	constraint pallo_fk2 foreign key (developerusername) references developer(username)
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

insert into user values ("recom1", "test", "d", "",""), ("recom2", "test", "d", "",""), ("recom3", "test", "d", "","");
insert into developer values ("recom1","2011-12-12","Thai"),("recom2","2012-12-12","Thai"),("recom3","2013-12-12","Thai");
insert into project values("Fathership","","nil","2015-06-29","Highest"), ("Recco", "", "nil", "2015-06-10","Highest"), ("Candy", "", "nil", "2015-02-10","Highest"),("LowPriority", "", "nil", "2015-02-10","Low");
insert into projectallocation values("Fathership", "recom1", "2015-06-12"),("Recco", "recom2","2015-05-10"), ("Candy", "recom2", "2015-01-10"), ("LowPriority", "recom3", "2014-03-03");
insert into defect values("1", "Recco", "Login Issues");
insert into defect values("2", "Recco", "Client complain lag");