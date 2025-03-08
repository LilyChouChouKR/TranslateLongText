#!/usr/bin/env python3
"""
Long Text Translator

This script translates long text from clipboard paragraph by paragraph using LLM via OpenRouter API.
It maintains translation consistency by including previously translated paragraphs in each prompt.
"""

import os
import sys
import json
import argparse
import pyperclip
import requests
from typing import List, Tuple, Dict, Optional
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Load constants from environment variables with fallback defaults
DEFAULT_CONTEXT_SIZE = int(os.getenv("DEFAULT_CONTEXT_SIZE", 3))
DEFAULT_MODEL = os.getenv("DEFAULT_MODEL", "google/gemini-2.0-flash-001")
DEFAULT_LANGUAGE = os.getenv("DEFAULT_LANGUAGE", "Korean")
API_URL = os.getenv("API_URL", "https://openrouter.ai/api/v1/chat/completions")

# Default instructions if not specified in environment variables
DEFAULT_INSTRUCTIONS = [
    "**Preserve Markdown/LaTeX syntax.** Do not alter any formatting symbols (e.g., `**bold**`, `_italics_`, `\\LaTeX` commands, headers, links, etc.).",
    "**No summarization.** Provide a direct translation of the paragraph without omission or addition.",
    "**Retain paragraph structure.** Don't merge or split sentences if not necessary.",
    "**Keep academic or technical terms in English** (even if the source text is in another language)."
]

def get_api_key() -> str:
    """
    Get OpenRouter API key from environment variables.
    
    Returns:
        str: The API key
    
    Raises:
        SystemExit: If API key is not found
    """
    api_key = os.getenv("OPENROUTER_API_KEY")
    if not api_key:
        print("Error: OPENROUTER_API_KEY not found in environment variables or .env file")
        print("Please set your API key using: export OPENROUTER_API_KEY='your_api_key'")
        print("Or create a .env file with: OPENROUTER_API_KEY=your_api_key")
        sys.exit(1)
    return api_key

def get_instructions() -> List[str]:
    """
    Get translation instructions from environment variables.
    
    Returns:
        List[str]: List of instructions
    """
    instructions = []
    
    # Check if any instructions are defined in environment variables
    i = 1
    while True:
        instruction_key = f"INSTRUCTION_{i}"
        instruction = os.getenv(instruction_key)
        
        if instruction is None:
            break
            
        if instruction.lower() != "default":
            instructions.append(instruction)
        
        i += 1
    
    # If no instructions found in environment variables, use defaults
    if not instructions:
        return DEFAULT_INSTRUCTIONS
    
    return instructions

def split_text_into_paragraphs(text: str) -> List[str]:
    """
    Split text into paragraphs.
    
    Args:
        text (str): The text to split
        
    Returns:
        List[str]: List of paragraphs
    """
    # Split by double newlines and filter out empty paragraphs
    paragraphs = [p.strip() for p in text.split("\n\n")]
    return [p for p in paragraphs if p]

def create_prompt(
    paragraph: str,
    prev_paragraphs: List[Tuple[str, str]],
    language: str,
    context_size: int
) -> str:
    """
    Create a prompt for the LLM to translate a paragraph.
    
    Args:
        paragraph (str): The paragraph to translate
        prev_paragraphs (List[Tuple[str, str]]): List of tuples containing (original, translated) paragraphs
        language (str): Target language for translation
        context_size (int): Number of previous paragraphs to include for context
        
    Returns:
        str: The formatted prompt
    """
    # Get the last n paragraphs for context
    context_paragraphs = prev_paragraphs[-context_size:] if prev_paragraphs else []
    
    # Format previous paragraphs for the prompt
    prev_original = ""
    prev_translated = ""
    
    for i, (orig, trans) in enumerate(context_paragraphs, 1):
        prev_original += f"  {i}. {orig}  \n"
        prev_translated += f"  {i}. {trans}  \n"
    
    # If no previous paragraphs, use placeholder text
    if not prev_original:
        prev_original = "  (No previous paragraphs available)  \n"
        prev_translated = "  (No previous paragraphs available)  \n"
    
    # Get instructions from environment variables
    instructions = get_instructions()
    
    # Format instructions for the prompt
    formatted_instructions = ""
    for i, instruction in enumerate(instructions, 1):
        formatted_instructions += f"{i}. {instruction}\n"
    
    # Create the prompt using the template
    prompt = f"""## Translation Task

You are a skilled bilingual translator. Your objective is to translate a single new paragraph of text to {language} while maintaining consistency with previously translated paragraphs and following specific guidelines. 

### Previously Translated Content

- **Last {min(context_size, len(context_paragraphs))} Original Paragraphs**  
{prev_original}

- **Last {min(context_size, len(context_paragraphs))} Translated Paragraphs**  
{prev_translated}

### Additional Instructions
{formatted_instructions}

### Paragraph to Translate
{paragraph}

---

**Please produce the translation of "Paragraph to Translate" to {language} in a manner that:**  
- Reflects the same writing style as the previously translated paragraphs.  
- Incorporates the above instructions.  
- Maintains overall consistency with the translated text so far.
- **Prints only the translated text, without additional comments.**
"""
    return prompt

