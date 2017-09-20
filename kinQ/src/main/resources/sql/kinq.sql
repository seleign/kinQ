-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.





DROP SEQUENCE Follow;
DROP SEQUENCE RNotify_SEQ;
DROP SEQUENCE QNotify_SEQ;
DROP SEQUENCE Qna_Answer_Attach_SEQ;
DROP SEQUENCE Qna_Attach_SEQ;
DROP SEQUENCE Field_SEQ;
DROP SEQUENCE PointLog_SEQ;
DROP SEQUENCE CashLog_SEQ;
DROP SEQUENCE Q_Attach_SEQ;
DROP SEQUENCE Tag_SEQ;
DROP SEQUENCE Minor_SEQ;
DROP SEQUENCE Qna_SEQ;
DROP SEQUENCE Major_SEQ;
DROP SEQUENCE Qna_Answer_SEQ;
DROP SEQUENCE Q_Reply_SEQ;
DROP SEQUENCE Q_Board_SEQ;
DROP SEQUENCE UserInfo_SEQ;
DROP INDEX r_comment_idx;
DROP INDEX r_content_idx;
DROP INDEX q_content_idx;
DROP TABLE Follow;
DROP TABLE RNotify;
DROP TABLE QNotify;
DROP TABLE Qna_Answer_Attach;
DROP TABLE Qna_Attach;
DROP TABLE Field;
DROP TABLE PointLog;
DROP TABLE CashLog;
DROP TABLE Thumbnail;
DROP TABLE Recommendation;
DROP TABLE R_Attach;
DROP TABLE Q_Attach;
DROP TABLE Tag;
DROP TABLE Minor;
DROP TABLE Qna;
DROP TABLE R_Comment; 
DROP TABLE Major;
DROP TABLE Qna_Answer;
DROP TABLE Q_Reply;
DROP TABLE Q_board;
DROP TABLE UserInfo;

-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- UserInfo Table Create SQL
CREATE TABLE UserInfo
(
    UserNum     NUMBER          NOT NULL, 
    ID          VARCHAR2(30)    NOT NULL, 
    PW          VARCHAR2(20)    NOT NULL, 
    UserName    VARCHAR2(30)    NOT NULL, 
    Age         NUMBER          NOT NULL, 
    Birth       DATE            NOT NULL, 
    Phone       VARCHAR2(30)    NOT NULL, 
    Email       VARCHAR2(90)    NOT NULL, 
    CONSTRAINT USERINFO_PK PRIMARY KEY (UserNum)
)
/

CREATE SEQUENCE UserInfo_SEQ
START WITH 1
INCREMENT BY 1;



-- Q_Board Table Create SQL
CREATE TABLE Q_Board
(
    QuestionNum        NUMBER            NOT NULL, 
    UserNum            NUMBER            NOT NULL, 
    timeLimit          DATE              NULL, 
    urgent             VARCHAR2(30)      NOT NULL, 
    RegDate            DATE              NOT NULL, 
    ModDate            DATE              NOT NULL, 
    Title              VARCHAR2(90)      NOT NULL, 
    RelatedTag         VARCHAR2(30)      NOT NULL, 
    Hit                NUMBER            NOT NULL, 
    QuestionContent    VARCHAR2(3000)    NOT NULL, 
    CONSTRAINT Q_BOARD_PK PRIMARY KEY (QuestionNum)
)
/

CREATE SEQUENCE Q_Board_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE Q_Board
    ADD CONSTRAINT FK_Q_Board_UserNum_UserInfo_Us FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- Q_Reply Table Create SQL
CREATE TABLE Q_Reply
(
    ReplyNum        NUMBER            NOT NULL, 
    QuestionNum     NUMBER            NOT NULL, 
    UserNum         NUMBER            NOT NULL, 
    ID              VARCHAR2(30)      NOT NULL, 
    R_RegDate       DATE              NOT NULL, 
    R_ModDate       DATE              NOT NULL, 
    ReplyTitle      VARCHAR2(90)      NOT NULL, 
    ReplyContent    VARCHAR2(1500)    NOT NULL, 
    videoSrc        VARCHAR2(100)     NULL, 
    CONSTRAINT Q_REPLY_PK PRIMARY KEY (ReplyNum)
)
/

CREATE SEQUENCE Q_Reply_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE Q_Reply
    ADD CONSTRAINT FK_Q_Reply_QuestionNum_Q_Board FOREIGN KEY (QuestionNum)
        REFERENCES Q_Board (QuestionNum)
