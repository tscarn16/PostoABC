unit uFormPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Menus, Variants, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList;

type
  TFormPadrao = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    {property Login: TLogin read FLogin write FLogin;}
  end;

var
  FormPadrao: TFormPadrao;
  Loading : boolean;

implementation

{$R *.dfm}

procedure TFormPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_Return) then
    Perform(WM_NEXTDLGCTL,0,0);
end;

end.
