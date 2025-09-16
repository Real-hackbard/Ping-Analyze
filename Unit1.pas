unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Winsock, ufbping, Dialogs,
  StdCtrls, ComCtrls, Controls, Forms, Buttons, ExtCtrls, Menus, Variants,
  IdBaseComponent, IdComponent, IdRawBase, IdRawClient, IdIcmpClient, OleCtrls,
  SHDocVw, ShellApi, Spin, TeEngine, Series, TeeProcs, Chart, Grids, IniFiles,
  ImgList, ClipBrd, XPMan;

{$DEFINE NO_MESSAGE}

const
  ICMP = 'ICMP.DLL';
  RES_UNKNOWN   = 'Unknown';
  WSA_TYPE = $101;
  STR_TRACE = 'Trace: ';
  STR_JUMP = 'Counts: ';
  STR_DONE = 'Done. ' + #13#10;
  HOST_NOT_REPLY = 'No Replay ';
  
type
  IP_INFO = packed record
    Ttl: Byte;
    Tos: Byte;
    IPFlags: Byte;
    OptSize: Byte;
    Options: Pointer;
  end;
  PIP_INFO = ^IP_INFO;

  ICMP_ECHO = packed record
    Source: Longint;
    Status: Longint;
    RTTime: Longint;
    DataSize: Word;
    Reserved: Word;
    pData: Pointer;
    i_ipinfo: IP_INFO;
  end;

type TThreadScan = class(TThread)
     msg : string;
     msg2 : string;
 private
     BeginAddr: integer;
     EndAddr: integer;
     Timeout: DWORD;
     procedure UpdateMemo;
     procedure UpdateStatusBar;
     procedure UpdateScanned;
 protected
     procedure Execute; override;
 public
     constructor Create(a,b:integer);
 end;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Clear1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ExportList1: TMenuItem;
    ExportSelected1: TMenuItem;
    DeleteSelected1: TMenuItem;
    N1: TMenuItem;
    OpenDialog1: TOpenDialog;
    IdIcmpClient1: TIdIcmpClient;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Bevel1: TBevel;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox10: TCheckBox;
    GroupBox2: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ListBox1: TListBox;
    Timer1: TTimer;
    IdIcmpClient2: TIdIcmpClient;
    PopupMenu2: TPopupMenu;
    View1: TMenuItem;
    N3D1: TMenuItem;
    N2D1: TMenuItem;
    Walls1: TMenuItem;
    N3D2: TMenuItem;
    N2D2: TMenuItem;
    Monochrome1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Memo6: TMemo;
    Chart1: TChart;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Memo3: TMemo;
    Memo4: TMemo;
    ListBox2: TListBox;
    StringGrid1: TStringGrid;
    PopupMenu3: TPopupMenu;
    L1: TMenuItem;
    G1: TMenuItem;
    CheckBox11: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel4: TPanel;
    ListView1: TListView;
    Panel5: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Panel6: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Edit7: TEdit;
    ComboBox1: TComboBox;
    SpinEdit2: TSpinEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    Label6: TLabel;
    Edit11: TEdit;
    Label7: TLabel;
    Edit12: TEdit;
    Label5: TLabel;
    Edit13: TEdit;
    Label8: TLabel;
    Edit14: TEdit;
    Memo2: TMemo;
    C1: TMenuItem;
    Panel9: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Edit6: TEdit;
    SpinEdit1: TSpinEdit;
    Memo5: TMemo;
    ImageList1: TImageList;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    SpinEdit5: TSpinEdit;
    Label10: TLabel;
    ComboBox2: TComboBox;
    Label11: TLabel;
    SpinEdit6: TSpinEdit;
    Label12: TLabel;
    SpinEdit7: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    SpinEdit8: TSpinEdit;
    CheckBox4: TCheckBox;
    CheckBox8: TCheckBox;
    Panel10: TPanel;
    Memo1: TMemo;
    Panel11: TPanel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    RadioGroup1: TRadioGroup;
    N2: TMenuItem;
    C2: TMenuItem;
    C3: TMenuItem;
    CheckBox1: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    R1: TMenuItem;
    N3: TMenuItem;
    R2: TMenuItem;
    C4: TMenuItem;
    N4: TMenuItem;
    Label17: TLabel;
    Label18: TLabel;
    S1: TMenuItem;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    CheckBox9: TCheckBox;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Clear1Click(Sender: TObject);
    procedure ExportList1Click(Sender: TObject);
    procedure ExportSelected1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure DeleteSelected1Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure IdIcmpClient1Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IdIcmpClient2Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
    procedure N3D1Click(Sender: TObject);
    procedure N2D1Click(Sender: TObject);
    procedure N3D2Click(Sender: TObject);
    procedure N2D2Click(Sender: TObject);
    procedure Monochrome1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure C1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure Edit17KeyPress(Sender: TObject; var Key: Char);
    procedure Edit18KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19KeyPress(Sender: TObject; var Key: Char);
    procedure C2Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure S1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Déclarations privées }
    Thread: array of TThreadScan;
    FColorKey: TCOLOR;
    procedure WriteOptions;
    procedure ReadOptions;
  public
    { Déclarations publiques }
  end;

TTraceThread = class(TThread)
  private
    DestAddr: in_addr;
    TraceHandle: THandle;
    DestinationAddress,
    ReportString: String;
    IterationCount: Byte;
  public
    procedure Execute; override;
    procedure Log;
    function Trace(const Iteration: Byte): Longint;
  end;

var
  Form1: TForm1;
  FoundedHosts: integer;
  TotalScanned: integer;
  Tentative : Byte;
  i, j, tmp : integer;
  minTTL, maxTTL, meanTTL, minTrip, maxTrip, meanTrip :integer;
  sommeTTL, sommeTrip: integer;
  TIF : TIniFile;
  p : integer = 0;
  e : integer = 0;
  v : integer = 0;

const
  LWA_COLORKEY = 1; LWA_ALPHA = 2; WS_EX_LAYERED = $80000;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128; // arb.
  MAX_ADAPTER_NAME_LENGTH        = 256; // arb.
  MAX_ADAPTER_ADDRESS_LENGTH     = 8;  // arb.

type
 TWindowPos = packed record
   hwnd: HWND; 
   hwndInsertAfter: HWND;
   x: Integer;
   y: Integer;
   cx: Integer;
   cy: Integer;
   flags: UINT;
end;

type
  PIP_ADDRESS_STRING = ^IP_ADDRESS_STRING;
  IP_ADDRESS_STRING =
    packed record
      acString : array [1..16] of Char;
    end;

  PIP_MASK_STRING = ^PIP_MASK_STRING;
  IP_MASK_STRING = IP_ADDRESS_STRING;

  PIP_ADDR_STRING = ^IP_ADDR_STRING;
  IP_ADDR_STRING =
    packed record
      Next     : PIP_ADDR_STRING;
      IpAddress : IP_ADDRESS_STRING;
      IpMask   : IP_MASK_STRING;
      Context  : DWORD;
    end;

  time_t = int64;

  PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;
  IP_ADAPTER_INFO =
    packed record
      Next               : PIP_ADAPTER_INFO;
      ComboIndex         : DWORD;
      AdapterName        : array [1..MAX_ADAPTER_NAME_LENGTH+4] of Char ;
      Description        : array [1..MAX_ADAPTER_DESCRIPTION_LENGTH+4] of Char;
      AddressLength      : UINT;
      Address            : array [1..MAX_ADAPTER_ADDRESS_LENGTH] of Byte;
      Index              : DWORD;
      dwType             : UINT;
      DhcpEnabled        : UINT;
      CurrentIpAddress   : PIP_ADDR_STRING;
      IpAddressList      : IP_ADDR_STRING;
      GatewayList        : IP_ADDR_STRING;
      DhcpServer         : IP_ADDR_STRING;
      HaveWins           : Boolean;
      PrimaryWinsServer  : IP_ADDR_STRING;
      SecondaryWinsServer : IP_ADDR_STRING;
      LeaseObtained      : time_t;
      LeaseExpires       : time_t;
    end;

type
  PNetResourceArray = ^TNetResourceArray;
  TNetResourceArray = array[0..100] of TNetResource;

function GetAdaptersInfo(const pAdapterInfo : PIP_ADAPTER_INFO;const pOutBufLen : PULONG) : DWORD; stdcall; external 'IPHLPAPI.DLL' name 'GetAdaptersInfo';

implementation

uses Unit2;

