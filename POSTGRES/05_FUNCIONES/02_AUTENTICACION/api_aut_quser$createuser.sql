CREATE OR REPLACE FUNCTION "api_aut_quser$createuser"
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

   
    -- =======================================
    -- Variables de control de transaccion
    -- =======================================
	
	
	
    -- Variables usadas para registro de info
    -- de la transaccion
    -- ---------------------------------------
    /*
    --Codigo interno de respuesta
	
   v_crta_crta_gral GE_TCRTA.CRTA_CRTA%TYPE;
   
   --Proceso al cual pertenece el codigo de respuesta
   v_crta_prcs_gral GE_TCRTA.CRTA_PRCS%TYPE;
  
  
    --Codigo Http para el cogido interno de respuesta 
    v_crta_http_gral GE_TCRTA.CRTA_HTTP_CODE%TYPE;
    
    --Descripcion general del codigo de respuesta 
    v_crta_descri_gral GE_TCRTA.CRTA_DESCRI%TYPE;
    
    --Log de trasnsacciones
    v_lgtr GE_TLGTR.LGTR_LGTR%TYPE;    
    
    ---Id Entidad para el log de transacciones 
    v_lgtr_id_entidad GE_TLGTR.LGTR_ID_ENTIDAD%TYPE;  
    
    */
    
    -- =======================================
    -- Transformaciones JSON Parametros Ctrl
    -- =======================================
    -- Se convierten los parametros TEXT json
    -- a objetos TYPE de base de datos
    -- ---------------------------------------
    /*
    
    -- Entrada
    -- parametros de control
    c_ctrl_operacion CURSOR (pc_variable TEXT) FOR
        SELECT * FROM json_populate_recordset
        (NULL ::TYPE_TO_GE_LGTR,
		(pc_variable)::json );
	
	tt_ctrl_operacion TYPE_TT_GE_LGTR;
    to_ctrl_operacion TYPE_TO_GE_LGTR;
    
    
    -- Salidas
    -- p_errores
    c_p_terrore CURSOR (pc_variable TEXT) FOR
    SELECT * FROM array_to_json
    (pc_variable::TYPE_TT_GE_ERRO);	
	
    -- p_mensajes
    c_p_tmensaj CURSOR (pc_variable TEXT) FOR
    SELECT * FROM array_to_json
    (pc_variable::TYPE_TT_GE_MNSJ);
    
    
    F$RESULT_CTRL RECORD;
    
    
    
    -- =======================================
    -- Variables de negocio 
    -- =======================================
    to_ge_erro TYPE_TO_GE_ERRO;
    tt_ge_erro TYPE_TT_GE_ERRO;
    -- =======================================
    -- Transformaciones JSON Para Negocio
    -- =======================================
    -- Se convierten los parametros TEXT json
    -- a objetos TYPE de base de datos
    -- ---------------------------------------
    
    
    -- parametros de entrada
    -- usuario
	c_tuser CURSOR (pc_variable TEXT)FOR
		SELECT *FROM json_populate_recordset
		(NULL ::TYPE_TO_AU_USER,
		(pc_variable)::json);
    
	tt_user TYPE_TT_AU_USER;
	to_user TYPE_TO_AU_USER; 
	
	c_tplayer CURSOR (pc_variable TEXT)FOR
		SELECT *FROM json_populate_recordset
		(NULL ::TYPE_TO_PL_PLAYER,
		(pc_variable)::json);
    
	to_pl_player TYPE_TO_PL_PLAYER;
    tt_pl_player TYPE_TT_PL_PLAYER; 
	
    */
    -- parametros de salida
   

    F$RESULT_LOGICA TEXT;

