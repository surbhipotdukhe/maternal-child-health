@REM ----------------------------------------------------------------------------
@REM Maven Wrapper startup batch script
@REM ----------------------------------------------------------------------------
@IF "%__MVNW_ARG0_NAME__%"=="" (SET __MVNW_ARG0_NAME__=%~nx0)
@SET PN=%__MVNW_ARG0_NAME__%
@SET PATCHELF_VERSION=0.9

@SET MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
@IF NOT "%MAVEN_PROJECTBASEDIR%"=="" GOTO endDetectBaseDir

@SET EXEC_DIR=%CD%
@SET WDIR=%EXEC_DIR%
:findBaseDir
@IF EXIST "%WDIR%"\pom.xml GOTO baseDirFound
@IF "%WDIR%"=="%WDIR:~0,3%" GOTO baseDirNotFound
@SET "WDIR=%WDIR%\..\.."
@GOTO findBaseDir
:baseDirFound
@SET MAVEN_PROJECTBASEDIR=%WDIR%
@GOTO endDetectBaseDir
:baseDirNotFound
@SET MAVEN_PROJECTBASEDIR=%EXEC_DIR%
:endDetectBaseDir

@SET MVNW_REPOURL=https://repo.maven.apache.org/maven2
@SET MAVEN_WRAPPER_PROPERTIES=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties

@SET MVNW_DISTRIBUTION_URL_STATUS=
@FOR /F "tokens=1,2 delims==" %%A IN (%MAVEN_WRAPPER_PROPERTIES%) DO (
    @IF "%%A"=="distributionUrl" SET DISTRIBUTION_URL=%%B
)

@SET M2_HOME=%USERPROFILE%\.m2\wrapper\dists\apache-maven-3.9.6-bin\apache-maven-3.9.6
@SET MAVEN_HOME=%M2_HOME%
@SET PATH=%M2_HOME%\bin;%PATH%

@IF EXIST "%M2_HOME%\bin\mvn.cmd" (
    @ECHO [MVN-WRAPPER] Using cached Maven at %M2_HOME%
    GOTO runMaven
)

@ECHO [MVN-WRAPPER] Maven not found. Downloading Apache Maven 3.9.6...
@ECHO [MVN-WRAPPER] This may take a minute on first run...

@IF NOT EXIST "%USERPROFILE%\.m2\wrapper\dists" MKDIR "%USERPROFILE%\.m2\wrapper\dists"

@SET MAVEN_ZIP=%USERPROFILE%\.m2\wrapper\dists\apache-maven-3.9.6-bin.zip
@powershell -Command "& { [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; Invoke-WebRequest -Uri 'https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.6/apache-maven-3.9.6-bin.zip' -OutFile '%MAVEN_ZIP%' -UseBasicParsing }"

@ECHO [MVN-WRAPPER] Extracting Maven...
@powershell -Command "& { Expand-Archive -Path '%MAVEN_ZIP%' -DestinationPath '%USERPROFILE%\.m2\wrapper\dists\' -Force }"

@ECHO [MVN-WRAPPER] Maven ready!

:runMaven
@SET MAVEN_CMD_LINE_ARGS=%*
"%M2_HOME%\bin\mvn.cmd" %MAVEN_CMD_LINE_ARGS%