{$R *.dfm}
{$R 'admin.res'}
function MainDir: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
   WriteBool(OPT,'LoadHostList',CheckBox11.Checked);
   WriteBool(OPT,'SaveHostList',CheckBox3.Checked);
   WriteBool(OPT,'Admin',CheckBox10.Checked);
   WriteBool(OPT,'StayTop',CheckBox5.Checked);
   WriteBool(OPT,'Tranzparent',CheckBox6.Checked);
   WriteBool(OPT,'HideOnTask',CheckBox7.Checked);
   WriteBool(OPT,'Skin',CheckBox2.Checked);
   WriteBool(OPT,'Statistic',CheckBox4.Checked);
   WriteBool(OPT,'Thread',CheckBox8.Checked);
   WriteInteger(OPT,'Range',RadioGroup1.ItemIndex);
   WriteBool(OPT,'Grid',G1.Checked);
   WriteString(OPT,'Range1',Edit8.Text);
   WriteString(OPT,'Range2',Edit9.Text);
   WriteString(OPT,'Range3',Edit10.Text);
   WriteString(OPT,'Range4',Edit15.Text);
   WriteString(OPT,'Range5',Edit16.Text);
   WriteString(OPT,'Range6',Edit17.Text);
   WriteString(OPT,'Range7',Edit18.Text);
   WriteString(OPT,'Range8',Edit19.Text);
   WriteString(OPT,'Timeout',Edit1.Text);
   WriteString(OPT,'Buffer',Edit2.Text);
   WriteInteger(OPT,'NBS',SpinEdit3.Value);
   WriteInteger(OPT,'TTL',SpinEdit4.Value);
   WriteString(OPT,'ThreadStart',Edit11.Text);
   WriteString(OPT,'ThreadStop',Edit12.Text);
   WriteString(OPT,'ThreadTime',Edit13.Text);
   WriteString(OPT,'ThreadNumber',Edit14.Text);
   WriteString(OPT,'TracertURL',Edit6.Text);
   WriteInteger(OPT,'TracertCount',SpinEdit1.Value);
   WriteInteger(OPT,'StatisticBuffer',SpinEdit7.Value);
   WriteInteger(OPT,'StatisticRecieve',SpinEdit8.Value);
   WriteInteger(OPT,'StatisticProtocol',ComboBox2.ItemIndex);
   WriteInteger(OPT,'StatisticPort',SpinEdit5.Value);
   WriteInteger(OPT,'StatisticInterval',ComboBox1.ItemIndex);
   WriteInteger(OPT,'StatisticCount',SpinEdit2.Value);
   WriteBool(OPT,'SaveThreadReport',CheckBox1.Checked);
   WriteBool(OPT,'SaveTracertReport',CheckBox12.Checked);
   WriteBool(OPT,'SaveStatisticReport',CheckBox13.Checked);


   //WriteBool(OPT,'SaveOptions',CheckBox1.Checked);
   //WriteInteger(OPT,'Compress',Combobox1.ItemIndex);
   //WriteInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
   Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
  TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
  with TIF do
  begin
  CheckBox11.Checked:=ReadBool(OPT,'LoadHostList',CheckBox11.Checked);
  CheckBox3.Checked:=ReadBool(OPT,'SaveHostList',CheckBox3.Checked);
  CheckBox10.Checked:=ReadBool(OPT,'Admin',CheckBox10.Checked);
  CheckBox5.Checked:=ReadBool(OPT,'StayTop',CheckBox5.Checked);
  CheckBox6.Checked:=ReadBool(OPT,'Tranzparent',CheckBox6.Checked);
  CheckBox7.Checked:=ReadBool(OPT,'HideOnTask',CheckBox7.Checked);
  CheckBox2.Checked:=ReadBool(OPT,'Skin',CheckBox2.Checked);
  CheckBox4.Checked:=ReadBool(OPT,'Statistic',CheckBox4.Checked);
  CheckBox8.Checked:=ReadBool(OPT,'Thread',CheckBox8.Checked);
  RadioGroup1.ItemIndex:=ReadInteger(OPT,'Range',RadioGroup1.ItemIndex);
  G1.Checked:=ReadBool(OPT,'Grid',G1.Checked);
  Edit8.Text:=ReadString(OPT,'Range1',Edit8.Text);
  Edit9.Text:=ReadString(OPT,'Range2',Edit9.Text);
  Edit10.Text:=ReadString(OPT,'Range3',Edit10.Text);
  Edit15.Text:=ReadString(OPT,'Range4',Edit15.Text);
  Edit16.Text:=ReadString(OPT,'Range5',Edit16.Text);
  Edit17.Text:=ReadString(OPT,'Range6',Edit17.Text);
  Edit18.Text:=ReadString(OPT,'Range7',Edit18.Text);
  Edit19.Text:=ReadString(OPT,'Range8',Edit19.Text);
  Edit1.Text:=ReadString(OPT,'Timeout',Edit1.Text);
  Edit2.Text:=ReadString(OPT,'Buffer',Edit2.Text);
  SpinEdit3.Value:=ReadInteger(OPT,'NBS',SpinEdit3.Value);
  SpinEdit4.Value:=ReadInteger(OPT,'TTL',SpinEdit4.Value);
  Edit11.Text:=ReadString(OPT,'ThreadStart',Edit11.Text);
  Edit12.Text:=ReadString(OPT,'ThreadStop',Edit12.Text);
  Edit13.Text:=ReadString(OPT,'ThreadTime',Edit13.Text);
  Edit14.Text:=ReadString(OPT,'ThreadNumber',Edit14.Text);
  Edit6.Text:=ReadString(OPT,'TracertURL',Edit6.Text);
  SpinEdit1.Value:=ReadInteger(OPT,'TracertCount',SpinEdit1.Value);
  SpinEdit7.Value:=ReadInteger(OPT,'StatisticBuffer',SpinEdit7.Value);
  SpinEdit8.Value:=ReadInteger(OPT,'StatisticRecieve',SpinEdit8.Value);
  ComboBox2.ItemIndex:=ReadInteger(OPT,'StatisticProtocol',ComboBox2.ItemIndex);
  SpinEdit5.Value:=ReadInteger(OPT,'StatisticPort',SpinEdit5.Value);
  ComboBox1.ItemIndex:=ReadInteger(OPT,'StatisticInterval',ComboBox1.ItemIndex);
  SpinEdit2.Value:=ReadInteger(OPT,'StatisticCount',SpinEdit2.Value);
  CheckBox1.Checked:=ReadBool(OPT,'SaveThreadReport',CheckBox1.Checked);
  CheckBox12.Checked:=ReadBool(OPT,'SaveTracertReport',CheckBox12.Checked);
  CheckBox13.Checked:=ReadBool(OPT,'SaveStatisticReport',CheckBox13.Checked);


  //CheckBox1.Checked:=ReadBool(OPT,'SaveOptions',CheckBox1.Checked);
  //Combobox1.ItemIndex:=ReadInteger(OPT,'Compress',combobox1.ItemIndex);
  //RadioGroup1.ItemIndex:=ReadInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
  Free;
  end;
  end;
end;

function NetServerGetInfo (serverName : PWideChar; level : Integer;
        var bufptr : Pointer) : Cardinal; stdcall; external 'NETAPI32.DLL';
function NetApiBufferFree (buffer : Pointer) : Cardinal; stdcall; external 'NETAPI32.DLL';

type
  SERVER_INFO_503 = record
    sv503_sessopens : Integer;
    sv503_sessvcs : Integer;
    sv503_opensearch : Integer;
    sv503_sizreqbuf : Integer;
    sv503_initworkitems : Integer;
    sv503_maxworkitems : Integer;
    sv503_rawworkitems : Integer;
    sv503_irpstacksize : Integer;
    sv503_maxrawbuflen : Integer;
    sv503_sessusers : Integer;
    sv503_sessconns : Integer;
    sv503_maxpagedmemoryusage : Integer;
    sv503_maxnonpagedmemoryusage : Integer;
    sv503_enablesoftcompat :BOOL;
    sv503_enableforcedlogoff :BOOL;
    sv503_timesource :BOOL;
    sv503_acceptdownlevelapis :BOOL;
    sv503_lmannounce :BOOL;
    sv503_domain : PWideChar;
    sv503_maxcopyreadlen : Integer;
    sv503_maxcopywritelen : Integer;
    sv503_minkeepsearch : Integer;
    sv503_maxkeepsearch : Integer;
    sv503_minkeepcomplsearch : Integer;
    sv503_maxkeepcomplsearch : Integer;
    sv503_threadcountadd : Integer;
    sv503_numblockthreads : Integer;
    sv503_scavtimeout : Integer;
    sv503_minrcvqueue : Integer;
    sv503_minfreeworkitems : Integer;
    sv503_xactmemsize : Integer;
    sv503_threadpriority : Integer;
    sv503_maxmpxct : Integer;
    sv503_oplockbreakwait : Integer;
    sv503_oplockbreakresponsewait : Integer;
    sv503_enableoplocks : BOOL;
    sv503_enableoplockforceclose : BOOL;
    sv503_enablefcbopens : BOOL;
    sv503_enableraw : BOOL;
    sv503_enablesharednetdrives : BOOL;
    sv503_minfreeconnections : Integer;
    sv503_maxfreeconnections : Integer;
  end;
  PSERVER_INFO_503 = ^SERVER_INFO_503;


