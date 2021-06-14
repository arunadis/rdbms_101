DELIMITER |

CREATE FUNCTION getStoreSettings(STORE_ID varchar(10), SETTING_KEY varchar(50))
RETURNS varchar(100)
DETERMINISTIC
BEGIN

DECLARE SETTING_VALUE varchar(100);

SELECT S.SETTING_VALUE INTO SETTING_VALUE FROM STORE_SETTINGS S
WHERE S.STORE_ID = STORE_ID AND S.SETTING_KEY =  SETTING_KEY;

RETURN SETTING_VALUE;

END
|

DELIMITER ;