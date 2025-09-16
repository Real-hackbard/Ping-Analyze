unit ufbPing;

// |===========================================================================|
// | UNITE ufbPing                                                             |
// | F.BASSO 2014                                                              |
// |___________________________________________________________________________|
// | Unité contenant la classe fbPing permettant de faire du ping via icmp     |
// |___________________________________________________________________________|
// | Ce programme est libre, vous pouvez le redistribuer et ou le modifier     |
// | selon les termes de la Licence Publique Générale GNU publiée par la       |
// | Free Software Foundation .                                                |
// | Ce programme est distribué car potentiellement utile,                     |
// | mais SANS AUCUNE GARANTIE, ni explicite ni implicite,                     |
// | y compris les garanties de commercialisation ou d'adaptation              |
// | dans un but spécifique.                                                   |
// | Reportez-vous à la Licence Publique Générale GNU pour plus de détails.    |
// |                                                                           |
// | anbasso@wanadoo.fr                                                        |
// |___________________________________________________________________________|
// | Versions                                                                  |
// |  _________                                                                |
// | /  2.0.0  \______________________________________________________________ |
// || 2016/11/11 F.BASSO                                                      ||
// || Ajout fonction trace route                                              ||
// || _________                                                               ||
// ||/  1.4.0  \______________________________________________________________||
// || 2016/09/24 F.BASSO                                                      ||
// || Adaptation du code pour Prise en charge du 64 bits                      ||
// || _________                                                               ||
// ||/  1.3.0  \______________________________________________________________||
// || 2016/08/15 F.BASSO                                                      ||
// || Prise en charge code de retour TIcmpEchoReply.Status  pour afiner le    ||
// || resultat                                                                ||
// || _________                                                               ||
// ||/  1.2.0  \______________________________________________________________||
// || 2014/07/30 F.BASSO                                                      ||
// || Création unité pour Delphi XE3                                          ||
// || _________                                                               ||
// ||/  1.1.0  \______________________________________________________________||
// || 2007/08/13 F.BASSO                                                      ||
// || Création unité pour Delphi 2005                                         ||
// || _________                                                               ||
// ||/  1.0.0  \______________________________________________________________||
// || 1997/01/06 François PIETTE francois.piette@overbyte.be                  ||
// || Création original de l'unité    http://www.overbyte.be                  ||
// ||_________________________________________________________________________||
// |===========================================================================|

interface

uses
  windows,
  SysUtils,
  Classes,
  WinSock,
  math;