function Get_Computer_Name: string;
var
  dwlen: DWORD;
begin
  dwlen := MAX_COMPUTERNAME_LENGTH + 1;
  Setlength(Result, dwlen);
  GetComputerName(pchar(Result), dwlen);
  Result := StrPas(pchar(Result));
end;

function GetDomainName : string;
var
  err : Integer;
  buf : pointer;
  fDomainName: string;
  wServerName : WideString;
begin
  wServerName := Get_Computer_Name;
  err := NetServerGetInfo (PWideChar (wServerName), 503, buf);
  if err = 0 then
  try
    fDomainName := PSERVER_INFO_503 (buf)^.sv503_domain;
  finally
    NetAPIBufferFree (buf)
  end;
  result := fDomainName;
end;

function CreateNetResourceList(ResourceType: DWord;
                              NetResource: PNetResource;
                              out Entries: DWord;
                              out List: PNetResourceArray): Boolean;
var
  EnumHandle: THandle;
  BufSize: DWord;
  Res: DWord;
begin
  Result := False;
  List := Nil;
  Entries := 0;
  if WNetOpenEnum(RESOURCE_GLOBALNET,
                  ResourceType,
                  0,
                  NetResource,
                  EnumHandle) = NO_ERROR then begin
    try
      BufSize := $4000;  // 16 kByte
      GetMem(List, BufSize);
      try
        repeat
          Entries := DWord(-1);
          FillChar(List^, BufSize, 0);
          Res := WNetEnumResource(EnumHandle, Entries, List, BufSize);
          if Res = ERROR_MORE_DATA then
          begin
            ReAllocMem(List, BufSize);
          end;
        until Res <> ERROR_MORE_DATA;

        Result := Res = NO_ERROR;
        if not Result then
        begin
          FreeMem(List);
          List := Nil;
          Entries := 0;
        end;
      except
        FreeMem(List);
        raise;
      end;
    finally
      WNetCloseEnum(EnumHandle);
    end;
  end;
end;

procedure ScanNetworkResources(ResourceType, DisplayType: DWord; List: TStrings);

procedure ScanLevel(NetResource: PNetResource);
var
  Entries: DWord;
  NetResourceList: PNetResourceArray;
  i: Integer;
begin
  if CreateNetResourceList(ResourceType, NetResource, Entries, NetResourceList) then try
    for i := 0 to Integer(Entries) - 1 do
    begin
      if (DisplayType = RESOURCEDISPLAYTYPE_GENERIC) or
        (NetResourceList[i].dwDisplayType = DisplayType) then begin
        List.AddObject(NetResourceList[i].lpRemoteName,
                      Pointer(NetResourceList[i].dwDisplayType));
      end;
      if (NetResourceList[i].dwUsage and RESOURCEUSAGE_CONTAINER) <> 0 then
        ScanLevel(@NetResourceList[i]);
    end;
  finally
    FreeMem(NetResourceList);
  end;
end;

begin
  ScanLevel(Nil);
end;

procedure KillDuplicates(s: TStrings);
var
  iLow, iHigh: integer;
begin
  for iLow := 0 to s.Count - 2 do
    for iHigh := Pred(s.Count) downto Succ(iLow) do
      if s[iLow] = s[iHigh] then
        s.Delete(iHigh);
end;

procedure selectline(memo:TMemo;line:integer);
begin
  memo.SelStart := memo.Perform(EM_LINEINDEX, line-1, 0);
  memo.Perform(EM_SCROLLCARET, 0, 0);
  memo.sellength:=length(Memo.lines.strings[line-1]);
  memo.SetFocus;
end;

function ToIP(I1,I2,I3,I4: Integer): Cardinal;

  function Check(Value: Integer): Byte;
  begin
    if (Value >= 0) and (Value <= 255) then Result := Value
      else raise Exception.Create('ToIP: Values I1,I2,I3,I4 must be in Range 0 up to 255 each');
  end;

begin
  Result := Check(I1) shl 24 or Check(I2) shl 16 or Check(I3) shl 8 or Check(I4);
end;


function IPToStr(Value: Cardinal): String;
begin
  Result := Format('%d.%d.%d.%d', [Value shr 24, Value shr 16 and $FF, Value shr 8 and $FF, Value and $FF]);
end;

procedure Range;
var
  IP: Cardinal;
begin
  for IP := ToIP(StrToInt(Form1.Edit8.Text) , StrToInt(Form1.Edit9.Text),StrToInt(Form1.Edit10.Text),StrToInt(Form1.Edit15.Text)) to
            ToIP(StrToInt(Form1.Edit16.Text) , StrToInt(Form1.Edit17.Text),StrToInt(Form1.Edit18.Text),StrToInt(Form1.Edit19.Text)) do begin

    Form1.Label15.Caption := IntToStr(Form1.Memo1.Lines.Count);
    Form1.Memo1.Lines.Add(IPToStr(IP));

    Application.ProcessMessages;
    end;
end;

type
    ip_option_information = packed record
        Ttl : byte;
        Tos : byte;
        Flags : byte;
        OptionsSize : byte;
        OptionsData : Pointer;
    end;

   icmp_echo_reply = packed record
        Address : u_long;
        Status : u_long;
        RTTime : u_long;
        DataSize : u_short;
        Reserved : u_short;
        Data : Pointer;
        Options : ip_option_information;
    end;

    PIPINFO = ^ip_option_information; PVOID = Pointer;

   function IcmpCreateFile() : THandle; stdcall; external 'ICMP.DLL' name 'IcmpCreateFile';
   function IcmpCloseHandle(IcmpHandle : THandle) : BOOL; stdcall; external 'ICMP.DLL'  name 'IcmpCloseHandle';
   function IcmpSendEcho(IcmpHandle : THandle;DestAddress : u_long;
                          RequestData : PVOID;RequestSize : Word;RequestOptns : PIPINFO;
                          ReplyBuffer : PVOID;
                          ReplySize : DWORD;
                          Timeout : DWORD
                         ) : DWORD; stdcall; external 'ICMP.DLL' name 'IcmpSendEcho';

function Conv(x:integer):integer;
begin
 Conv:= MakeWPARAM(MakeWORD(HiByte(HiWord(x)) , LoByte(HiWord(x))),
   MakeWORD(HiByte(LoWord(x)) , LoByte(LoWord(x))));
end;

function GetNameFromIP(const IP: String): String;
const
  ERR_INADDR    = 'Can not convert IP to in_addr.';
  ERR_HOST      = 'Can not get host information.';
  ERR_WSA       = 'Can not initialize WSA.';
var
  WSA   : TWSAData; Host  : PHostEnt; Addr  : u_long; Err   : Integer;
begin
  Result := RES_UNKNOWN;
  Err := WSAStartup(WSA_TYPE, WSA);
  if Err <> 0 then
  begin
    {$IFNDEF NO_MESSAGE}
      MessageDlg(ERR_WSA, mtError, [mbOK], 0);
    {$ENDIF}
    Exit;
  end;
  try
    Addr := inet_addr(PChar(IP));
    if Addr = u_long(INADDR_NONE) then
    begin
      {$IFNDEF NO_MESSAGE}
        MessageDlg(ERR_INADDR, mtError, [mbOK], 0);
      {$ENDIF}
      Exit;
    end;
    Host := gethostbyaddr(@Addr, SizeOf(Addr), PF_INET);
    if Assigned(Host) then
      Result := Host.h_name
    {$IFNDEF NO_MESSAGE}
      else
        MessageDlg(ERR_HOST, mtError, [mbOK], 0)
    {$ENDIF}
    ;
  finally WSACleanup; end;
end;

function GetDottetIP(const IP: Longint): String;
begin
  Result := Format('%d.%d.%d.%d', [IP and $FF,
    (IP shr 8) and $FF, (IP shr 16) and $FF, (IP shr 24) and $FF]);
end;

procedure TTraceThread.Execute;
var
  WSAData: TWSAData; Host: PHostEnt; Error, TickStart: DWORD; Result: Longint; I,
  Iteration: Byte; HostName: String; HostReply: Boolean; HostIP: LongInt;
