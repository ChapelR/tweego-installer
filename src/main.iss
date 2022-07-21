; TweegoInstaller, by Chapel
; Inno Setup v5.6.1 (a)
; Script version 1.3.0
; Installer version 1.3.0
; License: The Unlicense <http://unlicense.org/>

#define MyAppName "TweegoInstaller"
#define MyAppVersion "1.3.0"

[Setup]
AppId={{29682D59-9F14-4D71-BA16-B79BFBA9E4B8}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
; AppVerName={#MyAppName} {#MyAppVersion}
; we call the program 'Tweego', not TweegoInstaller, for users
DefaultDirName={pf}\Tweego
DefaultGroupName=Tweego
DisableProgramGroupPage=yes
; Tweego's license
LicenseFile=..\pack\LICENSE.txt
; TweegoInstaller's License
InfoBeforeFile=setup.txt
OutputDir=..\bin
OutputBaseFilename=tweego-installer
Compression=lzma
SolidCompression=yes
; we need to set up PATH and TWEEGO_PATH environment variables, so the explorer needs refreshed
ChangesEnvironment=true
; if possible, run in 64-bit mode
ArchitecturesInstallIn64BitMode=x64

[Tasks]
; checkbox option for adding Tweeego to the path 
Name: modifypath; Description: Add Tweego to PATH (recommended).

[Code]
// use modpath.iss to add the install directory to the user PATH
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
; add the TWEEGO_PATH environment variable via the registry
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "TWEEGO_PATH"; \
    ValueData: "{app}\storyformats"; Flags: preservestringtype

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
; installation options
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact (formats not included)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
; each component may be installed separately, including each format individually
Name: "main"; Description: "Program Files"; Types: full compact custom; Flags: fixed
Name: "readme"; Description: "Help File"; Types: full compact
Name: "formats"; Description: "Story Formats"; Types: full
Name: "formats\harlowe1"; Description: "Harlowe v1.x"; Types: full
Name: "formats\harlowe2"; Description: "Harlowe v2.x"; Types: full
Name: "formats\harlowe3"; Description: "Harlowe v3.x"; Types: full
Name: "formats\sugarcube1"; Description: "SugarCube v1.x"; Types: full
Name: "formats\sugarcube2"; Description: "SugarCube v2.x"; Types: full
Name: "formats\snowman1"; Description: "Snowman v1.x"; Types: full
Name: "formats\snowman2"; Description: "Snowman v2.x"; Types: full
Name: "formats\chapbook"; Description: "Chapbook v1.x"; Types: full
Name: "formats\paperthin1"; Description: "Paperthin v1.x"; Types: full

[Dirs]
; create a user-editable story-formats directory in the install directory, even if no formats are actually added
Name: "{app}\storyformats"; Permissions: users-modify
Name: "{app}\licenses"

[Files]
; if the installer is running in 64-bit mode, install the x64 version
Source: "..\pack\tweego-x64.exe"; DestDir: "{app}"; DestName: "tweego.exe"; Check: Is64BitInstallMode; Components: main; Flags: ignoreversion
; fall back to the x86 version for 32-bit systems
Source: "..\pack\tweego-x86.exe"; DestDir: "{app}"; DestName: "tweego.exe"; Check: "not Is64BitInstallMode"; Components: main; Flags: ignoreversion
; the license must be installed
Source: "..\pack\LICENSE.txt"; DestDir: "{app}"; Components: main
Source: "..\pack\licenses\*"; DestDir: "{app}\licenses"; Components: main
; the readme file
Source: "..\pack\README.html"; DestDir: "{app}"; Components: readme
; install the requested formats; by default, all are installed
Source: "..\pack\storyformats\harlowe-1\*"; DestDir: "{app}\storyformats\harlowe-1"; Components: formats\harlowe1; Flags: ignoreversion
Source: "..\pack\storyformats\harlowe-2\*"; DestDir: "{app}\storyformats\harlowe-2"; Components: formats\harlowe2; Flags: ignoreversion
Source: "..\pack\storyformats\harlowe-3\*"; DestDir: "{app}\storyformats\harlowe-3"; Components: formats\harlowe3; Flags: ignoreversion
Source: "..\pack\storyformats\sugarcube-1\*"; DestDir: "{app}\storyformats\sugarcube-1"; Components: formats\sugarcube1; Flags: ignoreversion 
Source: "..\pack\storyformats\sugarcube-2\*"; DestDir: "{app}\storyformats\sugarcube-2"; Components: formats\sugarcube2; Flags: ignoreversion 
Source: "..\pack\storyformats\snowman-1\*"; DestDir: "{app}\storyformats\snowman-1"; Components: formats\snowman1; Flags: ignoreversion
Source: "..\pack\storyformats\snowman-2\*"; DestDir: "{app}\storyformats\snowman-2"; Components: formats\snowman2; Flags: ignoreversion
Source: "..\pack\storyformats\chapbook\*"; DestDir: "{app}\storyformats\chapbook"; Components: formats\chapbook; Flags: ignoreversion
Source: "..\pack\storyformats\paperthin-1\*"; DestDir: "{app}\storyformats\paperthin-1"; Components: formats\paperthin1; Flags: ignoreversion

[Run]
; give the user the option to view the readme or the Tweego documentation (from the web) after a successful installation
Filename: "{app}\README.html"; Description: "View the README file"; Flags: postinstall shellexec skipifsilent runasoriginaluser
Filename: "http://www.motoslave.net/tweego/docs/"; Description: "View the documentation for Tweego"; Flags: postinstall shellexec skipifsilent runasoriginaluser