/

ALTER TABLE Q_Reply
    ADD CONSTRAINT FK_Q_Reply_UserNum_UserInfo_Us FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- Qna_Answer Table Create SQL
CREATE TABLE Qna_Answer
(
    QnaAnswerNum        NUMBER            NOT NULL, 
    UserNum             NUMBER            NOT NULL, 
    QnaA_RegDate        DATE              NOT NULL, 
    QnaAnswerTitle      VARCHAR2(90)      NOT NULL, 
    QnaAnswerContent    VARCHAR2(3000)    NOT NULL, 
    CONSTRAINT QNA_ANSWER_PK PRIMARY KEY (QnaAnswerNum)
)
/

CREATE SEQUENCE Qna_Answer_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE Qna_Answer
    ADD CONSTRAINT FK_Qna_Answer_UserNum_UserInfo FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- Major Table Create SQL
CREATE TABLE Major
(
    MajorNum     NUMBER         NOT NULL, 
    MajorName    VARCHAR(30)    NOT NULL, 
    CONSTRAINT MAJOR_PK PRIMARY KEY (MajorNum)
)
/

CREATE SEQUENCE Major_SEQ
START WITH 1
INCREMENT BY 1;



-- Qna Table Create SQL
CREATE TABLE Qna
(
    QnaNum          NUMBER            NOT NULL, 
    UserNum         NUMBER            NOT NULL, 
    Qna_RegDate     DATE              NOT NULL, 
    QnaTitle        VARCHAR2(90)      NOT NULL, 
    QnaContent      VARCHAR2(3000)    NOT NULL, 
    QnaAnswerNum    NUMBER            NULL, 
    CONSTRAINT QNA_PK PRIMARY KEY (QnaNum)
)
/

CREATE SEQUENCE Qna_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE Qna
    ADD CONSTRAINT FK_Qna_UserNum_UserInfo_UserNu FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/

ALTER TABLE Qna
    ADD CONSTRAINT FK_Qna_QnaAnswerNum_Qna_Answer FOREIGN KEY (QnaAnswerNum)
        REFERENCES Qna_Answer (QnaAnswerNum)
/


-- Minor Table Create SQL
CREATE TABLE Minor
(
    MinorNum     NUMBER         NOT NULL, 
    MajorNum     NUMBER         NOT NULL, 
    MinorName    VARCHAR(30)    NOT NULL, 
    CONSTRAINT MINOR_PK PRIMARY KEY (MinorNum)
)
/

CREATE SEQUENCE Minor_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE Minor
    ADD CONSTRAINT FK_Minor_MajorNum_Major_MajorN FOREIGN KEY (MajorNum)
        REFERENCES Major (MajorNum)
/


-- Tag Table Create SQL
CREATE TABLE Tag
(
    TagNum         NUMBER          NOT NULL, 
    QuestionNum    NUMBER          NOT NULL, 
    UserNum        NUMBER          NOT NULL, 
    Tag            VARCHAR2(60)    NOT NULL, 
    CONSTRAINT TAG_PK PRIMARY KEY (TagNum)
)
/

CREATE SEQUENCE Tag_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE Tag
    ADD CONSTRAINT FK_Tag_QuestionNum_Q_Board_Que FOREIGN KEY (QuestionNum)
        REFERENCES Q_Board (QuestionNum)
/

ALTER TABLE Tag
    ADD CONSTRAINT FK_Tag_UserNum_UserInfo_UserNu FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- Q_Attach Table Create SQL
CREATE TABLE Q_Attach
(
    FileNum        NUMBER           NOT NULL, 
    QuestionNum    NUMBER           NOT NULL, 
    UserNum        NUMBER           NOT NULL, 
    QFileName      VARCHAR2(300)    NOT NULL, 
    QFilePath      VARCHAR2(300)    NOT NULL, 
    CONSTRAINT Q_ATTACH_PK PRIMARY KEY (FileNum)
)
/

CREATE SEQUENCE Q_Attach_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE Q_Attach
    ADD CONSTRAINT FK_Q_Attach_QuestionNum_Q_Boar FOREIGN KEY (QuestionNum)
        REFERENCES Q_Board (QuestionNum)
/

ALTER TABLE Q_Attach
    ADD CONSTRAINT FK_Q_Attach_UserNum_UserInfo_U FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- R_Attach Table Create SQL
