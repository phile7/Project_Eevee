


show tables;

drop table t t_score;
drop table t_score;
drop table p_write;
drop table p_file;
drop table `member`;
drop table main_board;
drop table comment;
drop table c_file;
drop table c_write;


-- member 테이블 테스트 데이터
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (1, "test1", "test1", "test@naver.com", true, 2);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (2, "test2", "test2", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (3, "test3", "test3", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (4, "test4", "test4", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (5, "test5", "test5", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (6, "test6", "test6", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (7, "test7", "test7", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (8, "test8", "test8", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (9, "test9", "test9", "test@naver.com", true, 1);
insert into member (mb_uid, mb_id, mb_password, mb_email, `mb_emailSign`, mb_level) values (10, "test10", "test10", "test@naver.com", true, 1);


-- 자유게시판 test data
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (1, "집에 가고시ㅠㅍ다", "ㅠㅠㅠㅠㅠ", 2, 8);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (2, "집에", "보내주세요", 4, 8);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (3, "졸립니다", "졸려", 0, 6);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (4, "내일 발표", "으어어", 0, 10);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (5, "아니", "근데", 2, 1);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (6, "지금 안자는 사람", "?", 10, 9);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (7, "3일", "째 잠을 자지못하였다", 1, 7);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (8, "vi editor", "단축키가 기억나지 않습니다", 2, 2);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (9, "근데 이것은", "너무 심각한 아무말인 것인가", 5, 3);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (10, "ㅋㅋㅋㅋㅋ", "진짜 너무한거 아니냐", 2, 3);
insert into p_write (pwr_uid, pwr_subject, pwr_content, pwr_viewcnt, mb_uid) values (11, "sjan", "qhrhtlvdjdy", 0, 6);

-- 고객센터 test data
insert into c_write (cwr_uid, cwr_subject, cwr_content, cwr_viewcnt, mb_uid) values (1, "로그인 문의", "이메일만 다시 입력하고싶습니다", 1, 1);
insert into c_write (cwr_uid, cwr_subject, cwr_content, cwr_viewcnt, mb_uid) values (2, "다 좋은데", "글꼴만 궁ㅇ서체로ㅗ 해주시죠", 0, 8);
insert into c_write (cwr_uid, cwr_subject, cwr_content, cwr_viewcnt, mb_uid) values (3, "건의사항", "다시 ㄹ생각해보ㄱ니까 궁서체보다는 휴넌옛날ㄴ이좋겠어요", 0, 8);
insert into c_write (cwr_uid, cwr_subject, cwr_content, cwr_viewcnt, mb_uid) values (4, "반경확장 문의", "반경을 3km로 늘려주세요", 1, 1);
insert into c_write (cwr_uid, cwr_subject, cwr_content, cwr_viewcnt, mb_uid) values (5, "지도 문의", "지도에 길찾기 추가해주세요", 1, 10);


-- 댓글 test data
insert into comment (co_uid, co_content, co_puid, co_depth, mb_uid) values (1, "나", 6, 1, 7);
insert into comment (co_uid, co_content, co_puid, co_depth, mb_uid) values (2, "저요..", 6, 1, 6);
insert into comment (co_uid, co_content, co_puid, co_depth, mb_uid) values (3, "무슨발표?", 4, 1, 6);
insert into comment (co_uid, co_content, co_puid, co_depth, mb_uid) values (4, "저두요", 2, 1, 2);
insert into comment (co_uid, co_content, co_puid, co_depth, mb_uid) values (5, "ㅠㅠ", 2, 2, 3);
insert into comment (co_uid, co_content, co_puid, co_depth, mb_uid) values (6, "졸려", 5, 1, 1);
insert into comment (co_uid, co_content, co_puid, co_depth, mb_uid) values (7, "wlstladmfh", 2, 1, 6);


-- 화장실 별점 test data
insert into t_score values(1, 3, 11);
insert into t_score values(2, 4.5, 13910);

-- 화장실 게시판 test data
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (1, "좋아요", 4, "깨끗", 3, 1, 11, 1);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (2, "오", 5, "음악이나옵니다", 0, 2, 11, 1);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (3, "괜찮아요", 4, "괜찮아요", 2, 3, 11, 1);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (4, "만족", 3, "만족", 9, 4, 11, 1);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (5, "좋아요", 4, "칸 수가 많아요", 3, 5, 11, 1);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (6, "별로", 3, "그냥저냥", 6, 6, 13910, 2);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (7, "일반적인", 3, "일반적인", 11, 7, 13910, 2);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (8, "괜찮은 것 같다", 3, "아닌 것 같다", 5, 8, 13910, 2);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (9, "이건좀", 3, "평범해요", 8, 9, 13910, 2);
insert into t_write (twr_uid, twr_subject, twr_score, twr_content, twr_viewcnt, mb_uid, t_uid, ts_uid) values (10, "ㄲㄱ", 3, "보통입니다", 23, 10, 13910, 2);


