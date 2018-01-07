unit unit_awms_main_database_details_modal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { Tmodal_enter_database_details }

  Tmodal_enter_database_details = class(TForm)
    button_connect: TButton;
    button_cancel: TButton;
    input_name: TEdit;
    input_password: TEdit;
    input_port: TEdit;
    label_name: TLabel;
    label_port: TLabel;
    label_username: TLabel;
    input_hostname: TEdit;
    label_hostname: TLabel;
    label_information: TLabel;
    label_password: TLabel;
    label_welcome: TLabel;
    input_username: TEdit;
    connection_mysql: TMySQL55Connection;
    MySQL55Connection1: TMySQL55Connection;
    connection_progressbar: TProgressBar;
    procedure button_cancelClick(Sender: TObject);
    procedure CheckConnection(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure input_hostnameChange(Sender: TObject);
  private

  public

  end;

var
  modal_enter_database_details: Tmodal_enter_database_details;
  mysql: TMySQL55Connection;

implementation

{$R *.lfm}

{ Tmodal_enter_database_details }

procedure Tmodal_enter_database_details.FormCreate(Sender: TObject);
begin

end;

procedure Tmodal_enter_database_details.input_hostnameChange(Sender: TObject);
begin

end;

procedure Tmodal_enter_database_details.button_cancelClick(Sender: TObject);
begin
  if MessageDlg(
    'Are you sure you want to exit? AWMS will not be installed if you continue',
    mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
  begin
    Application.Terminate;
  end;
end;

procedure Tmodal_enter_database_details.CheckConnection(Sender: TObject);
begin
  // Check if any of the fields are empty here

  if input_hostname.Text = '' then
  begin
    MessageDlg('Please enter a hostname. Hint: If the server is hosted locally, use "localhost"', mtError, [mbOK], 0);
    abort;
  end;

  if input_name.Text = '' then
  begin
    MessageDlg('Please enter a database name', mtError, [mbOK], 0);
    abort;
  end;

  if input_username.Text = '' then
  begin
    MessageDlg('Please enter a username', mtError, [mbOK], 0);
    abort;
  end;

  if input_port.Text = '' then
  begin
    MessageDlg('Please enter a port (Default is 3306)', mtError, [mbOK], 0);
    abort;
  end;

  // Ask the user here do they want to continue with a password or not as good databases should really have them
  if input_password.Text = '' then
  begin
    if QuestionDlg('CaptionEdit',
      'Most databases require a password to connect. Do you still want to continue?',
      mtConfirmation, [mrYes, 'Continue', mrNo, 'Cancel'], 'HelpKeyWordEdit') = mrYes then
    begin
      try
        input_hostname.Enabled := False;
        input_name.Enabled := False;
        input_username.Enabled := False;
        input_password.Enabled := False;
        input_port.Enabled := False;

        mysql := TMySql55Connection.Create(nil);

        try
          mysql.HostName := input_hostname.Text;
          mysql.UserName := input_username.Text;
          mysql.DatabaseName := input_name.Text;
          mysql.Password := input_password.Text;
          mysql.Port := 3306;

          try
            mysql.Connected := True;
            if MessageDlg('Connected!', mtInformation, [mbOK], 0) = mrOk then
            begin
              Close;
            end;
          except
            MessageDlg(
              'Failed to connect to the database. Please check your details and try again.',
              mtError, [mbOK], 0);

            input_hostname.Enabled := True;
            input_name.Enabled := True;
            input_username.Enabled := True;
            input_password.Enabled := True;
            input_port.Enabled := True;
          end;
        finally
          mysql.Connected := False;
          mysql.Free;
        end;
      finally

      end;
    end;
  end
  else
  begin
    try
      input_hostname.Enabled := False;
      input_name.Enabled := False;
      input_username.Enabled := False;
      input_password.Enabled := False;
      input_port.Enabled := False;

      mysql := TMySql55Connection.Create(nil);

      try
        mysql.HostName := input_hostname.Text;
        mysql.UserName := input_username.Text;
        mysql.DatabaseName := input_name.Text;
        mysql.Password := input_password.Text;
        mysql.Port := 3307;

        try
          mysql.Connected := True;
          if MessageDlg('Connected!', mtInformation, [mbOK], 0) = mrOk then
          begin
            Close;
          end;
        except
          MessageDlg(
            'Failed to connect to the database. Please check your details and try again.',
            mtError, [mbOK], 0);

          input_hostname.Enabled := True;
          input_name.Enabled := True;
          input_username.Enabled := True;
          input_password.Enabled := True;
          input_port.Enabled := True;
        end;
      finally
        mysql.Connected := False;
        mysql.Free;
      end;
    finally

    end;
  end;
end;

end.