CREATE TABLE R_Attach
(
    RFileNum     NUMBER           NOT NULL, 
    ReplyNum     NUMBER           NOT NULL, 
    UserNum      NUMBER           NOT NULL, 
    RFileName    VARCHAR2(300)    NOT NULL, 
    RFilePath    VARCHAR2(300)    NOT NULL, 
    CONSTRAINT R_ATTACH_PK PRIMARY KEY (RFileNum)
)
/

ALTER TABLE R_Attach
    ADD CONSTRAINT FK_R_Attach_ReplyNum_Q_Reply_R FOREIGN KEY (ReplyNum)
        REFERENCES Q_Reply (ReplyNum)
/

ALTER TABLE R_Attach
    ADD CONSTRAINT FK_R_Attach_UserNum_UserInfo_U FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- R_Comment Table Create SQL
CREATE TABLE R_Comment
(
    ReplyNum      NUMBER           NOT NULL, 
    UserNum       NUMBER           NOT NULL, 
    ID            VARCHAR2(30)     NOT NULL, 
    R_Comment     VARCHAR2(900)    NOT NULL, 
    RC_RegDate    DATE             NOT NULL, 
    RC_ModDate    DATE             NULL   
)
/

ALTER TABLE R_Comment
    ADD CONSTRAINT FK_R_Comment_ReplyNum_Q_Reply_ FOREIGN KEY (ReplyNum)
        REFERENCES Q_Reply (ReplyNum)
/

ALTER TABLE R_Comment
    ADD CONSTRAINT FK_R_Comment_UserNum_UserInfo_ FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- Recommendation Table Create SQL
CREATE TABLE Recommendation
(
    ReplyNum       NUMBER    NOT NULL, 
    QuestionNum    NUMBER    NOT NULL, 
    UserNum        NUMBER    NOT NULL, 
    Score          NUMBER    NOT NULL
)
/

ALTER TABLE Recommendation
    ADD CONSTRAINT FK_Recommendation_ReplyNum_Q_R FOREIGN KEY (ReplyNum)
        REFERENCES Q_Reply (ReplyNum)
/

ALTER TABLE Recommendation
    ADD CONSTRAINT FK_Recommendation_QuestionNum_ FOREIGN KEY (QuestionNum)
        REFERENCES Q_Board (QuestionNum)
/

ALTER TABLE Recommendation
    ADD CONSTRAINT FK_Recommendation_UserNum_User FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- Thumbnail Table Create SQL
CREATE TABLE Thumbnail
(
    QuestionNum      NUMBER           NOT NULL, 
    ThumbnailName    VARCHAR2(300)    NOT NULL, 
    ThumbnailPath    VARCHAR2(300)    NOT NULL
)
/

ALTER TABLE Thumbnail
    ADD CONSTRAINT FK_Thumbnail_QuestionNum_Q_Boa FOREIGN KEY (QuestionNum)
        REFERENCES Q_Board (QuestionNum)
/


-- CashLog Table Create SQL
CREATE TABLE CashLog
(
    CashLogNum      NUMBER    NOT NULL, 
    UserNum         NUMBER    NOT NULL, 
    CCharged        NUMBER    NULL, 
    CChargedDate    DATE      NULL, 
    CUsed           NUMBER    NULL, 
    CUsedDate       DATE      NULL, 
    CChange         NUMBER    NOT NULL, 
    CONSTRAINT CASHLOG_PK PRIMARY KEY (CashLogNum)
)
/

CREATE SEQUENCE CashLog_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE CashLog
    ADD CONSTRAINT FK_CashLog_UserNum_UserInfo_Us FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- PointLog Table Create SQL
CREATE TABLE PointLog
(
    PointLogNum     NUMBER    NOT NULL, 
    PUserNum        NUMBER    NOT NULL, 
    PCharged        NUMBER    NULL, 
    PChargedDate    DATE      NULL, 
    PUsed           NUMBER    NULL, 
    PUsedDate       DATE      NULL, 
    PChange         NUMBER    NOT NULL, 
    CONSTRAINT POINTLOG_PK PRIMARY KEY (PointLogNum)
)
/

CREATE SEQUENCE PointLog_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE PointLog
    ADD CONSTRAINT FK_PointLog_PUserNum_UserInfo_ FOREIGN KEY (PUserNum)
        REFERENCES UserInfo (UserNum)
/


