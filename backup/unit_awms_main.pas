unit unit_awms_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus, IniFiles;

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

const
  C_DB_SECTION = 'DB_INFORMATION';

var
  XWindow: TXWindow;

  INI: TINIFile;
  DB_IP, DB_NAME, DB_USER, DB_PASS: String;
  DB_PORT: integer;

  DB_SETUP_PREVIOUS: LongInt;

implementation

{$R *.lfm}

{ TXWindow }

procedure TXWindow.Click_ExitApplication(Sender: TObject);
begin
  if MessageDlg('Question', 'Are you sure you want to exit?', mtConfirmation,
     [mbYes, mbNo], 0) = mrYes
             then Close;
end;

procedure TXWindow.FormCreate(Sender: TObject);
begin
  INI := TINIFile.Create('DB.ini');

  // Confirm if we have setup a connection to the database

  try
    DB_IP := INI.ReadString(C_DB_SECTION, 'DB_IP', 'NULL');

    DB_SETUP_PREVIOUS := CompareText(DB_IP, 'NULL');

    // The database has not been setup and we will have to display some sort
    // of modal in order to let the user setup any details
    if DB_SETUP_PREVIOUS = 0 then

    // The database has been setup and we can retrieve some of the values
    // that are needed to connect
    else
      DB_NAME := INI.ReadString(C_DB_SECTION, 'DB_NAME', 'awms');
      DB_USER := INI.ReadString(C_DB_SECTION, 'DB_USER', 'administrator');
      DB_PASS := INI.ReadString(C_DB_SECTION, 'DB_PASS', 'password');
      DB_PORT := INI.ReadInteger(C_DB_SECTION, 'DB_PORT', 3306);
  finally
         INI.Free;
  end;
end;



end.

