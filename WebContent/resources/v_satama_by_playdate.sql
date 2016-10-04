CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_satama_by_playdate` AS
    SELECT 
        `piainfo`.`playDate` AS `playDate`,
        SUM(IF((`piainfo`.`ballOutput` >= 0),
            `piainfo`.`ballOutput`,
            0)) AS `addday`,
        SUM(IF((`piainfo`.`ballOutput` < 0),
            `piainfo`.`ballOutput`,
            0)) AS `unaddday`,
        SUM(`piainfo`.`ballOutput`) AS `totalout`,
        FORMAT((ABS((SUM(IF((`piainfo`.`ballOutput` >= 0),
                        `piainfo`.`ballOutput`,
                        0)) / SUM(IF((`piainfo`.`ballOutput` < 0),
                        `piainfo`.`ballOutput`,
                        0)))) * 100),
            0) AS `rateday`,
        SUM(IF((`piainfo`.`ballOutput` >= 0), 1, 0)) AS `addtime`,
        SUM(IF((`piainfo`.`ballOutput` < 0), 1, 0)) AS `unaddtime`,
        FORMAT(((SUM(IF((`piainfo`.`ballOutput` >= 0), 1, 0)) / COUNT(`piainfo`.`taiNo`)) * 100),
            0) AS `ratetime`
    FROM
        `piainfo`
    GROUP BY `piainfo`.`playDate`
    ORDER BY `totalout` DESC