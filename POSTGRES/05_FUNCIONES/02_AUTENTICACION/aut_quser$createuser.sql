CREATE OR REPLACE FUNCTION  "aut_quser$createuser"
(

	p_name_user 	TEXT,
	p_age_user		numeric,
	p_position_user TEXT,
	p_rol 			TEXT,
	OUT p_answer 	TEXT
	
)

RETURNS TEXT
LANGUAGE 'plpgsql'
COST 100
VOLATILE 
AS $BODY$

DECLARE
	
	v_id_user varchar (50);
	v_id_user_temp numeric ;
	c_suser CURSOR FOR
	select nextval ('aut_suser');
	
BEGIN
	
	OPEN c_suser;
	FETCH c_suser INTO v_id_user_temp;
	CLOSE c_suser;
	
	v_id_user:= to_char(v_id_user_temp, '999');
	
	INSERT INTO AUT_TUSER (USER_USER, USER_NAME, USER_AGE, USER_POSITION) 
		VALUES (v_id_user,p_name_user,p_age_user, p_position_user)
	;
	
	INSERT INTO AUT_TUROL (UROL_USER, UROL_ROL) 
		VALUES (v_id_user, p_rol)
	;
	
	p_answer:='OK';
	
	EXCEPTION
	
	WHEN OTHERS THEN
	
	p_answer:='Error'||SQLERRM;
	
END;

$BODY$