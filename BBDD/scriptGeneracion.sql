USE SchoolerzZ;

DROP TABLE IF EXISTS
SZ_8014_Teachers_Teachers_Skins,
SZ_205_Students_Skins,
SZ_204_Students_Emblems,
SZ_203_Students_Parents,
SZ_109_Groups_Activities,
SZ_102_Groups_Students,
SZ_003_Parents,
SZ_015_School_Licences,
SZ_004_Emblems,
SZ_005_Skins,
SZ_017_Subjects,
SZ_002_Students,
SZ_007_School_Managers,
SZ_011_Posts,
SZ_010_Threads,
SZ_013_Messages,
SZ_012_Chats,
SZ_016_T_Licences,
SZ_014_Teachers_Skins,
SZ_009_Activities,
SZ_001_Groups,
SZ_008_Teachers,
SZ_006_Schools;



DROP DATABASE IF EXISTS schoolerzz;

CREATE DATABASE IF NOT EXISTS SchoolerzZ;

USE SchoolerzZ;

CREATE TABLE IF NOT EXISTS SZ_003_Parents(
    SZ_003_Id BINARY(16) PRIMARY KEY,
    SZ_003_Name VARCHAR(50) NOT NULL,
    SZ_003_SN1 VARCHAR(100) NOT NULL,
    SZ_003_SN2 VARCHAR(100) NOT NULL,
    SZ_003_Birth DATE NOT NULL,
    SZ_003_Nationality VARCHAR(50) NOT NULL,
    SZ_003_Country VARCHAR(30) NOT NULL,
    SZ_003_City VARCHAR(30) NOT NULL,
    SZ_003_PostalCode VARCHAR(5) NOT NULL,
    SZ_003_Address VARCHAR(200) NOT NULL,
    SZ_003_Email VARCHAR(100) NOT NULL,
    SZ_003_Nick VARCHAR(15),
    SZ_003_Password VARCHAR(200) NOT NULL,
    SZ_003_Phone1 VARCHAR(15) NOT NULL,
    SZ_003_Phone2 VARCHAR(15),
    SZ_003_Deleted TINYINT DEFAULT(0)
);
CREATE TABLE IF NOT EXISTS SZ_006_Schools(
    SZ_006_Id BINARY(16) PRIMARY KEY,
    SZ_006_Name VARCHAR(50) NOT NULL,
    SZ_006_SchoolCode INT NOT NULL,
    SZ_006_Words3 VARCHAR(3) NOT NULL,
    SZ_006_Country VARCHAR(30) NOT NULL,
    SZ_006_City VARCHAR(30) NOT NULL,
    SZ_006_PostalCode VARCHAR(5) NOT NULL,
    SZ_006_Address VARCHAR(200) NOT NULL,
    SZ_006_Deleted TINYINT DEFAULT(0)
);

CREATE TABLE IF NOT EXISTS SZ_016_T_Licences(
    SZ_016_Id BINARY(16) PRIMARY KEY,
    SZ_016_Licence VARCHAR(29)  NOT NULL,
    SZ_016_Usage INT DEFAULT (0),
    SZ_016_School_Id BINARY(16),
    FOREIGN KEY(SZ_016_School_Id)
        REFERENCES SZ_006_Schools(SZ_006_Id)
);

CREATE TABLE IF NOT EXISTS SZ_017_Subjects(
	SZ_017_Id BINARY(16) PRIMARY KEY,
    SZ_017_Name VARCHAR(30) NOT NULL
);
CREATE TABLE IF NOT EXISTS SZ_009_Activities(
    SZ_009_Id BINARY(16) PRIMARY KEY,
    SZ_009_Title VARCHAR(25) NOT NULL,
    SZ_009_Deadline DATETIME,
    SZ_009_CreationDate DATETIME NOT NULL,
    SZ_009_UpdateDate DATETIME NOT NULL,
    SZ_009_Route TEXT NOT NULL,
    SZ_009_Content TEXT NOT NULL,
    SZ_009_Deleted TINYINT DEFAULT(0)
);

