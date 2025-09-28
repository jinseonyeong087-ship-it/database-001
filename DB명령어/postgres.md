# postgres 명령어 정리

## 사용자 계정 생성
```
-- 비밀번호 포함 계정 생성
CREATE ROLE 사용자명 WITH LOGIN PASSWORD '비밀번호';

-- 슈퍼유저 계정 생성 (주의!)
CREATE ROLE 관리자 WITH LOGIN PASSWORD '1234' SUPERUSER;

-- 비밀번호 없이 계정 생성
CREATE ROLE read_only WITH LOGIN;
```
- WITH LOGIN 옵션을 지정해야 실제로 접속 가능한 계정이 됩니다.
- SUPERUSER는 모든 권한을 갖는 관리자 계정이므로 꼭 필요할 때만 사용하세요.

## 권한 부여
```
-- 특정 데이터베이스에 대한 연결 권한
GRANT CONNECT ON DATABASE mydb TO 사용자명;

-- 특정 스키마에 대한 USAGE 권한
GRANT USAGE ON SCHEMA public TO 사용자명;

-- 특정 테이블에 대한 SELECT 권한
GRANT SELECT ON TABLE public.student TO 사용자명;

-- 여러 권한 동시 부여 (SELECT, INSERT, UPDATE, DELETE)
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.student TO 사용자명;

-- 모든 테이블에 대해 읽기 권한 부여 (public 스키마)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO 사용자명;

-- ROLE 부여 (그룹 역할)
GRANT role_group TO 사용자명;
```

## 권한 철회
```
-- 특정 권한 철회
REVOKE SELECT ON TABLE public.student FROM 사용자명;

-- 데이터베이스 접속 권한 철회
REVOKE CONNECT ON DATABASE mydb FROM 사용자명;

-- ROLE 철회
REVOKE role_group FROM 사용자명;
```

## 계정 삭제
```
-- 먼저 권한과 소유 객체를 정리해야 함
DROP OWNED BY 사용자명;

-- 계정 삭제
DROP ROLE 사용자명;
```

## DBeaver에서 PostgreSQL 계정 정보 확인 방법
```
1️⃣ 서버 접속

DBeaver 실행 → Database > New Connection 클릭

PostgreSQL 선택 → Host/Port/User/Password 입력 → 연결 테스트 후 Finish

(이미 연결되어 있다면 해당 Connection 오른쪽 클릭 → Connect)

2️⃣ 계정(ROLE) 목록 확인

왼쪽 Database Navigator 창에서 연결한 PostgreSQL 서버를 펼칩니다.

Security (보안) → Roles 선택
→ 모든 계정(ROLE) 목록이 표시됩니다.

특정 Role을 더블 클릭하면 상세 속성 창이 열립니다.

General 탭 : ROLE 이름, LOGIN 여부, SUPERUSER 여부 등

Membership 탭 : 이 ROLE이 속한 그룹 ROLE, 이 ROLE이 가진 ROLE

Privileges 탭 : DB/Schema/Table 권한 목록
```