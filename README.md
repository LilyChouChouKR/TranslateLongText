# 긴 텍스트 번역기

LLM과 OpenRouter API를 사용하여 클립보드의 긴 텍스트를 단락별로 번역하는 Python 도구입니다. 이전에 번역된 단락을 각 프롬프트에 포함시켜 번역의 일관성을 유지합니다.

[English README](./README_ENG.md)

## 기능

- 클립보드의 텍스트를 단락별로 번역
- 이전에 번역된 단락을 컨텍스트로 포함하여 일관성 유지
- Markdown/LaTeX 구문 보존
- 학술 또는 기술 용어는 영어로 유지
- 번역 결과를 표준 출력, 파일 및 클립보드로 출력
- 환경 변수를 통한 설정 가능
- 사용자 정의 가능한 번역 지침
- macOS 독립 실행형 애플리케이션으로 실행 가능 (AppleScript 사용)

## 요구 사항

- Python 3.6+
- OpenRouter API 키

## 설치

1. 이 저장소를 클론합니다:
   ```
   git clone https://github.com/LilyChouChouKR/translate_long_text.git
   cd translate_long_text
   ```

2. 필요한 패키지를 설치합니다:
   ```
   pip install -r requirements.txt
   ```

3. API 키를 설정합니다:
   - `.env.example` 파일을 `.env`로 복사합니다: `cp .env.example .env`
   - 프로젝트 디렉토리의 `.env` 파일을 편집합니다
   - 플레이스홀더를 실제 API 키로 교체합니다: `OPENROUTER_API_KEY=your_api_key_here`
   - 필요에 따라 다른 설정도 수정할 수 있습니다

## 설정

`.env` 파일의 환경 변수를 통해 번역기를 설정할 수 있습니다:

```
# 필수
OPENROUTER_API_KEY=your_api_key_here

# 기본값이 있는 선택적 설정
DEFAULT_CONTEXT_SIZE=3
DEFAULT_MODEL=google/gemini-2.0-flash-001
DEFAULT_LANGUAGE=Korean
API_URL=https://openrouter.ai/api/v1/chat/completions

# 사용자 정의 가능한 번역 지침
INSTRUCTION_1=Preserve Markdown/LaTeX syntax. Do not alter any formatting symbols.
INSTRUCTION_2=No summarization. Provide a direct translation without omission or addition.
INSTRUCTION_3=Retain paragraph structure. Don't merge or split sentences if not necessary.
INSTRUCTION_4=Keep academic or technical terms in English.
# 더 많은 지침 추가: INSTRUCTION_5, INSTRUCTION_6 등
```

### 번역 지침 사용자 정의

`.env` 파일의 `INSTRUCTION_*` 변수를 수정하여 번역 지침을 사용자 정의할 수 있습니다:

1. **기본 지침 사용**: `INSTRUCTION_*` 변수가 정의되지 않은 경우 기본 지침이 사용됩니다.

2. **기존 지침 수정**: `INSTRUCTION_1`부터 `INSTRUCTION_4`까지의 값을 변경하여 기본 지침을 수정할 수 있습니다.

3. **새 지침 추가**: `INSTRUCTION_5`, `INSTRUCTION_6` 등을 추가하여 추가 지침을 포함할 수 있습니다.

4. **지침 제거**: 특정 지침을 사용하지 않으려면 해당 줄을 `.env` 파일에서 제거하면 됩니다.

5. **특정 지침 비활성화**: 지침 값을 "default"로 설정하면 해당 지침은 건너뛰면서 번호 매기기를 유지할 수 있습니다.

**참고**: `INSTRUCTION_4`(학술 또는 기술 용어를 영어로 유지)는 개인 선호도에 따라 제거하거나 수정할 수 있습니다. 일부 사용자는 모든 용어를 번역 대상 언어로 번역하는 것을 선호할 수 있습니다.

이러한 설정은 명령줄 인수를 통해 재정의할 수도 있습니다.

## 사용법

1. 번역하려는 텍스트를 클립보드에 복사합니다.

2. 스크립트를 실행합니다:
   ```
   python translate_long_text.py
   ```

3. 번역된 텍스트가 콘솔에 출력되고 클립보드에 복사됩니다.

### 명령줄 옵션

- `--language`, `-l`: 번역 대상 언어 (기본값: .env 파일 또는 Korean)
- `--model`, `-m`: 사용할 LLM 모델 (기본값: .env 파일 또는 google/gemini-2.0-flash-001)
- `--context`, `-c`: 컨텍스트로 포함할 이전 단락 수 (기본값: .env 파일 또는 3)
- `--output`, `-o`: 출력 파일 경로 (기본값: 표준 출력에 출력)

### 예시

일본어로 번역:
```
python translate_long_text.py --language Japanese
```

다른 모델 사용:
```
python translate_long_text.py --model openai/gpt-4-turbo
```

더 많은 컨텍스트 단락 포함:
```
python translate_long_text.py --context 5
```

번역을 파일로 저장:
```
python translate_long_text.py --output translated.txt
```

## macOS 애플리케이션으로 실행하기

macOS 사용자의 경우, 독립 실행형 애플리케이션을 만들 수 있습니다:

1. Script Editor(스크립트 편집기, `/Applications/Utilities/`에 위치)로 `TranslateLongText.applescript` 파일을 엽니다.
2. 파일 > 내보내기...를 클릭합니다.
3. 파일 형식으로 "응용 프로그램"을 선택합니다.
4. 원하는 위치(예: 응용 프로그램 폴더 또는 데스크톱)에 저장합니다.
5. 이제 애플리케이션을 더블 클릭하여 번역기를 실행할 수 있습니다.

이 애플리케이션은 다음과 같은 기능을 수행합니다:
- 필요한 모든 파일과 패키지가 있는지 확인
- `.env` 파일이 없는 경우 생성하도록 안내
- 터미널을 열고 번역기 실행

## 작동 방식

1. 스크립트가 클립보드에서 텍스트를 읽습니다
2. 텍스트를 단락으로 분할합니다
3. 각 단락에 대해:
   - 번역할 단락과 이전에 번역된 단락을 포함하는 프롬프트를 생성합니다
   - 프롬프트를 OpenRouter API로 전송합니다
   - 응답에서 번역된 텍스트를 추출합니다
4. 모든 번역된 단락을 결합하여 결과를 출력합니다 