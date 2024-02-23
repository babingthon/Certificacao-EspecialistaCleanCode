unit view.principal;

interface

  uses
    System.SysUtils, System.Types, System.UITypes, System.Classes,
    System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
    FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Edit,
    interfaces.usuario, classe.usuario;

  type
    TForm1 = class(TForm)
      Layout1: TLayout;
      Layout2: TLayout;
      Label1: TLabel;
      Layout3: TLayout;
      Layout4: TLayout;
      Layout5: TLayout;
      CheckBox1: TCheckBox;
      Label2: TLabel;
      Rectangle1: TRectangle;
      Label3: TLabel;
      Layout6: TLayout;
      Layout7: TLayout;
      EditUser: TEdit;
      EditPass: TEdit;
      Path1: TPath;
      Path2: TPath;
      Path3: TPath;
      Layout8: TLayout;
      procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
      private
        FUsuario: iUsuario;
        { Private declarations }
      public
        { Public declarations }
    end;

  var
    Form1: TForm1;

implementation

uses
  classe.conexao.firedac;

  {$R *.fmx}
  {$R *.XLgXhdpiTb.fmx ANDROID}
  {$R *.LgXhdpiPh.fmx ANDROID}

  procedure TForm1.FormCreate(Sender: TObject);
    begin
      FUsuario := TUsuario.New;
      ReportMemoryLeaksOnShutdown := True;
    end;

  procedure TForm1.Label3Click(Sender: TObject);
begin

  FUsuario
  .User(EditUser.Text)
  .Passoword(EditPass.Text)
  .Login;

end;

end.
