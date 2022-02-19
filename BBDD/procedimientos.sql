drop PROCEDURE if exists CreateNick;

-- CreateNick: Crea un Nick único para un usuario
--     Parámetros Entrada
--         pv_user_type: tipo de usuario varchar(1);
--         pv_school: nombre del colegio varchar(50);
--         pi_id: id del usuario al que quieres poner el Nick;
--     Parámetros de salida
--         pv_nick: el nick que quieres crear varchar(15);

DELIMITER //
create procedure CreateNick(in pv_user_type varchar(1),
							in pv_school varchar(50),
                            in pi_id BINARY(16),
                            out pv_nick varchar(15))
begin 
	declare vv_short_name varchar(50);
    declare vv_short_user varchar(6);
    declare vv_cad varchar(23);    
    declare vc_word char;
    set vc_word = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
    set vv_short_name = (select SZ_006_Words3 from sz_006_schools where SZ_006_Name like pv_school);
    if pv_user_type like 'S' then
        set vv_short_user = concat(lower(substr((select SZ_002_Name from sz_002_students where SZ_002_Id = pi_id),1,2)), lower(substr((select SZ_002_SN1 from sz_002_students where SZ_002_Id = pi_id),1,2)), lower(substr((select SZ_002_SN2 from sz_002_students where SZ_002_Id = pi_id),1,2)));
    else
        if pv_user_type like 'T' then
            set vv_short_user = concat(lower(substr((select SZ_008_Name from sz_008_teachers where SZ_008_Id = pi_id),1,2)), lower(substr((select SZ_008_SN1 from sz_008_teachers where SZ_008_Id = pi_id),1,2)), lower(substr((select SZ_008_SN2 from sz_008_teachers where SZ_008_Id = pi_id),1,2)));
        else
            if pv_user_type like 'M' then
                set vv_short_user = concat(lower(substr((select SZ_007_Name from sz_007_school_managers where SZ_007_Id = pi_id),1,2)), lower(substr((select SZ_007_SN1 from sz_007_school_managers where SZ_007_Id = pi_id),1,2)), lower(substr((select SZ_007_SN2 from sz_007_school_managers where SZ_007_Id = pi_id),1,2)));
            else
                if pv_user_type like 'P' then
                    set vv_short_user = concat(lower(substr((select SZ_003_Name from sz_003_parents where SZ_003_Id = pi_id),1,2)), lower(substr((select SZ_003_SN1 from sz_003_parents where SZ_003_Id = pi_id),1,2)), lower(substr((select SZ_003_SN2 from sz_003_parents where SZ_003_Id = pi_id),1,2)));
                end if;
            end if;
        end if;
    end if;
    set pv_nick = concat(upper(pv_user_type),upper(vv_short_name),'-',upper(vv_short_user),vc_word);
    while NOT((select SZ_002_Id from sz_002_students where SZ_002_Nick like pv_nick) <=> NULL) DO
		set vc_word = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
        set pv_nick = concat(upper(pv_user_type),upper(vv_short_name),'-',upper(vv_short_user),vc_word);
    end while;
end;
// DELIMITER ;

drop PROCEDURE if exists AddStudent;

DELIMITER //
create procedure AddStudent(in pv_School_Manager_Nick varchar(50),
                            in pv_Name varchar(50),
							in pv_SN1 varchar(100),
							in pv_SN2 varchar(100),
							in pdt_Birth date,
                            in pv_Nationality varchar(50),
                            in pv_Country varchar(30),
                            in pv_City varchar(30),
                            in pv_PostalCode varchar(5),
                            in pv_Address varchar(200),
                            in pv_Email varchar(100),
                            in pv_Password varchar(200),
                            in pt_Medical TEXT,
                            in pt_Observations TEXT,
                            in pt_Photo_Internal_Route TEXT,
                            out pi_r int)
