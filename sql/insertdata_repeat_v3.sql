INSERT INTO `projectallocation` (`projectname`, `developerusername`, `planstart`, `planend`, `actualstart`)
VALUES 
    ("Fathership", "testaccount166", "2015-06-12","2015-07-12","2015-06-12"),
    ("Recco", "kianlam999","2015-05-10","2015-06-10","2015-05-10"), 
	("Candy", "kianlam999", "2015-01-10", "2015-04-10", "2015-01-10"), 
	("LowPriority", "maxchuams", "2014-03-03", "2014-04-03", "2014-03-03");
    
INSERT INTO `defect` (`projectname`, `defectname`, `description`, `reportby`) VALUES 
('recco', 'nameless', 'No Description', 'kianlam999'),
('recco', 'report by wen', 'No Description', 'kaiwen12'),
('LowPriority', 'Defects', 'No Description', 'admin'),
('LowPriority', 'Defects', 'No Description', 'admin'),
('Candy', 'Defects 1', 'No Description', 'admin'),
('Candy', 'Defects 2', 'No Description', 'admin'),
('Fathership', 'Defects 2', 'No Description', 'admin'),
('LowPriority', 'nameless', 'No Description', 'admin');