CREATE TABLE IF NOT EXISTS SZ_005_Skins(
    SZ_005_Id BINARY(16) PRIMARY KEY,
    SZ_005_Name VARCHAR(25) NOT NULL,
    SZ_005_Description TEXT,
    SZ_005_Route TEXT NOT NULL,
    SZ_005_Deleted TINYINT DEFAULT(0)
);
CREATE TABLE IF NOT EXISTS SZ_004_Emblems(
    SZ_004_Id BINARY(16) PRIMARY KEY,
    SZ_004_Name VARCHAR(15) NOT NULL,
    SZ_004_Description TEXT,
    SZ_004_Deleted TINYINT DEFAULT(0)
);
CREATE TABLE IF NOT EXISTS SZ_014_Teachers_Skins(
    SZ_014_Id BINARY(16) PRIMARY KEY,
    SZ_014_Name VARCHAR(25) NOT NULL,
    SZ_014_Description TEXT NOT NULL,
    SZ_014_Route TEXT NOT NULL,
    SZ_014_Deleted TINYINT DEFAULT(0)
);
CREATE TABLE IF NOT EXISTS SZ_002_Students(
    SZ_002_Id BINARY(16) PRIMARY KEY,
    SZ_002_Name VARCHAR(50) NOT NULL,
    SZ_002_SN1 VARCHAR(100) NOT NULL,
    SZ_002_SN2 VARCHAR(100) NOT NULL,
    SZ_002_Birth DATE NOT NULL,
    SZ_002_Nationality VARCHAR(50) NOT NULL,
    SZ_002_Country VARCHAR(30) NOT NULL,
    SZ_002_City VARCHAR(30) NOT NULL,
    SZ_002_PostalCode VARCHAR(5) NOT NULL,
    SZ_002_Address VARCHAR(200) NOT NULL,
    SZ_002_Email VARCHAR(100) NOT NULL,
    SZ_002_Nick VARCHAR(15),
    SZ_002_Password VARCHAR(200) NOT NULL,
    SZ_002_Medical TEXT DEFAULT('Sin observaciones médicas'),
    SZ_002_Observations TEXT DEFAULT('Sin observaciones'),
    SZ_002_Photo_Internal_Route TEXT,
    SZ_002_Licence_Id Binary (16),
    SZ_002_Deleted TINYINT DEFAULT(0)
);
CREATE TABLE IF NOT EXISTS SZ_205_Students_Skins(
    SZ_205_Id BINARY(16) PRIMARY KEY,
    SZ_205_Students_Id BINARY(16) NOT NULL,
    SZ_205_Skins_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_205_Students_Id)
        REFERENCES SZ_002_Students(SZ_002_Id),
    FOREIGN KEY(SZ_205_Skins_Id)
        REFERENCES SZ_005_Skins(SZ_005_Id)
);
CREATE TABLE IF NOT EXISTS SZ_204_Students_Emblems(
    SZ_204_Id BINARY(16) PRIMARY KEY,
    SZ_204_Students_Id BINARY(16) NOT NULL,
    SZ_204_Emblems_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_204_Students_Id)
        REFERENCES SZ_002_Students(SZ_002_Id),
    FOREIGN KEY(SZ_204_Emblems_Id)
        REFERENCES SZ_004_Emblems(SZ_004_Id)
);
CREATE TABLE IF NOT EXISTS SZ_203_Students_Parents(
    SZ_203_Id BINARY(16) PRIMARY KEY,
    SZ_203_Students_Id BINARY(16) NOT NULL,
    SZ_203_Parents_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_203_Students_Id)
        REFERENCES SZ_002_Students(SZ_002_Id),
    FOREIGN KEY(SZ_203_Parents_Id)
        REFERENCES SZ_003_Parents(SZ_003_Id)
);
CREATE TABLE IF NOT EXISTS SZ_007_School_Managers(
    SZ_007_Id BINARY(16) PRIMARY KEY,
    SZ_007_Name VARCHAR(50) NOT NULL,
    SZ_007_SN1 VARCHAR(100) NOT NULL,
    SZ_007_SN2 VARCHAR(100) NOT NULL,
    SZ_007_Birth DATE NOT NULL,
    SZ_007_Nationality VARCHAR(50) NOT NULL,
    SZ_007_Country VARCHAR(30) NOT NULL,
    SZ_007_City VARCHAR(30) NOT NULL,
    SZ_007_PostalCode VARCHAR(5) NOT NULL,
    SZ_007_Address VARCHAR(200) NOT NULL,
    SZ_007_Email VARCHAR(100) NOT NULL,
    SZ_007_Phone1 VARCHAR(15) NOT NULL,
    SZ_007_Phone2 VARCHAR(15),
    SZ_007_Nick VARCHAR(15),
    SZ_007_Password VARCHAR(200) NOT NULL,
    SZ_007_Schools_Id BINARY(16) NOT NULL,
    SZ_007_Deleted TINYINT DEFAULT(0),
    FOREIGN KEY(SZ_007_Schools_Id)
        REFERENCES SZ_006_Schools(SZ_006_Id)
);
CREATE TABLE IF NOT EXISTS SZ_008_Teachers(
    SZ_008_Id BINARY(16) PRIMARY KEY,
    SZ_008_Name VARCHAR(50) NOT NULL,
    SZ_008_SN1 VARCHAR(100) NOT NULL,
    SZ_008_SN2 VARCHAR(100) NOT NULL,
    SZ_008_Birth DATE NOT NULL,
    SZ_008_Nationality VARCHAR(50) NOT NULL,
    SZ_008_Country VARCHAR(30) NOT NULL,
    SZ_008_City VARCHAR(30) NOT NULL,
    SZ_008_PostalCode VARCHAR(5) NOT NULL,
    SZ_008_Address VARCHAR(200) NOT NULL,
    SZ_008_Email VARCHAR(100) NOT NULL,
    SZ_008_Nick VARCHAR(15),
    SZ_008_Password VARCHAR(200) NOT NULL,
    SZ_008_Phone1 VARCHAR(15) NOT NULL,
    SZ_008_Phone2 VARCHAR(15),
    SZ_008_Deleted TINYINT DEFAULT(0)
);
CREATE TABLE IF NOT EXISTS SZ_001_Groups(
    SZ_001_Id BINARY(16) PRIMARY KEY,
    SZ_001_Stage ENUM('Primaria', 'Secundaria', 'Bachilletaro') NOT NULL,
    SZ_001_Level INT NOT NULL,
    SZ_001_Class VARCHAR(10) NOT NULL,
    SZ_001_Schools_Id BINARY(16) NOT NULL,
    SZ_001_Teachers_Id BINARY(16) NOT NULL,
    SZ_001_Deleted TINYINT DEFAULT(0),
    FOREIGN KEY(SZ_001_Schools_Id)
        REFERENCES SZ_006_Schools(SZ_006_Id),
    FOREIGN KEY(SZ_001_Teachers_Id)
        REFERENCES SZ_008_Teachers(SZ_008_Id)
);
CREATE TABLE IF NOT EXISTS SZ_102_Groups_Students(
    SZ_102_Id BINARY(16) PRIMARY KEY,
    SZ_102_Groups_Id BINARY(16) NOT NULL,
    SZ_102_Students_Id BINARY(16) NOT NULL,
    SZ_102_Subjects_Id BINARY(16) NOT NULL,
    SZ_102_Mark_1T INT,
    SZ_102_Mark_2T INT,
    SZ_102_Mark_3T INT,
    SZ_102_Mark_F INT,
    SZ_102_Absence_1T INT,
    SZ_102_Absence_2T INT,
    SZ_102_Absence_3T INT,
    SZ_102_Absence_F INT,
    SZ_102_J_Absence_1T INT,
    SZ_102_J_Absence_2T INT,
    SZ_102_J_Absence_3T INT,
    SZ_102_J_Absence_F INT,
    FOREIGN KEY(SZ_102_Groups_Id)
        REFERENCES SZ_001_Groups(SZ_001_Id),
    FOREIGN KEY(SZ_102_Students_Id)
        REFERENCES SZ_002_Students(SZ_002_Id),
	FOREIGN KEY(SZ_102_Subjects_Id)
		REFERENCES SZ_017_Subjects(SZ_017_Id)
);
CREATE TABLE IF NOT EXISTS SZ_109_Groups_Activities(
    SZ_109_Id BINARY(16) PRIMARY KEY,
    SZ_109_Groups_Id BINARY(16) NOT NULL,
    SZ_109_Activities_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_109_Groups_Id)
        REFERENCES SZ_001_Groups(SZ_001_Id),
    FOREIGN KEY(SZ_109_Activities_Id)
        REFERENCES SZ_009_Activities(SZ_009_Id)
);
CREATE TABLE IF NOT EXISTS SZ_012_Chats(
    SZ_012_Id BINARY(16) PRIMARY KEY,
    SZ_012_Name VARCHAR(25) NOT NULL,
    SZ_012_Image_Route TEXT,
    SZ_012_Deleted TINYINT DEFAULT(0),
    SZ_012_Group_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_012_Group_Id)
        REFERENCES SZ_001_Groups(SZ_001_Id)
);
CREATE TABLE IF NOT EXISTS SZ_013_Messages(
    SZ_013_Id BINARY(16) PRIMARY KEY,
    SZ_013_Body TEXT NOT NULL,
    SZ_013_Sent_Date DATETIME NOT NULL,
    SZ_013_Deleted TINYINT DEFAULT(0),
    SZ_013_Chats_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_013_Chats_Id)
        REFERENCES SZ_012_Chats(SZ_012_Id)
);
CREATE TABLE IF NOT EXISTS SZ_8014_Teachers_Teachers_Skins(
    SZ_8014_Id BINARY(16) PRIMARY KEY,
    SZ_8014_Teachers_Id BINARY(16) NOT NULL,
    SZ_8014_Teachers_Skins_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_8014_Teachers_Id)
        REFERENCES SZ_008_Teachers(SZ_008_Id),
    FOREIGN KEY(SZ_8014_Teachers_Skins_Id)
        REFERENCES SZ_014_Teachers_Skins(SZ_014_Id)
);
CREATE TABLE IF NOT EXISTS SZ_010_Threads(
    SZ_010_Id BINARY(16) PRIMARY KEY,
    SZ_010_Title VARCHAR(200) NOT NULL,
    SZ_010_CreationDate DATETIME NOT NULL,
    SZ_010_Deleted TINYINT DEFAULT(0),
    SZ_010_Teacher_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_010_Teacher_Id)
        REFERENCES SZ_008_Teachers(SZ_008_Id)
);
CREATE TABLE IF NOT EXISTS SZ_011_Posts(
    SZ_011_Id BINARY(16) PRIMARY KEY,
    SZ_011_Title VARCHAR(50) NOT NULL,
    SZ_011_CreationDate DATETIME NOT NULL,
    SZ_011_Body TEXT NOT NULL,
    SZ_011_Edited TINYINT DEFAULT(0),
    SZ_011_EditionDate DATETIME,
    SZ_011_Deleted TINYINT DEFAULT(0),
    SZ_011_Teacher_Id BINARY(16) NOT NULL,
    SZ_011_Threads_Id BINARY(16) NOT NULL,
    FOREIGN KEY(SZ_011_Teacher_Id)
        REFERENCES SZ_008_Teachers(SZ_008_Id),
    FOREIGN KEY(SZ_011_Threads_Id)
        REFERENCES SZ_010_Threads(SZ_010_Id)
);