begin 
	declare vv_nick varchar(15);
    declare vv_school_name varchar(50);
    declare vb_id binary(16);
    set vv_school_name = (select SZ_006_Name from sz_006_schools join sz_007_school_managers on SZ_006_Id = SZ_007_Schools_Id where SZ_007_Nick like upper(pv_School_Manager_Nick));
    if ((select sz_015_quantity from sz_015_School_Licences where sz_015_school_id = (SELECT sz_007_schools_id from sz_007_school_managers where SZ_007_Nick like pv_School_Manager_Nick)) > 0) then
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
		(UUID_TO_BIN(UUID()),
		pv_Name,
		pv_SN1,
		pv_SN2,
		pdt_Birth,
		pv_Nationality,
		pv_Country,
		pv_City,
		pv_PostalCode,
		pv_Address,
		pv_Email,
		pv_Password
		);
		set vb_id = (SELECT SZ_002_Id from sz_002_students where SZ_002_Name like pv_Name and SZ_002_SN1 like pv_SN1 and SZ_002_SN2 like pv_SN2);
		if pt_Medical not like '' then
			update sz_002_students set SZ_002_Medical = pt_Medical where SZ_002_Id = vb_id;
		end if;
		if pv_SN2 not like '' then
			update sz_002_students set SZ_002_SN2 = pv_SN2 where SZ_002_Id = vb_id;
		end if;
		if pt_Observations not like '' then
			update sz_002_students set SZ_002_Observations = pt_Observations where SZ_002_Id = vb_id;
		end if;
		if pt_Photo_Internal_Route not like '' then
			update sz_002_students set SZ_002_Photo_Internal_Route = pt_Photo_Internal_Route where SZ_002_Id = vb_id;
		end if;
		call CreateNick('S', vv_school_name, vb_id, @r_nick);
		UPDATE sz_002_students SET SZ_002_Nick = (select @r_nick) WHERE SZ_002_Id = vb_id;
        UPDATE sz_015_School_Licences SET sz_015_quantity = sz_015_quantity - 1 where sz_015_school_id = (SELECT sz_007_schools_id from sz_007_school_managers where SZ_007_Nick like pv_School_Manager_Nick);
		set pi_r = 0;
	else
		set pi_r = 1;
	end if;
end;
// DELIMITER ;

drop PROCEDURE if exists AddTeacher;

DELIMITER //
create procedure AddTeacher(in pv_School_Manager_Nick varchar(50),
                            in pv_Name varchar(50),
							in pv_SN1 varchar(100),
							in pv_SN2 varchar(100),
							in pdt_Birth date,
                            in pv_Nationality varchar(50),
                            in pv_Country varchar(30),
                            in pv_City varchar(30),
                            in pv_PostalCode varchar(5),
                            in pv_Address varchar(200),
                            in pv_Email varchar(100),
                            in pv_Password varchar(200),
                            in pv_Phone1 varchar(15),
                            in pv_Phone2 varchar(15),
                            out pi_r int)
begin 
	declare vv_nick varchar(15);
    declare vv_school_name varchar(50);
    declare vb_id binary(16);
    set vv_school_name = (select SZ_006_Name from sz_006_schools join sz_007_school_managers on SZ_006_Id = SZ_007_Schools_Id where SZ_007_Nick like upper(pv_School_Manager_Nick)); 
	if ((select sz_016_usage from sz_016_t_Licences where sz_016_school_id = (SELECT sz_007_schools_id from sz_007_school_managers where SZ_007_Nick like pv_School_Manager_Nick)) > 0) then
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
		(UUID_TO_BIN(UUID()),
		pv_Name,
		pv_SN1,
		pv_SN2,
		pdt_Birth,
		pv_Nationality,
		pv_Country,
		pv_City,
		pv_PostalCode,
		pv_Address,
		pv_Email,
		md5(pv_Password),
		pv_Phone1
		);
		set vb_id = (SELECT SZ_008_Id from sz_008_teachers where SZ_008_Name like pv_Name and SZ_008_SN1 like pv_SN1 and SZ_008_SN2 like pv_SN2);  
		if pv_Phone2 not like '' then
			update sz_008_teachers set sz_008_Phone2 = pv_Phone2 where SZ_008_Id = vb_id;
		end if;
		call CreateNick('T', vv_school_name, vb_id, @r_nick);
		-- set vv_nick = (select @r_nick);
		UPDATE sz_008_teachers SET SZ_008_Nick = (select @r_nick) WHERE SZ_008_Id = vb_id; 
        UPDATE sz_016_t_Licences SET sz_016_usage = sz_016_usage - 1 where sz_016_school_id = (SELECT sz_007_schools_id from sz_007_school_managers where SZ_007_Nick like pv_School_Manager_Nick);
		set pi_r = 0;
    else
		set pi_r = 1;
	end if;
end;
// DELIMITER ;

drop PROCEDURE if exists AddParent;

