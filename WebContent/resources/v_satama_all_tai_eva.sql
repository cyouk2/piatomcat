CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_satama_all_tai_eva` AS
    SELECT DISTINCT
        `v`.`playDate` AS `playdate`,
        IFNULL((SELECT 
                        SUM(`p`.`ballOutput`)
                    FROM
                        `piainfo` `p`
                    WHERE
                        ((`p`.`playDate` <= `v`.`playDate`)
                            AND (`p`.`kind` = 2))),
                0) AS `totalOutBefore`,
        (SELECT 
                SUM(`p`.`ballOutput`)
            FROM
                `piainfo` `p`
            WHERE
                ((`p`.`playDate` = `v`.`playDate`)
                    AND (`p`.`kind` = 2))) AS `totalOut`
    FROM
        `piainfo` `v`
    WHERE
        (`v`.`kind` = 2)