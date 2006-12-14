unit Patchapi;

interface

uses
  Windows, SysUtils;

const
  PATCH_OPTION_USE_BEST = $00000000;  // auto choose best (slower)
  PATCH_OPTION_USE_LZX_BEST = $00000003;  // auto choose best of LZX
  PATCH_OPTION_USE_LZX_A = $00000001;  // normal
  PATCH_OPTION_USE_LZX_B = $00000002;  // better on some x86 binaries
  PATCH_OPTION_USE_LZX_LARGE = $00000004;  // better support for files >8MB
  PATCH_OPTION_NO_BINDFIX = $00010000;  // PE bound imports
  PATCH_OPTION_NO_LOCKFIX = $00020000;  // PE smashed locks
  PATCH_OPTION_NO_REBASE = $00040000;  // PE rebased image
  PATCH_OPTION_FAIL_IF_SAME_FILE = $00080000;  // don't create if same
  PATCH_OPTION_FAIL_IF_BIGGER = $00100000;  // fail if patch is larger than simply compressing new file (slower)
  PATCH_OPTION_NO_CHECKSUM = $00200000;  // PE checksum zero
  PATCH_OPTION_NO_RESTIMEFIX = $00400000;  // PE resource timestamps
  PATCH_OPTION_NO_TIMESTAMP = $00800000;  // don't store new file timestamp in patch
  PATCH_OPTION_SIGNATURE_MD5 = $01000000;  // use MD5 instead of CRC32
  PATCH_OPTION_RESERVED1 = $80000000;  // (used internally)
  PATCH_OPTION_VALID_FLAGS = $80FF0007;
  PATCH_SYMBOL_NO_IMAGEHLP = $00000001;  // don't use imagehlp.dll
  PATCH_SYMBOL_NO_FAILURES = $00000002;  // don't fail patch due to imagehlp failures
  PATCH_SYMBOL_UNDECORATED_TOO = $00000004;  // after matching decorated symbols, try to match remaining by undecorated names
  PATCH_SYMBOL_RESERVED1 = $80000000;  // (used internally)

    //
    //  The following constants can be combined and used as the ApplyOptionFlags
    //  parameter in the patch apply and test apis.
    //

  APPLY_OPTION_FAIL_IF_EXACT = $00000001;  // don't copy new file
  APPLY_OPTION_FAIL_IF_CLOSE = $00000002;  // differ by rebase, bind
  APPLY_OPTION_TEST_ONLY = $00000004;  // don't create new file
  APPLY_OPTION_VALID_FLAGS = $00000007;

    //
    //  In addition to standard Win32 error codes, the following error codes may
    //  be returned via GetLastError() when one of the patch APIs fails.
    //
  ERROR_PATCH_ENCODE_FAILURE = $C00E3101;  // create
  ERROR_PATCH_INVALID_OPTIONS = $C00E3102;  // create
  ERROR_PATCH_SAME_FILE = $C00E3103;  // create
  ERROR_PATCH_RETAIN_RANGES_DIFFER = $C00E3104;  // create
  ERROR_PATCH_BIGGER_THAN_COMPRESSED = $C00E3105;  // create
  ERROR_PATCH_IMAGEHLP_FAILURE = $C00E3106;  // create
  ERROR_PATCH_DECODE_FAILURE = $C00E4101;  // apply
  ERROR_PATCH_CORRUPT = $C00E4102;  // apply
  ERROR_PATCH_NEWER_FORMAT = $C00E4103;  // apply
  ERROR_PATCH_WRONG_FILE = $C00E4104;  // apply
  ERROR_PATCH_NOT_NECESSARY = $C00E4105;  // apply
  ERROR_PATCH_NOT_AVAILABLE = $C00E4106;  // apply

