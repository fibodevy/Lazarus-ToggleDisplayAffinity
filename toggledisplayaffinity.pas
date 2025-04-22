{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ToggleDisplayAffinity;

{$warn 5023 off : no warning about unused units}
interface

uses
  uToggleDisplayAffinity, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('uToggleDisplayAffinity', @uToggleDisplayAffinity.Register);
end;

initialization
  RegisterPackage('ToggleDisplayAffinity', @Register);
end.
