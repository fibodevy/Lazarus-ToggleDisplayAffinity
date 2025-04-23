unit uToggleDisplayAffinity;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math,
  // LCL
  LCLType,
  // IdeIntf
  LazIDEIntf, MenuIntf;

procedure Register;

implementation

{$ifdef WINDOWS}
const // todo: resourcestring
  lisMenuViewToggleDisplayAffinity = 'Toggle Display Affinity';

var
  itmViewToggleDisplayAffinity: TIDEMenuCommand = nil;

function GetWindowDisplayAffinity(hWnd: HWND; pdwAffinity: PDWORD): bool; stdcall;
  external 'user32.dll';

function SetWindowDisplayAffinity(hWnd: HWND; dwAffinity: DWORD): bool; stdcall;
  external 'user32.dll';

procedure ToggleDisplayAffinity(Sender: TObject);
var
  lAffinity: DWORD;
begin
  itmViewToggleDisplayAffinity.Checked := GetWindowDisplayAffinity(LazarusIDE.GetMainBar.Handle, @lAffinity) and SetWindowDisplayAffinity(LazarusIDE.GetMainBar.Handle, IfThen(lAffinity = 0, $11, 0)) and (lAffinity = 0);
end;
{$endif}

procedure Register;
begin
  {$ifdef WINDOWS}
  itmViewToggleDisplayAffinity := RegisterIDEMenuCommand(itmViewMainWindows, 'ToggleDisplayAffinity',
    lisMenuViewToggleDisplayAffinity, nil, @ToggleDisplayAffinity, nil);
  itmViewMainWindows.Insert(0, itmViewToggleDisplayAffinity);
  {$endif}
end;

end.

