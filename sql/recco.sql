
create schema if not exists recco;
use recco;

create table user(
            username varchar(100) not null,
            password varchar(100) not null,
            type varchar(1) not null,
            constraint user_pk primary key (username)
);

create table developer(
			username varchar(100) not null,
			employmentdate date not null,
			nationality varchar(100) not null,
            constraint developer_pk primary key (username),
            constraint developer_fk foreign key (username) references user(username)

);

create table developerskill(
			username varchar(100) not null,
			skill varchar(100) not null,
            constraint developerskill_pk primary key (username, skill),
            constraint developerskill_fk foreign key (username) references user(username)

);

create table project(
			projectname varchar(100) not null,
			projectdescription varchar(100) not null,
			duedate date not null,
			urgency varchar(25),
            constraint project_pk primary key (projectname)
);



create table projectallocation(
			projectname varchar(100) not null,
			developerusername varchar(100) not null,
			dateallocated date not null,
            constraint projectallocation_pk primary key (projectname, developerusername, dateallocated),
            constraint projectallocation_fk foreign key (projectname) references project(projectname),
			constraint projectallocation_fk2 foreign key (developerusername) references developer(username)
);

create table bugcategory(
            severity int not null,
            followupaction varchar(200) not null,
            constraint user_pk primary key (severity)
);

create table bug(
			bugid int not null,
			projectname varchar(100) not null,
			severity int not null,
			flaggerusername varchar(100) not null,
			bugflagdate date not null,
			debuggerusername varchar(100),
			bugresolvedate date,
			bugdescription varchar(250),
            constraint bug_pk primary key (projectname, bugid),
            constraint bug_fk foreign key (projectname) references project(projectname),
			constraint bug_fk2 foreign key (debuggerusername) references developer(username),
			constraint bug_fk3 foreign key (flaggerusername) references user(username),
			constraint bug_fk4 foreign key (severity) references bugcategory(severity)
);
