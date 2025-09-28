# 명령어 정리

## 사용자 계정 생성 (CREATE USER)
```
-- 기본 문법
CREATE USER 'username'@'host' IDENTIFIED BY 'password';

-- 예시: 로컬호스트에서 user001 계정 생성
CREATE USER 'user001'@'localhost' IDENTIFIED BY 'user001';

-- 예시: 모든 호스트에서 접속 가능한 계정 생성
CREATE USER 'user001'@'%' IDENTIFIED BY 'user001';
```
- 'username'@'host'
  - host는 접속할 수 있는 호스트 지정 (localhost, 특정 IP, %=모든 호스트)

- IDENTIFIED BY 'password'
  - 비밀번호 설정

## 사용자 계정 정보 확인
```
select user, host from mysql.user;
```


## 권한 부여 (GRANT)
```
-- 특정 데이터베이스/테이블에 권한 부여
GRANT SELECT, INSERT, UPDATE, DELETE ON dbname.* TO 'user001'@'localhost';

-- 모든 권한 부여 (관리자급)
GRANT ALL PRIVILEGES ON *.* TO 'user001'@'localhost' WITH GRANT OPTION;

-- 권한 변경 사항 적용
FLUSH PRIVILEGES;
```
- ON dbname.* → 특정 데이터베이스 전체 테이블에 권한

- ON *.* → 모든 데이터베이스 / 모든 테이블에 권한

- WITH GRANT OPTION → 다른 사용자에게도 권한을 줄 수 있는 권한 부여

## 권한 확인 
```
--현재 접속 사용자의 권한 확인
show grants;

--user001의 사용자 권한 표시
show grants for 'user001'@'localhost';
```


## 권한 철회 (REVOKE)
```
-- 특정 권한만 철회
REVOKE INSERT, UPDATE ON mydb.* FROM 'user001'@'localhost';

-- 모든 권한 철회
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user001'@'localhost';

-- 변경 사항 적용
FLUSH PRIVILEGES;
```
- REVOKE ALL PRIVILEGES는 해당 계정을 삭제하지 않고, 권한만 없애는 명령어입니다.

- GRANT OPTION도 함께 철회해야 완전히 권한이 제거됩니다.


## 사용자 계정 삭제 (DROP USER)
```
-- 기본 문법
DROP USER 'username'@'host';

-- 예시
DROP USER 'user001'@'localhost';
```
- 해당 계정이 가지고 있는 권한도 함께 삭제됨


## 확인 및 관리 명령어
```
-- 사용자 목록 확인
SELECT User, Host FROM mysql.user;

-- 특정 사용자 권한 확인
SHOW GRANTS FOR 'user001'@'localhost';
```