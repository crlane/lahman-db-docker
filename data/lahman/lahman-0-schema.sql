-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE "all_star_full"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"gameNum"			INTEGER NOT NULL, 
	"game_id"			VARCHAR (24), 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
	"GP"			INTEGER, 
	"startingPos"			INTEGER
);

-- CREATE INDEXES ...
CREATE INDEX "all_star_full_game_id_idx" ON "all_star_full" ("game_id");
ALTER TABLE "all_star_full" ADD CONSTRAINT "all_star_full_pkey" PRIMARY KEY ("player_id", "year_id", "gameNum");
CREATE INDEX "all_star_full_lg_id_idx" ON "all_star_full" ("lg_id");
CREATE INDEX "all_star_full_team_id_idx" ON "all_star_full" ("team_id");
CREATE INDEX "all_star_full_player_id_idx" ON "all_star_full" ("player_id");

CREATE TABLE "appearances"
 (
	"year_id"			INTEGER NOT NULL, 
	"team_id"			VARCHAR (6) NOT NULL, 
	"lg_id"			VARCHAR (4), 
	"player_id"			VARCHAR (18) NOT NULL, 
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
ALTER TABLE "appearances" ADD CONSTRAINT "appearances_pkey" PRIMARY KEY ("year_id", "team_id", "player_id");

CREATE TABLE "awards_managers"
 (
	"player_id"			VARCHAR (20) NOT NULL, 
	"award_id"			VARCHAR (150) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"lg_id"			VARCHAR (4) NOT NULL, 
	"tie"			VARCHAR (2), 
	"notes"			VARCHAR (200)
);

-- CREATE INDEXES ...
ALTER TABLE "awards_managers" ADD CONSTRAINT "awards_managers_pkey" PRIMARY KEY ("year_id", "award_id", "lg_id", "player_id");

CREATE TABLE "awards_players"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"award_id"			VARCHAR (510) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"lg_id"			VARCHAR (4) NOT NULL, 
	"tie"			VARCHAR (2), 
	"notes"			VARCHAR (200)
);

-- CREATE INDEXES ...
ALTER TABLE "awards_players" ADD CONSTRAINT "awards_players_pkey" PRIMARY KEY ("year_id", "award_id", "lg_id", "player_id");

