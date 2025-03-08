# Long Text Translator

A Python tool that translates long text from clipboard paragraph by paragraph using LLM via OpenRouter API. It maintains translation consistency by including previously translated paragraphs in each prompt.

[한국어 README](./README.md)

## Features

- Translates text from clipboard paragraph by paragraph
- Maintains consistency by including previously translated paragraphs in context
- Preserves Markdown/LaTeX syntax
- Keeps academic or technical terms in English
- Outputs translation to stdout, file, and clipboard
- Configurable through environment variables
- Customizable translation instructions
- Can be run as a standalone macOS application (via AppleScript)

## Requirements

- Python 3.6+
- OpenRouter API key

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/LilyChouChouKR/translate_long_text.git
   cd translate_long_text
   ```

2. Install the required packages:
   ```
   pip install -r requirements.txt
   ```

3. Set up your API key:
   - Copy `.env.example` to `.env`: `cp .env.example .env`
   - Edit the `.env` file in the project directory
   - Replace the placeholder with your actual API key: `OPENROUTER_API_KEY=your_api_key_here`
   - Optionally modify other settings in the `.env` file

## Configuration

You can configure the translator through environment variables in the `.env` file:

```
# Required
OPENROUTER_API_KEY=your_api_key_here

# Optional with defaults
DEFAULT_CONTEXT_SIZE=3
DEFAULT_MODEL=google/gemini-2.0-flash-001
DEFAULT_LANGUAGE=Korean
API_URL=https://openrouter.ai/api/v1/chat/completions

# Customizable Translation Instructions
INSTRUCTION_1=Preserve Markdown/LaTeX syntax. Do not alter any formatting symbols.
INSTRUCTION_2=No summarization. Provide a direct translation without omission or addition.
INSTRUCTION_3=Retain paragraph structure. Don't merge or split sentences if not necessary.
INSTRUCTION_4=Keep academic or technical terms in English.
# Add more instructions: INSTRUCTION_5, INSTRUCTION_6, etc.
```

### Customizing Translation Instructions

You can customize the translation instructions by modifying the `INSTRUCTION_*` variables in your `.env` file:

1. **Use default instructions**: If no `INSTRUCTION_*` variables are defined, the default instructions will be used.

2. **Modify existing instructions**: Change the values of `INSTRUCTION_1` through `INSTRUCTION_4` to modify the default instructions.

3. **Add new instructions**: Add `INSTRUCTION_5`, `INSTRUCTION_6`, etc. to include additional instructions.

4. **Remove instructions**: To use fewer instructions, simply remove the corresponding lines from your `.env` file.

5. **Disable specific instructions**: Set an instruction to "default" to skip it while keeping the numbering consistent.

**Note**: `INSTRUCTION_4` (keeping academic or technical terms in English) can be removed or modified based on personal preference. Some users may prefer to have all terms translated into the target language.

These settings can also be overridden via command-line arguments.

## Usage

1. Copy the text you want to translate to your clipboard.

2. Run the script:
   ```
   python translate_long_text.py
   ```

3. The translated text will be printed to the console and copied to your clipboard.

### Command-line Options

- `--language`, `-l`: Target language for translation (default: from .env or Korean)
- `--model`, `-m`: LLM model to use (default: from .env or google/gemini-2.0-flash-001)
- `--context`, `-c`: Number of previous paragraphs to include for context (default: from .env or 3)
- `--output`, `-o`: Output file path (default: print to stdout)

### Examples

Translate to Japanese:
```
python translate_long_text.py --language Japanese
```

Use a different model:
```
python translate_long_text.py --model openai/gpt-4-turbo
```

Include more context paragraphs:
```
python translate_long_text.py --context 5
```

Save translation to a file:
```
python translate_long_text.py --output translated.txt
```

## Running as a macOS Application

For macOS users, you can create a standalone application:

1. Open the `TranslateLongText.applescript` file with Script Editor (found in `/Applications/Utilities/`).
2. Click on File > Export...
3. Choose "Application" as the File Format.
4. Save it to your desired location (e.g., Applications folder or Desktop).
5. You can now run the translator by double-clicking the application.

The application will:
- Check if all required files and packages are present
- Prompt to create a `.env` file if it doesn't exist
- Open Terminal and run the translator

## How It Works

1. The script reads text from your clipboard
2. It splits the text into paragraphs
3. For each paragraph:
   - It creates a prompt including the paragraph to translate and previously translated paragraphs
   - It sends the prompt to the OpenRouter API
   - It extracts the translated text from the response
4. It combines all translated paragraphs and outputs the result 