def translate_paragraph(
    paragraph: str,
    prev_paragraphs: List[Tuple[str, str]],
    language: str,
    context_size: int,
    model: str,
    api_key: str
) -> str:
    """
    Translate a single paragraph using the OpenRouter API.
    
    Args:
        paragraph (str): The paragraph to translate
        prev_paragraphs (List[Tuple[str, str]]): List of tuples containing (original, translated) paragraphs
        language (str): Target language for translation
        context_size (int): Number of previous paragraphs to include for context
        model (str): The LLM model to use
        api_key (str): OpenRouter API key
        
    Returns:
        str: The translated paragraph
        
    Raises:
        Exception: If the API request fails
    """
    prompt = create_prompt(paragraph, prev_paragraphs, language, context_size)
    
    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json"
    }
    
    data = {
        "model": model,
        "messages": [
            {"role": "user", "content": prompt}
        ]
    }
    
    try:
        response = requests.post(API_URL, headers=headers, json=data)
        response.raise_for_status()
        result = response.json()
        
        # Extract the translated text from the response
        translated_text = result["choices"][0]["message"]["content"].strip()
        return translated_text
    
    except Exception as e:
        print(f"Error during API request: {e}")
        if response and hasattr(response, 'text'):
            print(f"Response: {response.text}")
        raise

def main():
    """Main function to run the translator."""
    parser = argparse.ArgumentParser(description="Translate long text paragraph by paragraph using LLM.")
    parser.add_argument("--language", "-l", default=DEFAULT_LANGUAGE, 
                        help=f"Target language for translation (default: {DEFAULT_LANGUAGE})")
    parser.add_argument("--model", "-m", default=DEFAULT_MODEL, 
                        help=f"LLM model to use (default: {DEFAULT_MODEL})")
    parser.add_argument("--context", "-c", type=int, default=DEFAULT_CONTEXT_SIZE, 
                        help=f"Number of previous paragraphs to include for context (default: {DEFAULT_CONTEXT_SIZE})")
    parser.add_argument("--output", "-o", help="Output file path (default: print to stdout)")
    
    args = parser.parse_args()
    
    # Get API key
    api_key = get_api_key()
    
    # Get text from clipboard
    try:
        text = pyperclip.paste()
        if not text:
            print("Error: Clipboard is empty")
            sys.exit(1)
    except Exception as e:
        print(f"Error accessing clipboard: {e}")
        sys.exit(1)
    
    # Split text into paragraphs
    paragraphs = split_text_into_paragraphs(text)
    if not paragraphs:
        print("Error: No paragraphs found in clipboard text")
        sys.exit(1)
    
    print(f"Found {len(paragraphs)} paragraphs to translate")
    
    # Translate paragraphs
    translated_paragraphs = []
    prev_paragraphs = []  # List of (original, translated) tuples
    
    for i, paragraph in enumerate(paragraphs, 1):
        print(f"\nTranslating paragraph {i}/{len(paragraphs)}...")
        print(f"Original: {paragraph[:50]}..." if len(paragraph) > 50 else f"Original: {paragraph}")
        
        try:
            translated = translate_paragraph(
                paragraph, 
                prev_paragraphs, 
                args.language, 
                args.context, 
                args.model, 
                api_key
            )
            
            print(f"Translated: {translated[:50]}..." if len(translated) > 50 else f"Translated: {translated}")
            
            # Store the translated paragraph
            translated_paragraphs.append(translated)
            
            # Add to previous paragraphs for context
            prev_paragraphs.append((paragraph, translated))
            
        except Exception as e:
            print(f"Error translating paragraph {i}: {e}")
            # Continue with the next paragraph
    
    # Combine translated paragraphs
    full_translation = "\n\n".join(translated_paragraphs)
    
    # Output the translation
    if args.output:
        try:
            with open(args.output, "w", encoding="utf-8") as f:
                f.write(full_translation)
            print(f"\nTranslation saved to {args.output}")
        except Exception as e:
            print(f"Error saving to file: {e}")
            print("\nFull translation:")
            print(full_translation)
    else:
        print("\nFull translation:")
        print(full_translation)
    
    # Copy the translation to clipboard
    try:
        pyperclip.copy(full_translation)
        print("\nTranslation copied to clipboard")
    except Exception as e:
        print(f"Error copying to clipboard: {e}")

if __name__ == "__main__":
    main() 