################################################################################      
#==============================================================================#      
#==============================================================================#      
#                               Base de Datos                                  #                          
#==============================================================================#      
#==============================================================================#      
################################################################################   

#==============================================================================#   
# Instalación Postgres
#==============================================================================#  
Se deben ejecutar las siguientes lineas de comando dentro del directorio JUEGOHACKER_BD/POSTGRES/:
~~~
chcp 65001
SET PGCLIENTENCODING=utf-8 
psql -U postgres -d postgres -a -f INSTALADOR_GENERAL.sql > compila.lst
~~~

Las 2 primeras líneas son para especificar a la consola de windows que interprete los archivos como 

y posteriormente se debe escribir la contraseña del usuario postgres el cual se define durante la instalacion de POSTGRES.

                                                                                  
#==============================================================================#    
# Informacion de Versiones                                                                
#==============================================================================#    

[version_mayor].[nueva_funcionalidad].[correccion_errores]
version mayor = cambios que cambian la manera de funcionar el app. Siguiente consecutivo que se tiene la version actual
nueva_funcionalidad = agrega nuevas funciones al app. Siguiente consecutivo que se tiene la version actual 
correccion_errores = ajuste a funciones existentes. Siguiente consecutivo que se tiene la version actual 

Ejemplo: 1.0.3

