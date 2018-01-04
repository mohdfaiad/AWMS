unit XScreen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ActnList, Menus;

type

  { TXScreen }

  TXScreen = class(TForm)
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    TopMenu: TMainMenu;
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private

  public

  end;

var
  XScreen: TXScreen;

implementation

{$R *.lfm}

{ TXScreen }

procedure TXScreen.MenuItem2Click(Sender: TObject);
begin

end;

procedure TXScreen.MenuItem1Click(Sender: TObject);
begin

end;

end.

