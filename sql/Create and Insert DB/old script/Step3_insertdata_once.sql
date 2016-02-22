INSERT INTO `user` (`username`, `password`, `type`, `trellokey`, `trellotoken`, `photo`) VALUES
('admin', 'admin', 's', NULL, NULL, ''),
('kaiwen12', '1234', 'p', '7e35111227918de8a37f8c20844ed555', 'f7f588e4ce535adc2f08539a56b4b7d24caad79d0e7142cebb564fe979cbc565', ''),
('kianlam999', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', ''),
('maxchuams', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', ''),
('testaccount166','1234','c','f806c2eb70886448614862e25802b8e6','a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', '');

INSERT INTO `user` (`username`, `password`, `type`, `trellokey`, `trellotoken`, `photo`) VALUES
('perfectcoder', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', '');

INSERT INTO `developer` (`username`, `employmentdate`, `nationality`) VALUES
('kianlam999', '2015-10-30', 'Thailand'),
('maxchuams', '2015-10-30', 'Singapore'),
('perfectcoder', '2015-10-30', 'Malaysia'),
('testaccount166', '2015-10-30', 'Singapore');

INSERT INTO `project` (`projectname`, `trellokey`, `description`, `assignby`, `duedate`, `priority`, `iscomplete`, `type`, `psize`) 
VALUES ("defectlessproject","","nil","kaiwen12","2015-06-29","3",0 ,"Wordpress","1");

INSERT INTO `project` (`projectname`, `trellokey`, `description`, `assignby`, `duedate`, `priority`, `iscomplete`, `type`, `psize`) 
VALUES
	("Fathership","","nil","kaiwen12","2015-06-29","3",0 ,"Wordpress","1"), 
	("Recco", "", "nil", "kaiwen12","2015-06-10","3", 0,"eCommerce","1"), 
	("Candy", "", "nil","kaiwen12", "2015-02-10","3", 0,"eCommerce","1"),
	("LowPriority", "", "nil","kaiwen12", "2015-02-10","1", 0,"eCommerce","1");
    
    
INSERT INTO `projectallocation` (`projectname`, `developerusername`, `planstart`, `planend`, `actualstart`, `actualend`)
VALUES 
	("Fathership", "testaccount166", "2015-06-12","2015-07-12","2015-06-12","2015-08-12"),
	("Recco", "kianlam999","2015-05-10","2015-06-10","2015-05-10","2015-07-10"), 
    ("Recco", "maxchuams","2015-05-10","2015-06-10","2015-05-10","2015-07-10"), 
    ("defectlessproject", "perfectcoder","2015-05-10","2015-06-10","2015-05-10","2015-07-10"), 
	("Candy", "kianlam999", "2015-01-10", "2015-02-10", "2015-01-10", "2015-02-28"), 
	("LowPriority", "maxchuams", "2014-03-03", "2014-03-23", "2014-03-03", "2014-04-01");

insert into developerskill values
	("testaccount166", "Wordpress"),
 ("testaccount166", "Custom"), 
 ("testaccount166", "eCommerce"), 
 ("kianlam999", "Wordpress"), 
 ("kianlam999", "Custom"), 
 ("kianlam999", "eCommerce"), 
("maxchuams", "Wordpress"),
("maxchuams", "eCommerce"); 
