

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(nationalidnumber AS int) AS codigo_nacionalidade
       , trim(loginid) AS usuario
       , trim(jobtitle) AS cargo
       , cast(birthdate AS date) AS data_nascimento
       , trim(maritalstatus) AS estado_civil
       , trim(gender) AS sexo
       , cast(hiredate AS date) AS data_contratacao
       , cast(vacationhours AS int) AS hora_extra
       , cast(sickleavehours AS int) AS hora_licenca_medica
       , cast(modifieddate AS date) AS data_modificacao       
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`humanresources_employee`