BEGIN

    --v_crta_prcs_gral := 'api_qregister.registerplayer';

    -- =======================================
    -- Validacion de control de operacion
    -- =======================================
    -- Se valida que los parametros de control
    -- de operacion sean validos
    -- ---------------------------------------
	/*    
    DECLARE

        v_cod_rspta_lgtr_v GE_TCRTA.CRTA_CRTA%TYPE;
        v_cod_rpta_descri_lgtr_v GE_TCRTA.CRTA_DESCRI%TYPE;
        
    BEGIN
    
        
        FOR i IN c_ctrl_operacion(p_ctrl_operacion)
        LOOP
           to_ctrl_operacion := ROW (i.LGTR_TRANS, i.LGTR_TERMINAL, i.LGTR_USER, i.LGTR_FECH_OPER, i.LGTR_HORA_OPER, 
i.LGTR_OBSERVACION)::TYPE_TO_GE_LGTR;
           tt_ctrl_operacion[COALESCE(array_length(tt_ctrl_operacion, 1), 0)] := to_ctrl_operacion;
        END LOOP;
    
        SELECT
            *
            FROM ge_qlgtr$validar_ctrl_operacion(tt_ctrl_operacion, v_crta_prcs_gral)
            INTO F$RESULT_CTRL;
        
        
        v_cod_rspta_lgtr_v       := F$RESULT_CTRL.P_COD_RPTA;
        v_cod_rpta_descri_lgtr_v := F$RESULT_CTRL.P_COD_RPTA_DESCRI;
        
		
        IF (v_cod_rspta_lgtr_v <> 'OK') THEN

			raise EXCEPTION  using errcode = 50001;

        END IF;

    END;
    */
    -- =======================================
    -- Inicio de log de transaccion 
    -- =======================================
    -- Se inicia log de transaccion para el
    -- proceso especificado
    -- ---------------------------------------
	/*
    DECLARE

        v_cod_rspta_lgtr GE_TCRTA.CRTA_CRTA%TYPE;
        v_cod_rpta_descri_lgtr GE_TCRTA.CRTA_DESCRI%TYPE;

    BEGIN
    
        raise notice 'inicio log';
        raise notice 'tt_ctrl_operacion: %',tt_ctrl_operacion;
        raise notice 'v_crta_prcs_gral: %',v_crta_prcs_gral;
        
        SELECT
            *
            FROM ge_qlgtr$iniciar_log(tt_ctrl_operacion,v_crta_prcs_gral)
            INTO v_cod_rspta_lgtr, v_cod_rpta_descri_lgtr, v_lgtr;
        
        raise notice 'fin del inicio log';
		
		if(v_cod_rspta_lgtr <> 'OK')then
		
			v_crta_crta_gral := v_cod_rspta_lgtr;
			
			raise EXCEPTION  using errcode = 50002;
			
		end if;

    END;
    */
    -- =======================================
    -- LLamado a servicio de negocio
    -- =======================================
    -- Se realiza el llamado a la(s) operacion
    -- de negocio correspondiente
    -- ---------------------------------------
	BEGIN
		SELECT
			*
			FROM aut_quser$createuser(p_name_user,p_age_user,p_position_user,p_rol)
			INTO F$RESULT_LOGICA;
			p_answer:= F$RESULT_LOGICA;
		
		/*
		IF (p_cod_rpta<> 'OK') THEN
        
            --Se convierte las salidas de control a JSON
            OPEN c_p_terrore (F$RESULT_LOGICA.P_ERRORES);
            FETCH c_p_terrore INTO p_errores;
            CLOSE c_p_terrore;
            
            OPEN c_p_tmensaj (F$RESULT_LOGICA.P_MENSAJES);
            FETCH c_p_tmensaj INTO p_mensajes;
            CLOSE c_p_tmensaj;
		END IF;
		
		
		v_lgtr_id_entidad:=v_user_user;
		
		IF (p_cod_rpta <> 'OK') THEN
		
			raise EXCEPTION  using errcode = 50003;	
			
		end if;
		*/
		
	EXCEPTION
		when others then
			p_answer:= 'ERROR_LOGIC_NC';
		
    END;
    
    
    -- =======================================
    -- Finalizacion de log de transaccion 
    -- =======================================
    -- Se finaliza log de transaccion para el
    -- proceso especificado
    -- ---------------------------------------
    /*
	DECLARE

        v_cod_rspta_lgtr GE_TCRTA.CRTA_CRTA%TYPE;
        v_cod_rpta_descri_lgtr GE_TCRTA.CRTA_DESCRI%TYPE;

    BEGIN

        IF (p_cod_rpta = 'OK') THEN

            v_crta_crta_gral := 'OK';

        ELSE

            v_crta_crta_gral := p_cod_rpta;

        END IF;

        SELECT
            *
            FROM ge_qlgtr$finalizar_log(p_lgtr := v_lgtr, p_crta := v_crta_crta_gral, p_id_entidad := COALESCE(v_lgtr_id_entidad, '-'), p_error := 
v_crta_descri_gral)
            INTO v_cod_rspta_lgtr, v_cod_rpta_descri_lgtr;
	EXCEPTION 
		WHEN OTHERS THEN
			INSERT INTO GE_TLOGT
				(logt_logt,logt_valor)VALUES(50,'asd');
	END;*/

EXCEPTION
	WHEN others THEN

        p_answer:= 'ERROR_NC';
	
END;

$BODY$;

--ALTER FUNCTION "api_qregister$registerplayer"(text, text, text, text, text, text)
    
