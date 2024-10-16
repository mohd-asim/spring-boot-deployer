@echo off
setlocal

set MVN_EXEC=%~dp0mvnw

if exist "%M2_HOME%\bin\mvn.cmd" (
  set MVN_EXEC="%M2_HOME%\bin\mvn.cmd"
)

if not defined MVN_EXEC (
  echo The MAVEN_HOME environment variable is not defined correctly.
  exit /b 1
)

%MVN_EXEC% %*
endlocal