-- Field Table Create SQL
CREATE TABLE Field
(
    FieldNum    NUMBER    NOT NULL, 
    UserNum     NUMBER    NOT NULL, 
    MajorNum    NUMBER    NOT NULL, 
    MinorNum    NUMBER    NOT NULL, 
    CONSTRAINT FIELD_PK PRIMARY KEY (FieldNum)
)
/

CREATE SEQUENCE Field_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE Field
    ADD CONSTRAINT FK_Field_UserNum_UserInfo_User FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/

ALTER TABLE Field
    ADD CONSTRAINT FK_Field_MajorNum_Major_MajorN FOREIGN KEY (MajorNum)
        REFERENCES Major (MajorNum)
/

ALTER TABLE Field
    ADD CONSTRAINT FK_Field_MinorNum_Minor_MinorN FOREIGN KEY (MinorNum)
        REFERENCES Minor (MinorNum)
/


-- Qna_Attach Table Create SQL
CREATE TABLE Qna_Attach
(
    QnaFileNum     NUMBER           NOT NULL, 
    QnaNum         NUMBER           NOT NULL, 
    UserNum        NUMBER           NOT NULL, 
    QnaFileName    VARCHAR2(300)    NOT NULL, 
    QnaFilePath    VARCHAR2(300)    NOT NULL, 
    CONSTRAINT QNA_ATTACH_PK PRIMARY KEY (QnaFileNum)
)
/

CREATE SEQUENCE Qna_Attach_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE Qna_Attach
    ADD CONSTRAINT FK_Qna_Attach_QnaNum_Qna_QnaNu FOREIGN KEY (QnaNum)
        REFERENCES Qna (QnaNum)
/

ALTER TABLE Qna_Attach
    ADD CONSTRAINT FK_Qna_Attach_UserNum_UserInfo FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- Qna_Answer_Attach Table Create SQL
CREATE TABLE Qna_Answer_Attach
(
    QnaAFileNum     NUMBER           NOT NULL, 
    QnaAnswerNum    NUMBER           NOT NULL, 
    UserNum         NUMBER           NOT NULL, 
    QnaAFileName    VARCHAR2(300)    NOT NULL, 
    QnaAFilePath    VARCHAR2(300)    NOT NULL, 
    CONSTRAINT QNA_ANSWER_ATTACH_PK PRIMARY KEY (QnaAFileNum)
)
/

CREATE SEQUENCE Qna_Answer_Attach_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE Qna_Answer_Attach
    ADD CONSTRAINT FK_Qna_Answer_Attach_QnaAnswer FOREIGN KEY (QnaAnswerNum)
        REFERENCES Qna_Answer (QnaAnswerNum)
/

ALTER TABLE Qna_Answer_Attach
    ADD CONSTRAINT FK_Qna_Answer_Attach_UserNum_U FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- QNotify Table Create SQL
CREATE TABLE QNotify
(
    QNotifyNum       NUMBER           NOT NULL, 
    QuestionNum      NUMBER           NOT NULL, 
    UserNum          NUMBER           NOT NULL, 
    QN_RegDate       DATE             NOT NULL, 
    QNotifyReason    VARCHAR2(300)    NOT NULL, 
    QN_AnswerDate    DATE             NULL, 
    QNotifyResult    VARCHAR2(600)    NULL, 
    CONSTRAINT QNOTIFY_PK PRIMARY KEY (QNotifyNum)
)
/

CREATE SEQUENCE QNotify_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE QNotify
    ADD CONSTRAINT FK_QNotify_QuestionNum_Q_Board FOREIGN KEY (QuestionNum)
        REFERENCES Q_Board (QuestionNum)
/

ALTER TABLE QNotify
    ADD CONSTRAINT FK_QNotify_UserNum_UserInfo_Us FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/

-- Follow Table Create SQL
CREATE TABLE Follow
(
    followNum     NUMBER    NOT NULL, 
    StudentNum    NUMBER    NOT NULL, 
    TeacherNum    NUMBER    NOT NULL, 
    CONSTRAINT FOLLOW_PK PRIMARY KEY (followNum)
)
/

CREATE SEQUENCE Follow_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE Follow
    ADD CONSTRAINT FK_Follow_StudentNum_UserInfo_ FOREIGN KEY (StudentNum)
        REFERENCES UserInfo (UserNum)
/

ALTER TABLE Follow
    ADD CONSTRAINT FK_Follow_TeacherNum_UserInfo_ FOREIGN KEY (TeacherNum)
        REFERENCES UserInfo (UserNum)