begin
  Error := WSAStartup(WSA_TYPE, WSAData);
  if Error <> 0 then
  begin
    ReportString := SysErrorMessage(WSAGetLastError);
    Synchronize(Log);
    Exit;
  end;
  Screen.Cursor := crHourGlass; Form1.BitBtn5.Enabled := false;

  try
    Host := gethostbyname(PChar(DestinationAddress));
    if not Assigned(Host) then
    begin
      ReportString := SysErrorMessage(WSAGetLastError);
      Synchronize(Log);
      Exit;
    end;

    DestAddr := PInAddr(Host.h_addr_list^)^;
    TraceHandle := IcmpCreateFile;
    if TraceHandle = INVALID_HANDLE_VALUE then
    begin
      ReportString := SysErrorMessage(GetLastError);
      Synchronize(Log);
      Exit;
    end;
 try
      ReportString := STR_TRACE + DestinationAddress
        + ' [' + GetDottetIP(DestAddr.S_addr)+ ']' + #13#10;
      Synchronize(Log);
      ReportString := STR_JUMP + IntToStr(IterationCount) + ':' + #13#10;
      Synchronize(Log); Result := 0; Iteration := 0;

      while (Result <> DestAddr.S_addr) and (Iteration < IterationCount) do
      begin
        Inc(Iteration); HostReply := False;
        for I := 0 to 2 do
        begin
          TickStart := GetTickCount; Result := Trace(Iteration);
          if Result = -1 then
            ReportString := '    *    '
          else
          begin
            ReportString := Format('%6d ms', [GetTickCount - TickStart]);
            HostReply := True; HostIP := Result;
          end;
          if I = 0 then
            ReportString := Format('%3d: %s', [Iteration, ReportString]);
          Synchronize(Log);
          end;

        if HostReply then
        begin
          ReportString := GetDottetIP(HostIP);
          HostName := GetNameFromIP(ReportString);

         Form1.ProgressBar1.Position := +1;

          if HostName <> RES_UNKNOWN then
            ReportString := HostName + '[' + ReportString + ']';
          ReportString := ReportString + #13#10;

          Form1.StatusBar1.Panels[0].Text :=
          ' Total Scanned : ' + IntToStr(Form1.ProgressBar1.Position);
          Form1.StatusBar1.Panels[3].Text :=
          ' Host found : ' + IntToStr(Form1.ProgressBar1.Position);
          Form1.StatusBar1.Panels[2].Text :=
          ' Thread Max: ' + IntToStr(Form1.SpinEdit1.Value);

        end else
          ReportString := HOST_NOT_REPLY + #13#10;
        ReportString := '  ' + ReportString;
        Synchronize(Log); end;
    finally
    IcmpCloseHandle(TraceHandle);
    end;
    ReportString := STR_DONE; Synchronize(Log);
  finally
  WSACleanup;
  Form1.StatusBar1.Panels[1].Text := ' Ready';

  if Form1.CheckBox12.Checked = true then begin
  Form1.Memo5.Lines.SaveToFile(MainDir + 'Data\Saves\Tracert-Report.ini');
  end;
  Form1.Edit6.Enabled := true; Form1.SpinEdit1.Enabled := true;
  Form1.BitBtn5.Enabled := true;
  Screen.Cursor := crDefault;
  end;

  Form1.ProgressBar1.Position := Form1.ProgressBar1.Max;
end;