CREATE TABLE IF NOT EXISTS SZ_015_School_Licences(
    SZ_015_Id BINARY(16) PRIMARY KEY,
    SZ_015_Licence VARCHAR(29)  NOT NULL,
    SZ_015_Quantity INT DEFAULT(0),
    SZ_015_School_Id BINARY(16),
    FOREIGN KEY(SZ_015_School_Id)
        REFERENCES SZ_006_Schools(SZ_006_Id)
);

INSERT INTO `schoolerzz`.`sz_006_schools`
(`SZ_006_Id`,
`SZ_006_Name`,
`SZ_006_SchoolCode`,
`SZ_006_Words3`,
`SZ_006_Country`,
`SZ_006_City`,
`SZ_006_PostalCode`,
`SZ_006_Address`)
VALUES
(UUID_TO_BIN(UUID()),'Joyfe',1,'JOY','Spain', 'Madrid',28017,'c/ Vital Aza, 65');

INSERT INTO `schoolerzz`.`sz_007_school_managers`
(`SZ_007_Id`,
`SZ_007_Name`,
`SZ_007_SN1`,
`SZ_007_SN2`,
`SZ_007_Birth`,
`SZ_007_Nationality`,
`SZ_007_Country`,
`SZ_007_City`,
`SZ_007_PostalCode`,
`SZ_007_Address`,
`SZ_007_Email`,
`SZ_007_Phone1`,
`SZ_007_Nick`,
`SZ_007_Password`,
`SZ_007_Schools_Id`
)
VALUES
(UUID_TO_BIN(UUID()),'María Teresa','Martínez', 'Puche', curdate(),'Spanish','Spain','Madrid','28017','Calle Peter Peter, 4 2Z','mtere@mt.com','+34555555555', 'MJOY-MAMAPU', md5('1234'), (SELECT SZ_006_Id FROM sz_006_schools limit 1));