const
  IcmpDLL = 'icmp.dll';                                      // Dll à utiliser pour win 2000 voir MSDN
  IphlpapiDLL = 'Iphlpapi.dll';                              // Dll à utiliser à partir de XP voir MSDN

  ICMP_SUCCESS                                = 0 ;          // Pas d'erreur
  ICMP_STATUS_BUFFER_TO_SMALL                 = 11001 ;      // Buffer trop petit
  ICMP_STATUS_DESTINATION_NET_UNREACH         = 11002 ;      // Réseau de destination non atteignable
  ICMP_STATUS_DESTINATION_HOST_UNREACH        = 11003 ;      // Hôte destination non atteignable
  ICMP_STATUS_DESTINATION_PROTOCOL_UNREACH    = 11004 ;      // protocole de destination non atteignable
  ICMP_STATUS_DESTINATION_PORT_UNREACH        = 11005 ;      // port de destination non atteignable
  ICMP_STATUS_NO_RESOURCE                     = 11006 ;      // Pas de resources
  ICMP_STATUS_BAD_OPTION                      = 11007 ;      // Mauvaises options
  ICMP_STATUS_HARDWARE_ERROR                  = 11008 ;      // Erreur matériel
  ICMP_STATUS_LARGE_PACKET                    = 11009 ;      // Paquet trop grand
  ICMP_STATUS_REQUEST_TIMED_OUT               = 11010 ;      // Request timed out
  ICMP_STATUS_BAD_REQUEST                     = 11011 ;      // Mauvaise requête
  ICMP_STATUS_BAD_ROUTE                       = 11012 ;      // Mauvaise route
  ICMP_STATUS_TTL_EXPIRED_TRANSIT             = 11013 ;      // TTL à expiré pendant le trajet
  ICMP_STATUS_TTL_EXPIRED_REASSEMBLY          = 11014 ;      // TTL à expiré pendant le réassemblage
  ICMP_STATUS_PARAMETER                       = 11015 ;      // Problème de paramètrages
  ICMP_STATUS_SOURCE_QUENCH                   = 11016 ;      // Extinction de la source
  ICMP_STATUS_OPTION_TOO_BIG                  = 11017 ;      // Options trop grandes
  ICMP_STATUS_BAD_DESTINATION                 = 11018 ;      // Mauvaise destination
  ICMP_STATUS_ADDR_DELETED                    = 11019 ;      // Adresse supprimée
  ICMP_STATUS_SPEC_MTU_CHANGE                 = 11020 ;      // Les specifications MTU ont changé
  ICMP_STATUS_MTU_CHANGE                      = 11021 ;      // la taille maximale du paquet IP a changé
  ICMP_STATUS_UNLOAD                          = 11022 ;      // déchargement
  ICMP_STATUS_ADDRESS_ADDED                   = 11023 ;      // Adresse ajouté
  ICMP_STATUS_MEDIA_CONNECT                   = 11024 ;      // Média connecté
  ICMP_STATUS_MEDIA_DISCONNECT                = 11025 ;      // Média déconnecté
  ICMP_STATUS_BIND_ADAPTER                    = 11026 ;      // Adaptateur relié
  ICMP_STATUS_UNBIND_ADAPTER                  = 11027 ;      // Adaptateur non relié
  ICMP_STATUS_DEVICE_DOES_NOT_EXIST           = 11028 ;      // Matériel inexistant
  ICMP_STATUS_DUPLICATE_ADDRESS               = 11029 ;      // Doublon d'adresse
  ICMP_STATUS_INTERFACE_METRIC_CHANGE         = 11030 ;      // Distance de la route changée
  ICMP_STATUS_RECONFIG_SECFLTR                = 11031 ;      // ?????
  ICMP_STATUS_NEGOTIATING_IPSEC               = 11032 ;      // Négociation de l'IPSEC (Internet Protocol Security)
  ICMP_STATUS_INTERFACE_WOL_CAPABILITY_CHANGE = 11033 ;      // Changement des capacités de Wake on Lan
  ICMP_STATUS_DUPLICATE_IPADD                 = 11034 ;      // Doublon d'adresse IP
  ICMP_STATUS_GENERAL_FAILURE                 = 11050 ;      // Erreur générale
  ICMP_STATUS_PENDING                         = 11255 ;      // Ping en cours

type

  TicmpIPAddress   = Longword;                             // Adresse IP formaté comme un chiffre de 4 octets
  TicmpIPMask      = Longword;                             // Masque de sous reseau formaté comme un chiffre de 4 octets
  TicmpIPStatus    = Longword;                             // Code renvoyé par les API.

  PIPOptionInformation = ^TIP_OPTION_INFORMATION;
  TIP_OPTION_INFORMATION = packed record
     TTL:         Byte;                                    // Time To Live (used for traceroute)
     TOS:         Byte;                                    // Type Of Service (usually 0)
     Flags:       Byte;                                    // IP header flags (usually 0)
     OptionsSize: Byte;                                    // Size of options data (usually 0, max 40)
     OptionsData: PansiChar;                               // Options data buffer
  end;

  PIcmpEchoReply = ^TICMP_ECHO_REPLY;

  TICMP_ECHO_REPLY = packed record
     Address:       TicmpIPAddress;                        // Replying address
     Status:        longWord;                              // IP status value
     RTT:           longWord;                              // Round Trip Time in milliseconds
     DataSize:      Word;                                  // Reply data size
     Reserved:      Word;                                  // Reserved
     Data:          Pointer;                               // Pointer to reply data buffer
     Options:       TIP_OPTION_INFORMATION;                // Reply options
  end;

//  ___________________________________________________________________________
// | Type TIcmpCreateFile = function                                           |
// | _________________________________________________________________________ |
// || squelette de l'API IcmpCreateFile                                       ||
// || crée un handle sur lequel des requêtes ICMP peuvent être adressées      ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties | result : Thandler                                             ||
// ||         |   Handler ouvert ou INVALID_HANDLE_VALUE en cas d'erreur voir ||
// ||         |   Getlasterror pour avoir des informations d'étaillées        ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|
  TIcmpCreateFile = function: THandle; stdcall;

