unit php_thread;

interface

uses
  Windows, Classes, PHPCommon, php4Delphi, PHPTypes, ZendTypes, ZENDAPI, PHPAPI;

type
  TPHPThread = class(TThread)
  private
    { Private declarations }
    PHP : TpsvPHP;
  protected
    procedure Execute; override;
  end;

implementation


{ TPHPThread }

procedure TPHPThread.Execute;
begin
  PHP := TpsvPHP.Create(nil);
  PHP.RunCode('echo "Threaded";');
  PHP.Free;
  sleep(250); //for zend_timeout to kill timer
  try
    //This will release thread allocated resources
    //The better way is to reuse existsing threads
    //to save time and memory
    ts_free_thread;
  except
  end;
end;

end.