CREATE TABLE "awards_share_managers"
 (
	"award_id"			VARCHAR (50) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"lg_id"			VARCHAR (4) NOT NULL, 
	"player_id"			VARCHAR (20) NOT NULL, 
	"pointsWon"			INTEGER, 
	"pointsMax"			INTEGER, 
	"votesFirst"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "awards_share_managers" ADD CONSTRAINT "awards_share_managers_pkey" PRIMARY KEY ("award_id", "year_id", "lg_id", "player_id");

CREATE TABLE "batting"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
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
ALTER TABLE "batting" ADD CONSTRAINT "batting_pkey" PRIMARY KEY ("player_id", "year_id", "stint");
CREATE INDEX "batting_lg_id_idx" ON "batting" ("lg_id");
CREATE INDEX "batting_team_id_idx" ON "batting" ("team_id");
CREATE INDEX "batting_player_id_idx" ON "batting" ("player_id");

CREATE TABLE "batting_post"
 (
	"year_id"			INTEGER NOT NULL, 
	"round"			VARCHAR (20) NOT NULL, 
	"player_id"			VARCHAR (18) NOT NULL, 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
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
ALTER TABLE "batting_post" ADD CONSTRAINT "batting_post_pkey" PRIMARY KEY ("year_id", "round", "player_id");
CREATE INDEX "batting_post_lg_id_idx" ON "batting_post" ("lg_id");
CREATE INDEX "batting_post_team_id_idx" ON "batting_post" ("team_id");
CREATE INDEX "batting_post_player_id_idx" ON "batting_post" ("player_id");

CREATE TABLE "college_playing"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"school_id"			VARCHAR (30), 
	"year_id"			INTEGER
);

-- CREATE INDEXES ...

CREATE TABLE "fielding"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
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
ALTER TABLE "fielding" ADD CONSTRAINT "fielding_pkey" PRIMARY KEY ("player_id", "year_id", "stint", "POS");
CREATE INDEX "fielding_lg_id_idx" ON "fielding" ("lg_id");
CREATE INDEX "fielding_team_id_idx" ON "fielding" ("team_id");
CREATE INDEX "fielding_player_id_idx" ON "fielding" ("player_id");

CREATE TABLE "fielding_of"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"Glf"			INTEGER, 
	"Gcf"			INTEGER, 
	"Grf"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "fielding_of" ADD CONSTRAINT "fielding_of_pkey" PRIMARY KEY ("player_id", "year_id", "stint");

CREATE TABLE "fielding_post"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
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
ALTER TABLE "fielding_post" ADD CONSTRAINT "fielding_post_pkey" PRIMARY KEY ("player_id", "year_id", "round", "POS");
CREATE INDEX "fielding_post_lg_id_idx" ON "fielding_post" ("lg_id");
CREATE INDEX "fielding_post_team_id_idx" ON "fielding_post" ("team_id");
CREATE INDEX "fielding_post_player_id_idx" ON "fielding_post" ("player_id");

CREATE TABLE "hall_of_fame"
 (
	"player_id"			VARCHAR (20) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"votedBy"			VARCHAR (128) NOT NULL, 
	"ballots"			INTEGER, 
	"needed"			INTEGER, 
	"votes"			INTEGER, 
	"inducted"			VARCHAR (2), 
	"category"			VARCHAR (40), 
	"needed_note"			VARCHAR (50)
);

-- CREATE INDEXES ...
ALTER TABLE "hall_of_fame" ADD CONSTRAINT "hall_of_fame_pkey" PRIMARY KEY ("player_id", "year_id", "votedBy");
CREATE INDEX "hall_of_fame_player_id_idx" ON "hall_of_fame" ("player_id");

CREATE TABLE "managers_half"
 (
	"player_id"			VARCHAR (20) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"team_id"			VARCHAR (6) NOT NULL, 
	"lg_id"			VARCHAR (4), 
	"inseason"			INTEGER, 
	"half"			INTEGER NOT NULL, 
	"G"			INTEGER, 
	"W"			INTEGER, 
	"L"			INTEGER, 
	"rank"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "managers_half" ADD CONSTRAINT "managers_half_pkey" PRIMARY KEY ("year_id", "team_id", "player_id", "half");
CREATE INDEX "managers_half_player_id_idx" ON "managers_half" ("player_id");

CREATE TABLE "master"
 (
	"player_id"			VARCHAR (20), 
	"birth_year"			INTEGER, 
	"birth_month"			INTEGER, 
	"birth_day"			INTEGER, 
	"birth_country"			VARCHAR (100), 
	"birth_state"			VARCHAR (4), 
	"birth_city"			VARCHAR (100), 
	"death_year"			INTEGER, 
	"death_month"			INTEGER, 
	"death_day"			INTEGER, 
	"death_country"			VARCHAR (100), 
	"death_state"			VARCHAR (4), 
	"death_city"			VARCHAR (100), 
	"name_first"			VARCHAR (100), 
	"name_last"			VARCHAR (100), 
	"name_given"			VARCHAR (510), 
	"weight"			INTEGER, 
	"height"			INTEGER, 
	"bats"			VARCHAR (2), 
	"throws"			VARCHAR (2), 
	"debut"			VARCHAR (20), 
	"final_game"			VARCHAR (20), 
	"retro_id"			VARCHAR (18), 
	"bbrefID"			VARCHAR (18)
);

-- CREATE INDEXES ...
CREATE INDEX "master_bbrefID_idx" ON "master" ("bbrefID");
CREATE INDEX "master_player_id_idx" ON "master" ("player_id");
CREATE INDEX "master_name_first_idx" ON "master" ("name_first");
CREATE INDEX "master_name_given_idx" ON "master" ("name_given");
CREATE INDEX "master_name_last_idx" ON "master" ("name_given");
CREATE INDEX "master_retro_id_idx" ON "master" ("retro_id");

CREATE TABLE "pitching"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"stint"			INTEGER NOT NULL, 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
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
ALTER TABLE "pitching" ADD CONSTRAINT "pitching_pkey" PRIMARY KEY ("player_id", "year_id", "stint");
CREATE INDEX "pitching_lg_id_idx" ON "pitching" ("lg_id");
CREATE INDEX "pitching_team_id_idx" ON "pitching" ("team_id");
CREATE INDEX "pitching_player_id_idx" ON "pitching" ("player_id");

CREATE TABLE "pitching_post"
 (
	"player_id"			VARCHAR (18) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"round"			VARCHAR (20) NOT NULL, 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
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
ALTER TABLE "pitching_post" ADD CONSTRAINT "pitching_post_pkey" PRIMARY KEY ("player_id", "year_id", "round");
CREATE INDEX "pitching_post_lg_id_idx" ON "pitching_post" ("lg_id");
CREATE INDEX "pitching_post_team_id_idx" ON "pitching_post" ("team_id");
CREATE INDEX "pitching_post_player_id_idx" ON "pitching_post" ("player_id");

CREATE TABLE "salaries"
 (
	"year_id"			INTEGER, 
	"team_id"			VARCHAR (6), 
	"lg_id"			VARCHAR (4), 
	"player_id"			VARCHAR (18), 
	"salary"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
ALTER TABLE "salaries" ADD CONSTRAINT "salaries_pkey" PRIMARY KEY ("year_id", "team_id", "lg_id", "player_id");
CREATE INDEX "salaries_player_id_idx" ON "salaries" ("player_id");

CREATE TABLE "schools"
 (
	"school_id"			VARCHAR (30), 
	"name_full"			VARCHAR (510), 
	"city"			VARCHAR (110), 
	"state"			VARCHAR (110), 
	"country"			VARCHAR (110)
);

-- CREATE INDEXES ...
ALTER TABLE "schools" ADD CONSTRAINT "schools_pkey" PRIMARY KEY ("school_id");

CREATE TABLE "series_post"
 (
	"year_id"			INTEGER, 
	"round"			VARCHAR (10), 
	"team_idwinner"			VARCHAR (6), 
	"lg_idwinner"			VARCHAR (4), 
	"team_idloser"			VARCHAR (6), 
	"lg_idloser"			VARCHAR (4), 
	"wins"			INTEGER, 
	"losses"			INTEGER, 
	"ties"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "series_post" ADD CONSTRAINT "series_post_pkey" PRIMARY KEY ("year_id", "round");

CREATE TABLE "teams"
 (
	"year_id"			INTEGER NOT NULL, 
	"lg_id"			VARCHAR (4) NOT NULL, 
	"team_id"			VARCHAR (6) NOT NULL, 
	"franch_id"			VARCHAR (6), 
	"div_id"			VARCHAR (2), 
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
	"team_idBR"			VARCHAR (6), 
	"team_idlahman45"			VARCHAR (6), 
	"team_idretro"			VARCHAR (6)
);

-- CREATE INDEXES ...
CREATE INDEX "teams_div_id_idx" ON "teams" ("div_id");
CREATE INDEX "teams_franch_id_idx" ON "teams" ("franch_id");
ALTER TABLE "teams" ADD CONSTRAINT "teams_pkey" PRIMARY KEY ("year_id", "lg_id", "team_id");

CREATE TABLE "teams_franchises"
 (
	"franch_id"			VARCHAR (6), 
	"franchName"			VARCHAR (100), 
	"active"			VARCHAR (4), 
	"NAassoc"			VARCHAR (6)
);

-- CREATE INDEXES ...
ALTER TABLE "teams_franchises" ADD CONSTRAINT "teams_franchises_pkey" PRIMARY KEY ("franch_id");

CREATE TABLE "teams_half"
 (
	"year_id"			INTEGER, 
	"lg_id"			VARCHAR (4), 
	"team_id"			VARCHAR (6), 
	"Half"			VARCHAR (2), 
	"div_id"			VARCHAR (2), 
	"DivWin"			VARCHAR (2), 
	"Rank"			INTEGER, 
	"G"			INTEGER, 
	"W"			INTEGER, 
	"L"			INTEGER
);

-- CREATE INDEXES ...
ALTER TABLE "teams_half" ADD CONSTRAINT "teams_half_pkey" PRIMARY KEY ("year_id", "team_id", "lg_id", "Half");

CREATE TABLE "awards_share_players"
 (
	"award_id"			VARCHAR (50) NOT NULL, 
	"year_id"			INTEGER NOT NULL, 
	"lg_id"			VARCHAR (4) NOT NULL, 
	"player_id"			VARCHAR (18) NOT NULL, 
	"pointsWon"			DOUBLE PRECISION, 
	"pointsMax"			INTEGER, 
	"votesFirst"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
ALTER TABLE "awards_share_players" ADD CONSTRAINT "awards_share_players_pkey" PRIMARY KEY ("award_id", "year_id", "lg_id", "player_id");

CREATE TABLE "managers"
 (
	"player_id"			VARCHAR (20), 
	"year_id"			INTEGER NOT NULL, 
	"team_id"			VARCHAR (6) NOT NULL, 
	"lg_id"			VARCHAR (4), 
	"inseason"			INTEGER NOT NULL, 
	"G"			INTEGER, 
	"W"			INTEGER, 
	"L"			INTEGER, 
	"rank"			INTEGER, 
	"plyrMgr"			VARCHAR (2)
);

-- CREATE INDEXES ...
ALTER TABLE "managers" ADD CONSTRAINT "managers_pkey" PRIMARY KEY ("year_id", "team_id", "inseason");
CREATE INDEX "managers_manager_id_idx" ON "managers" ("player_id");