procedure TTraceThread.Log;
begin
  Form1.Memo5.Text := Form1.Memo5.Text + ReportString;
  SendMessage(Form1.Memo5.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

function TTraceThread.Trace(const Iteration: Byte): Longint;
var IP: IP_INFO; ECHO: ^ICMP_ECHO; Error: Integer;
begin
  GetMem(ECHO, SizeOf(ICMP_ECHO)); try with IP do begin
      Ttl := Iteration; Tos := 0; IPFlags := 0; OptSize := 0; Options := nil;
    end;
    Error := IcmpSendEcho(TraceHandle,
    DestAddr.S_addr,nil,0,@IP,ECHO,SizeOf(ICMP_ECHO),5000);
    if Error = 0 then begin Result := -1; Exit; end;
    Result := ECHO.Source;
  finally FreeMem(ECHO); end;
end;

constructor TThreadScan.Create(a,b:integer);
begin
  BeginAddr := a;
  EndAddr := b;
  inherited Create(True);
end;

procedure Connexion;
begin
  if (Tentative = 1) then
     Form1.WebBrowser1.Navigate('http://checkip.dyndns.org');
  if (Tentative = 2) then 
     Form1.WebBrowser1.Navigate('http://www.adresseip.com');
end;

function GetLocalIPs(const Lines:TStrings):boolean;
type
  PPInAddr= ^PInAddr;
var  wsaData: TWSAData; HostInfo: PHostEnt;
  HostName: Array[0..255] of Char; Addr: PPInAddr;
begin
  Result:=False; Lines.Clear;
  if WSAStartup($0102, wsaData)=0 then
  try
    if gethostname(HostName, SizeOf(HostName)) = 0 then Begin
       HostInfo:= gethostbyname(HostName);
       if HostInfo<>nil then Begin
          Addr:=Pointer(HostInfo^.h_addr_list);
          if (Addr<>nil) AND (Addr^<>nil) then 
             Repeat
             Lines.Add(StrPas(inet_ntoa(Addr^^))); inc(Addr);
             Until Addr^=nil;
       end; end; Result:=True; finally WSACleanup; end;
end;

function MakeWindowTransparent(Wnd: HWND; nAlpha: Integer = 10): Boolean;
type
  TSetLayeredWindowAttributes = function(hwnd: HWND; crKey: COLORREF; bAlpha: Byte;
    dwFlags: Longint): Longint;
  stdcall;
var
  hUser32: HMODULE; SetLayeredWindowAttributes: TSetLayeredWindowAttributes;
begin
  Result := False;
  hUser32 := GetModuleHandle('USER32.DLL');
  if hUser32 <> 0 then
  begin @SetLayeredWindowAttributes := GetProcAddress(hUser32, 'SetLayeredWindowAttributes');
    if @SetLayeredWindowAttributes <> nil then
    begin
      SetWindowLong(Wnd, GWL_EXSTYLE, GetWindowLong(Wnd, GWL_EXSTYLE) or WS_EX_LAYERED);
      SetLayeredWindowAttributes(Wnd, 0, Trunc((255 / 100) * (100 - nAlpha)), LWA_ALPHA);
      Result := True;
    end;
  end;
end;

function SetLayeredWindowAttributes( Wnd: hwnd; crKey: ColorRef; Alpha: Byte;
  dwFlags: DWORD): Boolean; stdcall; external 'user32.dll';

procedure TThreadScan.Execute;
var hIP : THandle; pingBuffer : array [0..31] of Char; pIpe : ^icmp_echo_reply;
    wVersionRequested : WORD; lwsaData : WSAData; error : DWORD;
    destAddress : In_Addr; i: integer; IPReply: string;
begin
    e := e + 1;
    hIP := IcmpCreateFile();
    GetMem( pIpe, sizeof(icmp_echo_reply) + sizeof(pingBuffer));
    pIpe.Data := @pingBuffer;
    pIpe.DataSize := sizeof(pingBuffer);
    wVersionRequested := MakeWord(1,1);
    error := WSAStartup(wVersionRequested,lwsaData);
    if (error <> 0) then
    begin
        {
         Form1.Memo1.SetTextBuf('Error in call to '+
                          'WSAStartup().');
         Form1.Memo1.Lines.Add('Error code: '+IntToStr(error));
         msg := 'Error code: '+IntToStr(error);
        Synchronize(ShowResult);
         Exit;
         }
    end;

    for i := BeginAddr to EndAddr do begin
    destAddress.S_addr := Conv(i);
    Inc(TotalScanned);
    msg2 := ' Total Scanned : ' + IntToStr(TotalScanned);
    Synchronize(UpdateScanned);
    IcmpSendEcho(hIP,destAddress.S_addr,@pingBuffer,sizeof(pingBuffer),
    Nil,pIpe,sizeof(icmp_echo_reply) + sizeof(pingBuffer),Timeout);

    error := GetLastError();
    if (error <> 0) then
    begin
         e := e + 1;
         msg := inet_ntoa(destAddress) + ' - Address not Available..';
         Synchronize(UpdateMemo);
         Form1.StatusBar1.Panels[4].Text := ' Host Errors : ' + IntToStr(e);
         continue;
    end;

    IPReply := IntToStr(LoByte(LoWord(pIpe^.Address)))+'.'+
               IntToStr(HiByte(LoWord(pIpe^.Address)))+'.'+
               IntToStr(LoByte(HiWord(pIpe^.Address)))+'.'+
               IntToStr(HiByte(HiWord(pIpe^.Address)));

   msg := IPReply + ' - ' + IntToStr(pIpe.RTTime)+' (ms)';
   Synchronize(UpdateMemo);
   Inc(FoundedHosts);
   msg := ' Host found : ' + IntToStr(FoundedHosts);
   Synchronize(UpdateStatusBar);
   end;
   IcmpCloseHandle(hIP); WSACleanup(); FreeMem(pIpe);
end;

procedure TThreadScan.UpdateScanned;
begin
  Form1.StatusBar1.Panels[0].Text := msg2;
  Form1.ProgressBar1.Position := TotalScanned + 1;
end;

procedure TThreadScan.UpdateStatusBar;
begin
 Form1.StatusBar1.Panels[3].Text := msg;
end;

procedure TThreadScan.UpdateMemo;
begin
 Form1.Memo2.Lines.Add(msg);
end;

function IPAddrToName(IPAddr: string): string;
var SockAddrIn: TSockAddrIn; HostEnt: PHostEnt; WSAData: TWSAData;
begin
  WSAStartup($101, WSAData);
  SockAddrIn.sin_addr.s_addr := inet_addr(PansiChar(AnsiString(IPAddr)));
  HostEnt := gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);
  if HostEnt <> nil then
    Result := StrPas(Hostent^.h_name) else  Result := ''; WSACleanup;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not DirectoryExists(MainDir + 'Data\Saves')
   then ForceDirectories(MainDir + 'Data\Saves');

  if (FileExists(MainDir + 'Data\Drivers\icmp_32.dll') and
     (FileExists(MainDir + 'Data\Drivers\icmp_64.dll')))
  then begin Exit;
  end else begin
  ShowMessage('ICMP Drivers "icmp_32.dll, icmp_64.dll" not found check Drivers Folder !' + #13#10 + 'Application Terminate !');
  Application.Terminate;
  end;

  if not FileExists(MainDir + 'Data\Drivers\IPHLPAPI_32.dll') then begin
  ShowMessage('Error "IPHLPAPI_32.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\IPHLPAPI_64.dll') then begin
  ShowMessage('Error "IPHLPAPI_64.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\iprtprio_32.dll') then begin
  ShowMessage('Error "iprtprio_32.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\iprtprio_64.dll') then begin
  ShowMessage('Error "iprtprio_64.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\netapi32_32.dll') then begin
  ShowMessage('Error "netapi32_32.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\netapi32_64.dll') then begin
  ShowMessage('Error "netapi32_64.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\NetworkStatus_32.dll') then begin
  ShowMessage('Error "NetworkStatus_32.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\NetworkStatus_64.dll') then begin
  ShowMessage('Error "NetworkStatus_64.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\Range.dll') then begin
  ShowMessage('Error "Range.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\ufbping.dll') then begin
  ShowMessage('Error "ufbping.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\USock.dll') then begin
  ShowMessage('Error "USock.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\wininet_32.dll') then begin
  ShowMessage('Error "wininet_32.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\wininet_64.dll') then begin
  ShowMessage('Error "wininet_64.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\WSHTCPIP_32.dll') then begin
  ShowMessage('Error "WSHTCPIP_32.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\WSHTCPIP_64.dll') then begin
  ShowMessage('Error "WSHTCPIP_64.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  Form1.ParentBackground := false;
  Memo1.MaxLength := $7FFFFFF0;

  j := 1;
  StringGrid1.ColWidths[0]:=105;
  StringGrid1.Cells[0,0]:='Date_Time';
  StringGrid1.Cells[1,0]:='TTL';
  StringGrid1.Cells[2,0]:='TripT.';
  minTTL:=256;
  maxTTL:=0;
  sommeTTL:=0;
  minTrip:=5000;
  maxTrip:=0;
  sommeTrip:=0;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if NOT (Key in [#08, '0'..'9']) then Key := #0;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if NOT (Key in [#08, '0'..'9']) then Key := #0;
end;

procedure TForm1.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
   if NOT (Key in [#08, '0'..'9']) then Key := #0;
end;

procedure TForm1.Edit14KeyPress(Sender: TObject; var Key: Char);
begin
   if NOT (Key in [#08, '0'..'9']) then Key := #0;
end;

procedure TForm1.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #46, #8]) then key := #0
end;

procedure TForm1.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #46, #8]) then key := #0
end;

procedure TForm1.Clear1Click(Sender: TObject);
begin
  ListView1.Clear;
  StatusBar1.Panels[0].Text := ' Total Scanned : 0';
  StatusBar1.Panels[1].Text := ' Clear';
  StatusBar1.Panels[2].Text := ' Thread Max : ' + IntToStr(Memo1.Lines.Count);
  StatusBar1.Panels[3].Text := ' Host found : 0';
  StatusBar1.Panels[4].Text := ' Host Errors : 0';
end;

procedure TForm1.ExportList1Click(Sender: TObject);
var I:Integer;
begin
    if ListView1.Items.Count = 0 then begin
  Beep;
  MessageDlg('No Data to Export!',mtInformation, [mbOK], 0);
  Exit;
  end;

  Memo2.Clear;
    if SaveDialog1.Execute = true then begin
    for I := 0 to ListView1.Items.Count - 1 do begin
      Memo3.Lines.Add(ListView1.Items[i].Caption) ;
      Memo3.Lines.AddStrings( ListView1.Items[I].SubItems);
      Memo3.Lines.Add('');
      Memo3.Lines.SaveToFile(SaveDialog1.FileName + '.txt');
    end;
    end;
end;
procedure TForm1.ExportSelected1Click(Sender: TObject);
begin
  if ListView1.Items.Count = 0 then begin
    Beep;
    MessageDlg('No Data to Export!',mtInformation, [mbOK], 0);
    Exit;
  end;

    Memo2.Clear;
    Memo2.Lines.Add(ListView1.Selected.Caption + ' : ' +
                    ListView1.Selected.SubItems.Text);
  begin
    if SaveDialog1.Execute then begin
    Memo2.Lines.SaveToFile(SaveDialog1.FileName + '-' + '.txt');
  end;
  end;
end;

procedure TForm1.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Sender.Canvas.Font.Color := clRed;
end;

procedure TForm1.ListView1CustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  with Sender.Canvas do begin
    if SubItem = 1 then Font.Color := clBlue;
    if SubItem = 2 then Font.Color := clBlue;
    if SubItem = 3 then Font.Color := clMaroon;
    if SubItem = 4 then Font.Color := clBlack;
  end;
end;

procedure TForm1.DeleteSelected1Click(Sender: TObject);
begin
  if ListView1.Items.Count = 0 then begin
    Beep;
    MessageDlg('No Data to Delete!',mtInformation, [mbOK], 0);
    Exit;
  end;
  
  ListView1.DeleteSelected;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
   if CheckBox5.Checked = true then begin
   SetWindowPos(Handle, HWND_TOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
   end else begin
   SetWindowPos(Handle, HWND_NOTOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
   end;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if CheckBox6.Checked = true then begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_LAYERED);
  SetLayeredWindowAttributes(Handle, ColorToRGB(FColorKey), 220, LWA_ALPHA);
  end else begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_LAYERED);
  SetLayeredWindowAttributes(Handle, ColorToRGB(FColorKey), 255, LWA_ALPHA);
  end;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
    if CheckBox7.Checked = true then begin
    ShowWindow( Application.Handle, SW_HIDE );
    end else begin
    ShowWindow( Application.Handle, SW_SHOW ); end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;

  if CheckBox11.Checked = true then begin
  try
  Memo1.Lines.LoadFromFile(MainDir + 'Data\Saves\host-lst.ini');
  except
  end;
  end;

  CheckBox4.OnClick(sender);
  CheckBox8.OnClick(sender);
  G1.OnClick(sender);

  Label15.Caption := IntToStr(Memo1.Lines.Count);
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
   if PageControl1.TabIndex = 4 then Button1.Click;
end;

procedure TForm1.IdIcmpClient1Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
var  sTime: String;
begin
  if (AReplyStatus.MsRoundTripTime = 0) then sTime := '< 1' else sTime := '=';
  Listbox1.Items.Add(Format('%d bytes from %s: ICMP_Seq=%d TTL=%d Time: %s%d (ms)',
                            [AReplyStatus.BytesReceived,
                             AReplyStatus.FromIpAddress,
                             AReplyStatus.SequenceId,
                             AReplyStatus.TimeToLive,
                             sTime,
                             AReplyStatus.MsRoundTripTime]));
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var i: Integer;
begin
  //ListBox1.Clear;
  IdIcmpClient1.Host := Edit3.Text;
  IdIcmpClient2.OnReply := IdIcmpClient2Reply;
  IdIcmpClient2.ReceiveTimeout := 1000;
  IdIcmpClient2.Port := SpinEdit6.Value;

  for i := 1 to 4 do
  begin
   IdIcmpClient1.Ping; Application.ProcessMessages;
  end;
  Listbox1.Items.Add('Ok.');
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var i: Integer;
begin
  ListBox1.Clear;
 IdIcmpClient1.Host := Edit4.Text;
 for i := 1 to 4 do
 begin
   IdIcmpClient1.Ping; Application.ProcessMessages;
 end;
 Listbox1.Items.Add('Ok.');
end;

procedure TForm1.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var S, IP : String; i :Integer;
begin
  S := WebBrowser1.OleObject.Document.Body.InnerHTML;
  If (Tentative = 2) then begin
      if (Pos('Ihre IP-Adresse lautet',S) <> 0) then begin
          i := Pos('Ihre IP-Adresse lautet',S)+67;
          While (S[i] <> ' ') do
            begin IP := IP + S[i]; inc(i); end;
          Edit5.Text := IP;
          StatusBar1.Panels[6].Text := ' IP : '  + IP;
          WebBrowser1.Stop;
          end else begin
          Edit5.Text := '      Offline';
          StatusBar1.Panels[6].Text := ' Offline';
        end; end;
  If (Tentative = 1) then begin
      if (Pos('Current IP Address: ',S) <> 0) then
        begin i := 21; While (S[i] <> ' ') do
            begin IP := IP + S[i]; inc(i); end;
          Edit5.Text := IP;
          StatusBar1.Panels[6].Text := ' IP : '  + IP;
          WebBrowser1.Stop;
        end else begin
          Tentative := 2;
          Connexion;
        end;
      end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var i: Integer;
begin
  ListBox1.Clear;
  IdIcmpClient1.Host := Edit5.Text;

  for i := 1 to 4 do
  begin
   IdIcmpClient1.Ping;
   Application.ProcessMessages;
  end;

  Listbox1.Items.Add('Ok.');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  try
  begin
    IdIcmpClient2.Ping;
    if Memo6.Lines.Count > SpinEdit2.Value then BitBtn7.Click;
    StatusBar1.Panels[0].Text := ' Total Scanned : ' + IntToStr(Memo6.Lines.Count);
    StatusBar1.Panels[2].Text := ' Thread Max : ' + IntToStr(SpinEdit2.Value);
    StatusBar1.Panels[3].Text := ' Host found : ' + IntToStr(Memo6.Lines.Count);
    ProgressBar1.Position := Memo6.Lines.Count;
    Application.ProcessMessages;
  end;
  except
    v := v + 1;
    Memo6.Lines.Add('Socket Error!');
    StatusBar1.Panels[4].Text := ' Host Errors : ' + IntToStr(v);
  end;
end;

procedure TForm1.IdIcmpClient2Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
var  sTime: string;
begin
    ListBox2.Items.Add(Format('%d;%d',
    [AReplyStatus.TimeToLive,
    AReplyStatus.MsRoundTripTime]));
    StringGrid1.RowCount:=j+1;
    StringGrid1.Cells[0,j]:=DateTimeToStr(now);
    StringGrid1.Cells[1,j]:= (copy(ListBox2.Items.Text,0,pos(';',ListBox2.Items.Text)-1));
    StringGrid1.Cells[2,j]:= copy(ListBox2.Items.Text,pos(';',ListBox2.Items.Text)+1,length(ListBox2.Items.Text)-(length(StringGrid1.Cells[1,j])+3));
    If StrToInt(StringGrid1.Cells[1,j])>maxTTL then
    begin maxTTL:=strToInt(StringGrid1.Cells[1,j]); end;
    If StrToInt(StringGrid1.Cells[1,j])<minTTL then
    begin minTTL:=strToInt(StringGrid1.Cells[1,j]); end;
    If StrToInt(StringGrid1.Cells[2,j])>maxTrip then
    begin maxTrip:=strToInt(StringGrid1.Cells[2,j]); end;
    If StrToInt(StringGrid1.Cells[2,j])<minTrip then
    begin minTrip:=strToInt(StringGrid1.Cells[2,j]); end;
    sommeTTL:=sommeTTL+strToInt(StringGrid1.Cells[1,j]);
    If j>1 then meanTTL:=round(sommeTTL/(j));
    sommeTrip:=sommeTrip+strToInt(StringGrid1.Cells[2,j]);
    If j>1 then meanTrip:=round(sommeTrip/(j));

    Memo6.Lines.Append(StringGrid1.Cells[0,j] + ' - TTL : ' + StringGrid1.Cells[1,j]
                       + ' - Trip Time : ' + StringGrid1.Cells[2,j]);
    if CheckBox13.Checked = true then begin
    Memo6.Lines.SaveToFile(MainDir + 'Data\Saves\Statistic.log.ini');
    end;

    if CheckBox9.Checked = true then begin
    Memo6.Lines.Append(StringGrid1.Cells[0,j] + '; TTL : ' + StringGrid1.Cells[1,j]
                       + ' - Trip Time : ' + StringGrid1.Cells[2,j]);

    Memo6.Lines.SaveToFile(MainDir + 'Data\Saves\Statistic.log.csv');
    end;

    ListBox2.Clear;
    j:=j+1;
    Series2.Clear;
    Series3.Clear;
    With Chart1 do begin
      for I:=1 to Stringgrid1.RowCount -1 do begin
      Series2.Add(Strtoint(Stringgrid1.cells[1,I]));
      Series3.Add(Strtoint(Stringgrid1.cells[2,I]));
      end;
    end;
    Series2.Active:=True;
    Series3.Active:=True;
end;

procedure TForm1.N3D1Click(Sender: TObject);
begin
   N3D1.Checked := true; N2D1.Checked := false; Walls1.Enabled := true;
   Chart1.View3D := true;
end;

procedure TForm1.N2D1Click(Sender: TObject);
begin
  N3D1.Checked := false; N2D1.Checked := true; Walls1.Enabled := false;
  Chart1.View3D := false;
end;

procedure TForm1.N3D2Click(Sender: TObject);
begin
  Chart1.View3DWalls := true;
end;

procedure TForm1.N2D2Click(Sender: TObject);
begin
  Chart1.View3DWalls := false;
end;

procedure TForm1.Monochrome1Click(Sender: TObject);
begin
  if Chart1.Monochrome = false then begin Monochrome1.Checked := true;
  Chart1.Monochrome := true; end else begin Chart1.Monochrome := false;
  Monochrome1.Checked := false; end;
end;

procedure TForm1.L1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  Label15.Caption := IntToStr(Memo1.Lines.Count);

  with Memo1 do begin
  SelStart := GetTextLen;
  SelLength := 1;
  end;
  Memo1.SelLength := 0;
  end;
end;

procedure TForm1.G1Click(Sender: TObject);
begin
  if  G1.Checked = true then begin
  ListView1.GridLines := true; end else begin
  ListView1.GridLines := false;  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if CheckBox3.Checked = true then begin
  Memo1.Lines.SaveToFile(MainDir + 'Data\Saves\host-lst.ini');
  end;

  WriteOptions;
end;

procedure TForm1.C1Click(Sender: TObject);
begin
  Memo1.Clear;
  Label15.Caption := IntToStr(Memo1.Lines.Count);
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if CheckBox4.Checked = true then begin

  if CheckBox8.Checked = true then begin
  Panel2.Visible := false;
  Panel3.Visible := true;
  Panel2.Visible := true;
  end;
  Panel3.Visible := true;
  end else begin
  Panel3.Visible := false;
  end;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if CheckBox8.Checked = true then begin
  Panel2.Visible := true;
  end else begin
  Panel2.Visible := false;
  end;

end;

procedure TForm1.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.Edit17KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.Edit18KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.Edit19KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#48..#57, #8]) then key := #0;
end;

procedure TForm1.C2Click(Sender: TObject);
var  items: TListItem;
begin
  if ListView1.Items.Count = 0 then begin
  Beep;
  MessageDlg('No DNS to Copy!',mtInformation, [mbOK], 0);
  Exit; end;

  items := ListView1.Selected;
  if items <> nil then
  begin
   Clipboard.AsText := items.SubItems[1]
  end;
end;

procedure TForm1.C3Click(Sender: TObject);
var  items: TListItem;
begin
  if ListView1.Items.Count = 0 then begin
  Beep;
  MessageDlg('No IP to Copy!',mtInformation, [mbOK], 0);
  Exit; end;
  items := ListView1.Selected;
  if items <> nil then
  begin
   Clipboard.AsText := items.SubItems[2]
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox12Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox13Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox10Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox11Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.R1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Memo1.Lines.BeginUpdate;
  KillDuplicates(Memo1.Lines);
  Memo1.Lines.EndUpdate;
  Label15.Caption := IntToStr(Memo1.Lines.Count);
  Screen.Cursor := crDefault;

  with Memo1 do begin
  SelStart := GetTextLen;
  SelLength := 1;
  end;

  Memo1.SelLength := 0;
end;

procedure TForm1.R2Click(Sender: TObject);
var i: integer;
    LineCount: integer;
begin
  LineCount := Memo1.Lines.Count;
  for i := 0 to LineCount - 1 do
  begin
    if (Memo1.Lines[i] = '') or
       (Pos(' ', Memo1.Lines[i]) = 1) then
       begin
         Memo1.Lines.Delete(i);
         dec(LineCount);
       end;
  end;
  Label15.Caption := IntToStr(Memo1.Lines.Count);

  with Memo1 do begin
  SelStart := GetTextLen;
  SelLength := 1;
  end;

  Memo1.SelLength := 0;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  Label15.Caption := IntToStr(Memo1.Lines.Count);
end;

procedure TForm1.C4Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  case RadioGroup1.ItemIndex of
  1 : Memo1.Clear;
  end;
  try
  ScanNetworkResources(RESOURCETYPE_DISK, RESOURCEDISPLAYTYPE_SERVER, Memo1.Lines);
  Memo1.Text := StringReplace(Memo1.Text,'\','',[rfReplaceAll]);
  except
  end;

  with Memo1 do begin
  SelStart := GetTextLen;
  SelLength := 1;
  end;

  Memo1.SelLength := 0;
  Screen.Cursor := crDefault;
end;

procedure TForm1.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  case Panel.Index of
    0: begin
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-2, 0);
      StatusBar.Canvas.TextOut(Rect.Left + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

    1: begin
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-2, 4);
      StatusBar.Canvas.TextOut(Rect.Left + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

    2: begin
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-2, 3);
      StatusBar.Canvas.TextOut(Rect.Left + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

    3: begin
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-2, 2);
      StatusBar.Canvas.TextOut(Rect.Left + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

    4: begin
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-2, 1);
      StatusBar.Canvas.TextOut(Rect.Left + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

    5: begin
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-2, 5);
      StatusBar.Canvas.TextOut(Rect.Left + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

    6: begin
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-2, 6);
      StatusBar.Canvas.TextOut(Rect.Left + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

  end;
end;

procedure TForm1.S1Click(Sender: TObject);
begin
  try form2 := TForm2.Create(nil); form2.ShowModal; finally end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Tentative := 1; Edit5.Text := 'Wait !';
  StatusBar1.Panels[6].Text := ' Wait !';  Connexion;
  Button1.Click;

  if GetSystemMetrics(SM_NETWORK) and $01 = $01 then begin
    Label18.Caption := 'Computer is attached to a Network!'
  end else begin
    Label18.Caption := 'Computer is not attached to a Network!';
  end;

  if not GetLocalIPs(Memo4.lines) then
  StatusBar1.Panels[5].Text := 'Offline';
  Edit3.Text := Memo4.Lines[0];
  StatusBar1.Panels[5].Text := ' Local IP : ' +  Memo4.Lines[0];

  TabSheet6.Show;
  TabSheet1.Show;
  Label17.Caption := GetDomainName;
end;

procedure TForm1.Button1Click(Sender: TObject);
var dwResult : DWORD; dwLen : DWORD; pAdapterWork : PIP_ADAPTER_INFO;
  pAdapterList : PIP_ADAPTER_INFO; iasWork     : IP_ADDR_STRING;
begin
  pAdapterList := nil; dwLen := 0;
  dwResult    := GetAdaptersInfo(pAdapterList,@dwLen);
  if dwResult = ERROR_BUFFER_OVERFLOW then
  begin
    pAdapterList := AllocMem(dwLen);
    try
      dwResult := GetAdaptersInfo(pAdapterList,@dwLen);
      if dwResult = ERROR_SUCCESS then
      begin
        pAdapterWork := pAdapterList;
        ListBox1.Clear;
        repeat
          iasWork := pAdapterWork.GatewayList;
          while iasWork.Next <> nil do
          begin
            ListBox1.Items.Add(trim(iasWork.IpAddress.acString));
            iasWork := iasWork.Next^;
          end;
          ListBox1.Items.Add(trim(iasWork.IpAddress.acString));
          pAdapterWork := pAdapterWork.Next;
        until pAdapterWork = nil;

        if ListBox1.Items.Count > 0 then
        begin
          ListBox1.ItemIndex := 0;
        end;
      end;
    finally
      FreeMem(pAdapterList,dwLen);
    end;
  end;
  if ListBox1.Items.Text = '' then begin Edit4.Text := 'Offline';
  Exit; end else begin
  Edit4.Text := ListBox1.Items.Strings[ListBox1.ItemIndex];
  end;
  ListBox1.Clear;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if RadioGroup1.ItemIndex = 1 then Memo1.Clear;
  Range;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Label9.Caption := 'stop';
  Memo1.ReadOnly := false; Edit1.Enabled := true; Edit2.Enabled := true;
  Label2.Enabled := true; Label3.Enabled := true;
  Label1.Enabled := true; Label4.Enabled := true;
  SpinEdit3.Enabled := true; SpinEdit4.Enabled := true;
  Screen.Cursor := crDefault; BitBtn3.Enabled := true;
  BitBtn4.Enabled := true; BitBtn5.Enabled := true;
  BitBtn7.Enabled := true;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var index, I : Integer;
    fbPing : tfbping;
    nitem: TListItem;
begin
  StatusBar1.SetFocus;
  Label9.Caption := 'start';

  //if Edit5.Text = 'Offline' then begin
  //ShowMessage('System is Offline, check Internet Connection!');
  //Exit; end;

  Screen.Cursor := crHourGlass; BitBtn3.Enabled := false;
  BitBtn4.Enabled := false; BitBtn5.Enabled := false;
  BitBtn7.Enabled := false;
  fbping := tfbping.Create;
  fbping.Timeout := strtoint(Edit1.Text);
  fbping.Size    := strtoint(Edit2.Text);

  fbping.intNBSaut := SpinEdit3.Value;
  fbping.TTL := SpinEdit4.Value;

  Memo1.ReadOnly := true;
  Edit1.Enabled := false; Edit2.Enabled := false;
  Label2.Enabled := false; Label3.Enabled := false;
  Label1.Enabled := false; Label4.Enabled := false;
  SpinEdit3.Enabled := false; SpinEdit4.Enabled := false;

  ListView1.Items.Clear;
  ProgressBar1.Max := Memo1.Lines.Count;

  p := 0; e := 0;

  for index := 0 to Memo1.Lines.Count-1 do
  begin
  selectLine(Memo1, index);

    if Label9.Caption = 'stop' then begin
    Screen.Cursor := crDefault; BitBtn3.Enabled := true;
    StatusBar1.Panels[1].Text := ' Stop';
    Exit;
    end;

    fbping.Address := Memo1.Lines[index];
    if fbping.Ping <> 0 then
    begin
      p := p + 1;
      nitem := ListView1.Items.Add;
      nitem.ImageIndex := 0;
      nitem.Caption:= Memo1.Lines[index];
      nitem.SubItems.Add('OK');
      nitem.SubItems.Add(IPAddrToName(fbPing.HostIP));
      nitem.SubItems.Add(fbPing.HostIP);
      nitem.SubItems.Add(IntToStr(fbPing.rtt));
      nitem.SubItems.Add(IntToStr(fbPing.TTL));
      nitem.SubItems.Add(IntToStr(fbPing.ErrorCode));
      nitem.SubItems.Add(IntToStr(fbPing.Flags));
      nitem.SubItems.Add(IntToStr(fbPing.intNBSaut));
      nitem.SubItems.Add(IntToStr(fbPing.Size));
      nitem.SubItems.Add(Label17.Caption);
    end
    else
    begin
      e := e + 1;
      nitem := ListView1.Items.Add;
      nitem.ImageIndex := 1;
      nitem.Caption:= Memo1.Lines[index];
      nitem.SubItems.Add('Error');
      nitem.SubItems.Add('-');
      nitem.SubItems.Add('-');
      nitem.SubItems.Add(fbPing.GetErrorString);
      nitem.SubItems.Add('-');
      nitem.SubItems.Add('-');
      nitem.SubItems.Add('-');
      nitem.SubItems.Add('-');
      nitem.SubItems.Add('-');
      nitem.SubItems.Add('n/a');
    end;

    ProgressBar1.Position := index + 1;
    StatusBar1.Panels[0].Text := ' Total Scanned : ' + IntToStr(index);
    StatusBar1.Panels[1].Text := ' Pinging...';
    StatusBar1.Panels[2].Text := ' Thread Max : ' + IntToStr(Memo1.Lines.Count);
    StatusBar1.Panels[3].Text := ' Host found : ' + IntToStr(p);
    StatusBar1.Panels[4].Text := ' Host Errors : ' + IntToStr(e);
    ListView1.Items[ListView1.Items.Count-1].MakeVisible(false);
    Application.ProcessMessages;
  end;

  if CheckBox3.Checked = true then begin
    Memo2.Clear;
    for I := 0 to ListView1.Items.Count - 1 do begin
      Memo3.Lines.Add(ListView1.Items[i].Caption) ;
      Memo3.Lines.AddStrings( ListView1.Items[I].SubItems);
      Memo3.Lines.Add('');
      Memo3.Lines.SaveToFile(MainDir + 'Data\Saves\Report-lst.ini');
    end;
    end;

  StatusBar1.Panels[1].Text := ' Ready';
  Memo1.ReadOnly := false; Edit1.Enabled := true; Edit2.Enabled := true;
  Label2.Enabled := true; Label3.Enabled := true;
  Label1.Enabled := true; Label4.Enabled := true;
  SpinEdit3.Enabled := true; SpinEdit4.Enabled := true;
  fbping.Free;
  Screen.Cursor := crDefault; BitBtn3.Enabled := true;
  BitBtn4.Enabled := true; BitBtn5.Enabled := true;
  BitBtn7.Enabled := true;

  Memo1.SelLength := 0;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  a, b, d, m, mwo, i, h, index, NumbArr, bs : integer;
  count, NumbThreads : Longint;
  start, finish : array of integer;
  len: array of integer;
  addr : in_addr;
  str : string;
  F : TextFile;
  hThread : array of array of Cardinal;
  time_out: Cardinal;

begin
 StatusBar1.SetFocus;
 if Edit5.Text = 'Offline' then begin
  ShowMessage('System is Offline, check Internet Connection!');
  Exit;
 end;

 Screen.Cursor := crHourGlass;
 BitBtn4.Enabled := false;
 Memo2.Clear;
 Edit11.Enabled := false;
 Edit12.Enabled := false;
 Edit13.Enabled := false;
 Edit14.Enabled := false;
 CheckBox1.Enabled := false;
 BitBtn3.Enabled := false;
 BitBtn5.Enabled := false;
 BitBtn7.Enabled := false;

 a := Conv(inet_addr(PChar(Edit11.Text)));
 b := Conv(inet_addr(PChar(Edit12.Text)));
 time_out := StrToInt(Edit13.Text);
 NumbThreads := StrToInt(Edit14.Text);
 mwo :=  MAXIMUM_WAIT_OBJECTS;
 SetLength(start,NumbThreads);
 SetLength(finish,NumbThreads);
 SetLength(len,NumbThreads);
 count := b - a + 1;
 FoundedHosts := 0;
 TotalScanned := 0;

 StatusBar1.Panels[0].Text := ' Total Scanned:';
 StatusBar1.Panels[1].Text := ' Pinging...';
 StatusBar1.Panels[2].Text := ' Thread Max: ' + IntToStr(count);
 StatusBar1.Panels[3].Text := ' Host found : ' ;
 StatusBar1.Panels[4].Text := ' Host Errors : ' ;

 h := count div NumbThreads;
 d := count mod NumbThreads;
 p := 0;

 ProgressBar1.Position := 0 ;
 ProgressBar1.Max := count;

 NumbArr := NumbThreads div mwo;
 m := NumbThreads mod mwo;
 if m <> 0 then Inc(NumbArr);
 for i := 0 to NumbThreads - 1 do len[i] := h;
 for i := 0 to d-1 do Inc(len[i]);
 start[0] := a ;
 finish[0] := a + len[0] - 1;

 for i := 1 to NumbThreads - 1 do
 begin
    start[i] := finish[i-1] + 1; finish[i] := start[i] + len[i] - 1;
 end;

 for i := 0 to NumbThreads-1 do
 begin
  addr.S_addr := Conv(start[i]);
  str := inet_ntoa(addr);
  addr.S_addr := Conv(finish[i]);
  str := str + ' - ' + inet_ntoa(addr);
  Memo2.Lines.Add(str);
  Application.Processmessages;
 end;

 SetLength(Thread, NumbThreads); SetLength(hThread, NumbArr, mwo);

 for i := 0 to NumbThreads - 1 do
 begin
  Thread[i] := TThreadScan.Create(start[i],finish[i]);
  Thread[i].Timeout := time_out;
  hThread[i div mwo][i mod mwo] := Thread[i].Handle;
  p := p + 1;
  StatusBar1.Panels[3].Text := ' Host found : ' + IntToStr(p);
  Application.Processmessages;
 end;

 for i:=0 to NumbThreads - 1 do
 begin
   Thread[i].Resume;
   Application.Processmessages;
 end;

 for i:=0 to NumbArr-1 do
 begin
   if (m > 0) and (i = NumbArr - 1) then mwo := m;
   while
   WaitForMultipleObjects(mwo, @hThread[i][0], true, 50) = WAIT_TIMEOUT do
   Application.ProcessMessages;
 end;

 if Form1.CheckBox1.Checked then begin
 Memo2.Lines.SaveToFile(MainDir + 'Data\Saves\Thread-Report.ini');
 end;

 Screen.Cursor := crDefault; BitBtn4.Enabled := true;
 StatusBar1.Panels[1].Text := ' Ready';
 Edit11.Enabled := true; Edit12.Enabled := true;
 Edit13.Enabled := true; Edit14.Enabled := true;
 CheckBox1.Enabled := true;
 BitBtn3.Enabled := true; BitBtn5.Enabled := true;
 BitBtn7.Enabled := true;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if Edit5.Text = 'Offline' then begin
  ShowMessage('System is Offline, check Internet Connection!'); Exit; end;

  Form1.Edit6.Enabled := false; Form1.SpinEdit1.Enabled := false;
  Form1.ProgressBar1.Max := Form1.SpinEdit1.Value;
  Form1.ProgressBar1.Position := 0;


  with TTraceThread.Create(False) do
  begin
    Memo5.Lines.Add('');
    StatusBar1.Panels[1].Text := ' Tracert .. wait!';
    FreeOnTerminate := True;
    DestinationAddress := Edit6.Text;
    IterationCount := SpinEdit1.Value;
    Resume;
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Timer1.Enabled := false;
  BitBtn7.caption := '  Ping';
  BitBtn7.Enabled := true;
  BitBtn4.Enabled := true; BitBtn5.Enabled := true;
  BitBtn3.Enabled := true; BitBtn7.Enabled := True;
  Edit7.Enabled := true; SpinEdit2.Enabled := true;
  ComboBox1.Enabled := true; ComboBox2.Enabled := true;
  SpinEdit5.Enabled := true; SpinEdit7.Enabled := true;
  SpinEdit8.Enabled := true;
  Label38.Enabled := true; Label37.Enabled := true;
  Label10.Enabled := true; Label11.Enabled := true;
  Label13.Enabled := true; Label14.Enabled := true;
  CheckBox13.Enabled := true;
  StatusBar1.Panels[1].Text := ' Stop';
  Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  //if Edit5.Text = 'Offline' then begin
   // ShowMessage('System is Offline, check Internet Connection!'); Exit;
  //end;

  Screen.Cursor := crHourGlass;
  BitBtn7.Enabled := false;
  BitBtn4.Enabled := false; BitBtn5.Enabled := false;
  BitBtn3.Enabled := false;
  Edit7.Enabled := false; SpinEdit2.Enabled := false;
  ComboBox1.Enabled := false; ComboBox2.Enabled := false;
  SpinEdit5.Enabled := false; SpinEdit7.Enabled := false;
  SpinEdit8.Enabled := false;
  Label38.Enabled := false; Label37.Enabled := false;
  Label10.Enabled := false; Label11.Enabled := false;
  Label13.Enabled := false; Label14.Enabled := false;
  CheckBox13.Enabled := false;
  v := 0;
  Timer1.Interval := StrToInt(ComboBox1.Text);

  IdIcmpClient2.Host := Edit7.Text;
  IdIcmpClient2.OnReply := IdIcmpClient2Reply;
  IdIcmpClient2.ReceiveTimeout := SpinEdit8.Value;
  IdIcmpClient2.Port := SpinEdit5.Value;
  IdIcmpClient2.Protocol := ComboBox2.ItemIndex;
  IdIcmpClient2.BufferSize := SpinEdit7.Value;

  If BitBtn7.caption = '  Ping' then
  begin
  Memo6.Clear;
  Timer1.Enabled := True;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := SpinEdit2.Value;
  BitBtn7.Caption := 'Stop';
  StatusBar1.Panels[1].Text := ' Pinging..';
  StatusBar1.Panels[4].Text := ' Host Errors : 0';
  end else begin
  BitBtn7.Enabled := true;
  BitBtn4.Enabled := true; BitBtn5.Enabled := true;
  BitBtn3.Enabled := true; BitBtn7.Enabled := True;
  Edit7.Enabled := true; SpinEdit2.Enabled := true;
  ComboBox1.Enabled := true; ComboBox2.Enabled := true;
  SpinEdit5.Enabled := true; SpinEdit7.Enabled := true;
  SpinEdit8.Enabled := true;
  Label38.Enabled := true; Label37.Enabled := true;
  Label10.Enabled := true; Label11.Enabled := true;
  Label13.Enabled := true; Label14.Enabled := true;
  CheckBox13.Enabled := true;
  Timer1.Enabled := False;
  BitBtn7.Caption := '  Ping';
  StatusBar1.Panels[1].Text := ' Ready';
  Screen.Cursor := crDefault;
  end;
end;

end.
