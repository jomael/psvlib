 {*******************************************************}
{                   PHP4Applications                    }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{ http://users.chello.be/ws36637                        }
{*******************************************************}

{ $Id: php4App.dpr,v 7.0 04/2007 delphi32 Exp $ }

{$I PHP.INC}

library php4App;
uses
  Windows,
  SysUtils,
  ZendTypes,
  PHPTypes,
  ZendAPI,
  PHPAPI,
  php4AppUnit;

{$R *.RES}



exports
  InitRequest,
  DoneRequest,
  ExecutePHP,
  ExecuteCode,
  RegisterVariable,
  GetResultText,
  GetVariable,
  SaveToFile,
  GetVariableSize,
  GetResultBufferSize;

begin
  InitEngine;
end.