/




-- RNotify Table Create SQL
CREATE TABLE RNotify
(
    RNotifyNum       NUMBER           NOT NULL, 
    ReplyNum         NUMBER           NOT NULL, 
    UserNum          NUMBER           NOT NULL, 
    RN_RegDate       DATE             NOT NULL, 
    RNotifyReason    VARCHAR2(300)    NOT NULL, 
    RN_AnswerDate    DATE             NULL, 
    RNotifyResult    VARCHAR2(600)    NULL, 
    CONSTRAINT RNOTIFY_PK PRIMARY KEY (RNotifyNum)
)
/

CREATE SEQUENCE RNotify_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE RNotify
    ADD CONSTRAINT FK_RNotify_UserNum_UserInfo_Us FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/

ALTER TABLE RNotify
    ADD CONSTRAINT FK_RNotify_ReplyNum_Q_Reply_Re FOREIGN KEY (ReplyNum)
        REFERENCES Q_Reply (ReplyNum)
/





-- Report Table Create SQL
CREATE TABLE Report
(
    ReportNum       NUMBER          NOT NULL, 
    reporterNum     NUMBER          NULL, 
    ReportTitle     VARCHAR2(30)    NULL, 
    ReportedQNum    NUMBER          NULL, 
    ReportedRNum    NUMBER          NULL, 
    ReportReason    VARCHAR2(50)    NULL, 
    CONSTRAINT REPORT_PK PRIMARY KEY (ReportNum)
)
/

CREATE SEQUENCE Report_SEQ
START WITH 1
INCREMENT BY 1;




CREATE INDEX q_content_idx
ON Q_Board( QuestionContent)
INDEXTYPE IS ctxsys.context;



CREATE INDEX r_content_idx
ON Q_Reply( ReplyContent)
INDEXTYPE IS ctxsys.context;




CREATE INDEX r_comment_idx
ON R_Comment( R_Comment)
INDEXTYPE IS ctxsys.context;




INSERT INTO Major values(Major_SEQ.nextval, '教育・学習');
INSERT INTO Major values(Major_SEQ.nextval, 'IT');
INSERT INTO Major values(Major_SEQ.nextval, 'ゲーム');
INSERT INTO Major values(Major_SEQ.nextval, 'エンタテインメント');
INSERT INTO Major values(Major_SEQ.nextval, '生活');
INSERT INTO Major values(Major_SEQ.nextval, '健康');
INSERT INTO Major values(Major_SEQ.nextval, '社会・政治');
INSERT INTO Major values(Major_SEQ.nextval, '経済');
INSERT INTO Major values(Major_SEQ.nextval, '旅行');
INSERT INTO Major values(Major_SEQ.nextval, 'スポーツ');


INSERT INTO Minor values(Minor_SEQ.nextval, 1, '乳幼児教育');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '小学校');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '中学校');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '高等学校');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '大学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '留学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '生涯学習');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '語学・外国語');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '文学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '歴史');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '哲学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '社会学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '数学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '物理学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '科学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '生物学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '地球科学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '電気工学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '建築学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '農学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '環境工学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '畜産学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '海洋学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '機械工学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '政治・外交学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '統計学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '天文学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '心理学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '工学');
INSERT INTO Minor values(Minor_SEQ.nextval, 1, '科学');

INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'コンピューター');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'ハードウェア');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'ソフトウェア');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'OS');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'プログラミング');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'ウェブサイト');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'インターネット');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, '通信ネットワーク');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, '放送通信');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, '保安');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'IT資格試験');
INSERT INTO Minor values(Minor_SEQ.nextval, 2, 'アプリケーション');

INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'RPGゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'Simulationゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'シューティングゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'アクションゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'レーシングゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'スポーツゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'ボード・パズルゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'モバゲー');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'ビデオゲーム');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'ゲーマー');
INSERT INTO Minor values(Minor_SEQ.nextval, 3, 'インディーズゲーム');

INSERT INTO Minor values(Minor_SEQ.nextval, 4, 'TV・ラジオ');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, '音楽');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, '映画');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, 'アニメ');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, '漫画');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, 'ビデオ・DVD');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, '演劇');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, 'ミュージカル');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, 'オペラ');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, 'ダンス');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, '美術');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, 'デザイン');
INSERT INTO Minor values(Minor_SEQ.nextval, 4, '写真');

