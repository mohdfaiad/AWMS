unit unit_awms_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TXWindow }

  TXWindow = class(TForm)
    option_system_exit: TMenuItem;
    option_system_logout: TMenuItem;
    option_system: TMenuItem;
    XMenu: TMainMenu;
    procedure Click_ExitApplication(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  XWindow: TXWindow;

implementation

{$R *.lfm}

{ TXWindow }

procedure TXWindow.Click_ExitApplication(Sender: TObject);
begin
  if MessageDlg('Question', 'Do you wnat to do this', mtConfirmation,
     [mbYes, mbNo], 0) = mrYes
             then Close;
end;

procedure TXWindow.FormCreate(Sender: TObject);
begin

end;



end.