DELIMITER //
create procedure AddParent(in pv_School_Manager_Nick varchar(50),
                           in pv_Name varchar(50),
                           in pv_SN1 varchar(100),
                           in pv_SN2 varchar(100),
                           in pdt_Birth date,
                           in pv_Nationality varchar(50),
                           in pv_Country varchar(30),
                           in pv_City varchar(30),
                           in pv_PostalCode varchar(5),
                           in pv_Address varchar(200),
                           in pv_Email varchar(100),
                           in pv_Password varchar(200),
                           in pv_Phone1 varchar(15),
                           in pv_Phone2 varchar(15),
                           in pv_Student_Nick varchar(15),
                           out pi_r int)
begin 
	declare vv_nick varchar(15);
    declare vv_school_name varchar(50);
    declare vb_id binary(16);
    declare vb_student_id binary(16);
    set vb_student_id = (select SZ_002_Id from sz_002_students where SZ_002_Nick like pv_Student_Nick);
    set vv_school_name = (select SZ_006_Name from sz_006_schools join sz_007_school_managers on SZ_006_Id = SZ_007_Schools_Id where SZ_007_Nick like upper(pv_School_Manager_Nick)); 
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
    (UUID_TO_BIN(UUID()),
    pv_Name,
    pv_SN1,
    pv_SN2,
    pdt_Birth,
    pv_Nationality,
    pv_Country,
    pv_City,
    pv_PostalCode,
    pv_Address,
    pv_Email,
    md5(pv_Password),
    pv_Phone1
    );
    set vb_id = (SELECT SZ_003_Id from sz_003_parents where SZ_003_Name like pv_Name and SZ_003_SN1 like pv_SN1 and SZ_003_SN2 like pv_SN2);  
    INSERT INTO sz_203_students_parents(
		`SZ_203_Id`,
        `SZ_203_Students_Id`,
        `SZ_203_Parents_Id`
    ) VALUES (
		UUID_TO_BIN(UUID()),
        pv_Student_Nick,
        vb_id
    );
    if pv_Phone2 not like '' then
		update sz_003_parents set SZ_003_Phone2 = pv_Phone2 where SZ_003_Id = vb_id;
    end if;
    call CreateNick('P', vv_school_name, vb_id, @r_nick);
    set vv_nick = (select @r_nick);
    UPDATE sz_003_parents SET SZ_003_Nick = vv_nick WHERE SZ_003_Id = vb_id; 
    set pi_r = 0;
end;
// DELIMITER ;


DROP PROCEDURE IF EXISTS InsertLicenses;
DELIMITER //
CREATE PROCEDURE InsertLicenses(in pi_n_lic int,
								IN pv_school_manager varchar(15))
BEGIN
	declare vb_s_id binary(16);
	declare vb_t_id binary(16);
    declare vv_new_lic varchar(29);
    DECLARE vi_t_usage INT;
	set vv_new_lic = GenerateLicence();
	set vb_s_id = (select SZ_015_Id from sz_015_school_licences where SZ_015_Licence like vv_new_lic);
	if vb_s_id <=> NULL then
		insert into sz_015_school_licences(SZ_015_Id, SZ_015_Licence, SZ_015_quantity, sz_015_school_Id) values(UUID_TO_BIN(UUID()), vv_new_lic,pi_n_lic, (select sz_006_Id from sz_006_schools s inner join sz_007_school_managers m on s.sz_006_id = m.SZ_007_Schools_Id where m.SZ_007_Nick = UPPER(pv_school_manager)));
    end if;
    set vi_t_usage =truncate((select sz_015_quantity from sz_015_school_licences where sz_015_school_id = (select sz_006_Id from sz_006_schools s inner join sz_007_school_managers m on s.sz_006_id = m.SZ_007_Schools_Id where m.SZ_007_Nick = UPPER(pv_school_manager))) DIV 20,0) + 1;
	insert into sz_016_t_licences(sz_016_id, SZ_016_Licence, SZ_016_Usage, sz_016_school_Id) values(UUID_TO_BIN(UUID()), GenerateLicence(), vi_t_usage, (select sz_006_Id from sz_006_schools s inner join sz_007_school_managers m on s.sz_006_id = m.SZ_007_Schools_Id where m.SZ_007_Nick = UPPER(pv_school_manager)));
END
// DELIMITER ;

/* PA de login
	Si devuelve 0 el usuario y la contraseña es correcta
    Si devuelve -1 el usuario y la contrase son incorrectas*/