//  ___________________________________________________________________________
// | Type TIcmpCloseHandle = function                                          |
// | _________________________________________________________________________ |
// || squelette de l'API IcmpCloseHandle                                      ||
// || Ferme le handle ouvert par TicmpCreateFile                              ||
// ||_________________________________________________________________________||
// || Entrées | IcmpHandle : THandle                                          ||
// ||         |   Handler à fermer                                            ||
// ||_________|_______________________________________________________________||
// || Sorties | result : Boolean                                              ||
// ||         |   True si andler bien fermé ou False en cas d'erreur voir     ||
// ||         |   Getlasterror pour avoir des informations d'étaillées        ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|
  TIcmpCloseHandle = function(IcmpHandle: THandle): Boolean; stdcall;

//  ___________________________________________________________________________
// | Type TIcmpSendEcho = function                                             |
// | _________________________________________________________________________ |
// || squelette de l'API IcmpSendEcho                                         ||
// || Envoie une requête Echo et renvoie une ou plusieurs reponses            ||
// ||_________________________________________________________________________||
// || Entrées | IcmpHandle : THandle                                          ||
// ||         |   Handler ouvert par TicmpCreateFile                          ||
// ||         | DestinationAddress : TicmpIPAddress                           ||
// ||         |   Adresse de destination des requêtes echo                    ||
// ||         | RequestData : Pointer                                         ||
// ||         |   Pointeur sur un tampon contenant les données envoyées par   ||
// ||         |   la requête                                                  ||
// ||         | RequestSize : Word                                            ||
// ||         |   Taille du tampon pointé par RequestData                     ||
// ||         | RequestOptions : PIPOptionInformation                         ||
// ||         |   Pointeur vers les options d'entête IP, doit être nul        ||
// ||         | ReplyBuffer : Pointer                                         ||
// ||         |   Pointeur sur le tampon de receptions des réponses, le tampon||
// ||         |   doit pouvoir contenir au minimun un ICMP_ECHO_REPLY et 8    ||
// ||         |   octet, taille d'un message d'erreur                         ||
// ||         | ReplySize : DWord                                             ||
// ||         |   Taille du tampon pointé par ReplyBuffer                     ||
// ||         | Timeout : DWord                                               ||
// ||         |   Temps en milli secondes d'attente de réponses               ||
// ||_________|_______________________________________________________________||
// || Sorties | result : DWord                                                ||
// ||         |   Nombre de réponses obtenu, 0 en cas d'erreur voir           ||
// ||         |   Getlasterror pour avoir des informations d'étaillées        ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|
  TIcmpSendEcho = function(IcmpHandle: THandle ;
                           DestinationAddress : TicmpIPAddress ;
                           RequestData : Pointer ;
                           RequestSize : Word ;
                           RequestOptions : PIPOptionInformation ;
                           ReplyBuffer : Pointer ;
                           ReplySize : longWord ;
                           Timeout : longWord ): longWord ; stdcall ;

//  ___________________________________________________________________________
// | Type TIcmpReply   = procedure                                             |
// | _________________________________________________________________________ |
// || squelette de la procedure à utiliser lors d'une réponse                 ||
// ||_________________________________________________________________________||
// || Entrées | Sender: TObject                                               ||
// ||         |   objet appelent la procédure                                 ||
// ||         | Error : Integer                                               ||
// ||         |   Eventuel numéro d'erreur suite au ping                      ||
// ||_________|_______________________________________________________________||
// || Sorties |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

  TIcmpReply = procedure(Sender: TObject; Error : Integer) of object;

// #############################################################################
// #############################################################################
// ##                                                                         ##
// ##  TFBPING                                                                ##
// ##                                                                         ##
// #############################################################################
// #############################################################################

  TfbPing = class(TObject)
  private

