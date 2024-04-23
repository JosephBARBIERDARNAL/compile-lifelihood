program lifelihoodCompiles;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, alea, fmath, fspec, mathromb, Unit2;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='compileLifelihood';
  Application.Scaled:=True;
  Application.Initialize;
  Application.Run;
end.