/* PA de login
	Si devuelve 0 el usuario y la contraseña es correcta
    Si devuelve -1 el usuario y la contrase son incorrectas*/

DROP PROCEDURE IF EXISTS LoginAJ;
DELIMITER //
CREATE  PROCEDURE LoginAJ(in pc_char char, in pv_username varchar(40), in pv_password varchar(200), out pi_valid int)
BEGIN
	Declare vb_id binary(16);
    Declare vv_user varchar(40);
    set vv_user = upper(concat(pc_char,pv_username));
    
   IF pc_char = upper('S') then 
		set vb_id = (Select SZ_002_Id FROM sz_002_students WHERE SZ_002_Nick LIKE vv_user AND SZ_002_Password LIKE md5(pv_password));
	ELSE
		IF pc_char = upper('T') then 
			set vb_id = (Select SZ_008_Id FROM sz_008_teachers WHERE SZ_008_Nick LIKE vv_user AND SZ_008_Password LIKE md5(pv_password));
		ELSE
			IF pc_char = upper('M') then 
				set vb_id = (Select SZ_007_Id FROM sz_007_school_managers WHERE SZ_007_Nick LIKE vv_user AND SZ_007_Password LIKE md5(pv_password));
			ELSE 
				IF pc_char = upper('P') then 
					set vb_id = (Select SZ_003_Id FROM sz_003_parents WHERE SZ_003_Nick LIKE vv_user AND SZ_003_Password LIKE md5(pv_password));
				END IF;
			END IF;
		END IF;
	END IF;
    IF vb_id IS NOT NULL THEN
		set pi_valid = 0;
	ELSE
		set pi_valid = -1;
	END IF;
END
// DELIMITER ;




drop procedure if exists GeneratePassword;

DELIMITER //
CREATE PROCEDURE GeneratePassword(out pv_word varchar(8))
Begin
    Declare vi_cont int;
    set pv_word = '';
    set vi_cont = 0;
    while vi_cont < 8 Do
		set pv_word = concat(pv_word,(substr('abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJLMNOPQRSTUVWXYZ%$&#-@/+',floor(rand()*66),1)));
        set vi_cont = vi_cont +1;
	End While;
end

// DELIMITER ;

DROP PROCEDURE IF EXISTS LoginTeacherAO;
DELIMITER //
CREATE PROCEDURE LoginTeacherAO(IN username VARCHAR(40), IN pwd VARCHAR(250), OUT valid INT)
BEGIN
	DECLARE exist BINARY(16);
    SELECT SZ_008_Id FROM sz_008_teachers  WHERE SZ_008_Nick LIKE username AND SZ_008_Password LIKE pwd INTO exist;
    IF exist IS NOT NULL THEN 
		SET valid = 0;
    ELSE
		SET valid = -1;
	END IF;
END
// DELIMITER ;

DROP PROCEDURE IF EXISTS GetStudent;

DELIMITER //
CREATE PROCEDURE GetStudent(in pv_Name varchar(50),
							in pv_SN1 varchar(100),
							in pv_SN2 varchar(100))
BEGIN
	select * from sz_002_students where sz_002_Name = pv_Name and sz_002_SN1 = pv_SN1 and sz_002_SN2 = pv_SN2; 
END
// DELIMITER ;

drop procedure if exists GetLicence;
DELIMITER //
CREATE PROCEDURE GetLicence(in pv_School_Manager varchar(50),
							out pv_Licence varchar(29))
BEGIN
	set pv_Licence = (select l.sz_015_Licence from sz_015_school_licences l join sz_007_school_managers m on l.sz_015_School_Id = m.sz_007_Schools_Id where m.sz_007_Nick like upper(pv_School_Manager));
END
// DELIMITER ;

DROP PROCEDURE IF EXISTS GetManager;

DELIMITER //
CREATE PROCEDURE GetManager(in pv_Nick varchar(15),
							out pv_name varchar(50),
                            out pv_sn1 varchar(50),
                            out pv_sn2 varchar(15))
BEGIN
	select m.sz_007_Name into pv_name from sz_007_school_managers m where m.sz_007_Nick = pv_Nick;
    select m.sz_007_SN1 into pv_sn1 from sz_007_school_managers m where m.sz_007_Nick = pv_Nick;
    select m.sz_007_SN2 into pv_sn2 from sz_007_school_managers m where m.sz_007_Nick = pv_Nick;
END
// DELIMITER ;