type
  PATCH_PROGRESS_CALLBACK = function (CallbackContext : Pointer;
    CurrentPosition : ULONG; MaximumPosition : ULONG) : boolean; stdcall;

  PPATCH_PROGRESS_CALLBACK = ^PATCH_PROGRESS_CALLBACK;
  TPatchProgressCallBack = PATCH_PROGRESS_CALLBACK;
  PPatchProgressCallBack = ^TPatchProgressCallBack;

  PATCH_SYMLOAD_CALLBACK = function (WhichFile : ULONG;  // 0 for new file, 1 for first old file, etc
  SymbolFileName : LPCSTR; SymType : ULONG;  // see SYM_TYPE imagehlp.h
  SymbolFileCheckSum : ULONG; SymbolFileTimeDate : ULONG;
  ImageFileCheckSum : ULONG; ImageFileTimeDate : ULONG;
  CallbackContext : Pointer) : boolean; stdcall;

  PPATCH_SYMLOAD_CALLBACK = ^PATCH_SYMLOAD_CALLBACK;
  TPatchSymloadCallBack = PATCH_SYMLOAD_CALLBACK;
  PPatchSymloadCallBack = ^TPatchSymloadCallBack;

  PATCH_IGNORE_RANGE =
    record
      OffsetInOldFile : ULONG;
      LengthInBytes : ULONG;
    end;

  PPATCH_IGNORE_RANGE = ^PATCH_IGNORE_RANGE;
  TPatchIgnoreRange = PATCH_IGNORE_RANGE;
  PPatchIgnoreRange = ^TPatchIgnoreRange;

  PATCH_RETAIN_RANGE =
    record
      OffsetInOldFile : ULONG;
      LengthInBytes : ULONG;
      OffsetInNewFile : ULONG;
    end;

  PPATCH_RETAIN_RANGE = ^PATCH_RETAIN_RANGE;
  TPatchRetainRange = PATCH_RETAIN_RANGE;
  PPatchRetainRange = ^TPatchRetainRange;

  PATCH_OLD_FILE_INFO_A =
    record
      SizeOfThisStruct : ULONG;
      OldFileName : LPCSTR;
      IgnoreRangeCount : ULONG;     // maximum 255
      IgnoreRangeArray : PPATCH_IGNORE_RANGE;
      RetainRangeCount : ULONG;     // maximum 255
      RetainRangeArray : PPATCH_RETAIN_RANGE;
    end;

  PPATCH_OLD_FILE_INFO_A = ^PATCH_OLD_FILE_INFO_A;
  TPatchOldFileInfoA = PATCH_OLD_FILE_INFO_A;
  PPatchOldFileInfoA = ^TPatchOldFileInfoA;
  TPatchOldFileInfo = TPatchOldFileInfoA;
  PPatchOldFileInfo = ^TPatchOldFileInfo;

  PATCH_OLD_FILE_INFO_W =
    record
      SizeOfThisStruct : ULONG;
      OldFileName : LPCWSTR;
      IgnoreRangeCount : ULONG;   // maximum 255
      IgnoreRangeArray : PPATCH_IGNORE_RANGE;
      RetainRangeCount : ULONG; // maximum 255
      RetainRangeArray : PPATCH_RETAIN_RANGE;
    end;

  PPATCH_OLD_FILE_INFO_W = ^PATCH_OLD_FILE_INFO_W;
  TPatchOldFileInfoW = PATCH_OLD_FILE_INFO_W;
  PPatchOldFileInfoW = ^TPatchOldFileInfoW;

  PATCH_OLD_FILE_INFO_H =
    record
      SizeOfThisStruct : ULONG;
      OldFileHandle : THandle;
      IgnoreRangeCount : ULONG;  // maximum 255
      IgnoreRangeArray : PPATCH_IGNORE_RANGE;
      RetainRangeCount : ULONG; // maximum 255
      RetainRangeArray : PPATCH_RETAIN_RANGE;
    end;

  PPATCH_OLD_FILE_INFO_H = ^PATCH_OLD_FILE_INFO_H;
  TPatchOldFileInfoH = PATCH_OLD_FILE_INFO_H;
  PPatchOldFileInfoH = ^TPatchOldFileInfoH;


  PATCH_OPTION_DATA =
    record
      SizeOfThisStruct : ULONG;
      SymbolOptionFlags : ULONG; // PATCH_SYMBOL_xxx flags
      NewFileSymbolPath : LPCSTR;  // always ANSI, never Unicode
      OldFileSymbolPathArray : ^LPCSTR;  // array[ OldFileCount ]
      ExtendedOptionFlags : ULONG;
      SymLoadCallback : PPATCH_SYMLOAD_CALLBACK;
      SymLoadContext : Pointer;
    end;

  PPATCH_OPTION_DATA = ^PATCH_OPTION_DATA;
  TPatchOptionData = PATCH_OPTION_DATA;
  PPatchOptionData = ^TPatchOptionData;

    //
    //  Note that PATCH_OPTION_DATA contains LPCSTR paths, and no LPCWSTR (Unicode)
    //  path argument is available, even when used with one of the Unicode APIs
    //  such as CreatePatchFileW.  This is because the underlying system services
    //  for symbol file handling (IMAGEHLP.DLL) only support ANSI file/path names.
    //
    //
    //  A note about PATCH_RETAIN_RANGE specifiers with multiple old files:
    //
    //  Each old version file must have the same RetainRangeCount, and the same
    //  retain range LengthInBytes and OffsetInNewFile values in the same order.
    //  Only the OffsetInOldFile values can differ between old files for retain
    //  ranges.
    //
    //
    //  The following prototypes are interface for creating patches from files.
    //

  function CreatePatchFileA (OldFileName : PChar; NewFileName : PChar;
    PatchFileName : PChar; OptionFlags : ULONG;
    OptionData : PPatchOptionData) : boolean; stdcall;

  function CreatePatchFile (OldFileName : PChar; NewFileName : PChar;
    PatchFileName : PChar; OptionFlags : ULONG;
    OptionData : PPatchOptionData) : boolean; stdcall;

  function CreatePatchFileW (OldFileName : LPCWSTR; NewFileName : LPCWSTR;
    PatchFileName : LPCWSTR; OptionFlags : ULONG;
    OptionData : PPatchOptionData) : boolean; stdcall;

  function CreatePatchFileByHandles (OldFileHandle : THandle;
    NewFileHandle : THandle; PatchFileHandle : THandle; OptionFlags : ULONG;
    OptionData : PPatchOptionData) : boolean; stdcall;

  function CreatePatchFileExA (OldFileCount : ULONG;  // maximum 255
    OldFileInfoArray : PPatchOldFileInfo; NewFileName : LPCSTR;
    PatchFileName : LPCSTR; OptionFlags : ULONG;
    OptionData : PPatchOptionData;  // optional
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  function CreatePatchFileEx (OldFileCount : ULONG;  // maximum 255
    OldFileInfoArray : PPatchOldFileInfo; NewFileName : LPCSTR;
    PatchFileName : LPCSTR; OptionFlags : ULONG;
    OptionData : PPatchOptionData;  // optional
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  function CreatePatchFileExW (OldFileCount : ULONG;  // maximum 255
    OldFileInfoArray : PPatchOldFileInfoW; NewFileName : LPCWSTR;
    PatchFileName : LPCWSTR; OptionFlags : ULONG;
    OptionData : PPatchOptionData;  // optional
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  function CreatePatchFileByHandlesEx (OldFileCount : ULONG;  // maximum 255
    OldFileInfoArray : PPatchOldFileInfoH; NewFileHandle : THandle;
    PatchFileHandle : THandle; OptionFlags : ULONG;
    OptionData : PPatchOptionData;  // optional
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  function ExtractPatchHeaderToFileA (PatchFileName : LPCSTR;
    PatchHeaderFileName : LPCSTR) : boolean;  stdcall;

  function ExtractPatchHeaderToFile (PatchFileName : LPCSTR;
    PatchHeaderFileName : LPCSTR) : boolean;  stdcall;

  function ExtractPatchHeaderToFileW (PatchFileName : LPCWSTR;
    PatchHeaderFileName : LPCWSTR) : boolean; stdcall;

  function ExtractPatchHeaderToFileByHandles (PatchFileHandle : THandle;
    PatchHeaderFileHandle : THandle) : boolean; stdcall;

  //
  //  The following prototypes are interface for creating new file from old file
  //  and patch file.  Note that it is possible for the TestApply API to succeed
  //  but the actual Apply to fail since the TestApply only verifies that the
  //  old file has the correct CRC without actually applying the patch.  The
  //  TestApply API only requires the patch header portion of the patch file,
  //  but its CRC must be fixed up.
  //

  function TestApplyPatchToFileA (PatchFileName : LPCSTR; OldFileName : LPCSTR;
    ApplyOptionFlags : ULONG) : boolean; stdcall;

  function TestApplyPatchToFile (PatchFileName : LPCSTR; OldFileName : LPCSTR;
    ApplyOptionFlags : ULONG) : boolean; stdcall;

  function TestApplyPatchToFileW (PatchFileName : LPCWSTR; OldFileName : LPCWSTR;
    ApplyOptionFlags : ULONG) : boolean; stdcall;

  function TestApplyPatchToFileByHandles (PatchFileHandle : THandle;  // requires GENERIC_READ access
    OldFileHandle : THandle;  // requires GENERIC_READ access
    ApplyOptionFlags : ULONG) : boolean; stdcall;

  function ApplyPatchToFileA (PatchFileName : LPCSTR; OldFileName : LPCSTR;
    NewFileName : LPCSTR; ApplyOptionFlags : ULONG) : boolean; stdcall;

  function ApplyPatchToFile (PatchFileName : LPCSTR; OldFileName : LPCSTR;
    NewFileName : LPCSTR; ApplyOptionFlags : ULONG) : boolean; stdcall;

  function ApplyPatchToFileW (PatchFileName : LPCWSTR; OldFileName : LPCWSTR;
    NewFileName : LPCWSTR; ApplyOptionFlags : ULONG) : boolean; stdcall;

  function ApplyPatchToFileByHandles (PatchFileHandle : THandle;  // requires GENERIC_READ access
    OldFileHandle : THandle;  // requires GENERIC_READ access
    NewFileHandle : THandle;  // requires GENERIC_READ | GENERIC_WRITE
    ApplyOptionFlags : ULONG) : boolean; stdcall;

  function ApplyPatchToFileExA (PatchFileName : LPCSTR; OldFileName : LPCSTR;
    NewFileName : LPCSTR; ApplyOptionFlags : ULONG;
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  function ApplyPatchToFileEx (PatchFileName : LPCSTR; OldFileName : LPCSTR;
    NewFileName : LPCSTR; ApplyOptionFlags : ULONG;
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  function ApplyPatchToFileExW (PatchFileName : LPCWSTR; OldFileName : LPCWSTR;
    NewFileName : LPCWSTR; ApplyOptionFlags : ULONG;
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  function ApplyPatchToFileByHandlesEx (PatchFileHandle : THandle;
    OldFileHandle : THandle; NewFileHandle : THandle; ApplyOptionFlags : ULONG;
    ProgressCallback : PPatchProgressCallBack; CallbackContext : Pointer) : boolean; stdcall;

  //
  //  The following prototypes provide a unique patch "signature" for a given
  //  file.  Consider the case where you have a new foo.dll and the machines
  //  to be updated with the new foo.dll may have one of three different old
  //  foo.dll files.  Rather than creating a single large patch file that can
  //  update any of the three older foo.dll files, three separate smaller patch
  //  files can be created and "named" according to the patch signature of the
  //  old file.  Then the patch applyer application can determine at runtime
  //  which of the three foo.dll patch files is necessary given the specific
  //  foo.dll to be updated.  If patch files are being downloaded over a slow
  //  network connection (Internet over a modem), this signature scheme provides
  //  a mechanism for choosing the correct single patch file to download at
  //  application time thus decreasing total bytes necessary to download.
  //

  function GetFilePatchSignatureA (FileName : LPCSTR; OptionFlags : ULONG;
    OptionData : Pointer; IgnoreRangeCount : ULONG;
    IgnoreRangeArray : PPatchIgnoreRange; RetainRangeCount : ULONG;
    RetainRangeArray : PPatchRetainRange; SignatureBufferSize : ULONG;
    SignatureBuffer : Pointer) : boolean; stdcall;

  function GetFilePatchSignature (FileName : LPCSTR; OptionFlags : ULONG;
    OptionData : Pointer; IgnoreRangeCount : ULONG;
    IgnoreRangeArray : PPatchIgnoreRange; RetainRangeCount : ULONG;
    RetainRangeArray : PPatchRetainRange; SignatureBufferSize : ULONG;
    SignatureBuffer : Pointer) : boolean; stdcall;

  function GetFilePatchSignatureW (FileName : LPCWSTR; OptionFlags : ULONG;
    OptionData : Pointer; IgnoreRangeCount : ULONG;
    IgnoreRangeArray : PPatchIgnoreRange; RetainRangeCount : ULONG;
    RetainRangeArray : PPatchRetainRange; SignatureBufferSizeInBytes : ULONG;
  SignatureBuffer : Pointer) : boolean; stdcall;

  function GetFilePatchSignatureByHandle (FileHandle : THandle;
    OptionFlags : ULONG; OptionData : Pointer; IgnoreRangeCount : ULONG;
    IgnoreRangeArray : PPatchIgnoreRange; RetainRangeCount : ULONG;
    RetainRangeArray : PPatchRetainRange; SignatureBufferSize : ULONG;
    SignatureBuffer : Pointer) : Boolean; stdcall;


implementation


function CreatePatchFileA; external 'mspatchc.dll' name 'CreatePatchFileA';
function CreatePatchFileW; external 'mspatchc.dll' name 'CreatePatchFileW';
function CreatePatchFile; external  'mspatchc.dll' name 'CreatePatchFileA';

function CreatePatchFileByHandles; external 'mspatchc.dll' name 'CreatePatchFileByHandles';

function CreatePatchFileExA; external 'mspatchc.dll' name 'CreatePatchFileExA';
function CreatePatchFileExW; external 'mspatchc.dll' name 'CreatePatchFileExW';
function CreatePatchFileEx; external 'mspatchc.dll' name 'CreatePatchFileExA';

function CreatePatchFileByHandlesEx; external 'mspatchc.dll' name 'CreatePatchFileByHandlesEx';

function ExtractPatchHeaderToFileA; external 'mspatchc.dll' name 'ExtractPatchHeaderToFileA';
function ExtractPatchHeaderToFileW; external 'mspatchc.dll' name 'ExtractPatchHeaderToFileW';
function ExtractPatchHeaderToFile; external 'mspatchc.dll' name 'ExtractPatchHeaderToFileA';

function ExtractPatchHeaderToFileByHandles; external 'mspatchc.dll' name 'ExtractPatchHeaderToFileByHandles';

function TestApplyPatchToFileA; external 'mspatcha.dll' name 'TestApplyPatchToFileA';
function TestApplyPatchToFileW; external 'mspatcha.dll' name 'TestApplyPatchToFileW';
function TestApplyPatchToFile; external 'mspatcha.dll' name 'TestApplyPatchToFileA';

function TestApplyPatchToFileByHandles; external 'mspatcha.dll' name 'TestApplyPatchToFileByHandles';

function ApplyPatchToFileA; external 'mspatcha.dll' name 'ApplyPatchToFileA';
function ApplyPatchToFileW; external 'mspatcha.dll' name 'ApplyPatchToFileW';
function ApplyPatchToFile; external 'mspatcha.dll' name 'ApplyPatchToFileA';

function ApplyPatchToFileByHandles; external 'mspatcha.dll' name 'ApplyPatchToFileByHandles';

function ApplyPatchToFileExA; external 'mspatcha.dll' name 'ApplyPatchToFileExA';
function ApplyPatchToFileExW; external 'mspatcha.dll' name 'ApplyPatchToFileExW';
function ApplyPatchToFileEx; external 'mspatcha.dll' name 'ApplyPatchToFileExA';

function ApplyPatchToFileByHandlesEx; external 'mspatcha.dll' name 'ApplyPatchToFileByHandlesEx';

function GetFilePatchSignatureA; external 'mspatcha.dll' name 'GetFilePatchSignatureA';
function GetFilePatchSignatureW; external 'mspatcha.dll' name 'GetFilePatchSignatureW';
function GetFilePatchSignature; external 'mspatcha.dll' name 'GetFilePatchSignatureA';

function GetFilePatchSignatureByHandle; external 'mspatcha.dll' name 'GetFilePatchSignatureByHandle';

end.

