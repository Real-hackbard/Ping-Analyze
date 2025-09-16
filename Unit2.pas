unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, WinInet, USock, NB30;

const
  MAX_PACKET_SIZE = $10000;
  SIO_RCVALL = $98000001;
  WSA_VER = $202;
  MAX_ADAPTER_NAME_LENGTH        = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH     = 8;
  IPHelper = 'iphlpapi.dll';
  ICMP_ECHO             = 8;
  ICMP_ECHOREPLY        = 0;
  // LAN
  MODEM = 1;
  LAN = 2;
  PROXY = 4;
  BUSY = 8;

type
  USHORT = WORD;
  ULONG = DWORD;
  time_t = Longint;

  TIPHeader = packed record
    iph_verlen:   UCHAR;
    iph_tos:      UCHAR;
    iph_length:   USHORT;
    iph_id:       USHORT;
    iph_offset:   USHORT;
    iph_ttl:      UCHAR;
    iph_protocol: UCHAR;
    iph_xsum:     USHORT;
    iph_src:      ULONG;
    iph_dest:     ULONG;
  end;
  PIPHeader = ^TIPHeader;


  TTCPHeader = packed record
    sourcePort: USHORT;
    destinationPort: USHORT;
    sequenceNumber: ULONG;
    acknowledgeNumber: ULONG;
    dataoffset: UCHAR;
    flags: UCHAR;
    windows: USHORT;
    checksum: USHORT;
    urgentPointer: USHORT;
  end;
  PTCPHeader = ^TTCPHeader;


  TUDPHeader = packed record
    sourcePort:       USHORT;
    destinationPort:  USHORT;
    len:              USHORT;
    checksum:         USHORT;
  end;

  PUDPHeader = ^TUDPHeader;
  TICMPHeader = packed record
   IcmpType      : BYTE;
   IcmpCode      : BYTE;
   IcmpChecksum  : WORD;
   IcmpId        : WORD;
   IcmpSeq       : WORD;
   IcmpTimestamp : DWORD;
  end;
  PICMPHeader = ^TICMPHeader;

  IP_ADDRESS_STRING = record
    S: array [0..15] of Char;
  end;
  IP_MASK_STRING = IP_ADDRESS_STRING;
  PIP_MASK_STRING = ^IP_MASK_STRING;

  PIP_ADDR_STRING = ^IP_ADDR_STRING;
  IP_ADDR_STRING = record
    Next: PIP_ADDR_STRING;
    IpAddress: IP_ADDRESS_STRING;
    IpMask: IP_MASK_STRING;
    Context: DWORD;
  end;

  PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;
  IP_ADAPTER_INFO = record
    Next: PIP_ADAPTER_INFO;
    ComboIndex: DWORD;
    AdapterName: array [0..MAX_ADAPTER_NAME_LENGTH + 3] of Char;
    Description: array [0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of Char;
    AddressLength: UINT;
    Address: array [0..MAX_ADAPTER_ADDRESS_LENGTH - 1] of BYTE;
    Index: DWORD;
    Type_: UINT;
    DhcpEnabled: UINT;
    CurrentIpAddress: PIP_ADDR_STRING;
    IpAddressList: IP_ADDR_STRING;
    GatewayList: IP_ADDR_STRING;
    DhcpServer: IP_ADDR_STRING;
    HaveWins: BOOL;
    PrimaryWinsServer: IP_ADDR_STRING;
    SecondaryWinsServer: IP_ADDR_STRING;
    LeaseObtained: time_t;
    LeaseExpires: time_t;
  end;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    procedure ReadLanInterfaces;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

function GetAdaptersInfo(pAdapterInfo: PIP_ADAPTER_INFO;
    var pOutBufLen: ULONG): DWORD; stdcall; external IPHelper;

implementation

{$R *.dfm}
function GetMACAdress: string;
var
  NCB: PNCB;
  Adapter: PAdapterStatus;

  URetCode: PChar;
  RetCode: char;
  I: integer;
  Lenum: PlanaEnum;
  _SystemID: string;
  TMPSTR: string;
begin
  Result    := '';
  _SystemID := '';
  Getmem(NCB, SizeOf(TNCB));
  Fillchar(NCB^, SizeOf(TNCB), 0);

  Getmem(Lenum, SizeOf(TLanaEnum));
  Fillchar(Lenum^, SizeOf(TLanaEnum), 0);

  Getmem(Adapter, SizeOf(TAdapterStatus));
  Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);

  Lenum.Length    := chr(0);
  NCB.ncb_command := chr(NCBENUM);
  NCB.ncb_buffer  := Pointer(Lenum);
  NCB.ncb_length  := SizeOf(Lenum);
  RetCode         := Netbios(NCB);

  i := 0;
  repeat
    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBRESET);
    Ncb.ncb_lana_num := lenum.lana[I];
    RetCode          := Netbios(Ncb);

    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBASTAT);
    Ncb.ncb_lana_num := lenum.lana[I];
    // Must be 16
    Ncb.ncb_callname := '*               ';

    Ncb.ncb_buffer := Pointer(Adapter);

    Ncb.ncb_length := SizeOf(TAdapterStatus);
    RetCode        := Netbios(Ncb);
    //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...
    if (RetCode = chr(0)) or (RetCode = chr(6)) then
    begin
      _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[5]), 2);
    end;
    Inc(i);
  until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');
  FreeMem(NCB);
  FreeMem(Adapter);
  FreeMem(Lenum);
  GetMacAdress := _SystemID;
