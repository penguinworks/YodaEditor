program ZenWriter;

uses
  Vcl.Forms,
  FormUnit in 'FormUnit.pas' {MainForm},
  ColorUnit in 'ColorUnit.pas',
  SolarizedColorUnit in 'SolarizedColorUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
