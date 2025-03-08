-- TranslateLongText.applescript
-- Script to run the Long Text Translator Python application

-- Get the path to the script file itself using a different approach
on getScriptPath()
	try
		-- Get the path to this script file
		set scriptPath to POSIX path of ((path to me) as text)
		
		-- If it's an application, get its parent directory instead of Resources
		if scriptPath contains ".app/Contents/" then
			-- Extract the app's parent directory by removing everything after and including the .app
			set appPos to offset of ".app" in scriptPath
			if appPos > 0 then
				set scriptPath to text 1 thru (appPos - 1) of scriptPath
				-- Find the last slash before .app
				set lastSlash to 0
				repeat with i from 1 to length of scriptPath
					if character i of scriptPath is "/" then
						set lastSlash to i
					end if
				end repeat
				if lastSlash > 0 then
					set scriptPath to text 1 thru lastSlash of scriptPath
				end if
			end if
		else
			-- If it's a script file, get its directory
			set lastSlash to 0
			repeat with i from 1 to length of scriptPath
				if character i of scriptPath is "/" then
					set lastSlash to i
				end if
			end repeat
			if lastSlash > 0 then
				set scriptPath to text 1 thru lastSlash of scriptPath
			end if
		end if
		
		return scriptPath
	on error errMsg
		-- Alternative method if the above fails
		try
			-- Try to get the desktop path as a fallback
			set desktopPath to POSIX path of (path to desktop)
			return desktopPath
		on error
			-- Last resort: use the home directory
			return "/Users/" & (do shell script "whoami") & "/"
		end try
	end try
end getScriptPath

-- Ask the user for the location of the translate_long_text.py file
on findPythonScript()
	-- First try to find it automatically
	try
		-- Get the script path
		set scriptPath to getScriptPath()
		
		-- Try to find in current directory first
		set findCommand to "find " & quoted form of scriptPath & " -name 'translate_long_text.py' -type f 2>/dev/null | head -n 1"
		set foundScript to do shell script findCommand
		
		-- If not found, try parent directory
		if foundScript is "" then
			set parentDir to do shell script "dirname " & quoted form of scriptPath
			set findCommand to "find " & quoted form of parentDir & " -name 'translate_long_text.py' -type f 2>/dev/null | head -n 1"
			set foundScript to do shell script findCommand
		end if
		
		-- If not found, try user's home directory
		if foundScript is "" then
			set homeDir to do shell script "echo $HOME"
			set findCommand to "find " & quoted form of homeDir & "/Documents -name 'translate_long_text.py' -type f 2>/dev/null | head -n 1"
			set foundScript to do shell script findCommand
		end if
		
		-- If found, return it
		if foundScript is not "" then
			return foundScript
		end if
	end try
	
	-- If automatic detection fails, ask the user
	set promptResult to display dialog "Please locate the 'translate_long_text.py' file:" buttons {"Cancel", "Browse..."} default button "Browse..." with icon note
	
	if button returned of promptResult is "Browse..." then
		set pythonFile to choose file with prompt "Select the translate_long_text.py file:" of type {"py"}
		return POSIX path of pythonFile
	else
		error "User cancelled operation"
	end if
end findPythonScript

-- Main script
try
	-- Find the Python script
	set foundScript to findPythonScript()
	
	-- Get the directory containing the Python script
	set scriptDir to do shell script "dirname " & quoted form of foundScript
	
	-- Define the command to run the Python script
	set pythonCommand to "cd " & quoted form of scriptDir & " && python3 " & quoted form of foundScript
	
	-- Check if required packages are installed
	set checkPyperclip to "python3 -c 'import pyperclip' 2>/dev/null && echo 'installed' || echo 'not installed'"
	set pyperclipInstalled to (do shell script checkPyperclip)
	
	if pyperclipInstalled is "not installed" then
		set installQuestion to display dialog "The required Python package 'pyperclip' is not installed. Would you like to install it now?" buttons {"Cancel", "Install"} default button "Install" with icon caution
		
		if button returned of installQuestion is "Install" then
			do shell script "pip3 install pyperclip requests python-dotenv"
		else
			error "Required packages not installed"
		end if
	end if
	
	-- Check if .env file exists, if not, create it from .env.example
	set checkEnvFile to "[ -f " & quoted form of (scriptDir & "/.env") & " ] && echo 'exists' || echo 'not found'"
	set envExists to (do shell script checkEnvFile)
	
	if envExists is "not found" then
		set checkEnvExample to "[ -f " & quoted form of (scriptDir & "/.env.example") & " ] && echo 'exists' || echo 'not found'"
		set envExampleExists to (do shell script checkEnvExample)
		
		if envExampleExists is "exists" then
			set copyQuestion to display dialog "No .env file found. Would you like to create one from .env.example?" buttons {"Cancel", "Create"} default button "Create" with icon caution
			
			if button returned of copyQuestion is "Create" then
				do shell script "cp " & quoted form of (scriptDir & "/.env.example") & " " & quoted form of (scriptDir & "/.env")
				display dialog "Please edit the .env file to add your OpenRouter API key before running the translator." buttons {"OK"} default button "OK" with icon note
				do shell script "open -e " & quoted form of (scriptDir & "/.env")
				error "Please run the application again after setting up your API key"
			else
				error "No .env file available"
			end if
		else
			display dialog "Error: Neither .env nor .env.example found in " & scriptDir & "." buttons {"OK"} default button "OK" with icon stop
			error "Configuration files not found"
		end if
	end if
	
	-- Run the command in Terminal
	tell application "Terminal"
		activate
		-- Open a new terminal window if none exists
		if (count of windows) is 0 then
			do script ""
		else
			-- Use the current window
			do script "" in front window
		end if
		
		-- Run the Python script
		do script pythonCommand in front window
		
		-- Set the title of the terminal window
		set custom title of front window to "Long Text Translator"
	end tell
	
on error errMsg
	display dialog "Error: " & errMsg buttons {"OK"} default button "OK" with icon stop
end try