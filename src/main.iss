; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "TweegoInstaller"
#define MyAppVersion "1.0.0"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{29682D59-9F14-4D71-BA16-B79BFBA9E4B8}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=..\pack\LICENSE.txt
InfoBeforeFile=..\pack\Setup.txt
InfoAfterFile=..\pack\After.txt
OutputDir=..\bin
OutputBaseFilename=tweego-setup
Compression=lzma
SolidCompression=yes
ChangesEnvironment=true

[Tasks]
Name: modifypath; Description: Add Tweego to the PATH environment variable (recommended).

[Code]
const 
    ModPathName = 'modifypath'; 
    ModPathType = 'user'; 

function ModPathDir(): TArrayOfString; 
begin 
    setArrayLength(Result, 1) 
    Result[0] := ExpandConstant('{app}'); 
end; 
#include "modpath.iss"

[Registry]
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "TWEEGO_PATH"; \
    ValueData: "{app}\story-formats"; Flags: preservestringtype

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\pack\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