// ****************************************************************************
// * Déclarations privées                                                     *
// ****************************************************************************

    hDll : HModule;                                // Handle sur la DLL
    IcmpCreateFile : TIcmpCreateFile;              // Lien sur la fonction IcmpCreateFile
    IcmpCloseHandle : TIcmpCloseHandle;            // Lien sur la fonction IcmpCloseHandle
    IcmpSendEcho : TIcmpSendEcho;                  // Lien sur la fonction IcmpSendEcho
    hICMP : THandle;                               // Handle de ping
    FIcmpEchoReply : TICMP_ECHO_REPLY;             // Tampon pour recevoir les réponses Echo
    FIPOptionInformation : TIP_OPTION_INFORMATION; // Tampon contenant les option de ping
    FstrAddress : String;                          // Addresse IP fournie
    FstrHostName : String;                         // Nom d'hôte résolut
    FstrHostIP : String;                           // Adresse IP de l'hôte résolut sous forme WWW.XXX.YYY.ZZZ
    FicmpIPAddress : TicmpIPAddress;               // Address IP de l'hôte
    FdwSize : Longword ;                           // taille des paquets (initialisé à 56)
    FdwTimeOut : Longword ;                        // Timeout (initialisé à 4000mS)
    FdwTTL : Longword;                             // Time To Live
    FFlags : Integer;                              // Options flags
    FOnEchoRequest : TNotifyEvent;                 // Adresse de la fonction à appeller sur onEchoRequest
    FOnEchoReply : TICMPReply;                     // Adresse de la fonction à appeller sur onEchoReply
    FdwLastError : longword;                       // Derniere erreur
    FbooAddressResolved : Boolean;                 // L'adresse de l'hôte a bien été résolut
    fdwLastRTT : Longword;                         // Temps de reponse du dernier ping
    fdwTotalRTT : longword;                        // Somme des temps de réponses
    fdwNbRepply : longword;                        // Nombres de réponses positives
    ffltRTT : Real ;                               // Temps de réponse moyen
    FDataBuf: Array of Byte;                       // Tampon d'envoie
    FReplyBuf: Array of Byte;                      // tempon de reception
    FReplyBufSize : Longword;                      // Taille du tampon de reception
    FintNBSaut : integer;                          // nombre de saut pour le trace route
    FstrAddressReply : string;                     // Adresse de reponce
    procedure ResolveAddress;
    procedure SetSize (intTaille : longword);
    function  envoyerEcho : integer;
  public

// ****************************************************************************
// * Déclarations publiques                                                   *
// ****************************************************************************

    constructor Create; virtual;
    destructor  Destroy; override;
    function    Ping : Integer;
    procedure   trace;
    procedure   SetAddress(strAddress : String);
    function    GetErrorString : String;

    property Address : String             read  FstrAddress    write SetAddress;
    property Size : longword              read  FdwSize        write SetSize;
    property Timeout : longword           read  FdwTimeout     write FdwTimeout;
    property Reply : TICMP_ECHO_REPLY     read  FIcmpEchoReply;
    property TTL : longword               read  FdwTTL         write FdwTTL;
    Property Flags : Integer              read  FFlags         write FFlags;
    Property intNBSaut : integer          read  FintNBSaut     write FintNBSaut;
    property strAddressReply : string     read  FstrAddressReply;
    property ErrorCode : longWord         read  FdwLastError;
    property ErrorString : String         read  GetErrorString;
    property HostName : String            read  FstrHostName;
    property HostIP : String              read  FstrHostIP;
    property RTT : longword               read  fdwLastRTT ;
    property averageRTT : real            read  ffltRTT ;
    property dwLastError : longword       read  FdwLastError;
    property OnEchoRequest : TNotifyEvent read  FOnEchoRequest write FOnEchoRequest;
    property OnEchoReply : TICMPReply     read  FOnEchoReply   write FOnEchoReply;
  end;

  TICMPException = class(Exception);

implementation

// #===========================================================================#
// #===========================================================================#
// #                                                                           #
// # Partie Privée                                                             #
// #                                                                           #
// #===========================================================================#
// #===========================================================================#

procedure TfbPing.ResolveAddress;

//  ___________________________________________________________________________
// | procedure TfbPing.ResolveAddress                                          |
// | _________________________________________________________________________ |
// || Permet de resoudre l'adresse fourni en adresse IP valide                ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

var
  HostEnt : PHostEnt;
begin

  fdwTotalRTT := 0;
  fdwNbRepply := 0;

// ****************************************************************************
// * C'est une adresse ip                                                     *
// ****************************************************************************

  FicmpIPAddress := inet_addr(PAnsiChar (AnsiString (FstrAddress)));
  if FicmpIPAddress <> Longword(INADDR_NONE) then
    FstrHostName := FstrAddress
  else
  begin

