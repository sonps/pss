/* 암호화 펑션 생성 스크립트 */
CREATE FUNCTION FN_ENCRYPT(encVal varchar(1000)) returns varchar(1000)

BEGIN
      DECLARE returnVal VARCHAR(1000);
      SET returnVal = '';

      SELECT
             HEX(AES_ENCRYPT(encVal,SHA2('djrakswkdwkthsvlftkd',512)))
        INTO returnVal;
      RETURN returnVal;
END;
/*
SELECT FN_ENCRYPT('test') FROM DUAL;
*/

/* 복호화 펑션 */
CREATE FUNCTION FN_DECRYPT(decVal varchar(1000)) returns varchar(1000)

BEGIN
      DECLARE returnVal VARCHAR(1000);
      SET returnVal = '';

      SELECT
             CAST(AES_DECRYPT(UNHEX(decVal),SHA2('djrakswkdwkthsvlftkd',512)) AS CHAR)
        INTO returnVal FROM DUAL;
      RETURN returnVal;
END;
/*
SELECT FN_DECRYPT('EE5C3DE68AF2FE16CA8C5DAA1744EAE0') FROM DUAL;
*/