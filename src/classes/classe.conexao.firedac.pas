unit classe.conexao.firedac;

interface

  uses
    interfaces.conexao.firedac,
    firedac.Stan.Intf, firedac.Stan.Option, firedac.Stan.Error, firedac.UI.Intf,
    firedac.Phys.Intf, firedac.Stan.Def, firedac.Stan.Pool, firedac.Stan.Async,
    firedac.Phys, firedac.FMXUI.Wait, firedac.Stan.Param, firedac.DatS,
    firedac.DApt.Intf, firedac.DApt, Data.DB, firedac.Comp.DataSet,
    firedac.Comp.Client, FireDAC.Phys.FB;

  type
    TConexaoFiredac = class(TInterfacedObject, iConexao)
      private
        FConexao: TFDConnection;
      public
        constructor Create;
        destructor Destroy; override;
        class function New: iConexao;
        function Connection: TCustomConnection;
    end;

implementation

  { TConexaoFiredac }

  function TConexaoFiredac.Connection: TCustomConnection;
    begin
      Result := FConexao;
    end;

  constructor TConexaoFiredac.Create;
    begin
      FConexao := TFDConnection.Create(nil);
      FConexao.DriverName := 'FB';
      FConexao.Params.Database := 'H:\GitHub\TelaLogin - CleanCode\src\DB\DB.FDB';
      FConexao.Params.UserName := 'SYSDBA';
      FConexao.Params.Password := 'masterkey';
      FConexao.Connected := True;
    end;

  destructor TConexaoFiredac.Destroy;
    begin

      inherited;
    end;

  class function TConexaoFiredac.New: iConexao;
    begin
      Result := self.Create;
    end;

end.
