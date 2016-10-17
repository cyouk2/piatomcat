CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_rate_layout` AS
    SELECT 
        `piainfo`.`playDate` AS `playdate`,
        `piainfo`.`month` AS `month`,
        SUM(IF((`piainfo`.`taiNo` = 557),
            `piainfo`.`rate`,
            0)) AS `v_557`,
        SUM(IF((`piainfo`.`taiNo` = 558),
            `piainfo`.`rate`,
            0)) AS `v_558`,
        SUM(IF((`piainfo`.`taiNo` = 559),
            `piainfo`.`rate`,
            0)) AS `v_559`,
        SUM(IF((`piainfo`.`taiNo` = 560),
            `piainfo`.`rate`,
            0)) AS `v_560`,
        SUM(IF((`piainfo`.`taiNo` = 561),
            `piainfo`.`rate`,
            0)) AS `v_561`,
        SUM(IF((`piainfo`.`taiNo` = 562),
            `piainfo`.`rate`,
            0)) AS `v_562`,
        SUM(IF((`piainfo`.`taiNo` = 563),
            `piainfo`.`rate`,
            0)) AS `v_563`,
        SUM(IF((`piainfo`.`taiNo` = 564),
            `piainfo`.`rate`,
            0)) AS `v_564`,
        SUM(IF((`piainfo`.`taiNo` = 565),
            `piainfo`.`rate`,
            0)) AS `v_565`,
        SUM(IF((`piainfo`.`taiNo` = 566),
            `piainfo`.`rate`,
            0)) AS `v_566`,
        SUM(IF((`piainfo`.`taiNo` = 567),
            `piainfo`.`rate`,
            0)) AS `v_567`,
        SUM(IF((`piainfo`.`taiNo` = 568),
            `piainfo`.`rate`,
            0)) AS `v_568`,
        SUM(IF((`piainfo`.`taiNo` = 569),
            `piainfo`.`rate`,
            0)) AS `v_569`,
        SUM(IF((`piainfo`.`taiNo` = 570),
            `piainfo`.`rate`,
            0)) AS `v_570`,
        SUM(IF((`piainfo`.`taiNo` = 571),
            `piainfo`.`rate`,
            0)) AS `v_571`,
        SUM(IF((`piainfo`.`taiNo` = 572),
            `piainfo`.`rate`,
            0)) AS `v_572`,
        SUM(IF((`piainfo`.`taiNo` = 573),
            `piainfo`.`rate`,
            0)) AS `v_573`,
        SUM(IF((`piainfo`.`taiNo` = 574),
            `piainfo`.`rate`,
            0)) AS `v_574`,
        SUM(IF((`piainfo`.`taiNo` = 575),
            `piainfo`.`rate`,
            0)) AS `v_575`,
        SUM(IF((`piainfo`.`taiNo` = 576),
            `piainfo`.`rate`,
            0)) AS `v_576`,
        SUM(IF((`piainfo`.`taiNo` = 577),
            `piainfo`.`rate`,
            0)) AS `v_577`,
        SUM(IF((`piainfo`.`taiNo` = 578),
            `piainfo`.`rate`,
            0)) AS `v_578`,
        SUM(IF((`piainfo`.`taiNo` = 579),
            `piainfo`.`rate`,
            0)) AS `v_579`,
        SUM(IF((`piainfo`.`taiNo` = 580),
            `piainfo`.`rate`,
            0)) AS `v_580`,
        SUM(IF((`piainfo`.`taiNo` = 581),
            `piainfo`.`rate`,
            0)) AS `v_581`,
        SUM(IF((`piainfo`.`taiNo` = 582),
            `piainfo`.`rate`,
            0)) AS `v_582`,
        SUM(IF((`piainfo`.`taiNo` = 583),
            `piainfo`.`rate`,
            0)) AS `v_583`,
        SUM(IF((`piainfo`.`taiNo` = 584),
            `piainfo`.`rate`,
            0)) AS `v_584`
    FROM
        `piainfo`
    GROUP BY `piainfo`.`playDate`
    ORDER BY `piainfo`.`playDate`