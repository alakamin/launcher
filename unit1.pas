unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, LCLType, ExtCtrls, ShellApi, lclintf;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
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
    Edit7: TEdit;
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
    Label9: TLabel;
    PageControl1: TPageControl;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure initbuttonClick(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
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
  if Reply = IDYES then
    begin
        ShellExecute(0,nil, PChar('cmd'),PChar('/c init.bat'),nil,1);
        showmessage('You have initialized the blockchain database - please click on CREATE WALLET then WALLET FOLDER and copy the rightmost 40 digits to use on CPU and GPU mining tabs');
    end
    else Application.MessageBox('Close one - Dont click INIT again !', 'Reply', MB_ICONHAND);
end;

procedure TForm1.Label10Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label9Click(Sender: TObject);
begin

end;

procedure TForm1.PageControl1Change(Sender: TObject);
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
s2b: String;
s3: String;
Reply, BoxStyle: Integer;
F0: Textfile;
F1: Textfile;
begin
BoxStyle := MB_ICONQUESTION + MB_YESNO;
if Edit5.Text='0xecb5d50b27d7e6441cf608217575da972aa24537'  Then
   Reply := Application.MessageBox('Are you sure you want to mine the default wallet?  This will mine for the developers.  Click YES if you want to give us some MN otherwise click NO and then enter in your own wallet ID - Click Wallet Folder or back to config for some help', 'MessageBoxDemo', BoxStyle);
         if Reply = IDNO then exit;

   AssignFile(F0, 'wallet.mn');
   Rewrite(F0);
   CloseFile(F0);
     with TStringList.Create do
     try
       Add(Edit5.Text);
       SaveToFile('wallet.mn');
     finally
       Free;
     end;
   AssignFile(F1, 'cpu.mn');
   Rewrite(F1);
   CloseFile(F1);
   with TStringList.Create do
   try
     Add(Edit6.Text);
     SaveToFile('cpu.mn');
   finally
     Free;
   end;

  //prep and launch geth.exe
  s:='/c geth --networkid 76248 --gcmode archive --datadir ./data --mine --minerthreads ';
  s2:=s+Edit6.Text;
  s2b:=RightStr(Edit5.Text,40);
  s3:=s2+' --etherbase 0x'+s2b;
//  ShowMessage(s3);
  ShellExecute(0,nil, PChar('cmd'),PChar(s3),nil,1);
end;

procedure TForm1.Button6Click(Sender: TObject);
Var
s: String;
s2: String;
s2b: String;
s3: String;
F: Textfile;
F0: Textfile;
F1: Textfile;
Reply, BoxStyle: Integer;
begin

BoxStyle := MB_ICONQUESTION + MB_YESNO;
if Edit8.Text='0xecb5d50b27d7e6441cf608217575da972aa24537'  Then
   Reply := Application.MessageBox('Are you sure you want to mine the default wallet?  This will mine for the developers.  Click YES if you want to give us some MN otherwise click NO and then enter in your own wallet ID - Click Wallet Folder or back to config for some help', 'MessageBoxDemo', BoxStyle);
         if Reply = IDNO then exit;

  AssignFile(F0, 'wallet.mn');
  Rewrite(F0);
  CloseFile(F0);
    with TStringList.Create do
    try
      Add(Edit8.Text);
      SaveToFile('wallet.mn');
    finally
      Free;
    end;
  AssignFile(F1, 'cpu.mn');
  Rewrite(F1);
  CloseFile(F1);
  with TStringList.Create do
  try
    Add(Edit7.Text);
    SaveToFile('cpu.mn');
  finally
    Free;
  end;

  AssignFile(F, 'autoGPU.bat');
  Rewrite(F);
  CloseFile(F);

  with TStringList.Create do
    try

  //prep and launch geth.exe
  s:='start cmd.exe /c geth --rpc --networkid 76248 --gcmode archive --datadir ./data --mine --minerthreads ';
  s2:=s+Edit7.Text;
  s2b:=RightStr(Edit8.Text,40);
  s3:=s2+' --etherbase 0x'+s2b;
//  ShowMessage(s3);
//  ShellExecute(0,nil, PChar('cmd'),PChar(s3),nil,1);
  Add(s3);

  //prep and launch ethminer.exe
  s2:='U --cl-local-work 192 --cuda-grid-size 1024';
  if RadioButton1.Checked then s2:='G';
  if RadioButton2.Checked then s2:='U --cl-local-work 192 --cuda-grid-size 1024';
  if RadioButton3.Checked then s2:='X --cl-local-work 192 --cuda-grid-size 1024';
  s:='start cmd.exe /c ethminer -'+s2+' --farm-retries 9999 http://127.0.0.1:8545';
//  ShowMessage(s);
//  ShellExecute(0,nil, PChar('cmd'),PChar(s),nil,1);
  Add('setx GPU_FORCE_64BIT_PTR 0');
  Add('setx GPU_MAX_HEAP_SIZE 100');
  Add('setx GPU_USE_SYNC_OBJECTS 1');
  Add('setx GPU_MAX_ALLOC_PERCENT 100');
  Add('setx GPU_SINGLE_ALLOC_PERCENT 100');
  Add(s); //finally the command we've been prepping
  SaveToFile('autoGPU.bat');
  ShellExecute(0,nil, PChar('cmd'),PChar('/c autoGPU.bat'),nil,1);
finally
  Free;
end;

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

procedure TForm1.Edit7Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var
wmn: String;
cmn: String;
F0: Textfile;
F1: Textfile;
begin
  AssignFile(F0, 'cpu.mn');
        if FileExists('cpu.mn') then
          begin
  try
    reset(F0);
    while not eof(F0) do
    begin
      readln(F0, wmn);
    end;
  except
    on E: EInOutError do
     writeln('File handling error occurred. Details: ', E.Message);
  end;
  CloseFile(F0);
  edit6.Text := wmn;
  edit7.Text := wmn;

if FileExists('wallet.mn') then
  begin
   AssignFile(F1, 'wallet.mn');
  try
    reset(F1);
    while not eof(F1) do
    begin
      readln(F1, cmn);
    end;
  except
    on E: EInOutError do
     writeln('File handling error occurred. Details: ', E.Message);
  end;
  CloseFile(F1);
  edit5.Text := cmn;
  edit8.Text := cmn;
  exit;
end;
end;
        showmessage('First Load - Make sure you review the Wallet ID + cpu threads');
        showmessage('First Load - YOUR FIRST STEP SHOULD BE TO CLICK - IINIT ALAKAMIN - on the CONFIG Tab');

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

procedure TForm1.Button12Click(Sender: TObject);
Var
Reply, BoxStyle: Integer;
begin
BoxStyle := MB_ICONQUESTION + MB_YESNO;
Reply := Application.MessageBox('If you got the error missing pi-ms-win-crt-runtime-l1-1-0.dll  please click YES to go to the microsoft universal C driver resource page and then install the appropriate version for your OS then try again.', 'MessageBoxDemo', BoxStyle);
if Reply = IDYES then OpenURL('https://support.microsoft.com/en-us/help/2999226/update-for-universal-c-runtime-in-windows')
  else Application.MessageBox('Web Page Loading Cancelled', 'Reply', MB_ICONHAND);
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

