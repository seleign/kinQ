-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.






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


CREATE OR REPLACE TRIGGER UserInfo_UserNum_AI_TRG
BEFORE INSERT ON UserInfo 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT UserInfo_SEQ.NEXTVAL
    INTO: NEW.UserNum
    FROM DUAL;
END;
/


-- Q_Board Table Create SQL
CREATE TABLE Q_Board
(
    QuestionNum        NUMBER            NOT NULL, 
    UserNum            NUMBER            NOT NULL, 
    ID                 VARCHAR2(30)      NOT NULL, 
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


CREATE OR REPLACE TRIGGER Q_Board_QuestionNum_AI_TRG
BEFORE INSERT ON Q_Board 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Q_Board_SEQ.NEXTVAL
    INTO: NEW.QuestionNum
    FROM DUAL;
END;
/

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
    ReplyTitle      VARCHAR2(90)      NOT NULL, 
    ReplyContent    VARCHAR2(1500)    NOT NULL, 
    CONSTRAINT Q_REPLY_PK PRIMARY KEY (ReplyNum)
)
/

CREATE SEQUENCE Q_Reply_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER Q_Reply_ReplyNum_AI_TRG
BEFORE INSERT ON Q_Reply 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Q_Reply_SEQ.NEXTVAL
    INTO: NEW.ReplyNum
    FROM DUAL;
END;
/

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
    QnaAnswerTitle      VARCHAR2(90)      NOT NULL, 
    QnaAnswerContent    VARCHAR2(3000)    NOT NULL, 
    CONSTRAINT QNA_ANSWER_PK PRIMARY KEY (QnaAnswerNum)
)
/

CREATE SEQUENCE Qna_Answer_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER Qna_Answer_QnaAnswerNum_AI_TRG
BEFORE INSERT ON Qna_Answer 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Qna_Answer_SEQ.NEXTVAL
    INTO: NEW.QnaAnswerNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER Major_MajorNum_AI_TRG
BEFORE INSERT ON Major 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Major_SEQ.NEXTVAL
    INTO: NEW.MajorNum
    FROM DUAL;
END;
/


-- Qna Table Create SQL
CREATE TABLE Qna
(
    QnaNum          NUMBER            NOT NULL, 
    UserNum         NUMBER            NOT NULL, 
    QnaTitle        VARCHAR2(90)      NOT NULL, 
    QnaContent      VARCHAR2(3000)    NOT NULL, 
    QnaAnswerNum    NUMBER            NULL, 
    CONSTRAINT QNA_PK PRIMARY KEY (QnaNum)
)
/

CREATE SEQUENCE Qna_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER Qna_QnaNum_AI_TRG
BEFORE INSERT ON Qna 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Qna_SEQ.NEXTVAL
    INTO: NEW.QnaNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER Minor_MinorNum_AI_TRG
BEFORE INSERT ON Minor 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Minor_SEQ.NEXTVAL
    INTO: NEW.MinorNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER Tag_TagNum_AI_TRG
BEFORE INSERT ON Tag 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Tag_SEQ.NEXTVAL
    INTO: NEW.TagNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER Q_Attach_FileNum_AI_TRG
BEFORE INSERT ON Q_Attach 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Q_Attach_SEQ.NEXTVAL
    INTO: NEW.FileNum
    FROM DUAL;
END;
/

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
    ReplyNum     NUMBER           NOT NULL, 
    UserNum      NUMBER           NOT NULL, 
    ID           VARCHAR2(30)     NOT NULL, 
    R_Comment    VARCHAR2(900)    NOT NULL
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


CREATE OR REPLACE TRIGGER CashLog_CashLogNum_AI_TRG
BEFORE INSERT ON CashLog 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT CashLog_SEQ.NEXTVAL
    INTO: NEW.CashLogNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER PointLog_PointLogNum_AI_TRG
BEFORE INSERT ON PointLog 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT PointLog_SEQ.NEXTVAL
    INTO: NEW.PointLogNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER Field_FieldNum_AI_TRG
BEFORE INSERT ON Field 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Field_SEQ.NEXTVAL
    INTO: NEW.FieldNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER Qna_Attach_QnaFileNum_AI_TRG
BEFORE INSERT ON Qna_Attach 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Qna_Attach_SEQ.NEXTVAL
    INTO: NEW.QnaFileNum
    FROM DUAL;
END;
/

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


CREATE OR REPLACE TRIGGER Qna_Answer_Attach_QnaAF_AI_TRG
BEFORE INSERT ON Qna_Answer_Attach 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Qna_Answer_Attach_SEQ.NEXTVAL
    INTO: NEW.QnaAFileNum
    FROM DUAL;
END;
/

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
    QNotifyReason    VARCHAR2(300)    NOT NULL, 
    QNotifyResult    VARCHAR2(600)    NULL, 
    CONSTRAINT QNOTIFY_PK PRIMARY KEY (QNotifyNum)
)
/

CREATE SEQUENCE QNotify_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER QNotify_QNotifyNum_AI_TRG
BEFORE INSERT ON QNotify 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT QNotify_SEQ.NEXTVAL
    INTO: NEW.QNotifyNum
    FROM DUAL;
END;
/

ALTER TABLE QNotify
    ADD CONSTRAINT FK_QNotify_QuestionNum_Q_Board FOREIGN KEY (QuestionNum)
        REFERENCES Q_Board (QuestionNum)
/

ALTER TABLE QNotify
    ADD CONSTRAINT FK_QNotify_UserNum_UserInfo_Us FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/


-- RNotify Table Create SQL
CREATE TABLE RNotify
(
    RNotifyNum       NUMBER           NOT NULL, 
    ReplyNum         NUMBER           NOT NULL, 
    UserNum          NUMBER           NOT NULL, 
    RNotifyReason    VARCHAR2(300)    NOT NULL, 
    RNotifyResult    VARCHAR2(600)    NULL, 
    CONSTRAINT RNOTIFY_PK PRIMARY KEY (RNotifyNum)
)
/

CREATE SEQUENCE RNotify_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER RNotify_RNotifyNum_AI_TRG
BEFORE INSERT ON RNotify 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT RNotify_SEQ.NEXTVAL
    INTO: NEW.RNotifyNum
    FROM DUAL;
END;
/

ALTER TABLE RNotify
    ADD CONSTRAINT FK_RNotify_UserNum_UserInfo_Us FOREIGN KEY (UserNum)
        REFERENCES UserInfo (UserNum)
/

ALTER TABLE RNotify
    ADD CONSTRAINT FK_RNotify_ReplyNum_Q_Reply_Re FOREIGN KEY (ReplyNum)
        REFERENCES Q_Reply (ReplyNum)
/





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