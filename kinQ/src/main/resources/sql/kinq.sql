-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.






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