// ****************************************************************************
// * Convertion du hostname en adresse IP                                     *
// ****************************************************************************

    HostEnt := GetHostByName(PAnsiChar (AnsiString (FstrAddress)));
    if HostEnt = nil then
    begin
      FdwLastError := GetLastError;
      Exit;
    end;
    FicmpIPAddress := longint(plongint(HostEnt^.h_addr_list^)^);
    FstrHostName := HostEnt^.h_name;
  end;
  FstrHostIP := StrPas(inet_ntoa(TInAddr(FicmpIPAddress)));
  FbooAddressResolved := TRUE;
end;

// #===========================================================================#
// #===========================================================================#
// #                                                                           #
// # Partie Publique                                                           #
// #                                                                           #
// #===========================================================================#
// #===========================================================================#

constructor TfbPing.Create;

//  ___________________________________________________________________________
// | constructor TfbPing.Create                                                |
// | _________________________________________________________________________ |
// || Constructeur de la class TICMP permet d'initialiser certaine variable et||
// || charger la DLL IPHLPAPI.DLL ou ICMP.DLL en fonction de la disponibilité ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

var
  WSAData: TWSAData;
begin
  hICMP      := INVALID_HANDLE_VALUE;
  FdwTTL     := 64;
  FdwTimeOut := 4000;
  FintNBSaut := 30;
  SetSize(56);

  if WSAStartup($101, WSAData) <> 0 then
      raise TICMPException.Create('Erreur lors de l''initialisation de Winsock');

// ****************************************************************************
// * Tentative de création de la liaison dynamique avec IPHLPAPI.DLL puis avec*
// * ICMP.DLL en cas d'échec                                                  *
// ****************************************************************************

  hdll := LoadLibrary(IphlpapiDLL);
    if hdll = 0 then
    hdll := LoadLibrary(IcmpDLL );
    if hDll = 0 then
      raise TICMPException.Create('Impossible de trouver ' + icmpDLL + ' ou ' + IphlpapiDLL );

// ****************************************************************************
// * Chargement des fonctions                                                 *
// ****************************************************************************

  @ICMPCreateFile  := GetProcAddress(hdll, 'IcmpCreateFile');
  @IcmpCloseHandle := GetProcAddress(hdll, 'IcmpCloseHandle');
  @IcmpSendEcho    := GetProcAddress(hdll, 'IcmpSendEcho');
  if (@ICMPCreateFile = Nil) or (@IcmpCloseHandle = Nil) or (@IcmpSendEcho = Nil) then
    raise TICMPException.Create('Erreur lors du chargement des fonctions API');

// ****************************************************************************
// * Création du handler de ping                                              *
// ****************************************************************************

  hICMP := IcmpCreateFile;
  if hICMP = INVALID_HANDLE_VALUE then
    raise TICMPException.Create('Impossible d''avoir le handle de Ping');
end;

destructor TfbPing.Destroy;

//  ___________________________________________________________________________
// | destructor TfbPing.Destroy                                                |
// | _________________________________________________________________________ |
// || Destructeur de la class TICMP pemet de libérrer les different handler   ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

begin
  if hICMP <> INVALID_HANDLE_VALUE then IcmpCloseHandle(hICMP);
  if hdll <> 0 then FreeLibrary(hdll);
  WSACleanup;
  inherited Destroy;
end;

function TfbPing.envoyerEcho: integer;

//  ___________________________________________________________________________
// | function TfbPing.envoyerEcho                                              |
// | _________________________________________________________________________ |
// || Permet d'envoyer un ping                                                ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties | result : integer                                              ||
// ||         |   nombre de reply 0 si KO                                     ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

begin
  if Assigned(FOnEchoRequest) then FOnEchoRequest(Self);
  result := IcmpSendEcho(hICMP, FicmpIPAddress,@FDataBuf[0] ,FdwSize, @fIPOptionInformation, @FReplyBuf[0], FReplyBufSize, FdwTimeOut);

// ****************************************************************************
// * copie les informations depuis le tempon de reponce                       *
// ****************************************************************************

  Move(FReplyBuf[0], fIcmpEchoReply, SizeOf (fIcmpEchoReply));
  FdwLastError := fIcmpEchoReply.Status;

