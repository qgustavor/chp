# CHP.EXE - Create Hidden Process

A lightweight Windows utility for launching applications silently without stealing focus or interrupting your workflow.

## About This Fork

This fork was created by **qgustavor** and published on GitHub because the original source code was difficult to find online. The project has been configured with GitHub Actions to compile from source, helping to avoid false positive malware detections that can occur with pre-compiled binaries.

## What is CHP?

CHP.EXE is a minimal Windows program that leverages the Win32 CreateProcess API to launch both GUI and console applications in hidden windows. This is particularly useful for:

- Running scheduled scripts without interrupting active work
- Launching background processes silently
- Preventing unwanted window focus changes
- Automating tasks without visual distraction

## Installation & Usage

### Basic Syntax
```bash
CHP <application> [arguments...]
```

### Examples
```bash
# Launch Notepad silently
CHP notepad

# Run a script with arguments
CHP python script.py arg1 arg2

# Execute a batch file in the background
CHP mybatch.bat
```

## Understanding Exit Codes

CHP provides meaningful exit codes to help with error handling and process monitoring:

### Success
- **Exit Code**: Process ID (PID) of the newly created process
- **Meaning**: The application was launched successfully

### Failure
- **Exit Code**: Negative Win32 error code (original error × -1)
- **Troubleshooting**: Use `NET HELPMSG <error_code>` to get the error description

### Viewing Output
Since CHP is a GUI application, pipe the output to view exit codes:

```bash
CHP notepad | more
```

### GitHub Actions
This repository includes automated builds via GitHub Actions, reducing the likelihood of antivirus false positives.

## Contributing

This fork welcomes contributions, especially from developers more experienced with C and Windows system programming.

## License & Attribution

GNU General Public License v3.0
Original tool by **Ritchie**  
Fork maintained by **qgustavor**

## AI Usage Disclaimer

Claude AI was used for assistance with Makefile and GitHub Actions configuration and to aid writting this readme.

---

*For issues, feature requests, or contributions, please use the GitHub repository.*