INSERT INTO `schoolerzz`.`sz_008_teachers`
(`SZ_008_Id`,
`SZ_008_Name`,
`SZ_008_SN1`,
`SZ_008_SN2`,
`SZ_008_Birth`,
`SZ_008_Nationality`,
`SZ_008_Country`,
`SZ_008_City`,
`SZ_008_PostalCode`,
`SZ_008_Address`,
`SZ_008_Email`,
`SZ_008_Password`,
`SZ_008_Phone1`
)
VALUES
(UUID_TO_BIN(UUID()), 'Guillermo','Pérez', 'Tomé',curdate(),'Spanish','Spain','Madrid','28017','Calle Colegio, 4 2Z','guille@gu.com',md5('1234'), '+34111111111');

INSERT INTO `schoolerzz`.`sz_002_students`
(`SZ_002_Id`,
`SZ_002_Name`,
`SZ_002_SN1`,
`SZ_002_SN2`,
`SZ_002_Birth`,
`SZ_002_Nationality`,
`SZ_002_Country`,
`SZ_002_City`,
`SZ_002_PostalCode`,
`SZ_002_Address`,
`SZ_002_Email`,
`SZ_002_Password`
)
VALUES
(UUID_TO_BIN(UUID()), 'Óscar Vicente','Melgarejo', 'Pino',curdate(),'Spanish','Spain','Madrid','28017','Call Carmencita, 4 2Z','oscar@os.com',md5('1234'));

