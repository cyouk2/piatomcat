CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_satama_all_tai` AS
    SELECT DISTINCT
        `v`.`playDate` AS `playdate`,
        IFNULL((SELECT 
                        SUM(`p`.`ballOutput`)
                    FROM
                        `piainfo` `p`
                    WHERE
                        (`p`.`playDate` <= `v`.`playDate`)),
                0) AS `totalOutBefore`,
        (SELECT 
                SUM(`p`.`ballOutput`)
            FROM
                `piainfo` `p`
            WHERE
                (`p`.`playDate` = `v`.`playDate`)) AS `totalOut`
    FROM
        `piainfo` `v`