// ****************************************************************************
// *  Calcule des resultats de reponse                                        *
// ****************************************************************************

  if (result <> 0)or(fIcmpEchoReply.Status=ICMP_STATUS_REQUEST_TIMED_OUT) then
  begin
    if (fIcmpEchoReply.Status <> ICMP_STATUS_TTL_EXPIRED_TRANSIT)and(fIcmpEchoReply.Status<>ICMP_SUCCESS) then
    begin
      fdwLastRTT := cardinal(-1);
      FstrAddressReply := geterrorstring;
    end else
    begin
      fdwNbRepply := fdwNbRepply + 1;
      fdwLastRTT := fIcmpEchoReply.RTT;
      fdwTotalRTT := fdwTotalRTT + fdwLastRTT;
      ffltRTT := fdwTotalRTT / fdwNbRepply ;
      FstrAddressReply := StrPas(inet_ntoa(TInAddr(fIcmpEchoReply.Address)));
    end;
  end else
  begin
    fdwLastRTT := cardinal(-1);
    FstrAddressReply := geterrorstring;
  end;
  if Assigned(FOnEchoReply) then FOnEchoReply(Self, FdwLastError);
end;

procedure TfbPing.SetAddress(strAddress : String);

//  ___________________________________________________________________________
// | procedure TfbPing.SetAddress(strAddress : String)                         |
// | _________________________________________________________________________ |
// || Permet de définir l'adresse IP                                          ||
// ||_________________________________________________________________________||
// || Entrées | strAddress : String                                           ||
// ||         |   adresse ip ou nom d'hôte à pinguer                          ||
// ||_________|_______________________________________________________________||
// || Sorties |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

begin
  if FstrAddress = strAddress then Exit;
  FstrAddress := strAddress;
  FbooAddressResolved := FALSE;
end;


procedure TfbPing.SetSize(intTaille: longword);

//  ___________________________________________________________________________
// | procedure TfbPing.SetSize                                                 |
// | _________________________________________________________________________ |
// || Permet de definir la taille du tampon d'envoie                          ||
// ||_________________________________________________________________________||
// || Entrées | intTaille: longword                                           ||
// ||         |   nouvelle taille                                             ||
// ||_________|_______________________________________________________________||
// || Sorties |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

var
  S: AnsiString;
  tailleMSG : longword;
begin
  if intTaille= FdwSize then exit;
  FdwSize := inttaille;
  if FdwSize< 32 then FdwSize := 32;
  s := 'Ping en cours ...';
  tailleMSG := length(s);
  FReplyBufSize := sizeof(fIcmpEchoReply) + FdwSize + 8;
  if Length (FDataBuf) < FdwSize then SetLength (FDataBuf, FdwSize);
  if Length (FReplyBuf) < FReplyBufSize then SetLength (FReplyBuf, FReplyBufSize);
  FillChar(FDataBuf[0], FdwSize, $20);
  FillChar(FReplyBuf[0], FReplyBufSize, 0);
  Move(S, FDataBuf[0],ifthen(FdwSize>=tailleMSG , tailleMSG ,FdwSize));
  FillChar(fIcmpEchoReply, SizeOf(fIcmpEchoReply), 0);
  FillChar(fIPOptionInformation, SizeOf(fIPOptionInformation), 0);
end;

procedure TfbPing.trace;

//  ___________________________________________________________________________
// | procedure TfbPing.trace                                                   |
// | _________________________________________________________________________ |
// || Permet de lancer un trace route                                         ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

var
  intRes : integer;
  intNbsaut : integer;
begin
  FdwLastError := 0;
  if not FbooAddressResolved then ResolveAddress;
  if FicmpIPAddress = Longword(INADDR_NONE) then
  begin
    FdwLastError := ICMP_STATUS_BAD_DESTINATION ;
    Exit;
  end;

// ****************************************************************************
// * Réservation mémoire pour les tampons                                     *
// ****************************************************************************

  setsize (32);
  for intNbsaut := 1 to FintNBSaut do
  begin
    fIPOptionInformation.TTL := intNbsaut;
    intRes := envoyerEcho ;
    if(fIcmpEchoReply.Status<>ICMP_STATUS_REQUEST_TIMED_OUT ) and
      (fIcmpEchoReply.Status<>ICMP_STATUS_TTL_EXPIRED_TRANSIT) or
      (FstrAddressReply = FstrHostIP) then break ;
    if intNbsaut < FintNBSaut then sleep(1000);
  end;
