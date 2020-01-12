

-- 1. 1번 쿼리만 먼저 실행한 후에 dbeaver 환경으로 전환한 후 
-- 	    현재 연결된 db -> Databases -> mydb -> Procedures 
-- 	  -> get_uid_by_location 클릭 -> source 부분에 가셔서 2번 쿼리 전부 복붙하고 저장까지 해주시면 완료입니다

-- 1번
DROP PROCEDURE IF EXISTS get_uid_by_location;
CREATE PROCEDURE get_uid_by_location()
begin
end;



/* 2번
CREATE DEFINER=`myuser`@`localhost` PROCEDURE `mydb`.`get_uid_by_location`(
	in on_latitude double,
	in on_longitude double
)
begin
	(SELECT dist.t_uid FROM(
		SELECT t.t_uid "t_uid", 
				( 6371 * acos( cos( radians(on_latitude) )
				* cos( radians(t.t_latitude) )
				* cos( radians( t.t_longitude)
				- radians(on_longitude) )
				+ sin( radians(on_latitude) )
			* sin( radians(t.t_latitude) ) ) ) AS distance
		FROM toilet_info t) dist
	WHERE dist.distance < 0.5);
END
*/

-- 2번 까지 실행 후 테스트
-- call get_uid_by_location(37.509976, 127.020663);



-- -------------
/*
-- 이 함수는 실행 하셔도 되고 안하셔도 됩니다
DROP PROCEDURE IF EXISTS clac_location;
CREATE PROCEDURE calc_location
(
	in on_latitude double,
	in on_longitude double
)
begin
END;
*/

-- call calc_location(37.509976, 127.020663, @cnt);


-- 화장실 정보 갯수 
-- select count(*) from toilet_info;
