; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Articulate"
#define MyAppVersion "0.2.4"
#define MyAppPublisher "Articulate Team"
#define MyAppURL "https://github.com/Mpstark/articulate"
#define MyAppExeName "Articulate.exe"
#define SetupFileName "ArticulateSetup"
#define Copyright "Copyright � 2013 Michael Starkweather, Benjamin Pannell, and other contributors."
#define Mutex "Articulate"
#define ReleaseType "Development Preview"

#define depends_net45

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{DDA3C095-838A-4287-AA38-CAE8C191ED5C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} v{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL="http://forums.bistudio.com/showthread.php?166228-Articulate-Squad-Voice-Command-Utility-for-Arma-3"
AppUpdatesURL="https://github.com/Mpstark/articulate/releases"
DefaultDirName={pf}\Articulate
DefaultGroupName=Articulate
AllowNoIcons=true
LicenseFile=..\LICENSE.txt
OutputBaseFilename={#SetupFileName}
SetupIconFile=..\Articulate\Main.ico
Compression=lzma2/Ultra
SolidCompression=true
WizardImageFile="LargeLogo.bmp"
WizardSmallImageFile="SmallLogo.bmp"
WizardImageBackColor=clWhite
WizardImageStretch=false
AppCopyright={#Copyright}
AppMutex={#Mutex}
OutputDir=..\Release
MinVersion=0,5.01sp3
UninstallDisplayName={#MyAppName}
AppComments=Remove {#MyAppName} from your computer
AppContact=GitHub/BI Forums
AppReadmeFile={app}\Readme.md
UninstallDisplayIcon={app}\Articulate.exe
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany=Articulate Team
VersionInfoTextVersion=v{#MyAppVersion} {#ReleaseType}
VersionInfoCopyright={#Copyright}
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
ShowLanguageDialog=auto
UninstallLogMode=append
UninstallFilesDir={app}
InternalCompressLevel=Ultra
VersionInfoProductTextVersion=v{#MyAppVersion} {#ReleaseType}

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\Readme.md"; DestDir: "{app}"; Flags: ignoreversion

;NETKey
Source: ..\Articulate\bin\Release\Articulate.exe; DestDir: "{app}"; Flags: ignoreversion; Permissions: authusers-full
[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; Flags: nowait postinstall runascurrentuser skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "", "")}}"


#include "scripts\products.iss"
#include "scripts\products\stringversion.iss"
#include "scripts\products\winversion.iss"
#include "scripts\products\fileversion.iss"
#include "scripts\products\dotnetfxversion.iss"
#ifdef depends_net45
#include "scripts\products\dotnetfx45.iss"
#endif

[Code]
function InitializeSetup(): boolean;
begin
	//init windows version
	initwinversion();

	// if no .netfx 4.0 is found, install the client (smallest)
	if (not netfxinstalled(NetFx45, '')) then
		dotnetfx45();


	Result := true;
end;