INSERT INTO Minor values(Minor_SEQ.nextval, 5, '飲食');
INSERT INTO Minor values(Minor_SEQ.nextval, 5, '美容');
INSERT INTO Minor values(Minor_SEQ.nextval, 5, 'ファッション');
INSERT INTO Minor values(Minor_SEQ.nextval, 5, 'ペット');
INSERT INTO Minor values(Minor_SEQ.nextval, 5, 'インテリア');
INSERT INTO Minor values(Minor_SEQ.nextval, 5, '車');

INSERT INTO Minor values(Minor_SEQ.nextval, 6, '歯学');
INSERT INTO Minor values(Minor_SEQ.nextval, 6, '薬学');
INSERT INTO Minor values(Minor_SEQ.nextval, 6, '栄養学');
INSERT INTO Minor values(Minor_SEQ.nextval, 6, '運動');
INSERT INTO Minor values(Minor_SEQ.nextval, 6, '医療');
INSERT INTO Minor values(Minor_SEQ.nextval, 6, '保険');
INSERT INTO Minor values(Minor_SEQ.nextval, 6, '健康常識');

INSERT INTO Minor values(Minor_SEQ.nextval, 7, '行政');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '法律');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '国防');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '外交');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '選挙');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '雇用・労働');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '宗教');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '福祉');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '環境');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '災害');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '社会文化');
INSERT INTO Minor values(Minor_SEQ.nextval, 7, '機関・団体・人物');

INSERT INTO Minor values(Minor_SEQ.nextval, 8, '金融');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '不動産');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '税務');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '経営');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '貿易');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '就職');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '創業');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '経済制度');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '経済動向');
INSERT INTO Minor values(Minor_SEQ.nextval, 8, '経済団体');

INSERT INTO Minor values(Minor_SEQ.nextval, 9, '国内旅行');
INSERT INTO Minor values(Minor_SEQ.nextval, 9, '海外旅行');

INSERT INTO Minor values(Minor_SEQ.nextval, 10, '球技スポーツ');
INSERT INTO Minor values(Minor_SEQ.nextval, 10, '陸上・水上スポーツ');
INSERT INTO Minor values(Minor_SEQ.nextval, 10, 'ウインタースポーツ');
INSERT INTO Minor values(Minor_SEQ.nextval, 10, '武芸');
INSERT INTO Minor values(Minor_SEQ.nextval, 10, 'レジャー');


create table goods(
    goodsNum number primary key,
    goodsName varchar2(50) not null,
    price number not null,
    imageurl varchar2(1000)
);

create sequence goods_seq start with 1 increment by 1;


