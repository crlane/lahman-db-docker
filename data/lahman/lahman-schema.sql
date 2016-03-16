-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE "AllstarFull"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"gameNum"			INTEGER NOT NULL, 
	"gameID"			VARCHAR (24), 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"GP"			INTEGER, 
	"startingPos"			INTEGER
);

-- CREATE INDEXES ...
CREATE INDEX "AllstarFull_gameID_idx" ON "AllstarFull" ("gameID");
ALTER TABLE "AllstarFull" ADD CONSTRAINT "AllstarFull_pkey" PRIMARY KEY ("playerID", "yearID", "gameNum");
CREATE INDEX "AllstarFull_lgID_idx" ON "AllstarFull" ("lgID");
CREATE INDEX "AllstarFull_teamID_idx" ON "AllstarFull" ("teamID");
CREATE INDEX "AllstarFull_playerID_idx" ON "AllstarFull" ("playerID");

CREATE TABLE "Appearances"
 (
	"yearID"			INTEGER NOT NULL, 
	"teamID"			VARCHAR (6) NOT NULL, 
	"lgID"			VARCHAR (4), 
	"playerID"			VARCHAR (18) NOT NULL, 
	"G_all"			INTEGER, 
	"GS"			INTEGER, 
	"G_batting"			INTEGER, 
	"G_defense"			INTEGER, 
	"G_p"			INTEGER, 
	"G_c"			INTEGER, 
	"G_1b"			INTEGER, 
	"G_2b"			INTEGER, 
	"G_3b"			INTEGER, 
	"G_ss"			INTEGER, 
	"G_lf"			INTEGER, 
	"G_cf"			INTEGER, 
	"G_rf"			INTEGER, 
	"G_of"			INTEGER, 
	"G_dh"			INTEGER, 
	"G_ph"			INTEGER, 
	"G_pr"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "Appearances" ADD CONSTRAINT "Appearances_pkey" PRIMARY KEY ("yearID", "teamID", "playerID");

CREATE TABLE "AwardsManagers"
 (
	"playerID"			VARCHAR (20) NOT NULL, 
	"awardID"			VARCHAR (150) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"lgID"			VARCHAR (4) NOT NULL, 
	"tie"			VARCHAR (2), 
	"notes"			VARCHAR (200)
);

-- CREATE INDEXES ...
ALTER TABLE "AwardsManagers" ADD CONSTRAINT "AwardsManagers_pkey" PRIMARY KEY ("yearID", "awardID", "lgID", "playerID");

CREATE TABLE "AwardsPlayers"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"awardID"			VARCHAR (510) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"lgID"			VARCHAR (4) NOT NULL, 
	"tie"			VARCHAR (2), 
	"notes"			VARCHAR (200)
);

-- CREATE INDEXES ...
ALTER TABLE "AwardsPlayers" ADD CONSTRAINT "AwardsPlayers_pkey" PRIMARY KEY ("yearID", "awardID", "lgID", "playerID");