INSERT INTO `schoolerzz`.`sz_003_parents`
(`SZ_003_Id`,
`SZ_003_Name`,
`SZ_003_SN1`,
`SZ_003_SN2`,
`SZ_003_Birth`,
`SZ_003_Nationality`,
`SZ_003_Country`,
`SZ_003_City`,
`SZ_003_PostalCode`,
`SZ_003_Address`,
`SZ_003_Email`,
`SZ_003_Password`,
`SZ_003_Phone1`
)
VALUES
(UUID_TO_BIN(UUID()), 'Pater','Noster', 'Muy Noster',curdate(),'Spanish','Spain','Madrid','28017','Calle Yo Claudio, 4 2Z','Pater@pa.com',md5('1234'), '+34666666666');

INSERT INTO `schoolerzz`.`sz_203_students_parents`
(`SZ_203_Id`,
`SZ_203_Students_Id`,
`SZ_203_Parents_Id`
)
VALUES
(UUID_TO_BIN(UUID()), (SELECT SZ_002_Id FROM sz_002_students limit 1) , (SELECT SZ_003_Id FROM sz_003_parents limit 1));

INSERT INTO `schoolerzz`.`sz_005_skins`
(`SZ_005_Id`,
`SZ_005_Name`,
`SZ_005_Description`,
`SZ_005_Route`
)
VALUES
(UUID_TO_BIN(UUID()),'Bic Cristal Rojo', 'Skin de Boli Bic Cristal Rojo super molona', 'C:/SchoolerzZ/Skins/bic_rojo.png');

INSERT INTO `schoolerzz`.`sz_205_students_skins`
(`SZ_205_Id`,
`SZ_205_Students_Id`,
`SZ_205_Skins_Id`
)
VALUES
(UUID_TO_BIN(UUID()),(SELECT SZ_002_Id FROM sz_002_students limit 1), (SELECT SZ_005_Id FROM sz_005_skins limit 1));

INSERT INTO `schoolerzz`.`sz_004_emblems`
(`SZ_004_Id`,
`SZ_004_Name`,
`SZ_004_Description`
)
VALUES
(UUID_TO_BIN(UUID()),'Pitagorín', 'Eres el más rápido en cálculo mental');

INSERT INTO `schoolerzz`.`sz_204_students_emblems`
(`SZ_204_Id`,
`SZ_204_Students_Id`,
`SZ_204_Emblems_Id`
)
VALUES
(UUID_TO_BIN(UUID()),(SELECT SZ_002_Id FROM sz_002_students limit 1), (SELECT SZ_004_Id FROM sz_004_emblems limit 1));

INSERT INTO `schoolerzz`.`sz_001_groups`
(
	`SZ_001_Id`,
    `SZ_001_Stage`,
    `SZ_001_Level`,
    `SZ_001_Class`,
    `SZ_001_Schools_Id`,
    `SZ_001_Teachers_Id`
)
VALUES
(UUID_TO_BIN(UUID()),'Primaria', 1, 'A', (SELECT SZ_006_Id FROM sz_006_schools limit 1), (SELECT SZ_008_Id FROM sz_008_teachers limit 1));
INSERT INTO SZ_017_Subjects(
	SZ_017_Id,
    SZ_017_Name
)
 VALUES (UUID_TO_BIN(UUID()), 'Matemáticas');