end;

function TfbPing.GetErrorString : String;

//  ___________________________________________________________________________
// | function TfbPing.GetErrorString : String                                  |
// | _________________________________________________________________________ |
// || Permet de réccuperer le détail de la derniere erreur lors de l'execution||
// || du ping                                                                 ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties | result : string                                               ||
// ||         |   détail de l'erreur                                          ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

begin
  case FdwLastError of
    ICMP_SUCCESS                             : Result := 'No error';
    ICMP_STATUS_BUFFER_TO_SMALL              : Result := 'Buffer trop petit';
    ICMP_STATUS_DESTINATION_NET_UNREACH      : Result := 'Réseau de destination non atteignable';
    ICMP_STATUS_DESTINATION_HOST_UNREACH     : Result := 'Hôte destination non atteignable';
    ICMP_STATUS_DESTINATION_PROTOCOL_UNREACH : Result := 'protocole de destination non atteignable';
    ICMP_STATUS_DESTINATION_PORT_UNREACH     : Result := 'port de destination non atteignable';
    ICMP_STATUS_NO_RESOURCE                  : Result := 'Pas de resources';
    ICMP_STATUS_BAD_OPTION                   : Result := 'Mauvaises options';
    ICMP_STATUS_HARDWARE_ERROR               : Result := 'Erreur matériel';
    ICMP_STATUS_LARGE_PACKET                 : Result := 'Paquet trop grand';
    ICMP_STATUS_REQUEST_TIMED_OUT            : Result := 'Request timed out';
    ICMP_STATUS_BAD_REQUEST                  : Result := 'Mauvaise requête';
    ICMP_STATUS_BAD_ROUTE                    : Result := 'Mauvaise route';
    ICMP_STATUS_TTL_EXPIRED_TRANSIT          : Result := 'TTL à expiré pendant le trajet';
    ICMP_STATUS_TTL_EXPIRED_REASSEMBLY       : Result := 'TTL à expiré pendant le réassemblage';
    ICMP_STATUS_PARAMETER                    : Result := 'Problème de paramètrages';
    ICMP_STATUS_SOURCE_QUENCH                : Result := 'Extinction de la source';
    ICMP_STATUS_OPTION_TOO_BIG               : Result := 'Options trop grandes';
    ICMP_STATUS_BAD_DESTINATION              : Result := 'Mauvaise destination';
    ICMP_STATUS_ADDR_DELETED                 : Result := 'Adresse supprimée';
    ICMP_STATUS_SPEC_MTU_CHANGE              : Result := 'Les specifications MTU ont changé'; // (MTU Maximum Transmission Unit,taille maximale d'un paquet IP)
    ICMP_STATUS_MTU_CHANGE                   : Result := 'la taille maximale du paquet IP a changé';
    ICMP_STATUS_GENERAL_FAILURE              : Result := 'Erreur générale';
    ICMP_STATUS_PENDING                      : Result := 'Ping en cours';
    else
      Result := 'ICMP error #' + IntToStr(FdwLastError);
  end;
end;

function TfbPing.Ping : Integer;

//  ___________________________________________________________________________
// | function TfbPing.Ping : Integer                                           |
// | _________________________________________________________________________ |
// || Permet d'executer un ping sur une adresse de destination                ||
// ||_________________________________________________________________________||
// || Entrées |                                                               ||
// ||         |                                                               ||
// ||_________|_______________________________________________________________||
// || Sorties | result : integer                                              ||
// ||         |   nombre de réponses reçue 1 ok, 0 Erreur                     ||
// ||_________|_______________________________________________________________||
// |___________________________________________________________________________|

begin
  FdwLastError := 0;
  if not FbooAddressResolved then ResolveAddress;
  if FicmpIPAddress = Longword(INADDR_NONE) then
  begin
    FdwLastError := ICMP_STATUS_BAD_DESTINATION ;
    Exit;
  end;
  fIPOptionInformation.TTL := FdwTTL;
  fIPOptionInformation.Flags := FFlags;
  result := envoyerEcho;
end;

end.

