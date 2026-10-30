# Harness Kit

짧은 시간 안에 AI와 문제를 정의·구현·검증·설명하기 위한 경량 작업 키트입니다. 과제별 답이나 완성 기능은 포함하지 않습니다. 대회 규정과 제공 README가 언제나 이 키트보다 우선합니다.

## 시작 순서 (10분)

1. 대회 규정, 제공 README, 데이터, 실행·제출 조건을 전부 읽습니다.
2. `docs/00-start.md`의 분석 프롬프트로 필수 요건과 질문을 정리합니다.
3. `prompts/discovery.md`를 호출해 `docs/01-discovery.md` 형식의 발견 기록을 만들고, `prompts/problem_brief.md`로 `docs/02-problem-brief.md`에서 범위를 확정합니다.
4. `prompts/plan.md`를 호출해 `docs/04-task-board.md`의 작업 목록과 필요한 `docs/03-decision-log.md` 결정 행을 만듭니다.
5. **Now**의 작업 하나마다 `prompts/implement.md`를 호출하고, 구현 결과와 검증 증거를 `docs/05-test-plan.md`에 반영합니다.
6. 마감 40분 전부터는 새 기능을 멈추고 `prompts/review.md`로 리뷰/Q&A 보충 자료를, `prompts/handoff.md`로 `docs/06-handoff.md`를 작성합니다.

## 폴더 안내

- `docs/`: 대회 중 채워 넣는 문제 정의·결정·검증·인수인계 문서
- `prompts/`: AI에게 역할별로 작고 검증 가능한 일을 맡기는 프롬프트
- `scripts/`: 프로젝트별로 명령을 채우는 최소 점검 스크립트
- `docs/00-start.md`: 시작 체크리스트, 과제 분석, 실무자 질문 템플릿

## 운영 원칙

- 먼저 문제와 성공 기준을 합의하고, 그 다음 구현합니다.
- AI에는 작은 작업 하나씩만 맡깁니다. 계획 → 구현 → 실행 → 검증 → 기록을 반복합니다.
- 점수·권한·계산처럼 설명 가능성과 재현성이 중요한 핵심 로직은 코드로 고정합니다.
- 문서에 없는 추정은 `가정`으로 표시하고, 검증하지 않은 것은 `미검증`으로 표시합니다.
- 기존 코드, 외부 자료, 도구 반입은 대회 규정을 다시 확인한 뒤에만 사용합니다.

## 사전 리허설 체크

- [ ] 빈 환경에서 이 레포를 열고 필요한 자료를 찾을 수 있다.
- [ ] 사용하는 기술 스택의 앱을 한 줄 명령으로 실행할 수 있다.
- [ ] 실제 비밀키는 없고 `.env.example`만 있다.
- [ ] `scripts/check.sh`의 프로젝트별 명령을 실제로 실행해 봤다.

## 파일별 사용법

| 파일 | 역할 | AI로 채우거나 AI에 전달 | 직접 읽고 판단 |
|---|---|---|---|
| `README.md` | 키트 전체 사용 안내 | 전달하지 않음 | 시작 순서·운영 원칙·리허설 점검 |
| `docs/00-start.md` | 시작 체크리스트, 과제 분석·질문 템플릿 | 분석 프롬프트를 AI에 전달 | 0~20분 체크리스트, 질문 원칙, 최소 실행 흐름 |
| `docs/01-discovery.md` | 과제 자료·실무자 대화에서 발견한 사실 기록 | AI 분석 결과를 옮기거나 요약을 요청할 수 있음 | 사실·가설·미확인 질문을 구분 |
| `docs/02-problem-brief.md` | 문제 정의와 범위 합의 | AI에게 초안 작성을 요청할 수 있음 | 실무자 답변으로 사실·가정·범위를 확정 |
| `docs/03-decision-log.md` | 설계 판단 근거 기록 | AI에게 결정 요약을 요청할 수 있음 | 선택·포기·리스크가 타당한지 판단 |
| `docs/04-task-board.md` | 작업 우선순위 관리 | AI에게 작업 분해를 요청할 수 있음 | Now / Next / Later와 범위 통제 |
| `docs/05-test-plan.md` | 요구사항-테스트 증거 기록 | AI에게 테스트 케이스 초안을 요청할 수 있음 | 실제 실행 결과를 직접 확인·기록 |
| `docs/06-handoff.md` | 현재 상태·다음 행동 인수인계 | `prompts/handoff.md`로 AI 초안 생성 | 실행법·완료 상태·한계가 사실인지 확인 |
| `docs/07-qna-notes.md` | 제출 후 설명 대비 | AI에게 예상 질문·취약점 정리를 요청할 수 있음 | AI 없이 답할 수 있도록 말로 연습 |
| `prompts/discovery.md` | 과제 자료 분석 | 그대로 AI에 전달 | AI 답변의 사실·추론·확인 필요 구분 점검 |
| `prompts/problem_brief.md` | 문제·범위 합의 문서화 | 실무자 대화 뒤 AI에 전달 | 사실·가정·확정된 범위 점검 |
| `prompts/plan.md` | MVP 작업 분해 | 그대로 AI에 전달 | 작업 크기·우선순위·범위 결정 |
| `prompts/implement.md` | 단일 구현 작업 위임 | `[작업 하나]`를 채워 AI에 전달 | 계획 승인, 결과·테스트·리스크 확인 |
| `prompts/review.md` | 심사관 관점 결함 점검 | 그대로 AI에 전달 | 시간 내 수정할 항목 선택 |
| `prompts/handoff.md` | 인수인계 문서 초안 | 그대로 AI에 전달 | AI 초안이 실제 상태와 일치하는지 확인 |

실전 순서: `00-start → discovery → problem-brief → task-board → decision-log → test-plan → handoff/Q&A`.
AI가 초안을 만들더라도 문제 정의, 우선순위, 테스트 결과, 최종 설명은 직접 확인합니다.

## 프롬프트 호출과 산출물

각 프롬프트는 결과를 바로 문서에 붙여 넣을 수 있는 Markdown으로 반환하도록 설계되어 있습니다. 프롬프트에 적힌 출력 형식을 바꾸지 말고, 결과를 아래 문서에 반영한 뒤 사실 여부를 검토합니다.

| 단계 | 호출할 프롬프트 | 산출물 형식 / 반영 위치 |
|---|---|---|
| 발견 | `prompts/discovery.md` | 섹션과 표로 구성된 발견 기록 → `docs/01-discovery.md` |
| 문제 합의 | `prompts/problem_brief.md` | 문제·성공 정의·범위·근거 표 → `docs/02-problem-brief.md` |
| 계획 | `prompts/plan.md` | Now/Next/Later 체크박스와 결정 로그 표 행 → `docs/04-task-board.md`, `docs/03-decision-log.md` |
| 구현·검증 | `prompts/implement.md` | 수정 파일 표, 검증 증거 표, 기록할 문서 변경 → 코드, `docs/05-test-plan.md`, 필요 시 `docs/03-decision-log.md` |
| 리뷰 | `prompts/review.md` | 심각도별 리뷰 표와 Q&A 보충 항목 → `docs/07-qna-notes.md` |
| 인수인계 | `prompts/handoff.md` | 현재 상태·실행법·검증 표·다음 우선순위 → `docs/06-handoff.md` |
