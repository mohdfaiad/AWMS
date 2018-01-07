unit unit_awms_main_database_details_modal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Tmodal_enter_database_details }

  Tmodal_enter_database_details = class(TForm)
    Label1: TLabel;
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