CREATE TABLE "AwardsShareManagers"
 (
	"awardID"			VARCHAR (50) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"lgID"			VARCHAR (4) NOT NULL, 
	"playerID"			VARCHAR (20) NOT NULL, 
	"pointsWon"			INTEGER, 
	"pointsMax"			INTEGER, 
	"votesFirst"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "AwardsShareManagers" ADD CONSTRAINT "AwardsShareManagers_pkey" PRIMARY KEY ("awardID", "yearID", "lgID", "playerID");

CREATE TABLE "Batting"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"G"			INTEGER, 
	"G_batting"			INTEGER, 
	"AB"			INTEGER, 
	"R"			INTEGER, 
	"H"			INTEGER, 
	"2B"			INTEGER, 
	"3B"			INTEGER, 
	"HR"			INTEGER, 
	"RBI"			INTEGER, 
	"SB"			INTEGER, 
	"CS"			INTEGER, 
	"BB"			INTEGER, 
	"SO"			INTEGER, 
	"IBB"			INTEGER, 
	"HBP"			INTEGER, 
	"SH"			INTEGER, 
	"SF"			INTEGER, 
	"GIDP"			INTEGER, 
	"G_old"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "Batting" ADD CONSTRAINT "Batting_pkey" PRIMARY KEY ("playerID", "yearID", "stint");
CREATE INDEX "Batting_lgID_idx" ON "Batting" ("lgID");
CREATE INDEX "Batting_teamID_idx" ON "Batting" ("teamID");
CREATE INDEX "Batting_playerID_idx" ON "Batting" ("playerID");

CREATE TABLE "BattingPost"
 (
	"yearID"			INTEGER NOT NULL, 
	"round"			VARCHAR (20) NOT NULL, 
	"playerID"			VARCHAR (18) NOT NULL, 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"G"			INTEGER, 
	"AB"			INTEGER, 
	"R"			INTEGER, 
	"H"			INTEGER, 
	"2B"			INTEGER, 
	"3B"			INTEGER, 
	"HR"			INTEGER, 
	"RBI"			INTEGER, 
	"SB"			INTEGER, 
	"CS"			INTEGER, 
	"BB"			INTEGER, 
	"SO"			INTEGER, 
	"IBB"			INTEGER, 
	"HBP"			INTEGER, 
	"SH"			INTEGER, 
	"SF"			INTEGER, 
	"GIDP"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "BattingPost" ADD CONSTRAINT "BattingPost_pkey" PRIMARY KEY ("yearID", "round", "playerID");
CREATE INDEX "BattingPost_lgID_idx" ON "BattingPost" ("lgID");
CREATE INDEX "BattingPost_teamID_idx" ON "BattingPost" ("teamID");
CREATE INDEX "BattingPost_playerID_idx" ON "BattingPost" ("playerID");

CREATE TABLE "CollegePlaying"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"schoolID"			VARCHAR (30), 
	"yearID"			INTEGER
);

-- CREATE INDEXES ...

CREATE TABLE "Fielding"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"POS"			VARCHAR (4) NOT NULL, 
	"G"			INTEGER, 
	"GS"			INTEGER, 
	"InnOuts"			INTEGER, 
	"PO"			INTEGER, 
	"A"			INTEGER, 
	"E"			INTEGER, 
	"DP"			INTEGER, 
	"PB"			INTEGER, 
	"WP"			INTEGER, 
	"SB"			INTEGER, 
	"CS"			INTEGER, 
	"ZR"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
ALTER TABLE "Fielding" ADD CONSTRAINT "Fielding_pkey" PRIMARY KEY ("playerID", "yearID", "stint", "POS");
CREATE INDEX "Fielding_lgID_idx" ON "Fielding" ("lgID");
CREATE INDEX "Fielding_teamID_idx" ON "Fielding" ("teamID");
CREATE INDEX "Fielding_playerID_idx" ON "Fielding" ("playerID");

CREATE TABLE "FieldingOF"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"Glf"			INTEGER, 
	"Gcf"			INTEGER, 
	"Grf"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "FieldingOF" ADD CONSTRAINT "FieldingOF_pkey" PRIMARY KEY ("playerID", "yearID", "stint");

CREATE TABLE "FieldingPost"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"round"			VARCHAR (20) NOT NULL, 
	"POS"			VARCHAR (4) NOT NULL, 
	"G"			INTEGER, 
	"GS"			INTEGER, 
	"InnOuts"			INTEGER, 
	"PO"			INTEGER, 
	"A"			INTEGER, 
	"E"			INTEGER, 
	"DP"			INTEGER, 
	"TP"			INTEGER, 
	"PB"			INTEGER, 
	"SB"			INTEGER, 
	"CS"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "FieldingPost" ADD CONSTRAINT "FieldingPost_pkey" PRIMARY KEY ("playerID", "yearID", "round", "POS");
CREATE INDEX "FieldingPost_lgID_idx" ON "FieldingPost" ("lgID");
CREATE INDEX "FieldingPost_teamID_idx" ON "FieldingPost" ("teamID");
CREATE INDEX "FieldingPost_playerID_idx" ON "FieldingPost" ("playerID");

CREATE TABLE "HallOfFame"
 (
	"playerID"			VARCHAR (20) NOT NULL, 
	"yearid"			INTEGER NOT NULL, 
	"votedBy"			VARCHAR (128) NOT NULL, 
	"ballots"			INTEGER, 
	"needed"			INTEGER, 
	"votes"			INTEGER, 
	"inducted"			VARCHAR (2), 
	"category"			VARCHAR (40), 
	"needed_note"			VARCHAR (50)
);

-- CREATE INDEXES ...
ALTER TABLE "HallOfFame" ADD CONSTRAINT "HallOfFame_pkey" PRIMARY KEY ("playerID", "yearid", "votedBy");
CREATE INDEX "HallOfFame_playerID_idx" ON "HallOfFame" ("playerID");

CREATE TABLE "ManagersHalf"
 (
	"playerID"			VARCHAR (20) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"teamID"			VARCHAR (6) NOT NULL, 
	"lgID"			VARCHAR (4), 
	"inseason"			INTEGER, 
	"half"			INTEGER NOT NULL, 
	"G"			INTEGER, 
	"W"			INTEGER, 
	"L"			INTEGER, 
	"rank"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "ManagersHalf" ADD CONSTRAINT "ManagersHalf_pkey" PRIMARY KEY ("yearID", "teamID", "playerID", "half");
CREATE INDEX "ManagersHalf_playerID_idx" ON "ManagersHalf" ("playerID");

CREATE TABLE "Master"
 (
	"playerID"			VARCHAR (20), 
	"birthYear"			INTEGER, 
	"birthMonth"			INTEGER, 
	"birthDay"			INTEGER, 
	"birthCountry"			VARCHAR (100), 
	"birthState"			VARCHAR (4), 
	"birthCity"			VARCHAR (100), 
	"deathYear"			INTEGER, 
	"deathMonth"			INTEGER, 
	"deathDay"			INTEGER, 
	"deathCountry"			VARCHAR (100), 
	"deathState"			VARCHAR (4), 
	"deathCity"			VARCHAR (100), 
	"nameFirst"			VARCHAR (100), 
	"nameLast"			VARCHAR (100), 
	"nameGiven"			VARCHAR (510), 
	"weight"			INTEGER, 
	"height"			INTEGER, 
	"bats"			VARCHAR (2), 
	"throws"			VARCHAR (2), 
	"debut"			VARCHAR (20), 
	"finalGame"			VARCHAR (20), 
	"retroID"			VARCHAR (18), 
	"bbrefID"			VARCHAR (18)
);

-- CREATE INDEXES ...
CREATE INDEX "Master_bbrefID_idx" ON "Master" ("bbrefID");
CREATE INDEX "Master_playerID_idx" ON "Master" ("playerID");
CREATE INDEX "Master_nameFirst_idx" ON "Master" ("nameFirst");
CREATE INDEX "Master_nameGiven_idx" ON "Master" ("nameGiven");
CREATE INDEX "Master_nameLast_idx" ON "Master" ("nameGiven");
CREATE INDEX "Master_retroID_idx" ON "Master" ("retroID");

CREATE TABLE "Pitching"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"W"			INTEGER, 
	"L"			INTEGER, 
	"G"			INTEGER, 
	"GS"			INTEGER, 
	"CG"			INTEGER, 
	"SHO"			INTEGER, 
	"SV"			INTEGER, 
	"IPouts"			INTEGER, 
	"H"			INTEGER, 
	"ER"			INTEGER, 
	"HR"			INTEGER, 
	"BB"			INTEGER, 
	"SO"			INTEGER, 
	"BAOpp"			DOUBLE PRECISION, 
	"ERA"			DOUBLE PRECISION, 
	"IBB"			INTEGER, 
	"WP"			INTEGER, 
	"HBP"			INTEGER, 
	"BK"			INTEGER, 
	"BFP"			INTEGER, 
	"GF"			INTEGER, 
	"R"			INTEGER, 
	"SH"			INTEGER, 
	"SF"			INTEGER, 
	"GIDP"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "Pitching" ADD CONSTRAINT "Pitching_pkey" PRIMARY KEY ("playerID", "yearID", "stint");
CREATE INDEX "Pitching_lgID_idx" ON "Pitching" ("lgID");
CREATE INDEX "Pitching_teamID_idx" ON "Pitching" ("teamID");
CREATE INDEX "Pitching_playerID_idx" ON "Pitching" ("playerID");

CREATE TABLE "PitchingPost"
 (
	"playerID"			VARCHAR (18) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"round"			VARCHAR (20) NOT NULL, 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"W"			INTEGER, 
	"L"			INTEGER, 
	"G"			INTEGER, 
	"GS"			INTEGER, 
	"CG"			INTEGER, 
	"SHO"			INTEGER, 
	"SV"			INTEGER, 
	"IPouts"			INTEGER, 
	"H"			INTEGER, 
	"ER"			INTEGER, 
	"HR"			INTEGER, 
	"BB"			INTEGER, 
	"SO"			INTEGER, 
	"BAOpp"			DOUBLE PRECISION, 
	"ERA"			DOUBLE PRECISION, 
	"IBB"			INTEGER, 
	"WP"			INTEGER, 
	"HBP"			INTEGER, 
	"BK"			INTEGER, 
	"BFP"			INTEGER, 
	"GF"			INTEGER, 
	"R"			INTEGER, 
	"SH"			INTEGER, 
	"SF"			INTEGER, 
	"GIDP"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "PitchingPost" ADD CONSTRAINT "PitchingPost_pkey" PRIMARY KEY ("playerID", "yearID", "round");
CREATE INDEX "PitchingPost_lgID_idx" ON "PitchingPost" ("lgID");
CREATE INDEX "PitchingPost_teamID_idx" ON "PitchingPost" ("teamID");
CREATE INDEX "PitchingPost_playerID_idx" ON "PitchingPost" ("playerID");

CREATE TABLE "Salaries"
 (
	"yearID"			INTEGER, 
	"teamID"			VARCHAR (6), 
	"lgID"			VARCHAR (4), 
	"playerID"			VARCHAR (18), 
	"salary"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
ALTER TABLE "Salaries" ADD CONSTRAINT "Salaries_pkey" PRIMARY KEY ("yearID", "teamID", "lgID", "playerID");
CREATE INDEX "Salaries_playerID_idx" ON "Salaries" ("playerID");

CREATE TABLE "Schools"
 (
	"schoolID"			VARCHAR (30), 
	"name_full"			VARCHAR (510), 
	"city"			VARCHAR (110), 
	"state"			VARCHAR (110), 
	"country"			VARCHAR (110)
);

-- CREATE INDEXES ...
ALTER TABLE "Schools" ADD CONSTRAINT "Schools_pkey" PRIMARY KEY ("schoolID");

CREATE TABLE "SeriesPost"
 (
	"yearID"			INTEGER, 
	"round"			VARCHAR (10), 
	"teamIDwinner"			VARCHAR (6), 
	"lgIDwinner"			VARCHAR (4), 
	"teamIDloser"			VARCHAR (6), 
	"lgIDloser"			VARCHAR (4), 
	"wins"			INTEGER, 
	"losses"			INTEGER, 
	"ties"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "SeriesPost" ADD CONSTRAINT "SeriesPost_pkey" PRIMARY KEY ("yearID", "round");

CREATE TABLE "Teams"
 (
	"yearID"			INTEGER NOT NULL, 
	"lgID"			VARCHAR (4) NOT NULL, 
	"teamID"			VARCHAR (6) NOT NULL, 
	"franchID"			VARCHAR (6), 
	"divID"			VARCHAR (2), 
	"Rank"			INTEGER, 
	"G"			INTEGER, 
	"Ghome"			INTEGER, 
	"W"			INTEGER, 
	"L"			INTEGER, 
	"DivWin"			VARCHAR (2), 
	"WCWin"			VARCHAR (2), 
	"LgWin"			VARCHAR (2), 
	"WSWin"			VARCHAR (2), 
	"R"			INTEGER, 
	"AB"			INTEGER, 
	"H"			INTEGER, 
	"2B"			INTEGER, 
	"3B"			INTEGER, 
	"HR"			INTEGER, 
	"BB"			INTEGER, 
	"SO"			INTEGER, 
	"SB"			INTEGER, 
	"CS"			INTEGER, 
	"HBP"			INTEGER, 
	"SF"			INTEGER, 
	"RA"			INTEGER, 
	"ER"			INTEGER, 
	"ERA"			DOUBLE PRECISION, 
	"CG"			INTEGER, 
	"SHO"			INTEGER, 
	"SV"			INTEGER, 
	"IPouts"			INTEGER, 
	"HA"			INTEGER, 
	"HRA"			INTEGER, 
	"BBA"			INTEGER, 
	"SOA"			INTEGER, 
	"E"			INTEGER, 
	"DP"			INTEGER, 
	"FP"			DOUBLE PRECISION, 
	"name"			VARCHAR (100), 
	"park"			VARCHAR (510), 
	"attendance"			INTEGER, 
	"BPF"			INTEGER, 
	"PPF"			INTEGER, 
	"teamIDBR"			VARCHAR (6), 
	"teamIDlahman45"			VARCHAR (6), 
	"teamIDretro"			VARCHAR (6)
);

-- CREATE INDEXES ...
CREATE INDEX "Teams_divID_idx" ON "Teams" ("divID");
CREATE INDEX "Teams_franchID_idx" ON "Teams" ("franchID");
ALTER TABLE "Teams" ADD CONSTRAINT "Teams_pkey" PRIMARY KEY ("yearID", "lgID", "teamID");

CREATE TABLE "TeamsFranchises"
 (
	"franchID"			VARCHAR (6), 
	"franchName"			VARCHAR (100), 
	"active"			VARCHAR (4), 
	"NAassoc"			VARCHAR (6)
);

-- CREATE INDEXES ...
ALTER TABLE "TeamsFranchises" ADD CONSTRAINT "TeamsFranchises_pkey" PRIMARY KEY ("franchID");

CREATE TABLE "TeamsHalf"
 (
	"yearID"			INTEGER, 
	"lgID"			VARCHAR (4), 
	"teamID"			VARCHAR (6), 
	"Half"			VARCHAR (2), 
	"divID"			VARCHAR (2), 
	"DivWin"			VARCHAR (2), 
	"Rank"			INTEGER, 
	"G"			INTEGER, 
	"W"			INTEGER, 
	"L"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "TeamsHalf" ADD CONSTRAINT "TeamsHalf_pkey" PRIMARY KEY ("yearID", "teamID", "lgID", "Half");

CREATE TABLE "AwardsSharePlayers"
 (
	"awardID"			VARCHAR (50) NOT NULL, 
	"yearID"			INTEGER NOT NULL, 
	"lgID"			VARCHAR (4) NOT NULL, 
	"playerID"			VARCHAR (18) NOT NULL, 
	"pointsWon"			DOUBLE PRECISION, 
	"pointsMax"			INTEGER, 
	"votesFirst"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
ALTER TABLE "AwardsSharePlayers" ADD CONSTRAINT "AwardsSharePlayers_pkey" PRIMARY KEY ("awardID", "yearID", "lgID", "playerID");

CREATE TABLE "Managers"
 (
	"playerID"			VARCHAR (20), 
	"yearID"			INTEGER NOT NULL, 
	"teamID"			VARCHAR (6) NOT NULL, 
	"lgID"			VARCHAR (4), 
	"inseason"			INTEGER NOT NULL, 
	"G"			INTEGER, 
	"W"			INTEGER, 
	"L"			INTEGER, 
	"rank"			INTEGER, 
	"plyrMgr"			VARCHAR (2)
);

-- CREATE INDEXES ...
ALTER TABLE "Managers" ADD CONSTRAINT "Managers_pkey" PRIMARY KEY ("yearID", "teamID", "inseason");
CREATE INDEX "Managers_managerID_idx" ON "Managers" ("playerID");
