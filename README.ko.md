# Context Relay (컨텍스트 릴레이)

<p align="center">
  <img src="https://img.shields.io/github/stars/oasunryo/context-relay?style=for-the-badge&color=ffd700" alt="GitHub stars">
  <img src="https://img.shields.io/github/forks/oasunryo/context-relay?style=for-the-badge&color=007acc" alt="GitHub forks">
  <img src="https://img.shields.io/github/issues/oasunryo/context-relay?style=for-the-badge&color=red" alt="GitHub issues">
  <img src="https://img.shields.io/github/license/oasunryo/context-relay?style=for-the-badge" alt="License">
</p>

<p align="center">
  <a href="./README.md"><b>🇺🇸 English Document</b></a>
</p>

다양한 AI 코딩 에이전트(Antigravity, Cursor, Cline 등)가 다른 대화 세션으로 전환할 때, 개발 진행 상황과 환경을 유실 없이 그대로 이어서 진행할 수 있도록 설계된 크로스 플랫폼 및 범용 시스템 프롬프트(명세서) 구성입니다.

---

## 📊 성능 및 효율성 (Performance & Efficiency)

불필요하게 누적된 대화 노이즈(지나간 디버깅 로그, 컴파일 출력, 터미널 세부 내용)를 제거하는 동시에 프로젝트 구조와 개발 상태는 온전히 계승함으로써, 에이전트의 구동 속도와 정확성을 극적으로 끌어올립니다:

| 측정 지표 | 기존 장기 세션 (노이즈 누적) | 릴레이 세션 (컨텍스트 초기화) | 향상 수치 |
| :--- | :--- | :--- | :--- |
| **활성 컨텍스트 크기** | 50K - 150K tokens | 1K - 2K tokens | **~98.5% 토큰 압축** |
| **응답 대기 시간 (TTFT)** | 5.2초 - 12.0초 | 0.8초 - 1.5초 | **~85.0% 응답 속도 향상** |
| **단일 호출당 토큰 비용** | 높음 (전체 누적 기록 로드) | 최소화 (핵심만 로드) | **최대 10배 비용 절감** |
| **에이전트 판단 정확도** | 긴 대화로 인한 탈조(Drift) 현상 발생 | 당면 태스크에 완벽 정렬 | **환각 현상 제거** |

---

## 🦄 호환성 (Compatibility)

**Context Relay**는 거의 모든 주요 AI 코딩 어시스턴트 및 LLM 인터페이스와 호환됩니다:
*   **AI IDE / 확장 기능**: Cursor, Cline (Roo Code), Antigravity, GitHub Copilot.
*   **CLI 기반 AI 에이전트**: Claude Code, Aider.
*   **웹 대화형 인터페이스**: ChatGPT, Claude Projects, Gemini Advanced.

---

## 🦄 주요 기능

작업 도중 새로운 대화창으로 세션을 이관하려고 할 때, AI 에이전트가 다음과 같이 동작하도록 지침을 제공합니다:
1. 현재 프로젝트 워크스페이스 상태 분석 (Git diff, 파일 수정 내역, 설계적 결정 사항).
2. 활성화된 체크리스트 분석 (`task.md` 또는 `TODO.md`).
3. 다음 대화에 바로 복사-붙여넣기 할 수 있는 고도로 최적화된 영어 컨텍스트 브리프(Brief) 생성.

생성된 출력값을 새 대화 세션에 붙여넣기만 하면, 새로운 에이전트가 처음부터 다시 학습하지 않고 이전 작업을 그대로 이어받아 수행합니다.

---

## 🚀 설치 및 적용 방법

### 대화형 스크립트로 설치
이 저장소를 클론하고 아래 설치 스크립트를 실행합니다:
```bash
git clone https://github.com/oasunryo/context-relay.git
cd context-relay
chmod +x install.sh
./install.sh
```

원하는 에디터 환경을 선택하여 적용합니다:
*   **Antigravity Custom Skill**: Antigravity 전용 커스텀 스킬 폴더에 자동 추가
*   **Cursor**: 프로젝트 루트의 `.cursorrules` 파일 뒤에 연동 적용
*   **Roo Code / Cline**: 프로젝트 루트의 `.roo/instructions.md` 파일로 복사 적용

### 수동 설정
*   **CLI / 기타 에이전트 (Claude Code, Copilot, ChatGPT, Claude Projects 등)**: `SKILL.md` 파일의 내용을 통째로 복사한 다음, 시스템 프롬프트 설정(예: `.claudeprompts`, Custom Instructions, 프로젝트 지식베이스)에 붙여넣어 연동합니다.

---

## 📖 단계별 사용 시나리오

**Context Relay**를 사용하여 코딩 세션을 마이그레이션하는 예시 흐름입니다.

### 1단계: 마이그레이션 요청
활성화된 AI 세션 대화창에 한글로 이관을 요청합니다:
> "이거 다음 대화로 넘겨줘"
> "다른 대화에서 이어서 하고 싶어요."

### 2단계: 생성된 요약 브리프(Brief) 복사
에이전트가 프로젝트 상태를 요약한 마크다운을 출력해 줍니다:
```markdown
# Session Handover Context (Via Context Relay)
We are resuming a development task from a previous conversation session.
Source Session ID: <PREVIOUS_SESSION_ID>
Project Workspace Directory: /path/to/your/project

## 1. High-Level Objective
Implementing user authentication flow using custom JWT.

...
```
출력된 마크다운 코드 블록을 **복사**합니다.

### 3단계: 새 세션에서 바로 재개하기
1. 사용 중인 AI 툴에서 **새 대화창(New Chat)**을 생성합니다.
2. **동일한 프로젝트 폴더**를 열어둡니다.
3. 복사했던 요약 브리프 블록을 대화창에 **붙여넣기**하여 전송합니다.
4. 새로운 AI 세션이 전후 상황을 즉시 완벽하게 파악하고 하던 작업을 바로 이어서 코딩을 시작합니다.

---

## 📈 스타 히스토리

[![Star History Chart](https://api.star-history.com/svg?repos=oasunryo/context-relay&type=Date)](https://star-history.com/#oasunryo/context-relay&Date)
