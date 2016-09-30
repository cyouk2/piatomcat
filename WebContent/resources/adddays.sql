CREATE DEFINER=`root`@`localhost` FUNCTION `adddays`(intDay INT,adds INT) RETURNS int(11)
BEGIN
	declare result INTEGER;
SELECT 
    DATE_FORMAT(ADDDATE(STR_TO_DATE(intDay, '%Y%m%d'),
                INTERVAL adds DAY),
            '%Y%m%d')
INTO result;
    
RETURN result;
END