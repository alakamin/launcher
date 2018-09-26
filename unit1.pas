unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, LCLType, ExtCtrls, ShellApi, lclintf, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    memoo: TMemo;
    PageControl1: TPageControl;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
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
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
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
  Reply := Application.MessageBox('CLICK YES IF YOU HAVE NEVER RUN THE INIT BEFORE', 'Blockchain Init Sanity Check', BoxStyle);
  if Reply = IDYES then
    begin
        ShellExecute(0,nil, PChar('cmd'),PChar('/c init.bat'),nil,1);
        showmessage('You have initialized the blockchain database - please click on CREATE WALLET when you are ready to begin mining.');
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

procedure TForm1.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
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
s2b: String;
s3: String;
Reply, BoxStyle: Integer;
F0: Textfile;
F1: Textfile;
begin
BoxStyle := MB_ICONQUESTION + MB_YESNO;
if Edit5.Text='0xecb5d50b27d7e6441cf608217575da972aa24537'  Then
   Reply := Application.MessageBox('Are you sure you want to mine the default wallet?  This will mine for the developers.  Click YES if you want to give us some MN otherwise click NO and then enter in your own wallet ID - Click Wallet Folder or back to config for some help', 'To tip or not to Tip', BoxStyle);
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
  s:='/c geth --networkid 76248 --gcmode=archive --syncmode=full --datadir ./data --mine --minerthreads ';
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
E1: Textfile;
Reply, BoxStyle: Integer;
begin
  //test to see if ethmminer.exe is there or not.
  //if it isn't then offer the users the chance to visit the git repo where it resides and open the folder where they need to unpack it
  AssignFile(E1, 'ethminer.exe');
      if not FileExists('ethminer.exe') then
        begin
          showmessage('ethminer.exe was not found - we will open a small webpage explaining the issue and provide some links there.');
          ShellExecute(0,nil, PChar('cmd'),PChar('/c ethminer_exe.htm'),nil,1);
          ShellExecute(0,nil, PChar('cmd'),PChar('/c fulder.bat'),nil,1);
          exit;
        end;

BoxStyle := MB_ICONQUESTION + MB_YESNO;
if Edit8.Text='0xecb5d50b27d7e6441cf608217575da972aa24537'  Then
   Reply := Application.MessageBox('Are you sure you want to mine the default wallet?  This will mine for the developers.  Click YES if you want to give us some MN otherwise click NO and then enter in your own wallet ID - Click Wallet Folder or back to config for some help', 'To tip or not to Tip', BoxStyle);
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
  s:='start cmd.exe /c geth --rpc --networkid 76248 --gcmode=archive --syncmode=full --datadir ./data --mine --minerthreads ';
  s2:=s+Edit7.Text;
  s2b:=RightStr(Edit8.Text,40);
  s3:=s2+' --etherbase 0x'+s2b;
//  ShowMessage(s3);
//  ShellExecute(0,nil, PChar('cmd'),PChar(s3),nil,1);
  Add(s3);

  //prep and launch ethminer.exe
  s2:='U --cl-local-work 192 --cuda-grid-size 1024';
  if RadioButton1.Checked then s2:='G';
  if RadioButton3.Checked then s2:='U --cl-local-work 192 --cuda-grid-size 1024';
  if RadioButton2.Checked then s2:='X --cl-local-work 192 --cuda-grid-size 1024';
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

procedure TForm1.Edit3Change(Sender: TObject);
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
F2: Textfile;
F3: Textfile;
begin
memoo.Text:='attribution list';

AssignFile(F3, 'attribution.mn');
      if FileExists('attribution.mn') then
        begin
try
  reset(F3);
  while not eof(F3) do
  begin
    readln(F3, wmn);
    memoo.Text := memoo.Text + sLineBreak + wmn;
  end;
  except
    on E: EInOutError do
    writeln('File handling error occurred. Details: ', E.Message);
  end;
  CloseFile(F3);
  end;

AssignFile(F2, 'mnv.mn');
      if FileExists('mnv.mn') then
        begin
try
  reset(F2);
  while not eof(F2) do
  begin
    readln(F2, wmn);
  end;
except
  on E: EInOutError do
   writeln('File handling error occurred. Details: ', E.Message);
end;
CloseFile(F2);
Form1.Caption := 'Alakamin Treasure Mountain - Launcher' + wmn;
end;

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
  edit9.Text := cmn;
  exit;
end;
end;
        ShellExecute(0,nil, PChar('cmd'),PChar('/c echo 4 > cpu.mn'),nil,1);
        ShellExecute(0,nil, PChar('cmd'),PChar('/c init.bat'),nil,1);
        showmessage('First Load - You have initialized the Alakamin (MN) blockchain - please click on CREATE WALLET when you are ready to begin mining.');
