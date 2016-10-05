CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_satama_by_d_t_10` AS
    SELECT 
        `v`.`playDate` AS `playDate`,
        `v`.`taiNo` AS `taiNo`,
        `v`.`bonusCount` AS `bonusCount`,
        `v`.`rate` AS `rate`,
        `v`.`ballOutput` AS `ballOutput`,
        CAST(IF((`v`.`rate` <> 0),
                (`v`.`bonusCount` * `v`.`rate`),
                ABS((((`v`.`ballOutput` * 4) / 1000) * 14)))
            AS UNSIGNED) AS `ballInput`,
        (SELECT 
                SUM(`p`.`ballOutput`)
            FROM
                `piainfo` `p`
            WHERE
                ((`v`.`playDate` >= `p`.`playDate`)
                    AND (`p`.`taiNo` = `v`.`taiNo`)
                    AND (`p`.`playDate` BETWEEN 20161001 AND 20161031))) AS `totalOut`,
        IFNULL((SELECT 
                        SUM(`p`.`ballOutput`)
                    FROM
                        `piainfo` `p`
                    WHERE
                        ((`v`.`playDate` > `p`.`playDate`)
                            AND (`p`.`taiNo` = `v`.`taiNo`)
                            AND (`p`.`playDate` BETWEEN 20161001 AND 20161031))),
                0) AS `totalOutBefore`,
        FORMAT(IF((`v`.`rate` = 0),
                0,
                (10000 / `v`.`rate`)),
            0) AS `rateN`,
        (`v`.`bonusCount` * 10) AS `bonusCountN`,
        CAST((`v`.`ballOutput` / 100) AS SIGNED) AS `ballOutputN`,
        SUBSTR(`v`.`playDate`, 5) AS `playDateN`,
        CAST(((SELECT 
                    SUM(`p`.`ballOutput`)
                FROM
                    `piainfo` `p`
                WHERE
                    ((`v`.`playDate` >= `p`.`playDate`)
                        AND (`p`.`taiNo` = `v`.`taiNo`)
                        AND (`p`.`playDate` BETWEEN 20161001 AND 20161031))) / 100)
            AS SIGNED) AS `totalOutN`
    FROM
        `piainfo` `v`
    WHERE
        (`v`.`playDate` BETWEEN 20161001 AND 20161031)
    GROUP BY `v`.`taiNo` , `v`.`playDate`