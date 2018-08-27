unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, LCLType, ExtCtrls, ShellApi, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    initbutton: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure initbuttonClick(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.initbuttonClick(Sender: TObject);
var
  Reply, BoxStyle: Integer;
begin
  BoxStyle := MB_ICONQUESTION + MB_YESNO;
  Reply := Application.MessageBox('CLICK YES IF YOU HAVE NEVER RUN THE INIT BEFORE', 'MessageBoxDemo', BoxStyle);
  if Reply = IDYES then ShellExecute(0,nil, PChar('cmd'),PChar('/c init.bat'),nil,1)
    else Application.MessageBox('Close one - Dont click INIT again !', 'Reply', MB_ICONHAND);
end;

procedure TForm1.Label10Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
Var
s: String;
s2: String;
s3: String;
begin
  //prep and launch geth.exe
  s:='/c geth --networkid 76248 --gcmode archive --datadir ./data';
  s2:=RightStr(Edit8.Text,40);
  s3:=s+' --etherbase 0x'+s2;
  ShellExecute(0,nil, PChar('cmd'),PChar(s3),nil,1)
end;

procedure TForm1.Button6Click(Sender: TObject);
Var
s: String;
s2: String;
s2b: String;
s3: String;
begin
  //prep and launch geth.exe
  s:='/c geth --rpc ---networkid 76248 --gcmode archive --datadir ./data --mine --minerthreads ';
  s2:=s+Edit6.Text;
  s2b:=RightStr(Edit5.Text,40);
  s3:=s2+' --etherbase 0x'+s2b;
  ShellExecute(0,nil, PChar('cmd'),PChar(s3),nil,1);

  //prep and launch ethminer.exe
  if RadioButton1.Checked then s2:='G';
  if RadioButton2.Checked then s2:='U';
  if RadioButton3.Checked then s2:='X';
  s:='/c ethminer -'+s2+' --cuda-grid-size 1024 http://127.0.0.1:8545';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('cmd'),PChar('/c fulder.bat'),nil,1)
end;

procedure TForm1.Button8Click(Sender: TObject);
begin

end;

procedure TForm1.Edit4Change(Sender: TObject);
begin

end;

procedure TForm1.Edit8Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    ShowMessage('BACKUP YOUR WALLETS AND KEEP YOUR PASSWORD SECURE - NEVER SHARE THE WALLET FILE OR PASSWORD WITH ANYONE! - YOU HAVE BEEN WARNED.');
    ShellExecute(0,nil, PChar('cmd'),PChar('/c make_wallet.bat'),nil,1)
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  ShowMessage('Click on Wallet Folder then choose a file you want to use and copy the rightmost 40 digits.  Protip for keyboard ninjas: (F2) to begin editing CTRL+SHIFT+LEFT to quickly select and CTRL+C to copy. You are welcome');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('cmd'),PChar('/c run_node.bat'),nil,1)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('cmd'),PChar('/c console.bat'),nil,1)
end;

end.