end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
var
cmn: String;
F1: Textfile;
begin
    ShowMessage('BACKUP YOUR WALLETS AND KEEP YOUR PASSWORD SECURE - NEVER SHARE THE WALLET FILE OR PASSWORD WITH ANYONE! - YOU HAVE BEEN WARNED.');
    ShellExecute(0,nil, PChar('cmd'),PChar('/c del rmw.bat /y'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c copy make_wallet.bat rmw.bat'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c echo zz >> rmw.bat'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c echo '+Edit10.Text+' > pwtmp.mn'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c echo geth --networkid 76248 account new --password pwtmp.mn --datadir ./data >> rmw.bat'),nil,1);
    ShowMessage('Your account is almost ready.');
    ShellExecute(0,nil, PChar('cmd'),PChar('/c rmw.bat'),nil,1);
    ShowMessage('Your account is created.');
    ShellExecute(0,nil, PChar('cmd'),PChar('/c del pwtmp.mn /y'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c del rmw.bat /y'),nil,1);

    //ok we made the account now we need to perform some magic and get the account name and put the password in too
    ShellExecute(0,nil, PChar('cmd'),PChar('/c copy komd.bat fr.bat /Y'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c echo echo 0x%lastchar% ^> ..\..\wallet.mn >> fr.bat'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c echo echo %lastchar% ^> ..\..\WALLET_%lastchar%.txt >> fr.bat'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c echo echo '+Edit10.Text+' ^>^> ..\..\WALLET_%lastchar%.txt >> fr.bat'),nil,1);
    //ShellExecute(0,nil, PChar('cmd'),PChar('/c echo pause >> fr.bat'),nil,1);
    ShellExecute(0,nil, PChar('cmd'),PChar('/c fr.bat'),nil,1);
    ShowMessage('Please click on WALLET FOLDER and go up 2 levels and you will see files labeled WALLET_???.txt - these are your wallet codes and passwords.   Your actual wallets are in the folder you see when you click WALLET FOLDER.  Please back those up somewhere offline preferrably.  You do not need them on your PC unless you are changing password or sending MN to another user.');
    ShellExecute(0,nil, PChar('cmd'),PChar('/c del fr.bat /y'),nil,1);

    Edit10.Text := 'notapassword';
//    Edit11.Text := 'notanewpassword';
    // now let's use some magic and grab that wallet address
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
          edit9.Text := cmn;
          exit;
        end;
    //note to anyone editing this the messages above are just to add some pausing so the cmd piping actually completes sequentially and correctly.
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
Reply := Application.MessageBox('If you got the error missing pi-ms-win-crt-runtime-l1-1-0.dll  please click YES to go to the microsoft universal C driver resource page and then install the appropriate version for your OS then try again.', 'Load Microsoft Link?', BoxStyle);
if Reply = IDYES then OpenURL('https://support.microsoft.com/en-us/help/2999226/update-for-universal-c-runtime-in-windows')
  else Application.MessageBox('Web Page Loading Cancelled', 'Reply', MB_ICONHAND);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
   ShellExecute(0,nil, PChar('cmd'),PChar('/c alakamin_help.htm'),nil,1)
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
ShellExecute(0,nil, PChar('cmd'),PChar('/c echo @echo off > pwc.bat'),nil,1);
ShellExecute(0,nil, PChar('cmd'),PChar('/c echo '+Edit10.Text+' > pwtmp.mn'),nil,1);
//ShellExecute(0,nil, PChar('cmd'),PChar('/c echo '+Edit11.Text+' > pwtmp2.mn'),nil,1);
ShellExecute(0,nil, PChar('cmd'),PChar('/c echo geth account update '+Edit9.Text+' --password pwtmp.mn pwtmp2.mn >> pwc.bat'),nil,1);
ShellExecute(0,nil, PChar('cmd'),PChar('/c echo pause >> pwc.bat'),nil,1);
ShellExecute(0,nil, PChar('cmd'),PChar('/c pwc.bat'),nil,1);
ShowMessage('Password change attempted');

ShellExecute(0,nil, PChar('cmd'),PChar('/c del pwc.bat /y'),nil,1);
ShellExecute(0,nil, PChar('cmd'),PChar('/c del pwtmp.mn /y'),nil,1);
ShellExecute(0,nil, PChar('cmd'),PChar('/c del pwtmp2.mn /y'),nil,1);

Edit10.Text := 'notapassword';
//Edit11.Text := 'notanewpassword';
  end;

procedure TForm1.Button15Click(Sender: TObject);
begin
    ShellExecute(0,nil, PChar('cmd'),PChar('/c run_node_full.bat'),nil,1)
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('cmd'),PChar('/c run_node.bat'),nil,1)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('cmd'),PChar('/c geth attach \\.\pipe\geth.ipc'),nil,1)
end;

end.

