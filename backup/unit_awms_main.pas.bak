unit unit_awms_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus, IniFiles,

  BlowFish,
  SetupQueries,

  unit_awms_main_database_details_modal;

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

  C_DB_KEY = 't5aq5drUB8!Freba';

var
  XWindow: TXWindow;

  ENC_STREAM: TBlowFishEncryptStream;
  DE_STREAM: TBlowFishDeCryptStream;

  STREAM_1, STREAM_2: TStringStream;

  INI: TINIFile;
  DB_HOST, DB_NAME, DB_USER, DB_PASS: String;
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
    DB_HOST := INI.ReadString(C_DB_SECTION, 'DB_HOST', 'NULL');

    DB_SETUP_PREVIOUS := CompareText(DB_HOST, 'NULL');

    // The database has not been setup and we will have to display some sort
    // of modal in order to let the user setup any details
    if DB_SETUP_PREVIOUS = 0 then
       begin

            Application.CreateForm(Tmodal_enter_database_details, modal_enter_database_details);
            if modal_enter_database_details.ShowModal = mrOk then
               begin;
                    MessageDlg(modal_enter_database_details.input_hostname.Text, mtInformation, [mbOK], 0);

                    // We now have the details and can connect to the database. From here,
                    // 1: The AWMS_DETAIL Table is checked
                       // If it doesn't exist, we'll tell the user do they want to install AWMS onto the database
                          // If yes, Do all the tables, then return to step 2
                       // Else refuse, and exit
                    // 2: If the table does exist, add the data and link up

                    STREAM_1 := TStringStream.Create('');
                    ENC_STREAM := TBlowFishEncryptStream.Create(C_DB_KEY, STREAM_1);
                    ENC_STREAM.Write(modal_enter_database_details.input_password.Text, Length(modal_enter_database_details.input_password.Text));
                    ENC_STREAM.Free;

                    INI.WriteString(C_DB_SECTION, 'DB_HOST', modal_enter_database_details.input_hostname.Text);
                    INI.WriteString(C_DB_SECTION, 'DB_NAME', modal_enter_database_details.input_name.Text);
                    INI.WriteString(C_DB_SECTION, 'DB_USERNAME', modal_enter_database_details.input_username.Text);
                    INI.WriteString(C_DB_SECTION, 'DB_PASSWORD', STREAM_1.DataString);
                    INI.WriteInteger(C_DB_SECTION, 'DB_PORT', StrToInt(modal_enter_database_details.input_port.Text));
               end;

            // Write(modal_enter_database_details.input_hostname.Text);

    // The database has been setup and we can retrieve some of the values
    // that are needed to connect
       end
    else
        begin
          DB_HOST := INI.ReadString(C_DB_SECTION, 'DB_HOST', 'localhost');
          DB_NAME := INI.ReadString(C_DB_SECTION, 'DB_NAME', 'awms');
          DB_USER := INI.ReadString(C_DB_SECTION, 'DB_USER', 'administrator');
          DB_PASS := INI.ReadString(C_DB_SECTION, 'DB_PASS', 'password');
          DB_PORT := INI.ReadInteger(C_DB_SECTION, 'DB_PORT', 3306);

          SetupQueries.Query_DoesInstallationExist();

        end;
  finally
         INI.Free;
  end;
end;



end.