INSERT INTO `schoolerzz`.`sz_102_groups_students`
(
	`SZ_102_Id`,
    `SZ_102_Groups_Id`,
    `SZ_102_Students_Id`,
     SZ_102_Subjects_Id,
     SZ_102_Mark_1T,
     SZ_102_Mark_2T,
     SZ_102_Mark_3T,
     SZ_102_Mark_F,
     SZ_102_Absence_1T,
     SZ_102_Absence_2T,
     SZ_102_Absence_3T,
     SZ_102_Absence_F,
     SZ_102_J_Absence_1T,
     SZ_102_J_Absence_2T,
     SZ_102_J_Absence_3T,
     SZ_102_J_Absence_F
)
VALUES
(UUID_TO_BIN(UUID()),(SELECT SZ_001_Id FROM sz_001_groups limit 1), (SELECT SZ_002_Id FROM sz_002_students limit 1),(SELECT SZ_017_Id FROM sz_017_subjects limit 1),0,0,0,0,0,0,0,0,0,0,0,0);

INSERT INTO `schoolerzz`.`sz_009_activities`
(
    `SZ_009_Id`,
    `SZ_009_Title`,
    `SZ_009_Deadline`,
    `SZ_009_CreationDate`,
    `SZ_009_UpdateDate`,
    `SZ_009_Route`,
    `SZ_009_Content`
)
VALUES
(UUID_TO_BIN(UUID()),'Juego Triángulos', '1996-11-22', '1996-11-21', curdate(), 'C:/SchoolerzZ/Activities/tri_game.exe', '-Formas Geométricas -Identificación de Triángulos');

INSERT INTO `schoolerzz`.`sz_109_groups_activities`
(
    `SZ_109_Id`,
    `SZ_109_Groups_Id`,
    `SZ_109_Activities_Id`
)
VALUES
(UUID_TO_BIN(UUID()),(SELECT SZ_001_Id FROM sz_001_groups limit 1), (SELECT SZ_009_Id FROM sz_009_activities limit 1));

INSERT INTO `schoolerzz`.`sz_012_chats`
(
    `SZ_012_Id`,
    `SZ_012_Name`,
    `SZ_012_Image_Route`,
    `SZ_012_Group_Id`
)
VALUES
(UUID_TO_BIN(UUID()),'1A', 'C:/SchoolerzZ/Chats/chat1A.txt', (SELECT SZ_001_Id FROM sz_001_groups limit 1));

INSERT INTO `schoolerzz`.`sz_013_messages`
(
    `SZ_013_Id`,
    `SZ_013_Body`,
    `SZ_013_Sent_Date`,
    `SZ_013_Chats_Id`
)
VALUES
(UUID_TO_BIN(UUID()),'Primer Mensaje', curdate(), (SELECT SZ_012_Id FROM sz_012_chats limit 1));

INSERT INTO `schoolerzz`.`sz_014_teachers_skins`
(`SZ_014_Id`,
`SZ_014_Name`,
`SZ_014_Description`,
`SZ_014_Route`
)
VALUES
(UUID_TO_BIN(UUID()),'Pilot Verde', 'Skin de Pilot Verde de Aprobar', 'C:/SchoolerzZ/Teachers_Skins/pilot_verde.png');

INSERT INTO `schoolerzz`.`sz_8014_teachers_teachers_skins`
(
    `SZ_8014_Id`,
    `SZ_8014_Teachers_Id`,
    `SZ_8014_Teachers_Skins_Id`
) 
VALUES 
(UUID_TO_BIN(UUID()),(SELECT SZ_008_Id FROM sz_008_teachers limit 1), (SELECT SZ_014_Id FROM sz_014_teachers_skins limit 1));

INSERT INTO `schoolerzz`.`sz_010_Threads`
(
	`SZ_010_Id`,
    `SZ_010_Title`,
    `SZ_010_CreationDate`,
    `SZ_010_Teacher_Id`
)
VALUES 
(UUID_TO_BIN(UUID()),'Actividades 1A', curdate(), (SELECT SZ_008_Id FROM sz_008_teachers limit 1));

INSERT INTO `schoolerzz`.`sz_011_posts`
(
	`SZ_011_Id`,
    `SZ_011_Title`,
    `SZ_011_CreationDate`,
    `SZ_011_Body`,
    `SZ_011_Teacher_Id`,
    `SZ_011_Threads_Id`
)
VALUES 
(UUID_TO_BIN(UUID()),'Primer Post', curdate(), 'Body primer post', (SELECT SZ_008_Id FROM sz_008_teachers limit 1), (SELECT SZ_010_Id FROM sz_010_threads limit 1));
