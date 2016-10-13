CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_group_ballout` AS
    SELECT 
        `a`.`playDate` AS `playDate`,
        SUM(IF((`a`.`groupName` = 'A'), `a`.`ss`, 0)) AS `a`,
        SUM(IF((`a`.`groupName` = 'B'), `a`.`ss`, 0)) AS `b`,
        SUM(IF((`a`.`groupName` = 'C'), `a`.`ss`, 0)) AS `c`,
        SUM(IF((`a`.`groupName` = 'D'), `a`.`ss`, 0)) AS `d`,
        SUM(`a`.`ss`) AS `totalOut`,
        (SELECT 
                SUM(`p1`.`ballOutput`)
            FROM
                `pia`.`piainfo` `p1`
            WHERE
                ((`p1`.`playDate` <= `a`.`playDate`)
                    AND (`p1`.`kind` = 1))) AS `totalOutBefore`
    FROM
        (SELECT 
            `p`.`playDate` AS `playDate`,
                `t`.`groupName` AS `groupName`,
                SUM(`p`.`ballOutput`) AS `ss`
        FROM
            (`pia`.`piainfo` `p`
        JOIN `pia`.`taino` `t`)
        WHERE
            ((`p`.`taiNo` = `t`.`taiNo`)
                AND (`p`.`taiNo` < 683))
        GROUP BY `p`.`playDate` , `t`.`groupName`
        ORDER BY `p`.`playDate` , `t`.`groupName`) `a`
    GROUP BY `a`.`playDate`