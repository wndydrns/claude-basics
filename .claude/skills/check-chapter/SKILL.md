---
name: check-chapter
description: 가이드 장 파일(chapters/01-개념.md 등)의 구조와 길이를 검사한다. "장 검사해줘", "구조 확인", "check chapter"라고 하거나 장을 쓰거나 고친 직후에 사용한다.
---

# 장 검사

## 절차
1. 검사할 장 파일을 정한다. 지정이 없으면 `chapters/` 안에서 `0`으로 시작하는 장 파일 5개 전부. `chapters/README.md`는 장이 아니므로 검사하지 않는다.
2. 파일마다 아래 명령을 실행한다.
   ```
   powershell -ExecutionPolicy Bypass -File ./.claude/skills/check-chapter/check-chapter.ps1 chapters/<파일명>
   ```
3. 결과를 `OK` 또는 `FAIL: 이유`로 장마다 한 줄씩 알린다.
4. FAIL이면 고칠 곳을 알려 주되, 사용자가 요청하기 전에는 파일을 수정하지 않는다.

## 검사 항목
- 제목 4개(`3줄 요약`, `핵심 개념`, `따라 하기`, `예제와 다음 장`)가 순서대로 있는가
- 150줄 이하인가
- `확인한 날짜` 문구가 있는가

## 규칙
- 스크립트가 통과해도 문체(장식 없이 짧게)는 검사하지 않는다. 필요하면 따로 읽고 의견을 말한다.
