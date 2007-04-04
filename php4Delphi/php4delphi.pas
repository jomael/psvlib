{*******************************************************}
{                     PHP4Delphi                        }
{               PHP - Delphi interface                  }
{                                                       }
{ Developers:                                           }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{                                                       }
{ Toby Allen (Documentation)                            }
{ tobyphp@toflidium.com                                 }
{                                                       }
{ http://users.chello.be/ws36637                        }
{*******************************************************}
{$I PHP.INC}

{ $Id: php4delphi.pas,v 7.0 04/2007 delphi32 Exp $ }

//  Important:
//  Please check PHP version you are using and change php.inc file
//  See php.inc for more details

{
You can download the latest version of PHP from
http://www.php.net/downloads.php
You have to download and install PHP separately.
It is not included in the package.

For more information on the PHP Group and the PHP project,
please see <http://www.php.net>.
}

unit php4delphi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  PHPCommon,
  ZendTypes,
  PHPTypes,
  zendAPI,
  PHPAPI,
  DelphiFunctions,
  PHPCustomLibrary;

type

  TPHPLogMessage = procedure (Sender : TObject; AText : string) of object;
  TPHPErrorEvent = procedure (Sender : TObject; AText : string;
        AType : TPHPErrorType; AFileName : string; ALineNo : integer) of object;
  TPHPReadPostEvent = procedure(Sender : TObject; Stream : TStream) of object;
  TPHPReadResultEvent = procedure(Sender : TObject; Stream : TStream) of object;

  TPHPMemoryStream = class(TMemoryStream)
  public
    constructor Create;
    procedure SetInitialSize(ASize : integer);
  end;

  TPHPEngine = class(TPHPComponent, IUnknown, IPHPEngine)
  private
    FINIPath : string;
    FOnEngineStartup  : TNotifyEvent;
    FOnEngineShutdown : TNotifyEvent;
    FEngineActive : boolean;
    FHandleErrors : boolean;
    FSafeMode : boolean;
    FSafeModeGid : boolean;
    FRegisterGlobals : boolean;
    FHTMLErrors : boolean;
    FMaxInputTime : integer;
    FConstants : TphpConstants;
    FDLLFolder : string;
    FReportDLLError : boolean;
    FRequestList : TThreadList;
    FLock: TRTLCriticalSection;
    FOnScriptError : TPHPErrorEvent;
    FOnLogMessage : TPHPLogMessage;
    FWaitForShutdown : boolean;
    FHash : TStringList;
    FLibraryModule : Tzend_module_entry;
    FLibraryEntryTable : array  of zend_function_entry;
    procedure SetConstants(Value : TPHPConstants);
    function GetConstantCount: integer;
    function GetEngineActive : boolean;
  protected
    TSRMLS_D  : pppointer;
    procedure StartupPHP; virtual;
    procedure PrepareEngine; virtual;
    procedure PrepareIniEntry; virtual;
    procedure RegisterConstants; virtual;
    procedure RegisterInternalConstants(TSRMLS_DC : pointer); virtual;
    procedure HandleRequest(ht : integer; return_value : pzval; return_value_ptr : ppzval; this_ptr : pzval;
      return_value_used : integer; TSRMLS_DC : pointer); virtual;
    property RequestList : TThreadList read FRequestList write FRequestList;
    procedure HandleError (Sender : TObject; AText : string; AType : TPHPErrorType; AFileName : string; ALineNo : integer);
    procedure HandleLogMessage(Sender : TObject; AText : string);
    procedure RegisterLibrary(ALib : TCustomPHPLibrary);
    procedure RefreshLibrary;
    procedure UnlockLibraries;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure  StartupEngine; virtual;
    procedure  ShutdownEngine; virtual;
    procedure  LockEngine; virtual;
    procedure  UnlockEngine; virtual;
    procedure  PrepareForShutdown; virtual;
    property   EngineActive : boolean read GetEngineActive;
    property   ConstantCount : integer read GetConstantCount;
    property   WaitForShutdown : boolean read FWaitForShutdown;
    procedure  ShutdownAndWaitFor; virtual;
    property   LibraryEntry : Tzend_module_entry read FLibraryModule;
  published
    property  HandleErrors : boolean read FHandleErrors write FHandleErrors default true;
    property  OnEngineStartup  : TNotifyEvent read FOnEngineStartup write FOnEngineStartup;
    property  OnEngineShutdown : TNotifyEvent read FOnEngineShutdown write FOnEngineShutdown;
    property  OnScriptError : TPHPErrorEvent read FOnScriptError write FOnScriptError;
    property  OnLogMessage : TPHPLogMessage read FOnLogMessage write FOnLogMessage;
    property  IniPath : string read FIniPath write FIniPath;
    property  SafeMode : boolean read FSafeMode write FSafeMode default false;
    property  SafeModeGid : boolean read FSafeModeGid write FSafeModeGid default false;
    property  RegisterGlobals : boolean read FRegisterGlobals write FRegisterGlobals default true;
    property  HTMLErrors : boolean read FHTMLErrors write FHTMLErrors default false;
    property  MaxInputTime : integer read FMaxInputTime write FMaxInputTime default 0;
    property  Constants : TPHPConstants read FConstants write SetConstants;
    property  DLLFolder : string read FDLLFolder write FDLLFolder;
    property  ReportDLLError : boolean read FReportDLLError write FReportDLLError;
  end;

  TpsvCustomPHP = class(TPHPComponent, IUnknown, IPHPRequest)
  private
    FHeaders : TPHPHeaders;
    FMaxExecutionTime : integer;
    FExecuteMethod : TPHPExecuteMethod;
    FSessionActive : boolean;
    FOnRequestStartup : TNotifyEvent;
    FOnRequestShutdown : TNotifyEvent;
    FAfterExecute : TNotifyEvent;
    FBeforeExecute : TNotifyEvent;
    FTerminated : boolean;
    FVariables : TPHPVariables;
    FBuffer : TPHPMemoryStream;
    FFileName : string;
    {$IFDEF PHP4}
    FWriterHandle : THandle;
    FVirtualReadHandle : THandle;
    FVirtualWriteHandle : THandle;
    FVirtualCode : string;
    {$ENDIF}
    FUseDelimiters : boolean;
    FUseMapping : boolean;
    FPostStream : TMemoryStream;
    FOnReadPost : TPHPReadPostEvent;
    FRequestType : TPHPRequestType;
    FOnReadResult : TPHPReadResultEvent;
    FContentType: string;
    {$IFDEF PHP5}
    FVirtualStream : TMemoryStream;
    {$ENDIF}
    procedure SetVariables(Value : TPHPVariables);
    procedure SetHeaders(Value : TPHPHeaders);
    function GetVariableCount: integer;
  protected
    TSRMLS_D  : pointer;
    procedure ClearBuffer;
    procedure ClearHeaders;
    procedure StartupRequest; virtual;
    procedure ShutdownRequest; virtual;
    procedure PrepareResult(TSRMLS_D : pointer); virtual;
    procedure PrepareVariables(TSRMLS_D : pointer); virtual;
    function RunTime : boolean;
    function GetThreadSafeResourceManager : pointer;
    function  CreateVirtualFile(ACode : string) : boolean;
    procedure CloseVirtualFile;
    {$IFDEF PHP4}
    property  VirtualCode : string read FVirtualCode;
    {$ENDIF}
    function GetEngine : IPHPEngine;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function  EngineActive : boolean;
    function  Execute : string; overload;
    function  Execute(AFileName : string) : string; overload;
    function  RunCode(ACode : string) : string; overload;
    function  RunCode(ACode : TStrings) : string; overload;
    function  VariableByName(AName : string) : TPHPVariable;
    property  PostStream : TMemoryStream read FPostStream;
    property  ExecuteMethod : TPHPExecuteMethod read FExecuteMethod write FExecuteMethod default emServer;
    property  FileName  : string read FFileName write FFileName;
    property  Variables : TPHPVariables read FVariables write SetVariables;
    property  VariableCount : integer read GetVariableCount;
    property  OnRequestStartup : TNotifyEvent read FOnRequestStartup write FOnRequestStartup;
    property  OnRequestShutdown : TNotifyEvent read FOnRequestShutdown write FOnRequestShutdown;
    property  BeforeExecute : TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property  AfterExecute : TNotifyEvent read FAfterExecute write FAfterExecute;
    property  ThreadSafeResourceManager : pointer read GetThreadSafeResourceManager;
    property  SessionActive : boolean read FSessionActive;
    property  UseDelimiters : boolean read FUseDelimiters write FUseDelimiters default true;
    property  MaxExecutionTime : integer read FMaxExecutionTime write FMaxExecutionTime default 0;
    property  Headers : TPHPHeaders read FHeaders write SetHeaders;
    property  OnReadPost : TPHPReadPostEvent read FOnReadPost write FOnReadPost;
    property  RequestType : TPHPRequestType read FRequestType write FRequestType default prtGet;
    property  ResultBuffer : TPHPMemoryStream read FBuffer;
    property  OnReadResult : TPHPReadResultEvent read FOnReadResult write FOnReadResult;
    property  ContentType : string read FContentType write FContentType;
  end;


   TpsvPHP = class(TpsvCustomPHP)
  published
    property About;
    property FileName;
    property Variables;
    property OnRequestStartup;
    property OnRequestShutdown;
    property OnReadPost;
    property BeforeExecute;
    property AfterExecute;
    property UseDelimiters;
    property MaxExecutionTime;
    property RequestType;
    property OnReadResult;
    property ContentType;
  end;


var
  PHPEngine : TPHPEngine = nil;

implementation

uses
  PHPFunctions;

const
 {$IFDEF PHP5}
  PHPWin = 'php5ts.dll';
  {$ELSE}
  PHPWin = 'php4ts.dll';
  {$ENDIF}

var
  delphi_sapi_module : sapi_module_struct;
  php_delphi_module  : Tzend_module_entry;

{$IFDEF REGISTER_COLORS}
const
  Colors: array[0..41] of TIdentMapEntry = (
    (Value: clBlack; Name: 'clBlack'),
    (Value: clMaroon; Name: 'clMaroon'),
    (Value: clGreen; Name: 'clGreen'),
    (Value: clOlive; Name: 'clOlive'),
    (Value: clNavy; Name: 'clNavy'),
    (Value: clPurple; Name: 'clPurple'),
    (Value: clTeal; Name: 'clTeal'),
    (Value: clGray; Name: 'clGray'),
    (Value: clSilver; Name: 'clSilver'),
    (Value: clRed; Name: 'clRed'),
    (Value: clLime; Name: 'clLime'),
    (Value: clYellow; Name: 'clYellow'),
    (Value: clBlue; Name: 'clBlue'),
    (Value: clFuchsia; Name: 'clFuchsia'),
    (Value: clAqua; Name: 'clAqua'),
    (Value: clWhite; Name: 'clWhite'),
    (Value: clScrollBar; Name: 'clScrollBar'),
    (Value: clBackground; Name: 'clBackground'),
    (Value: clActiveCaption; Name: 'clActiveCaption'),
    (Value: clInactiveCaption; Name: 'clInactiveCaption'),
    (Value: clMenu; Name: 'clMenu'),
    (Value: clWindow; Name: 'clWindow'),
    (Value: clWindowFrame; Name: 'clWindowFrame'),
    (Value: clMenuText; Name: 'clMenuText'),
    (Value: clWindowText; Name: 'clWindowText'),
    (Value: clCaptionText; Name: 'clCaptionText'),
    (Value: clActiveBorder; Name: 'clActiveBorder'),
    (Value: clInactiveBorder; Name: 'clInactiveBorder'),
    (Value: clAppWorkSpace; Name: 'clAppWorkSpace'),
    (Value: clHighlight; Name: 'clHighlight'),
    (Value: clHighlightText; Name: 'clHighlightText'),
    (Value: clBtnFace; Name: 'clBtnFace'),
    (Value: clBtnShadow; Name: 'clBtnShadow'),
    (Value: clGrayText; Name: 'clGrayText'),
    (Value: clBtnText; Name: 'clBtnText'),
    (Value: clInactiveCaptionText; Name: 'clInactiveCaptionText'),
    (Value: clBtnHighlight; Name: 'clBtnHighlight'),
    (Value: cl3DDkShadow; Name: 'cl3DDkShadow'),
    (Value: cl3DLight; Name: 'cl3DLight'),
    (Value: clInfoText; Name: 'clInfoText'),
    (Value: clInfoBk; Name: 'clInfoBk'),
    (Value: clNone; Name: 'clNone'));
{$ENDIF}


{$IFDEF PHP510}
procedure DispatchRequest(ht : integer; return_value : pzval; return_value_ptr : ppzval; this_ptr : pzval;
      return_value_used : integer; TSRMLS_DC : pointer); cdecl;
{$ELSE}
procedure DispatchRequest(ht : integer; return_value : pzval; this_ptr : pzval;
      return_value_used : integer; TSRMLS_DC : pointer); cdecl;
{$ENDIF}
var
 php : TComponent;
 gl : psapi_globals_struct;
 p : pointer;
 Lib : IPHPEngine;
 Req : IPHPRequest;
{$IFNDEF PHP510}
 return_value_ptr : ppzval;
{$ENDIF}
begin
  {$IFNDEF PHP510}
  return_value_ptr := nil;
  {$ENDIF}
  ZVAL_NULL(return_value);
  p := ts_resource_ex(0, nil);
  gl := GetSAPIGlobals(p);
  php := TComponent(gl^.server_context);
  if Assigned(php) then
   begin
     try
       if Supports(PHP, IPHPRequest, Req) then
        begin
          Lib := Req.GetEngine;
          if lib <> nil then
           Lib.HandleRequest(ht, return_value, return_value_ptr, this_ptr, return_value_used, TSRMLS_DC);
        end;
     except
      ZVAL_NULL(return_value);
     end;
   end;
end;

procedure php_info_delphi(zend_module : Pointer; TSRMLS_DC : pointer); cdecl;
begin
  php_info_print_table_start();
  php_info_print_table_row(2, PChar('SAPI module version'), PChar('PHP4Delphi 7.0 Apr 2007'));
  php_info_print_table_row(2, PChar('Variables support'), PChar('enabled'));
  php_info_print_table_row(2, PChar('Constants support'), PChar('enabled'));
  php_info_print_table_row(2, PChar('Classes support'), PChar('enabled'));
  php_info_print_table_row(2, PChar('Home page'), PChar('http://users.chello.be/ws36637'));

  php_info_print_table_row(2, 'delphi_date', 'Returns the current date.');
  php_info_print_table_row(2, 'delphi_extract_file_dir', 'Extracts the drive and directory parts from FileName.');
  php_info_print_table_row(2, 'delphi_extract_file_drive', 'Returns the drive portion of a file name.');
  php_info_print_table_row(2, 'delphi_extract_file_name', 'Extracts the name and extension parts of a file name.');
  php_info_print_table_row(2, 'delphi_extract_file_ext', 'Returns the extension portions of a file name.');
  php_info_print_table_row(2, 'delphi_show_message', 'Displays a message box with an OK button.');
  php_info_print_table_row(2, 'register_delphi_object', 'Register Delphi object as PHP class');
  php_info_print_table_row(2, 'delphi_get_author', 'Returns TAuthor object');
  php_info_print_table_row(2, 'delphi_str_date', 'Converts a TDateTime value to a string.');
  php_info_print_table_row(2, 'delphi_get_system_directory', 'Returns Windows system directory');
  php_info_print_table_row(2, 'delphi_input_box', 'Displays an input dialog box that enables the user to enter a string.');
  php_info_print_table_row(2, 'register_delphi_component', 'Register Delphi component as PHP class');

  php_info_print_table_end();
end;

procedure php_info_library(zend_module : Pointer; TSRMLS_DC : pointer); cdecl;
var
 cnt : integer;
begin
  php_info_print_table_start();
  if Assigned(PHPEngine) then
   begin
     for cnt := 0 to PHPEngine.FHash.Count - 1 do
      begin
        php_info_print_table_row(2, PChar(PHPEngine.FHash[cnt]), PChar(TPHPFunction(PHPEngine.FHash.Objects[cnt]).Description));
      end;
   end;
  php_info_print_table_end();
end;

function php_delphi_startup(sapi_module : Psapi_module_struct) : integer; cdecl;
begin
  result := php_module_startup(sapi_module, nil, 0);
end;

function php_delphi_deactivate(p : pointer) : integer; cdecl;
begin
  result := 0;
end;


procedure php_delphi_flush(p : pointer); cdecl;
begin
end;

function php_delphi_ub_write(str : pchar; len : uint; p : pointer) : integer; cdecl;
var
 php : TpsvPHP;
 gl : psapi_globals_struct;
begin
  Result := 0;
  gl := GetSAPIGlobals(p);
  if Assigned(gl) then
   begin
     php := TpsvPHP(gl^.server_context);
     if Assigned(php) then
      begin
        try
         result := php.FBuffer.Write(str^, len);
        except
        end;
      end;
   end;
end;


procedure php_delphi_register_variables(val : pzval; p : pointer); cdecl;
var
 php : TpsvPHP;
 gl : psapi_globals_struct;
 ts : pointer;
 cnt : integer;
 varcnt : integer;
begin
  ts := tsrmls_fetch;
  gl := GetSAPIGlobals(ts);
  php := TpsvPHP(gl^.server_context);

  if PHP = nil then
   begin
     Exit;
   end;

  php_register_variable('PHP_SELF', '_', nil, p);
  php_register_variable('SERVER_NAME','DELPHI', val, p);
  php_register_variable('SERVER_SOFTWARE', 'Delphi', val, p);
//  if php.RequestType = prtPost then
//   php_register_variable('REQUEST_METHOD', 'POST', val, p)
//     else
//       php_register_variable('REQUEST_METHOD', 'GET', val, p);

  varcnt := PHP.Variables.Count;
  if varcnt > 0 then
   begin
      for cnt := 0 to varcnt - 1 do
       begin
         php_register_variable(PChar(php.Variables[cnt].Name),
                PChar(php.Variables[cnt].Value), val, p);
       end;
   end;
end;

function php_delphi_read_post(buf : PChar; len : uint; p : pointer) : integer; cdecl;
var
 gl : psapi_globals_struct;
 php : TpsvPHP;
begin
  gl := GetSAPIGlobals(p);


  php := TpsvPHP(gl^.server_context);

  if PHP = nil then
   begin
     Result := 0;
     Exit;
   end;

  if php.PostStream = nil then
   begin
     Result := 0;
     Exit;
   end;

  if php.PostStream.Size = 0 then
   begin
     Result := 0;
     Exit;
   end;

  Result := php.PostStream.Read(buf^, len);
end;

function php_delphi_log_message(msg : Pchar) : integer; cdecl;
var
 php : TpsvPHP;
 gl : psapi_globals_struct;
 p : pointer;
begin
  p := ts_resource_ex(0, nil);
  gl := GetSAPIGlobals(p);
  php := TpsvPHP(gl^.server_context);
  if Assigned(PHPEngine) then
   begin
     if Assigned(PHPEngine.OnLogMessage) then
       phpEngine.HandleLogMessage(php, msg)
        else
          MessageBox(0, MSG, 'PHP4Delphi', MB_OK)
    end
      else
        MessageBox(0, msg, 'PHP4Delphi', MB_OK);
  result := 0;
end;

function php_delphi_send_header(p1, TSRMLS_DC : pointer) : integer; cdecl;
var
 php : TpsvPHP;
 gl  : psapi_globals_struct;
 p : pointer;
begin
  p := ts_resource_ex(0, nil);
  gl := GetSAPIGlobals(p);
  php := TpsvPHP(gl^.server_context);
  if Assigned(p1) and Assigned(php) then
   begin
    with php.Headers.Add do
     Header := String(Psapi_header_struct(p1).header);
   end;
  Result := SAPI_HEADER_SENT_SUCCESSFULLY;
end;

function php_delphi_header_handler(sapi_header : psapi_header_struct;  sapi_headers : psapi_headers_struct; TSRMLS_DC : pointer) : integer; cdecl;
begin
  Result := SAPI_HEADER_ADD;
end;

function php_delphi_read_cookies(p1 : pointer) : pointer; cdecl;
begin
  result := nil;
end;



procedure delphi_error_cb(_type : integer; const error_filename : PChar;
   const error_lineno : uint; const _format : PChar; args : PChar); cdecl;
var
 buffer  : array[0..1023] of char;
 err_msg : PChar;
 php : TpsvPHP;
 gl : psapi_globals_struct;
 p : pointer;
 error_type_str : string;
 err : TPHPErrorType;
begin
  wvsprintf(buffer, _format, args);
  err_msg := buffer;
  p := ts_resource_ex(0, nil);
  gl := GetSAPIGlobals(p);
  php := TpsvPHP(gl^.server_context);

  case _type of
   E_ERROR              : err := etError;
   E_WARNING            : err := etWarning;
   E_PARSE              : err := etParse;
   E_NOTICE             : err := etNotice;
   E_CORE_ERROR         : err := etCoreError;
   E_CORE_WARNING       : err := etCoreWarning;
   E_COMPILE_ERROR      : err := etCompileError;
   E_COMPILE_WARNING    : err := etCompileWarning;
   E_USER_ERROR         : err := etUserError;
   E_USER_WARNING       : err := etUserWarning;
   E_USER_NOTICE        : err := etUserNotice;
    else
      err := etUnknown;
  end;

  if assigned(PHPEngine) then
   begin
     if Assigned(PHPEngine.OnScriptError) then
        begin
           PHPEngine.HandleError(php, Err_Msg, err, error_filename, error_lineno);
        end
          else
             begin
               case _type of
                E_RECOVERABLE_ERROR:
                 error_type_str := 'Recoverable error';
                E_ERROR,
                E_CORE_ERROR,
                E_COMPILE_ERROR,
                E_USER_ERROR:
                   error_type_str := 'Fatal error';
                E_WARNING,
                E_CORE_WARNING,
                E_COMPILE_WARNING,
                E_USER_WARNING :
                   error_type_str := 'Warning';
                E_PARSE:
                   error_type_str := 'Parse error';
                E_STRICT,   
                E_NOTICE,
                E_USER_NOTICE:
                    error_type_str := 'Notice';
                else
                    error_type_str := 'Unknown error';
               end;

                php_log_err(PChar(Format('PHP4DELPHI %s:  %s in %s on line %d', [error_type_str, buffer, error_filename, error_lineno])), p);
             end;
 end;

   _zend_bailout(error_filename, error_lineno);
end;


function minit (_type : integer; module_number : integer; TSRMLS_DC : pointer) : integer; cdecl;
begin
  RegisterInternalClasses(TSRMLS_DC);
  RESULT := SUCCESS;
end;

function mshutdown (_type : integer; module_number : integer; TSRMLS_DC : pointer) : integer; cdecl;
begin
  RESULT := SUCCESS;
end;


{Request initialization}
function rinit (_type : integer; module_number : integer; TSRMLS_DC : pointer) : integer; cdecl;
begin
  Result := SUCCESS;
end;

{Request shutdown}
function rshutdown (_type : integer; module_number : integer; TSRMLS_DC : pointer) : integer; cdecl;
begin
  Result := SUCCESS;
end;

{$IFDEF PHP5}

//PHP 5
function delphi_stream_reader (handle : pointer; buf : pChar; len : size_t; TSRMLS_DC : pointer) : size_t; cdecl;
var
 MS : TMemoryStream;
begin
  MS := TMemoryStream(handle);
  if MS =  nil then
    result := 0
     else
       try
         result := MS.Read(buf^, len);
       except
          result := 0;
       end;
end;

//PHP 5
procedure delphi_stream_closer(handle : pointer; TSRMLS_DC : pointer); cdecl;
var
 MS : TMemoryStream;
begin
  MS := TMemoryStream(handle);
  if MS <> nil then
   try
     MS.Clear;
   except
   end;
end;

{$IFDEF PHP510}
// PHP 5.10
function delphi_stream_teller(handle : pointer; TSRMLS_DC : pointer) : longint; cdecl;
var
  MS : TMemoryStream;
begin
  MS := TMemoryStream(handle);
  if MS <> nil then
   try
     result := MS.Size;
   except
     Result := 0;
   end
    else
      Result := 0;
end;
{$ENDIF}

{$ENDIF}

{ TpsvCustomPHP }

constructor TpsvCustomPHP.Create(AOwner: TComponent);
begin
  inherited;
  FMaxExecutionTime := 0;
  FExecuteMethod := emServer;
  FSessionActive := false;
  FVariables := TPHPVariables.Create(Self);
  FHeaders := TPHPHeaders.Create(Self);
  FUseDelimiters := true;
  FRequestType := prtGet;
  FBuffer := TPHPMemoryStream.Create;
  {$IFDEF PHP4}
  FVirtualCode := '';
  {$ELSE}
  FVirtualStream := TMemoryStream.Create;
  {$ENDIF}
end;

destructor TpsvCustomPHP.Destroy;
begin
  FVariables.Free;
  FHeaders.Free;
  FSessionActive := False;
  FBuffer.Free;
  {$IFDEF PHP4}
  FVirtualCode := '';
  {$ELSE}
  if FVirtualStream <> nil then
   FreeAndNil(FVirtualStream);
  {$ENDIF}
  if Assigned(FPostStream) then
   FreeAndNil(FPostStream);
  inherited;
end;

procedure TpsvCustomPHP.ClearBuffer;
begin
  FBuffer.Clear;
end;

procedure TpsvCustomPHP.ClearHeaders;
begin
  FHeaders.Clear;
end;


{$IFDEF PHP4}
function WriterProc(Parameter : Pointer) : integer;
var
 n : integer;
 php : TpsvCustomPHP;
 buf : PChar;
 k : cardinal;
begin
  try
    php := TPsvCustomPHP(Parameter);
    Buf := PChar(php.FVirtualCode);
    k := length(php.FVirtualCode);
    repeat
      n := _write(php.FVirtualWriteHandle, Buf, k);
      if (n <= 0) then
       break
        else
          begin
            inc(Buf, n);
            dec(K, n);
          end;
    until (n <= 0);
    Close(php.FVirtualWriteHandle);
    php.FVirtualWriteHandle := 0;
  finally
    Result := 0;
    ExitThread(0);
  end;
end;
{$ENDIF}

function TpsvCustomPHP.Execute : string;
var
  file_handle : zend_file_handle;
  {$IFDEF PHP4}
  thread_id : cardinal;
  {$ENDIF}
  {$IFDEF PHP5}
  ZendStream : TZendStream;
  {$ENDIF}
begin

  if not EngineActive then
   begin
     Result := '';
     Exit;
   end;

   if PHPEngine.WaitForShutdown then
    begin
      Result := '';
      Exit;
    end;

  PHPEngine.RequestList.Add(Self);

  try
    ClearHeaders;
    ClearBuffer;

    if Assigned(FBeforeExecute) then
     FBeforeExecute(Self);



    FTerminated := false;
    if not FUseMapping then
     begin
      if not FileExists(FFileName) then
        raise Exception.CreateFmt('File %s does not exists', [FFileName]);
     end;

    StartupRequest;


    FillChar(file_handle, sizeof(zend_file_handle), 0);

    if FUseMapping then
     begin
       {$IFDEF PHP5}

       ZendStream.reader := delphi_stream_reader;
       ZendStream.closer := delphi_stream_closer;
       {$IFDEF PHP510}
       ZendStream.fteller := delphi_stream_teller;
       {$ENDIF}
       ZendStream.interactive := 0;
       ZendStream.handle := FVirtualStream;

       file_handle._type := ZEND_HANDLE_STREAM;
       file_handle.opened_path := nil;
       file_handle.filename := '-';
       file_handle.free_filename := 0;
       file_handle.handle.stream := ZendStream;
       {$ELSE}
       //for PHP4 only
       file_handle._type := ZEND_HANDLE_FD;
       file_handle.opened_path := nil;
       file_handle.filename := '-';
       file_handle.free_filename := 0;
       file_handle.handle.fd := FVirtualReadHandle;
       FWriterHandle := BeginThread(nil, 8192, @WriterProc, Self, 0, thread_id);
       {$ENDIF}
     end
      else
       begin
         file_handle._type := ZEND_HANDLE_FILENAME;
         file_handle.filename := PChar(FFileName);
         file_handle.opened_path := nil;
         file_handle.free_filename := 0;
       end;

    try
      php_execute_script(@file_handle, TSRMLS_D);
    except
      FBuffer.Clear;
    end;

    PrepareResult(TSRMLS_D);


    if Assigned(FAfterExecute) then
     FAfterExecute(Self);

    ShutdownRequest;

    FBuffer.Position := 0;
    if Assigned(FOnReadResult) then
     begin
       FOnReadResult(Self, FBuffer);
       Result := '';
     end
       else
         begin
           SetLength(Result, FBuffer.Size);
           FBuffer.Read(Result[1], FBuffer.Size);
         end;
    FBuffer.Clear;
    {$IFDEF PHP4}
    FVirtualCode := '';
    {$ENDIF}
  finally
    PHPEngine.RequestList.Remove(Self);
  end;
end;

function TpsvCustomPHP.RunCode(ACode : string) : string;
begin
  if not EngineActive then
   begin
     Result := '';
     Exit;
   end;

  ClearHeaders;
  ClearBuffer;
  FUseMapping := true;
  try
   if FUseDelimiters then
    begin
      if Pos('<?', ACode) = 0 then
        ACode := Format('<? %s ?>', [ACode]);
    end;
    if not CreateVirtualFile(ACode) then
      begin
        Result := '';
        Exit;
      end;
     Result := Execute;
     CloseVirtualFile;
     finally
       FUseMapping := false;
     end;
end;


function TpsvCustomPHP.RunCode(ACode: TStrings): string;
begin
  if Assigned(ACode) then
   Result := RunCode(ACode.Text);
end;


procedure TpsvCustomPHP.SetVariables(Value: TPHPVariables);
begin
  FVariables.Assign(Value);
end;

procedure TpsvCustomPHP.SetHeaders(Value : TPHPHeaders);
begin
  FHeaders.Assign(Value);
end;



function TpsvCustomPHP.Execute(AFileName: string): string;
begin
  FFileName := AFileName;
  Result := Execute;
end;

procedure TpsvCustomPHP.PrepareResult(TSRMLS_D : pointer);
var
  ht  : PHashTable;
  data: ^ppzval;
  cnt : integer;
  variable : pzval;
begin
  if FVariables.Count = 0 then
   Exit;
   
  if FExecuteMethod = emServer then
  {$IFDEF PHP4}
   ht := GetSymbolsTable(TSRMLS_D)
  {$ELSE}
   ht := @GetExecutorGlobals(TSRMLS_D).symbol_table
  {$ENDIF} 
    else
     ht := GetTrackHash('_GET', TSRMLS_D);
  if Assigned(ht) then
   begin
     for cnt := 0 to FVariables.Count - 1  do
      begin
        new(data);
        try
          if zend_hash_find(ht, PChar(FVariables[cnt].Name),
          strlen(PChar(FVariables[cnt].Name)) + 1, data) = SUCCESS then
          begin
            variable := data^^;
            convert_to_string(variable);
            FVariables[cnt].Value := variable^.value.str.val;
          end;
        finally
          freemem(data);
        end;
      end;
   end;
end;

function TpsvCustomPHP.VariableByName(AName: string): TPHPVariable;
begin
  Result := FVariables.ByName(AName);
end;


function TpsvCustomPHP.EngineActive : boolean;
begin
  if Assigned(PHPEngine) then
   Result := PHPEngine.EngineActive
    else
      Result := false;
end;

procedure TpsvCustomPHP.StartupRequest;
var
 gl  : psapi_globals_struct;
 TimeStr : string;
begin
  if not EngineActive then
   raise EDelphiErrorEx.Create('PHP engine is not active ');

  if FSessionActive then
   Exit;

  TSRMLS_D := tsrmls_fetch;

  if PHPEngine.RegisterGlobals then
   GetPHPGlobals(TSRMLS_D)^.register_globals := true;

  try
    if Assigned(FPostStream) then
     FPostStream.Clear
       else
         FPostStream := TMemoryStream.Create;
    if Assigned(FOnReadPost) then
     FOnReadPost(Self, FPostStream);

    FPostStream.Position := 0;

    gl := GetSAPIGlobals(TSRMLS_D);
    gl^.server_context := Self;
    gl^.request_info.query_string := PChar(Variables.GetVariables);
    gl^.sapi_headers.http_response_code := 200;
    if RequestType = prtGet then
     gl^.request_info.request_method := 'GET'
      else
       begin
        gl^.request_info.request_method := 'POST';
        gl^.request_info.content_length := FPostSTream.Size;
        if FContentType = '' then
         gl^.request_info.content_type := 'application/x-www-form-urlencoded'
          else
            gl^.request_info.content_type := PChar(FContentType);
       end;

    php_request_startup(TSRMLS_D);
     if Assigned(FOnRequestStartup) then
      FOnRequestStartup(Self);
    TimeStr := IntToStr(FMaxExecutionTime);
    zend_alter_ini_entry('max_execution_time', 19, PChar(TimeStr), Length(TimeStr), ZEND_INI_SYSTEM, ZEND_INI_STAGE_RUNTIME);


    FSessionActive := true;
  except
    FSessionActive := false;
  end;
end;

function TpsvCustomPHP.RunTime: boolean;
begin
  Result :=   not (csDesigning in ComponentState);
end;

function TpsvCustomPHP.GetThreadSafeResourceManager: pointer;
begin
  Result := TSRMLS_D;
end;

function TpsvCustomPHP.GetVariableCount: integer;
begin
  Result := FVariables.Count;
end;


procedure TpsvCustomPHP.ShutdownRequest;
var
 gl  : psapi_globals_struct;
begin
  if not FSessionActive then
   Exit;
  try

    if not FTerminated then
     begin
       php_request_shutdown(nil);
       gl := GetSAPIGlobals(TSRMLS_D);
       gl^.server_context := nil;
     end;

    if Assigned(FOnRequestShutdown) then
      FOnRequestShutdown(Self);

  finally
    FSessionActive := false;
  end;

end;


procedure TpsvCustomPHP.PrepareVariables(TSRMLS_D: pointer);
var
  ht  : PHashTable;
  data: ^ppzval;
  cnt : integer;
begin
  {$IFDEF PHP4}
   ht := GetSymbolsTable(TSRMLS_D);
  {$ELSE}
   ht := @GetExecutorGlobals(TSRMLS_D).symbol_table;
  {$ENDIF}
  if Assigned(ht) then
   begin
     for cnt := 0 to FVariables.Count - 1  do
      begin
        new(data);
        try
          if zend_hash_find(ht, PChar(FVariables[cnt].Name),
          strlen(PChar(FVariables[cnt].Name)) + 1, data) = SUCCESS then
          begin
            if (data^^^._type = IS_STRING) then
             begin
               efree(data^^^.value.str.val);
               ZVAL_STRING(data^^, PChar(FVariables[cnt].Value), true);
             end
               else
                 begin
                   ZVAL_STRING(data^^, PChar(FVariables[cnt].Value), true);
                 end;
          end;
        finally
          freemem(data);
        end;
      end;
   end;
end;

procedure TpsvCustomPHP.CloseVirtualFile;
begin
  {$IFDEF PHP4}
  if FWriterHandle <> 0 then
   begin
     WaitForSingleObject(FWriterHandle, INFINITE);
     CloseHandle(FWriterHandle);
     FWriterHandle := 0;
   end;
  {$ELSE}
  FVirtualStream.Clear;
  {$ENDIF}
end;

function TpsvCustomPHP.CreateVirtualFile(ACode : string): boolean;
{$IFDEF PHP4}
var
 _handles : array[0..1] of THandle;
{$ENDIF}
begin
  Result := false;
  {$IFDEF PHP4}
  if ACode = '' then
   begin
     FVirtualReadHandle := 0;
     FVirtualWriteHandle := 0;
     Exit; //empty buffer was provided
   end;

  FVirtualCode := ACode;

  if pipe(@_handles, 4096, 0) = -1 then
   begin
     FVirtualReadHandle := 0;
     FVirtualWriteHandle := 0;
     FVirtualCode := '';
     Exit;
   end;

  FVirtualReadHandle := _handles[0];
  FVirtualWriteHandle := _handles[1];
  Result := true;
  {$ELSE}
  if ACode = '' then
   Exit;
  try
    FVirtualStream.Clear;
    FVirtualStream.Write(ACode[1], Length(ACode));
    FVirtualStream.Position := 0;
    Result := true;
  except
    Result := false;
  end;
  {$ENDIF}
end;


function TpsvCustomPHP.GetEngine: IPHPEngine;
begin
  Result := PHPEngine;
end;

{ TPHPEngine }


constructor TPHPEngine.Create(AOwner: TComponent);
begin
  inherited;
  if Assigned(PHPEngine) then
   raise Exception.Create('Only one instance of PHP engine per application');
  FEngineActive := false;
  FHandleErrors := true;
  FSafeMode := false;
  FSafeModeGid := false;
  FRegisterGlobals := true;
  FHTMLErrors := false;
  FMaxInputTime := 0;
  FWaitForShutdown := false;
  FConstants := TPHPConstants.Create(Self);
  FRequestList := TThreadList.Create;
  FHash := TStringList.Create;
  FHash.Duplicates := dupError;
  FHash.Sorted := true;
  InitializeCriticalSection(FLock);
  PHPEngine := Self;
end;

destructor TPHPEngine.Destroy;
begin
  ShutdownAndWaitFor;
  FEngineActive := false;
  FConstants.Free;
  FRequestList.Free;
  FHash.Free;
  DeleteCriticalSection(FLock);
  if (PHPEngine = Self) then
   PHPEngine := nil;
  inherited;
  if PHPLoaded then
     UnloadPHP;
end;

function TPHPEngine.GetConstantCount: integer;
begin
  Result := FConstants.Count;
end;

procedure TPHPEngine.HandleRequest(ht: integer; return_value: pzval;
  return_value_ptr: ppzval; this_ptr: pzval; return_value_used: integer;
  TSRMLS_DC: pointer);

var
  Params : pzval_array;
  AFunction : TPHPFunction;
  j  : integer;
  FActiveFunctionName : string;
  FunctionIndex : integer;
begin
 try

  if ht > 0 then
   begin
     if ( not (zend_get_parameters_ex(ht, Params) = SUCCESS )) then
      begin
        zend_wrong_param_count(TSRMLS_DC);
        Exit;
      end;
    end;

  FActiveFunctionName := get_active_function_name(TSRMLS_DC);
  if FHash.Find(FActiveFunctionName, FunctionIndex) then
    AFunction := TPHPFunction(FHash.Objects[FunctionIndex])
     else
       AFunction := nil;

   if Assigned(AFunction) then
    begin
      if AFunction.Collection = nil then
       Exit; //library was destroyed

      if Assigned(AFunction.OnExecute) then
        begin
           if AFunction.Parameters.Count <> ht then
             begin
               zend_wrong_param_count(TSRMLS_DC);
               Exit;
             end;

           if ht > 0 then
             begin
               for j := 0 to ht - 1 do
                 begin
                   if not IsParamTypeCorrect(AFunction.Parameters[j].ParamType, Params[j]^) then
                     begin
                       zend_error(E_WARNING, PChar(Format('Wrong parameter type for %s()', [get_active_function_name(TSRMLS_DC)])));
                       Exit;
                     end;
                   AFunction.Parameters[j].ZendValue := (Params[j]^);
                 end;
             end; // if ht > 0

          AFunction.ZendVar.AsZendVariable := return_value; //direct access to zend variable
          AFunction.OnExecute(Self, AFunction.Parameters, AFunction.ReturnValue, this_ptr, TSRMLS_DC);
          if AFunction.ZendVar.ISNull then   //perform variant conversion
            variant2zval(AFunction.ReturnValue, return_value);
      end; //if assigned AFunction.OnExecute
    end;

  finally
    dispose_pzval_array(Params);
  end;
end;

procedure TPHPEngine.PrepareIniEntry;
var
  p   : integer;
  TimeStr : string;
begin
  if not PHPLoaded then
   Exit;

  if FHandleErrors then
   begin
     p := integer(GetProcAddress(PHPLib, 'zend_error_cb'));
     asm
       mov edx, dword ptr [p]
       mov dword ptr [edx], offset delphi_error_cb
     end;
   end;

  if FSafeMode then
   zend_alter_ini_entry('safe_mode', 10, '1', 1, PHP_INI_SYSTEM, PHP_INI_STAGE_STARTUP)
    else
      zend_alter_ini_entry('safe_mode', 10, '0', 1, PHP_INI_SYSTEM, PHP_INI_STAGE_STARTUP);

  if FSafeModeGID then
   zend_alter_ini_entry('safe_mode_gid', 14, '1', 1, PHP_INI_SYSTEM, PHP_INI_STAGE_STARTUP)
    else
      zend_alter_ini_entry('safe_mode_gid', 14, '0', 1, PHP_INI_SYSTEM, PHP_INI_STAGE_STARTUP);

  zend_alter_ini_entry('register_argc_argv', 19, '0', 1, ZEND_INI_SYSTEM, ZEND_INI_STAGE_ACTIVATE);

  if FRegisterGlobals then
    zend_alter_ini_entry('register_globals',   17, '1', 1, ZEND_INI_SYSTEM, ZEND_INI_STAGE_ACTIVATE)
      else
        zend_alter_ini_entry('register_globals',   17, '0', 1, ZEND_INI_SYSTEM, ZEND_INI_STAGE_ACTIVATE);

  if FHTMLErrors then
   zend_alter_ini_entry('html_errors',        12, '1', 1, ZEND_INI_SYSTEM, ZEND_INI_STAGE_ACTIVATE)
     else
       zend_alter_ini_entry('html_errors',        12, '0', 1, ZEND_INI_SYSTEM, ZEND_INI_STAGE_ACTIVATE);

  zend_alter_ini_entry('implicit_flush',     15, '1', 1, ZEND_INI_SYSTEM, ZEND_INI_STAGE_ACTIVATE);

  TimeStr := IntToStr(FMaxInputTime);
  zend_alter_ini_entry('max_input_time', 15, PChar(TimeStr), Length(TimeStr), ZEND_INI_SYSTEM, ZEND_INI_STAGE_ACTIVATE);
end;

procedure TPHPEngine.PrepareEngine;
begin
  delphi_sapi_module.name := 'embed';  //to solve a problem with dl()
  delphi_sapi_module.pretty_name := 'PHP for Delphi';
  delphi_sapi_module.startup := php_delphi_startup;
  delphi_sapi_module.shutdown := php_module_shutdown_wrapper;
  delphi_sapi_module.activate:= nil;
  delphi_sapi_module.deactivate := @php_delphi_deactivate;
  delphi_sapi_module.ub_write := @php_delphi_ub_write;
  delphi_sapi_module.flush := @php_delphi_flush;
  delphi_sapi_module.stat:= nil;
  delphi_sapi_module.getenv:= nil;
  delphi_sapi_module.sapi_error := @zend_error;
  delphi_sapi_module.header_handler := @php_delphi_header_handler;
  delphi_sapi_module.send_headers := nil;
  delphi_sapi_module.send_header :=  @php_delphi_send_header;
  delphi_sapi_module.read_post := @php_delphi_read_post;
  delphi_sapi_module.read_cookies := @php_delphi_read_cookies;
  delphi_sapi_module.register_server_variables := @php_delphi_register_variables;
  delphi_sapi_module.log_message := @php_delphi_log_message;
  if FIniPath <> '' then
  delphi_sapi_module.php_ini_path_override := PChar(FIniPath)
   else
     delphi_sapi_module.php_ini_path_override :=  nil;
  delphi_sapi_module.block_interruptions := nil;
  delphi_sapi_module.unblock_interruptions := nil;
  delphi_sapi_module.default_post_reader := nil;
  delphi_sapi_module.treat_data := nil;
  delphi_sapi_module.executable_location := nil;
  delphi_sapi_module.php_ini_ignore := 0;

  InitDelphiFunctions;
  php_delphi_module.size := sizeOf(Tzend_module_entry);
  php_delphi_module.zend_api := ZEND_MODULE_API_NO;
  php_delphi_module.zend_debug := 0;
  php_delphi_module.zts := USING_ZTS;
  php_delphi_module.name := 'php4delphi_support';
  php_delphi_module.functions := @DelphiTable[0];
  php_delphi_module.module_startup_func := @minit;
  php_delphi_module.module_shutdown_func := @mshutdown;
  php_delphi_module.info_func := @php_info_delphi;
  php_delphi_module.version := '7.0';
  {$IFDEF PHP4}
  php_delphi_module.global_startup_func := nil;
  {$ENDIF}
  php_delphi_module.request_startup_func := @rinit;
  php_delphi_module.request_shutdown_func := @rshutdown;

  {$IFDEF PHP5}
  {$IFNDEF PHP520}
  php_delphi_module.global_id := 0;
  {$ENDIF}
  {$ENDIF}
  php_delphi_module.module_started := 0;
  php_delphi_module._type := MODULE_PERSISTENT;
  php_delphi_module.handle := nil;
  php_delphi_module.module_number := 0;

  FLibraryModule.size := sizeOf(Tzend_module_entry);
  FLibraryModule.zend_api := ZEND_MODULE_API_NO;
  FLibraryModule.zend_debug := 0;
  FLibraryModule.zts := USING_ZTS;
  FLibraryModule.name := 'php4delphi_internal';
  FLibraryModule.functions := nil;
  FLibraryModule.module_startup_func := nil;
  FLibraryModule.module_shutdown_func := nil;
  FLibraryModule.info_func := @php_info_library;
  FLibraryModule.version := '7.0';
  {$IFDEF PHP4}
  FLibraryModule.global_startup_func := nil;
  {$ENDIF}
  FLibraryModule.request_shutdown_func := nil;
  {$IFDEF PHP5}
  {$IFNDEF PHP520}
  FLibraryModule.global_id := 0;
  {$ENDIF}
  {$ENDIF}
  FLibraryModule.module_started := 0;
  FLibraryModule._type := MODULE_PERSISTENT;
  FLibraryModule.handle := nil;
  FLibraryModule.module_number := 0;
end;

procedure TPHPEngine.RegisterConstants;
var
 cnt : integer;
begin
  for cnt := 0 to FConstants.Count - 1 do
  begin
    zend_register_string_constant(PChar(FConstants[cnt].Name),
      strlen(PChar(FConstants[cnt].Name)) + 1,
      PChar(FConstants[cnt].Value), CONST_PERSISTENT or CONST_CS, 0, TSRMLS_D);
  end;

  RegisterInternalConstants(TSRMLS_D);
end;

procedure TPHPEngine.RegisterInternalConstants(TSRMLS_DC: pointer);
{$IFDEF REGISTER_COLORS}
var
 i : integer;
{$ENDIF}
begin
 {$IFDEF REGISTER_COLORS}
  for I := Low(Colors) to High(Colors) do
   zend_register_long_constant( PChar(Colors[i].Name), strlen(PChar(Colors[i].Name)) + 1, Colors[i].Value,
    CONST_PERSISTENT or CONST_CS, 0, TSRMLS_DC);
 {$ENDIF}
end;


procedure TPHPEngine.SetConstants(Value: TPHPConstants);
begin
  FConstants.Assign(Value);
end;

procedure TPHPEngine.ShutdownEngine;
begin

  if PHPEngine <> Self then
   raise EDelphiErrorEx.Create('Only active engine can be stopped');


  if not FEngineActive then
   Exit;

  try
    delphi_sapi_module.shutdown(@delphi_sapi_module);
    sapi_shutdown;
     //Shutdown PHP thread safe resource manager
     if Assigned(FOnEngineShutdown) then
       FOnEngineShutdown(Self);
    tsrm_shutdown();
    FHash.Clear;
   finally
     FEngineActive := false;
     FWaitForShutdown := False;
   end;
end;

procedure TPHPEngine.RegisterLibrary(ALib : TCustomPHPLibrary);
var
 cnt : integer;
 skip : boolean;
 FN : string;
begin
  skip := false;
  ALib.Refresh;
  for cnt := 0 to ALib.Functions.Count - 1 do
   begin
      FN := Lowercase(ALib.Functions[cnt].FunctionName);
      if FHash.IndexOf(FN) > -1 then
      begin
        skip := true;
        break;
      end;
   end;

  if not skip then
   begin
      for cnt := 0 to ALib.Functions.Count - 1 do
       begin
         FN := Lowercase(ALib.Functions[cnt].FunctionName);
         FHash.AddObject(FN, ALib.Functions[cnt]);
       end;
      ALib.Locked := true; 
   end;
end;

procedure TPHPEngine.RefreshLibrary;
var
 cnt : integer;
begin
  SetLength(FLibraryEntryTable, FHash.Count + 1);
    for cnt := 0 to FHash.Count - 1 do
    begin
      FLibraryEntryTable[cnt].fname := PChar(FHash[cnt]);
      FLibraryEntryTable[cnt].handler := @DispatchRequest;
      {$IFDEF PHP4}
      FLibraryEntryTable[cnt].func_arg_types := nil;
      {$ENDIF}
    end;
    FLibraryEntryTable[FHash.Count].fname := nil;
    FLibraryEntryTable[FHash.Count].handler := nil;
    {$IFDEF PHP4}
    FLibraryEntryTable[FHash.Count].func_arg_types := nil;
    {$ENDIF}

    FLibraryModule.functions :=  @FLibraryEntryTable[0];
end;

procedure TPHPEngine.StartupEngine;
var
 i : integer;
 p : pointer;
begin
  if PHPEngine <> Self then
   begin
     raise EDelphiErrorEx.Create('Only one PHP engine can be activated');
   end;

   if FEngineActive then
       raise EDelphiErrorEx.Create('PHP engine already active');

     StartupPHP;

     PrepareEngine;


     if not PHPLoaded then //Peter Enz
       begin
         raise EDelphiErrorEx.Create('PHP engine is not loaded');
       end;

     try
      //Start PHP thread safe resource manager
      tsrm_startup(128, 1, TSRM_ERROR_LEVEL_CORE , 'TSRM.LOG');

      sapi_startup(@delphi_sapi_module);
      p := @php_delphi_module;
      php_module_startup(@delphi_sapi_module, p, 1);
      TSRMLS_D := ts_resource_ex(0, nil);

      PrepareIniEntry;
      RegisterConstants;

      FHash.Clear;
      for i := 0 to Librarian.Count -1 do
      begin
        RegisterLibrary(Librarian.GetLibrary(I));
      end;


      //only register library if at least 1 function present
      if FHash.Count > 0 then
       begin
          RefreshLibrary;
          p := @FLibraryModule;
          {$IFDEF PHP510}
          php_register_extensions(@p, 1, TSRMLS_D);
          {$ELSE}
          php_startup_extensions(@p, 1);
          {$ENDIF}
       end;

      if Assigned(FOnEngineStartup) then
       FOnEngineStartup(Self);

      FEngineActive := true;
      except
       FEngineActive := false;
      end;
end;

procedure TPHPEngine.StartupPHP;
var
 DLLName : string;
begin
   if not PHPLoaded then
    begin
      if FDLLFolder <> '' then
         DLLName := IncludeTrailingBackSlash(FDLLFolder) + PHPWin
           else
             DLLName := PHPWin;
      LoadPHP;
      if FReportDLLError then
       begin
         if PHPLib = 0 then raise Exception.CreateFmt('%s not found', [DllName]);
       end;
    end;
end;

procedure TPHPEngine.LockEngine;
begin
  EnterCriticalSection(FLock);
end;

procedure TPHPEngine.UnlockEngine;
begin
  LeaveCriticalSection(FLock);
end;

procedure TPHPEngine.HandleError(Sender: TObject; AText: string;
  AType: TPHPErrorType; AFileName: string; ALineNo: integer);
begin
  LockEngine;
  try
    if Assigned(FOnScriptError) then
      FOnScriptError(Sender, AText, AType, AFileName, ALineNo);
  finally
    UnlockEngine;
  end;
end;

procedure TPHPEngine.HandleLogMessage(Sender: TObject; AText: string);
begin
  LockEngine;
  try
    if Assigned(FOnLogMessage) then
     FOnLogMessage(Sender, AText);
  finally
    UnlockEngine;
  end;
end;

procedure TPHPEngine.PrepareForShutdown;
begin
  LockEngine;
  try
   FWaitForShutdown := true;
  finally
    UnlockEngine;
  end;
end;

procedure TPHPEngine.ShutdownAndWaitFor;
var
 cnt : integer;
 AllClear : boolean;
begin
  PrepareForShutdown;
  
  AllClear := false;
  while not AllClear do
   begin
      try
        cnt := FRequestList.LockList.Count;
       finally
         FRequestList.UnlockList;
       end;
       if cnt <= 0 then
        AllClear := true
         else
           Sleep(250);
   end;
  ShutdownEngine;
end;

function TPHPEngine.GetEngineActive: boolean;
begin
  Result := FEngineActive;
end;

procedure TPHPEngine.UnlockLibraries;
var
 cnt : integer;
begin
  if Assigned(Librarian) then
   begin
     for cnt := 0 to Librarian.Count - 1 do
      Librarian.GetLibrary(cnt).Locked := false;
   end;
end;

{ TPHPMemoryStream }

constructor TPHPMemoryStream.Create;
begin
  inherited;
end;

procedure TPHPMemoryStream.SetInitialSize(ASize: integer);
begin
  Capacity := ASize;
end;

end.