insert into goods values(goods_seq.nextval, '商品1', 100, 'hot1504160555644.jpg');
insert into goods values(goods_seq.nextval, '商品2', 200, 'hot1504165732399.jpg');
insert into goods values(goods_seq.nextval, '商品3', 130, 'hot1504162515721.jpg');
insert into goods values(goods_seq.nextval, '商品4', 140, 'hot1504162729561.jpg');
insert into goods values(goods_seq.nextval, '商品5', 120, 'hot1504496920566.jpg');
insert into goods values(goods_seq.nextval, '商品6', 200, 'hot1504159515166.jpg');
insert into goods values(goods_seq.nextval, '商品7', 150, 'hot1504158816917.jpg');
insert into goods values(goods_seq.nextval, '商品8', 100, 'hot1505111841917.jpg');
insert into goods values(goods_seq.nextval, '商品9', 130, 'hot1505012804410.jpg');
insert into goods values(goods_seq.nextval, '商品10', 200, 'S1488275758937.jpg');
insert into goods values(goods_seq.nextval, '商品11', 220, 'S1456102185997.jpg');
insert into goods values(goods_seq.nextval, '商品12', 110, 'S1501056565894.jpg');
insert into goods values(goods_seq.nextval, '商品13', 140, 'hot1471997081256.jpg');
insert into goods values(goods_seq.nextval, '商品14', 300, 'S1503969739507.jpg');
insert into goods values(goods_seq.nextval, '商品15', 140, 'S1504493272268.jpg');
insert into goods values(goods_seq.nextval, '商品16', 120, 'S1503969743459.jpg');
insert into goods values(goods_seq.nextval, '商品17', 330, 'S1504493278076.jpg');
insert into goods values(goods_seq.nextval, '商品18', 300, 'S1504586600356.jpg');
insert into goods values(goods_seq.nextval, '商品19', 200, 'hot1504159708059.jpg');
insert into goods values(goods_seq.nextval, '商品20', 400, 'S1505354307751.jpg');
insert into goods values(goods_seq.nextval, '商品21', 540, 'A201602031834496082.jpg');
insert into goods values(goods_seq.nextval, '商品22', 120, 'S1504857360866.jpg');
insert into goods values(goods_seq.nextval, '商品23', 140, 'hot1504673618357.jpg');
insert into goods values(goods_seq.nextval, '商品24', 160, 'S1505294453319.jpg');
insert into goods values(goods_seq.nextval, '商品25', 250, 'S1504753601389.jpg');
insert into goods values(goods_seq.nextval, '商品26', 100, 'hot1504163510196.jpg');
insert into goods values(goods_seq.nextval, '商品27', 300, 'hot1504086638139.jpg');
insert into goods values(goods_seq.nextval, '商品28', 150, 'hot1504168474775.jpg');
insert into goods values(goods_seq.nextval, '商品29', 230, 'hot1504251818753.jpg');
insert into goods values(goods_seq.nextval, '商品30', 420, 'hot1504505586093.jpg');
insert into goods values(goods_seq.nextval, '商品31', 130, 'hot1503219217957.jpg');
insert into goods values(goods_seq.nextval, '商品32', 500, 'S1504515892336.jpg');
insert into goods values(goods_seq.nextval, '商品33', 230, 'S1504758015507.jpg');
insert into goods values(goods_seq.nextval, '商品34', 100, 'hot1505201207510.jpg');
insert into goods values(goods_seq.nextval, '商品35', 140, 'S1504145083463.jpg');
insert into goods values(goods_seq.nextval, '商品36', 110, 'hot1505201061051.jpg');
insert into goods values(goods_seq.nextval, '商品37', 230, 'S1504145073593.jpg');
insert into goods values(goods_seq.nextval, '商品38', 310, 'S1505453812784.jpg');
insert into goods values(goods_seq.nextval, '商品39', 340, 'hot1503567622551.jpg');
insert into goods values(goods_seq.nextval, '商品40', 200, 'hot1504493092211.jpg');
insert into goods values(goods_seq.nextval, '商品41', 330, 'hot1504758974432.jpg');
insert into goods values(goods_seq.nextval, '商品42', 130, 'S1504090154752.jpg');
insert into goods values(goods_seq.nextval, '商品43', 140, 'hot1504759129062.jpg');
insert into goods values(goods_seq.nextval, '商品44', 100, 'S1504090130888.jpg');
insert into goods values(goods_seq.nextval, '商品45', 150, 'hot1505191617473.jpg');
insert into goods values(goods_seq.nextval, '商品46', 170, 'hot1504863083068.jpg');
insert into goods values(goods_seq.nextval, '商品47', 190, 'hot1505179206668.jpg');
insert into goods values(goods_seq.nextval, '商品48', 200, 'hot1505191799450.jpg');
insert into goods values(goods_seq.nextval, '商品49', 120, 'hot1505283627394.jpg');
insert into goods values(goods_seq.nextval, '商品50', 200, 'A201311031708231252.jpg');
insert into goods values(goods_seq.nextval, '商品51', 450, 'hot1504686198774.jpg');
insert into goods values(goods_seq.nextval, '商品52', 150, 'A201311031717404682.jpg');
insert into goods values(goods_seq.nextval, '商品53', 510, 'hot1504687063374.jpg');
insert into goods values(goods_seq.nextval, '商品54', 130, 'hot1504835840632.jpg');

insert into cashlog values(CashLog_SEQ.nextval, 1, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 2, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 3, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 4, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 5, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 6, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 7, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 8, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 9, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 10, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 11, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 12, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 13, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 14, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 15, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 16, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 17, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 18, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 19, 0, sysdate, null, null, 0);
insert into cashlog values(CashLog_SEQ.nextval, 20, 0, sysdate, null, null, 0);

insert into pointlog values(pointlog_seq.nextval, 1, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 2, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 3, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 4, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 5, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 6, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 7, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 8, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 9, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 10, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 11, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 12, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 13, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 14, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 15, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 16, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 17, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 18, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 19, 0, sysdate, null, null, 0);
insert into pointlog values(pointlog_seq.nextval, 20, 0, sysdate, null, null, 0);


commit;



