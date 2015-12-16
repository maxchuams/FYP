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

Drop table defectscreenshot;
Drop table defect;
