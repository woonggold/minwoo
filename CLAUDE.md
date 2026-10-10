# 전설의 민우키우기

브라우저에서 바로 실행되는 육성 게임. 게임 전체가 `index.html` 한 파일에 들어 있다.
GitHub Pages(https://woonggold.github.io/minwoo/)로 배포되고, 엔딩·업적·랭킹은 Firebase(Firestore)에 저장된다.

## 스킬 사용 규칙

이 저장소의 `.claude/skills/` 스킬은 해당하는 작업이면 묻지 않고 먼저 불러서 쓴다.

- **design-taste-frontend**: 화면, 레이아웃, 색, 버튼, 새 UI(모달·패널·카드)를 만들거나 바꿀 때. 기존 디자인 토큰(`--pk`, `--pk2`, `--line`, `.act`, `.sm`, `.go` 등)을 따른다.
- **agent-browser**: 게임을 실제로 열어 확인하거나, 스크린샷을 찍거나, 클릭·입력으로 동작을 시험할 때. 수정 후에는 이걸로 직접 열어 확인한다.
- **find-skills**: 지금 있는 스킬로 안 되는 일을 하려 할 때, 쓸 만한 스킬이 있는지 먼저 찾아본다.

agent-browser는 SessionStart 훅(`.claude/hooks/session-start.sh`)이 설치하고, 컨테이너에 깔린 Chromium을 쓰도록 `~/.agent-browser/config.json`을 만든다.

## 작업 규칙

- 사용자는 한국어로 대화한다. 답변도 한국어로.
- `claude/` 브랜치에 올리면 GitHub Actions가 자동으로 `main`에 병합한다(`.github/workflows/auto-merge-claude.yml`).
- Firebase 보안 규칙은 `firestore.rules`에 있다. 새 컬렉션을 쓰면 규칙도 같이 고치고, 사용자에게 콘솔에서 게시하라고 안내한다.
- 디버그 모드(빈 월요일 칸 5번 탭)를 쓴 판은 랭킹·업적에서 제외한다.
