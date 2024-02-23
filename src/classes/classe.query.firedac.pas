unit classe.query.firedac;

interface

  uses
    interfaces.conexao.firedac,
    firedac.Stan.Intf, firedac.Stan.Option, firedac.Stan.Error, firedac.UI.Intf,
    firedac.Phys.Intf, firedac.Stan.Def, firedac.Stan.Pool, firedac.Stan.Async,
    firedac.Phys, firedac.FMXUI.Wait, firedac.Stan.Param, firedac.DatS,
    firedac.DApt.Intf, firedac.DApt, Data.DB, firedac.Comp.DataSet,
    firedac.Comp.Client, classe.conexao.firedac;

  type
    TQueryFiredac = class(TInterfacedObject, iQuery)
      private
        FParent: iConexao;
        FQuery: TFDQuery;
      public
        constructor Create(Parent: iConexao);
        destructor Destroy; override;
        class function New(Parent: iConexao): iQuery;
        function SQL(Value: string): iQuery;
    end;

implementation

  { TQueryFiredac }

  constructor TQueryFiredac.Create(Parent: iConexao);
    begin
      FParent := Parent;
      FQuery := TFDQuery.Create(nil);

      if not Assigned(FParent) then
        FParent := TConexaoFiredac.New;

      FQuery.Connection := TFDConnection(FParent.Connection);
    end;

  destructor TQueryFiredac.Destroy;
    begin

      inherited;
    end;

  class function TQueryFiredac.New(Parent: iConexao): iQuery;
    begin
      Result := self.Create(Parent);
    end;

  function TQueryFiredac.SQL(Value: string): iQuery;
    begin
      Result := self;
      FQuery.SQL.Clear;
      FQuery.SQL.Add(Value);
      FQuery.Active := True;
    end;

end.
