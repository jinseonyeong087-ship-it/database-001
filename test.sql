
CREATE TABLE Student
(
  id   VARCHAR(10) NOT NULL DEFAULT s001 COMMENT '학번',
  name VARCHAR(50) NOT NULL DEFAULT 김연아 COMMENT '이름',
  PRIMARY KEY (id)
) COMMENT '학생';

CREATE TABLE student_subject
(
  id     VARCHAR(10) NOT NULL DEFAULT rowId()0,
  stu_id VARCHAR(10) NOT NULL DEFAULT s001 COMMENT '학번',
  sub_id VARCHAR(3)  NOT NULL,
  PRIMARY KEY (id)
) COMMENT '다대다의 수강신청';

CREATE TABLE subject
(
  id   VARCHAR(3)  NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
) COMMENT 'subject';

ALTER TABLE student_subject
  ADD CONSTRAINT FK_Student_TO_student_subject
    FOREIGN KEY (stu_id)
    REFERENCES Student (id);

ALTER TABLE student_subject
  ADD CONSTRAINT FK_subject_TO_student_subject
    FOREIGN KEY (sub_id)
    REFERENCES subject (id);
