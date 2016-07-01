::yhuu
::no error check

@echo off
set users=c:\temp\users.txt
set output=c:\temp\output.txt
set nodes=%userprofile%\documents\nodes.txt
set loggedon=c:\sysinternals\psloggedon.exe

type NUL > %users%
type NUL > %output%

for /f %%n in (%nodes%) do (
  %loggedon% -l \\%%n > %output%
  echo %%n: >> %users
  findstr \/ %output% >> %users%
  echo. >> %users%
)

notepad %users%
del %users %output%
