# ☁️ 엔딩 기록 클라우드 저장 설정 (Firebase)

설정 전에는 엔딩 기록이 브라우저에만 저장됩니다. 아래를 한 번만 해 두면 **구글 로그인**으로 어느 기기에서든 같은 엔딩 도감을 볼 수 있어요.

## 1. Firebase 프로젝트 만들기
1. https://console.firebase.google.com 에 접속 → **프로젝트 추가**
2. 이름 아무거나 (예: `minwoo459`) → Google 애널리틱스는 꺼도 됩니다 → 만들기

## 2. 웹 앱 등록 → 설정값 복사
1. 프로젝트 홈에서 **`</>` (웹)** 아이콘 클릭 → 앱 닉네임 입력 → 등록
2. 화면에 나오는 `firebaseConfig` 안의 `apiKey`, `authDomain`, `projectId`, `appId` 값을 복사
3. `index.html`에서 `const FB={apiKey:'',...}` 줄을 찾아 값을 채웁니다 (또는 Claude에게 값을 보내주세요)

> `apiKey`는 비밀번호가 아니라 공개해도 되는 값입니다. 데이터 보호는 아래 4번의 보안 규칙이 합니다.

## 3. 구글 로그인 켜기
1. 왼쪽 메뉴 **빌드 → Authentication** → 시작하기
2. **Sign-in method** 탭 → **Google** → 사용 설정 → 지원 이메일 선택 → 저장
3. **Settings** 탭 → **승인된 도메인** → **도메인 추가** → `woonggold.github.io`

## 4. 데이터베이스 만들기 + 보안 규칙
1. 왼쪽 메뉴 **빌드 → Firestore Database** → 데이터베이스 만들기
2. 위치: `asia-northeast3 (서울)` 추천 → **프로덕션 모드**로 시작
3. **규칙** 탭에 이 저장소의 [`firestore.rules`](firestore.rules) 내용을 붙여 넣고 **게시**

## 저장되는 내용
- `users/{로그인한 사람 uid}` 문서 하나에 `endings` (엔딩 이름 → 본 횟수, 처음 본 날)
- 로그인하면 그 브라우저에 있던 기록과 클라우드 기록을 합칩니다.
- 무료 요금제(Spark) 한도 안에서 충분히 쓸 수 있습니다.
