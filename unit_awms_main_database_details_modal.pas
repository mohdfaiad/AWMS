unit unit_awms_main_database_details_modal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

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
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  modal_enter_database_details: Tmodal_enter_database_details;

implementation

{$R *.lfm}

{ Tmodal_enter_database_details }

procedure Tmodal_enter_database_details.FormCreate(Sender: TObject);
begin

end;

end.

