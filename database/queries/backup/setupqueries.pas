unit SetupQueries;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, DB, sqldb, mysql55conn;

procedure Query_DoesInstallationExist();

var
  Conn: TSQLConnector;
  Query: TSQLQuery;
  F: TField;

implementation

procedure Query_DoesInstallationExist();
begin
  Conn := TSQLConnector.Create(nil);
  with Conn do
  begin
    ConnectorType := 'mysql 5.5';
    HostName := 'sql2.freemysqlhosting.net';
    DatabaseName := 'sql2214733';
    UserName := 'sql2214733';
    Password := 'kQ9!tL9*';
    Transaction := TSQLTransaction.Create(Conn);

  end;

  Query := TSQLQuery.Create(nil);
  Query.DataBase := Conn;

  Query.SQL.Text := 'SELECT * FROM awms_details';
  Query.Open;

  while not Query.EOF do
  begin
       MessageDlg(IntToStr(Query.FieldByName('string').AsInteger), mtWarning, [],0);
       Query.Next;
  end;
  // Query.Close;
  // Query.Free;
  // Conn.Free;
end;

end.