end;

procedure TForm2.ReadLanInterfaces;
var
  InterfaceInfo,
  TmpPointer: PIP_ADAPTER_INFO;
  IP: PIP_ADDR_STRING;
  Len: ULONG;
begin
  if GetAdaptersInfo(nil, Len) = ERROR_BUFFER_OVERFLOW then
  begin
    GetMem(InterfaceInfo, Len);
    try
      if GetAdaptersInfo(InterfaceInfo, Len) = ERROR_SUCCESS then
      begin
        TmpPointer := InterfaceInfo;
        repeat
          IP := @TmpPointer.IpAddressList;
          repeat
            ComboBox1.Items.Add(Format('%s - [%s]',
              [IP^.IpAddress.S, TmpPointer.Description]));
            IP := IP.Next;
          until IP = nil;
          TmpPointer := TmpPointer.Next;
        until TmpPointer = nil;
      end;
    finally
      FreeMem(InterfaceInfo);
    end;
  end;
  if ComboBox1.Items.Count = 0 then
  begin
    Exit;
  end
  else
    ComboBox1.ItemIndex := 0;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
Var i                 : Integer;
    aNetInterfaceList : tNetworkInterfaceList;
begin
  ReadLanInterfaces;

  If (GetNetworkInterfaces (aNetInterfaceList)) THen
  Begin
    Memo1.Clear;
    Memo1.Lines.Add (DateTimeToStr (Now)+ ' : ');

    For i := 0 to High (aNetInterfaceList) do
    Begin
      Memo1.Lines.Add ('');
      Memo1.Lines.Add ('Number                     : ' + IntToStr(i));
      Memo1.Lines.Add ('Name                       : ' + aNetInterfaceList[i].ComputerName);
      Memo1.Lines.Add ('IP-Address                 : ' + aNetInterfaceList[i].AddrIP);
      Memo1.Lines.Add ('Subnet Mask                : ' + aNetInterfaceList[i].SubnetMask);
      Memo1.Lines.Add ('Net Address                : ' + aNetInterfaceList[i].AddrNet);
      Memo1.Lines.Add ('Limited broadcast Address  : ' + aNetInterfaceList[i].AddrLimitedBroadcast);
      Memo1.Lines.Add ('Directed Broadcast Address : ' + aNetInterfaceList[i].AddrDirectedBroadcast);
      Memo1.Lines.Add ('Interface Up               : ' + BoolToStr (aNetInterfaceList[i].IsInterfaceUp, True));
      Memo1.Lines.Add ('Broadcast Supported        : ' + BoolToStr (aNetInterfaceList[i].BroadcastSupport, True));
      Memo1.Lines.Add ('Loopback Interface         : ' + BoolToStr (aNetInterfaceList[i].IsLoopback, True));
      Memo1.Lines.Add ('');
      Memo1.Lines.Add ('MAC Address                : ' + GetMACAdress);
    end;
  end;
end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
  Memo1.Enabled := false; ComboBox1.Enabled := false;
  Windows.SetFocus(0);
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
  Memo1.Enabled := true; ComboBox1.Enabled := true;
  Windows.SetFocus(0);
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
Var i                 : Integer;
    aNetInterfaceList : tNetworkInterfaceList;
begin
  If (GetNetworkInterfaces (aNetInterfaceList)) THen
  Begin
    Memo1.Clear;
    Memo1.Lines.Add (DateTimeToStr (Now)+ ' : ');

    For i := 0 to High (aNetInterfaceList) do
    Begin
      Memo1.Lines.Add ('');
      Memo1.Lines.Add ('Number                     : ' + IntToStr(i));
      Memo1.Lines.Add ('Name                       : ' + aNetInterfaceList[i].ComputerName);
      Memo1.Lines.Add ('IP-Address                 : ' + aNetInterfaceList[i].AddrIP);
      Memo1.Lines.Add ('Subnet Mask                : ' + aNetInterfaceList[i].SubnetMask);
      Memo1.Lines.Add ('Net Address                : ' + aNetInterfaceList[i].AddrNet);
      Memo1.Lines.Add ('Limited broadcast Address  : ' + aNetInterfaceList[i].AddrLimitedBroadcast);
      Memo1.Lines.Add ('Directed Broadcast Address : ' + aNetInterfaceList[i].AddrDirectedBroadcast);
      Memo1.Lines.Add ('Interface Up               : ' + BoolToStr (aNetInterfaceList[i].IsInterfaceUp, True));
      Memo1.Lines.Add ('Broadcast Supported        : ' + BoolToStr (aNetInterfaceList[i].BroadcastSupport, True));
      Memo1.Lines.Add ('Loopback Interface         : ' + BoolToStr (aNetInterfaceList[i].IsLoopback, True));
      Memo1.Lines.Add ('');
      Memo1.Lines.Add ('MAC Address                : ' + GetMACAdress);
    end;
  end;
  Windows.SetFocus(0); 
end;

end.
