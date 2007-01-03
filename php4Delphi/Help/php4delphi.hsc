HelpScribble project file.
12
absyvqvhz `bsgjner-1N4R808P
0
1
php4delphi



TRUE

E:\DEVELO~1\PHP4DE~1\source\PHP4DE~1\Help,G:\PHP4DE~1\source\help,E:\SOURCE~1\PHP4DE~1\source\PHP4DE~1\Help
1
BrowseButtons()
0
FALSE

FALSE
TRUE
16777215
0
16711680
8388736
255
FALSE
FALSE
FALSE
137
10
php4delphi_Unit
php4delphi Unit
php4delphi Unit;Units



Imported,Updated



FALSE
33
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 php4delphi unit \{keepn\} 
\par \cf0\b0\fs20 PHP4Delphi is a Delphi interface to PHP for \b Delphi 5, 6 and 7
\par \b0 PHP4Delphi allows \lang2057\f1 you to \lang6153\f0 execut\lang2057\f1 e\lang6153\f0  PHP scripts \lang2057\f1 from \lang6153\f0 within \lang2057\f1 a\lang6153\f0  Delphi program directly\lang2057\f1 .  You can execute scripts\lang6153\f0  from file or\lang2057\f1  directly as a string from\lang6153\f0  memory.
\par You can read and write global PHP variables and set the result value\lang2057\f1  which will be returned to Delphi\lang6153\f0 .
\par \cf2 Author: Serhiy Perevoznyk (\cf1\ul serge_perevoznyk@hotmail.com\cf2\ulnone )
\par Home page: \cf1\ul http://users.chello.be/ws36637\cf2\ulnone 
\par 
\par You can download the latest version of PHP from \cf1\ul http://www.php.net/downloads.php\cf2\ulnone 
\par You have to download and install PHP separately. It is not included in the package. For more information on the PHP Group and the PHP project, please see \cf1\ul http://www.php.net\cf2\ulnone .
\par 
\par You need to ensure that the dlls which php uses can be found. php4ts.dll is always used. If you are using any php extension dlls then you will need those as well. 
\par To make sure that the dlls can be found, you \lang2057\f1 need to\lang6153\f0  copy them to the system directory (e.g. winnt/system32 or  windows/system)\lang2057\f1  on your machine\lang6153\f0 .
\par 
\par Copy the file, php.ini-dist to your %WINDOWS% directory on\lang2057\f1  \lang6153\f0 Windows 95/98 or to your %SYSTEMROOT% directory under Windows NT,\lang2057\f1  \lang6153\f0 Windows 2000 or Windows XP and rename it to php.ini. Your %WINDOWS% or\lang2057\f1  \lang6153\f0 %SYSTEMROOT% directory is typically:
\par c:\\windows for Windows 95/98
\par c:\\winnt or c:\\winnt40 for NT/2000/XP servers
\par \pard\sb55 
\par \pard\sb95\b Classes
\par \pard\b0\strike EDelphiErrorEx\strike0\{linkID=20\}
\par \strike TPHPVariable\strike0\{linkID=30\}
\par \strike TPHPVariables\strike0\{linkID=120\}
\par \strike TPHPConstant\strike0\{linkID=210\}
\par \strike TPHPConstants\strike0\{linkID=260\}
\par \strike TpsvPHP\strike0\{linkID=320\}
\par \cf3 
\par \pard\sb95\cf2\b Types
\par \pard\sb55\b0 TPHPLogMessage = procedure (Sender : TObject; AText : string) of object;
\par TPHPErrorEvent = procedure (Sender : TObject; AText : string; AType : integer) of object;
\par \pard\cf3 
\par 
\par }
20
EDelphiErrorEx_Component
EDelphiErrorEx Component
Components;EDelphiErrorEx



Imported


EDelphiErrorEx;EDelphiErrorEx_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b EDelphiErrorEx Class  
\par \cf3\b0\fs20\{keepn\} 
\par \pard\sb75\cf4\b Unit
\par \pard\cf3\b0\strike php4delphi\strike0\{linkID=10\}
\par \pard\sb55\cf4\b Description
\par \pard\b0 EdelphiErrorEx is the exception class for php4Delphi component\cf0 
\par 
\par }
30
TPHPVariable_Component
TPHPVariable Component
Components;TPHPVariable



Imported,Updated


TPHPVariable;TPHPVariable_Object
FALSE
20
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue128;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TPHPVariable Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=60>list\}\tab\tab\strike Methods\strike0\{linkID=40>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike php4delphi\strike0\{linkID=10\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 .
\par TPHPVariable represents a PHP \cf3\ul variable\cf1\ulnone\{linkID=35\}\cf4  in a collection of variables.
\par 
\par \cf0 When a PHP script \f1 is \f0 executed, the information from \lang2057\f1 all\lang6153\f0  \cf4 TPHPVariable \lang2057\f1 objects\cf0\lang6153\f0  \lang2057\f1 are\lang6153\f0  automatically made available to the script\lang2057\f1  through the $_GET superglobal.  If you have Register_Globals = true in your php.ini file, they will be available as globals.
\par 
\par For example if you have assigned a PHPVariable at runtime in your delphi application with the Displayname 'Username' and the value 'John Doe' you can access the variable in your php script like this.
\par 
\par \cf5 <?php echo $Username ?>\cf0 
\par \lang6153\f0 
\par 
\par 
\par 
\par }
35
Scribble35
def_Variable




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang2057{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss Arial;}{\f3\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Variable\cf0\b0\f1\fs20 
\par 
\par \cf2\lang6153\f2 A variable is an identifier whose value can change at runtime. Put differently, a variable is a name for a location in memory; you can use the name to read or write to the memory location. Variables are like containers for data\lang2057\f3 .\cf0\f1 
\par }
40
php4delphi_TPHPVariable_Methods_Popup
php4delphi_TPHPVariable_Methods_Popuprma




Imported



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable Methods  
\par \cf2\b0\strike\fs20 TPHPVariable\strike0\{link=TPHPVariable_Component>main\}\{keepn\} 
\par \cf0 
\par \strike GetDisplayName\strike0\{linkID=50>main\}
\par 
\par }
50
TPHPVariable_GetDisplayName
TPHPVariable GetDisplayName Method
GetDisplayName;Methods



Imported,Updated



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable.GetDisplayName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariable\strike0\{linkID=30\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function  GetDisplayName : string; override;
\par \pard\sb95\b\f0 Description
\par \pard\b0\f2 This method is used internally by Delphi.\lang2057   
\par \lang6153\f0 
\par 
\par }
60
php4delphi_TPHPVariable_Properties_Popup
php4delphi_TPHPVariable_Properties_Popupoperty. 




Imported



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable Properties  
\par \cf2\b0\strike\fs20 TPHPVariable\cf3\strike0\{linkID=30>main\}\cf4 
\par \cf0 
\par \strike AsBoolean\strike0\{linkID=80>main\}
\par \strike AsFloat\strike0\{linkID=100>main\}
\par \strike AsInteger\strike0\{linkID=70>main\}
\par \strike AsString\strike0\{linkID=90>main\}
\par \cf2\strike\f1 Name\cf3\strike0\{linkID=115>main\}\cf0\f0 
\par \strike Value\strike0\{linkID=110>main\}
\par 
\par }
70
TPHPVariable_AsInteger
TPHPVariable AsInteger Property
AsInteger;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable.AsInteger property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariable\strike0\{linkID=30\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsInteger : integer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the value of a variable as an Integer value
\par 
\par }
80
TPHPVariable_AsBoolean
TPHPVariable AsBoolean Property
AsBoolean;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable.AsBoolean property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariable\strike0\{linkID=30\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsBoolean : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the value of a variable as a Boolean value
\par 
\par }
90
TPHPVariable_AsString
TPHPVariable AsString Property
AsString;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable.AsString property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariable\strike0\{linkID=30\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsString  : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the value of a variable as a String value
\par 
\par }
100
TPHPVariable_AsFloat
TPHPVariable AsFloat Property
AsFloat;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable.AsFloat property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariable\strike0\{linkID=30\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsFloat   : double;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the value of a variable as a Float value.
\par 
\par }
110
TPHPVariable_Value
TPHPVariable Value Property
Properties;Value



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariable.Value property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariable\strike0\{linkID=30\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Value : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Represents the value of a variable as a String (default) value.
\par 
\par }
115
Scribble115
TPHPVariable Name Property
Properties,Name



Writing



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang6153{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss Arial;}{\f3\fmodern Courier New;}{\f4\fmodern\fcharset0 Courier New;}{\f5\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TPHPVariable Name Property\cf2\{keepn\}\cf0\b0\f1\fs20 
\par 
\par \pard\sb95\cf3\b\f2 Applies To
\par \pard\b0\strike TPHPVariable\strike0\{linkID=30\}
\par \pard\sb95\b Visibility
\par \pard\b0\f3 PUBLISHED
\par \pard\sb95\b\f2 Declaration
\par \pard\b0\f3 property \f4 Name\f3  : string;
\par \pard\sb95\b\f2 Description
\par \pard\b0 Represents the \f5 name of the PHPVariable item.  This is the name of the phpvariable, as it will be available to your php scripts.
\par 
\par \lang2057\i Note:\i0  Keep in mind that variable names in php are case-sensitive.\cf0\lang6153\f1 
\par }
120
TPHPVariables_Component
TPHPVariables Component
Components;TPHPVariables



Imported,Updated


TPHPVariables;TPHPVariables_Object
FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TPHPVariables Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=190>list\}\tab\tab\strike Methods\strike0\{linkID=130>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike php4delphi\strike0\{linkID=10\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 Collection of the PHP variables\lang2057\f1  (\cf3\strike TPHPVariable\cf1\strike0\{linkID=30\}\cf4 )\lang6153\f0 . 
\par 
\par This collection \lang2057\f1 represents what would normally be contained in the \cf0\lang6153\f0 QUERY_STRING\lang2057\f1  available to a php script\lang6153\f0  (the information after the '?' in an URL).
\par 
\par 
\par }
130
php4delphi_TPHPVariables_Methods_Popup
php4delphi_TPHPVariables_Methods_Popup c




Imported



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables Methods  
\par \cf2\b0\strike\fs20 TPHPVariables\strike0\{link= TPHPVariables_Component>main\}\{keepn\}
\par \cf0 
\par \strike Add\strike0\{linkID=140>main\}
\par \strike AddRawString\strike0\{linkID=170>main\}
\par \strike ByName\strike0\{linkID=180>main\}
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike GetOwner\strike0\{link=!AL(`TComponent_GetOwner',1,`',`Main')\}
\par \strike GetVariables\strike0\{linkID=150>main\}
\par \strike IndexOf\strike0\{linkID=160>main\}
\par 
\par }
140
TPHPVariables_Add
TPHPVariables Add Method
Add;Methods



Imported;Updated



FALSE
17
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables.Add method 
\par \cf0\lang2057\b0\f1\fs20 Example\cf1\lang6153\b\f0\fs24  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariables\strike0\{linkID=120\}
\par \pard\sb95\b Visibility
\par \pard\b0\f2 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f2 function Add: TPHPVariable;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Creates a new TPHPVariable instance and adds it to the Items array.
\par Call Add to create an item in the collection. The new item is placed at the end of the Items array.
\par 
\par Add returns the new \f1 TPHPVariable \f0 collection item.
\par 
\par }
145
Scribble145
TPHPVariables.Add Example




Writing


Example
FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang2057{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;}
\viewkind4\uc1\pard\cf1\b\fs32 TPHPVariables.Add Example\cf0\b0\f1\fs20 
\par 
\par 
\par }
150
TPHPVariables_GetVariables
TPHPVariables GetVariables Method
GetVariables;Methods



Imported,Updated



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fmodern\fcharset0 Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red0\green128\blue128;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables.GetVariables method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariables\strike0\{linkID=120\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC\lang2057\f2  - \cf4\b Depreciated\cf3\lang6153\b0\f1 
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function GetVariables : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns the QUERY STRING \cf0 (the information after the '?' in an URL). This method is obsolete and exists for compatibility with php4Delphi version 4\cf3 
\par 
\par }
160
TPHPVariables_IndexOf
TPHPVariables IndexOf Method
IndexOf;Methods



Imported;Updated



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables.IndexOf method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariables\strike0\{linkID=120\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function IndexOf(AName : string) : integer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns the index of the first variable in the list with a specified name.
\par \f2 If AName does not exist -1 is returned.\f0 
\par 
\par }
170
TPHPVariables_AddRawString
TPHPVariables AddRawString Method
AddRawString;Methods



Imported,Updated



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fmodern\fcharset0 Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red0\green128\blue128;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables.AddRawString method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariables\strike0\{linkID=120\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC\lang2057\f2  - \cf4\b Depreciated\cf3\lang6153\f1 
\par \pard\sb95\f0 Declaration
\par \pard\b0\f1 procedure AddRawString(AString : string);
\par \pard\sb95\b\f0 Description
\par \pard\b0 Parses response result of PHP script and changes values of the variables after script executed.
\par \pard\sa115 Do not call AddRawString directly. \cf0 This method is obsolete and exists for compatibility with php4Delphi version 4\cf3 
\par 
\par }
180
TPHPVariables_ByName
TPHPVariables ByName Method
ByName;Methods



Imported;Updated



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables.ByName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariables\strike0\{linkID=120\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function ByName(AName : string) : TPHPVariable;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Return \lang2057\f2 a T\lang6153\f0 PHPvariable \lang2057\f2 given the\lang6153\f0  variable name.
\par 
\par \lang2057\f2 If AName doesnt exist nil is returned\lang6153\f0 
\par 
\par }
190
php4delphi_TPHPVariables_Properties_Popup
php4delphi_TPHPVariables_Properties_Popup




Imported



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables Properties  
\par \cf2\b0\strike\fs20 TPHPVariables\cf3\strike0\{link=>main\}\cf4\{keepn\}
\par \cf0 
\par \strike Items\strike0\{linkID=200>main\}
\par 
\par }
200
TPHPVariables_Items
TPHPVariables Items Property
Items;Properties



Imported,Updated



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPVariables.Items property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPVariables\strike0\{linkID=120\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Items[Index: Integer]: \cf2\strike TPHPVariable\cf4\strike0\{linkID=30\}\cf3 ; Default;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Use Items to access individual variables in the collection. The value of the Index parameter corresponds to the Index property of TPHPVariable. It represents the position of the PHP variable in the collection.\lang2057\f2   Use  \cf2\strike TpsvPHP.VariableCount\cf4\strike0\{linkID=650\}\cf3  property to retrieve the total number of items.\lang6153\f0 
\par 
\par }
210
TPHPConstant_Component
TPHPConstant Component
Components;TPHPConstant



Imported


TPHPConstant;TPHPConstant_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TPHPConstant Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=240>list\}\tab\tab\strike Methods\strike0\{linkID=220>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike php4delphi\strike0\{linkID=10\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 Represents the global PHP constant\cf0 
\par 
\par }
220
php4delphi_TPHPConstant_Methods_Popup
php4delphi_TPHPConstant_Methods_Popup




Imported



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstant Methods  
\par \cf2\b0\strike\fs20 TPHPConstant\strike0\{link= TPHPConstant_Component>main\}\{keepn\}
\par \cf0 
\par \strike GetDisplayName\strike0\{linkID=230>main\}
\par 
\par }
230
TPHPConstant_GetDisplayName
TPHPConstant GetDisplayName Method
GetDisplayName;Methods



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstant.GetDisplayName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPConstant\strike0\{linkID=210\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function GetDisplayName : string; override;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Returns the value of the DisplayName property. Use GetDisplayName to return the display name of the constant.
\par 
\par }
240
php4delphi_TPHPConstant_Properties_Popup
php4delphi_TPHPConstant_Properties_Popupoperty. 




Imported



FALSE
9
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstant Properties  
\par \cf2\b0\strike\fs20 TPHPConstant\strike0\{link=TPHPConstant_Component>main\}\{keepn\} 
\par \cf0 
\par \strike Name\strike0\{link=!AL(`TComponent_Name',1,`',`Main')\}
\par \strike Value\strike0\{linkID=250>main\}
\par 
\par }
250
TPHPConstant_Value
TPHPConstant Value Property
Properties;Value



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstant.Value property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPConstant\strike0\{linkID=210\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Value : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Represents the value of the constant
\par 
\par }
255
Scribble255
TPHPConstant Name Property




Writing



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0\deflang6153{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss Arial;}{\f3\fmodern Courier New;}{\f4\fmodern\fcharset0 Courier New;}{\f5\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TPHPConstant Name Property\cf2\{keepn\}\cf0\b0\f1\fs20 
\par 
\par \pard\sb95\cf3\b\f2 Applies To
\par \pard\b0\strike TPHPConstant\strike0\{linkID=210\}
\par \pard\sb95\b Visibility
\par \pard\b0\f3 PUBLISHED
\par \pard\sb95\b\f2 Declaration
\par \pard\b0\f3 property \f4 Name\f3  : string;
\par \pard\sb95\b\f2 Description
\par \pard\b0 Represents the \f5 name\f2  of the constant\f5  as it will appear to your PHP Scripts\cf0\f1 
\par }
260
TPHPConstants_Component
TPHPConstants Component
Components;TPHPConstants



Imported


TPHPConstants;TPHPConstants_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TPHPConstants Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=300>list\}\tab\tab\strike Methods\strike0\{linkID=270>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike php4delphi\strike0\{linkID=10\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 Represents an array of PHP constants.\cf0 
\par 
\par }
270
php4delphi_TPHPConstants_Methods_Popup
php4delphi_TPHPConstants_Methods_Popup




Imported



FALSE
11
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstants Methods  
\par \cf2\b0\strike\fs20 TPHPConstants\strike0\{link=TPHPConstants_Component>main\}\{keepn\} 
\par \cf0 
\par \strike Add\strike0\{linkID=280>main\}
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike GetOwner\strike0\{link=!AL(`TComponent_GetOwner',1,`',`Main')\}
\par \strike IndexOf\strike0\{linkID=290>main\}
\par 
\par }
280
TPHPConstants_Add
TPHPConstants Add Method
Add;Methods



Imported



FALSE
16
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstants.Add method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPConstants\strike0\{linkID=260\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function Add: TPHPConstant;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Creates a new TPHPConstant \f2 item \f0 and adds it to the Items array.
\par Call Add to create an item in the collection. The new item is placed at the end of the Items array.
\par 
\par Add returns the new \f2 TPHPConstant \f0 collection item.
\par 
\par }
290
TPHPConstants_IndexOf
TPHPConstants IndexOf Method
IndexOf;Methods



Imported,Updated



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstants.IndexOf method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPConstants\strike0\{linkID=260\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function IndexOf(AName : string) : integer;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Finds the index number of a constant in the Items array from its name.
\par 
\par \f2 If AName does not exist it returns -1.\f0 
\par }
300
php4delphi_TPHPConstants_Properties_Popup
php4delphi_TPHPConstants_Properties_Popupthe Ite




Imported



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstants Properties  
\par \cf2\b0\strike\fs20 TPHPConstants\strike0\{link=TPHPConstants_Component>main\}\{keepn\} 
\par \cf0 
\par \strike Items\strike0\{linkID=310>main\}
\par 
\par }
310
TPHPConstants_Items
TPHPConstants Items Property
Items;Properties



Imported,Updated



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPConstants.Items property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPConstants\strike0\{linkID=260\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Items[Index: Integer]: TPHPConstant; Default;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Provides indexed access to the items in the collection.
\par Use Items to access individual items in the collection. The value of the Index parameter corresponds to the Index property of TCollectionItem. It represents the position of the item in the collection.\f2   Use TpsvPHP.ConstantCount to get the total number of Constants assigned.\f0 
\par 
\par }
320
TpsvPHP_Component
TpsvPHP Component
Components;TpsvPHP



Imported,Updated


TpsvPHP;TpsvPHP_Object
FALSE
14
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TpsvPHP Component  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=610>list\}\tab\tab\strike Methods\strike0\{linkID=330>list\}\tab\tab\strike Events\cf1\strike0\{linkID=520>list\}\cf3\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike php4delphi\strike0\{linkID=10\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\cf0\b0 TpsvPHP component \lang2057\f1 can be dropped on a form, and \lang6153\f0 allows\lang2057\f1  your application\lang6153\f0  to execute PHP scripts directly without a Web Server.
\par 
\par \lang2057\f1 Scripts can be executed as a simple string, or from a file on disk.
\par 
\par With the introduction of php4Delphi 5.3 you can nowscript a delphi applications properties of components using the TpsvPHP component.  Further discussion of how to do this\cf3\strike  here.\cf1\lang6153\strike0\f0\{linkID=1320\}\cf0 
\par 
\par }
330
php4delphi_TpsvPHP_Methods_Popup
php4delphi_TpsvPHP_Methods_Popupcute PHP




Imported,Updated



FALSE
27
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP Methods  
\par \cf2\b0\strike\fs20 TpsvPHP\cf3\strike0\{linkID=320>main\}\cf4\{keepn\} 
\par \cf0 
\par \strike AddModule\strike0\{linkID=410>main\}
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike Destroy\strike0\{link=!AL(`TComponent_Destroy',1,`',`Main')\}
\par \strike Execute\strike0\{linkID=470>main\}
\par \strike GetThreadSafeResourceManager\strike0\{linkID=450>main\}
\par \strike HandleRequest\strike0\{linkID=430>main\}
\par \strike PrepareIniEntry\strike0\{linkID=350>main\}
\par \strike PrepareModule\strike0\{linkID=340>main\}
\par \strike PrepareResult\strike0\{linkID=380>main\}
\par \strike PrepareVariables\strike0\{linkID=390>main\}
\par \strike RegisterConstants\strike0\{linkID=460>main\}
\par \strike RegisterInternalConstants\strike0\{linkID=400>main\}
\par \strike RemoveModule\strike0\{linkID=420>main\}
\par \strike RunCode\strike0\{linkID=480>main\}
\par \strike RunTime\strike0\{linkID=440>main\}
\par \strike ShutdownModule\strike0\{linkID=510>main\}
\par \strike ShutdownRequest\strike0\{linkID=370>main\}
\par \strike StartupModule\strike0\{linkID=500>main\}
\par \strike StartupRequest\strike0\{linkID=360>main\}
\par \strike VariableByName\strike0\{linkID=490>main\}
\par 
\par }
340
TpsvPHP_PrepareModule
TpsvPHP PrepareModule Method
Methods;PrepareModule



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.PrepareModule method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure PrepareModule; virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Prepares PHP SAPI module to execute. Override this method to change specified behavior of PHP interpreter.
\par 
\par }
350
TpsvPHP_PrepareIniEntry
TpsvPHP PrepareIniEntry Method
Methods;PrepareIniEntry



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.PrepareIniEntry method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure PrepareIniEntry; virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Changes default values of PHP interpreter parameters in memory. Does not changes php.ini file.
\par 
\par }
360
TpsvPHP_StartupRequest
TpsvPHP StartupRequest Method
Methods;StartupRequest



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.StartupRequest method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure StartupRequest; virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Startup of PHP request. Every time when PHP script executes, new request started if KeepSession property equal false.
\par 
\par }
370
TpsvPHP_ShutdownRequest
TpsvPHP ShutdownRequest Method
Methods;ShutdownRequest



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.ShutdownRequest method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure ShutdownRequest; virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Shutdown PHP request.
\par 
\par }
380
TpsvPHP_PrepareResult
TpsvPHP PrepareResult Method
Methods;PrepareResult



Imported,Updated



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.PrepareResult method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure PrepareResult(TSRMLS_D : pointer); virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Parses the PHP script result and returns values of PHP variables to Variables collection.
\par Uses only if value of \cf2\strike KeepSession\cf4\strike0\{linkID=720\}\cf3  property equals false
\par 
\par }
390
TpsvPHP_PrepareVariables
TpsvPHP PrepareVariables Method
Methods;PrepareVariables



Imported,Updated



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.PrepareVariables method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure PrepareVariables(TSRMLS_D : pointer); virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Parses the PHP script result and returns values of PHP variables to Variables collection.
\par Uses only if value of\cf2\strike  KeepSession\cf4\strike0\{linkID=720\}\cf3  property equals true
\par 
\par }
400
TpsvPHP_RegisterInternalConstants
TpsvPHP RegisterInternalConstants Method
Methods;RegisterInternalConstants



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.RegisterInternalConstants method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure RegisterInternalConstants(TSRMLS_DC : pointer); virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Regsters internal psvPHP constants
\par 
\par }
410
TpsvPHP_AddModule
TpsvPHP AddModule Method
AddModule;Methods



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.AddModule method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure AddModule(AModule : Pointer); virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Uses internally to register TPHPLibrary component
\par 
\par }
420
TpsvPHP_RemoveModule
TpsvPHP RemoveModule Method
Methods;RemoveModule



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.RemoveModule method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure RemoveModule(AModule : Pointer); virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Uses internally to remove TPHPLibrary component from the list of available libraries
\par 
\par }
430
TpsvPHP_HandleRequest
TpsvPHP HandleRequest Method
HandleRequest;Methods



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.HandleRequest method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure HandleRequest(ht : integer; return_value : pzval; this_ptr : pzval;      return_value_used : integer; TSRMLS_DC : pointer); virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Internal method to call the function from TPHPLibrary component
\par 
\par }
440
TpsvPHP_RunTime
TpsvPHP RunTime Method
Methods;RunTime



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.RunTime method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function RunTime : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns the state of the component. If Runtime = false then the component is in a form being manipulated by the form designer
\par 
\par }
450
TpsvPHP_GetThreadSafeResourceManager
TpsvPHP GetThreadSafeResourceManager Method
GetThreadSafeResourceManager;Methods



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.GetThreadSafeResourceManager method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function GetThreadSafeResourceManager : pointer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns pointer to PHP thread safe resources manager
\par 
\par }
460
TpsvPHP_RegisterConstants
TpsvPHP RegisterConstants Method
Methods;RegisterConstants



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.RegisterConstants method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure RegisterConstants;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Performs registration of PHP constants
\par 
\par }
470
TpsvPHP_Execute
TpsvPHP Execute Method
Execute;Methods



Imported,Updated,Check



FALSE
22
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.Execute method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function  Execute : string; overload;
\par function  Execute(AFileName : string) : string; overload;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\lang2057\b0\f2 The \lang6153\f0 Execute\lang2057\f2  method will execute\lang6153\f0  a PHP script. The \lang2057\f2 function returns the output of the php script contained in the file AFilename as a string.
\par The second overloaded procedure can be used if you have not set the \cf2\strike Filename\cf4\strike0\{linkID=680\}\cf3  property of the TpsvPHP Component, or if you wish to execute a seperate file\lang6153\f0 
\par \lang2057\f2 The following are equivalent.\lang6153\f0 
\par 
\par \lang2057\f2\tab psvPHP1.Filename := 'C:\\myphpfile.php';
\par \tab Result := psvPHP1.Execute;
\par and
\par \tab Result := psvPHP1.Execute('C:\\myphpfile.php');\lang6153\f0 
\par 
\par 
\par }
480
TpsvPHP_RunCode
TpsvPHP RunCode Method
Methods;RunCode



Imported,Updated



FALSE
21
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fmodern\fcharset0 Courier New;}{\f3\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.RunCode method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function  RunCode(ACode : string) : string; overload;
\par function  RunCode(ACode : TString\f2 s\f1 ) : string; overload;
\par \pard\sb95\b\f0 Description
\par \pard\lang2057\b0\f3 Use RunCode if you wish to execute some php code without first having to save it to a file.  As with \cf2\strike Execute\cf4\strike0\{linkID=470\},\cf3  RunCode returns the output of the php script that is executed.
\par 
\par You may either pass a string or any TStrings  descendant (such as TStringlist, TMemo.lines, TListbox.Items) to this function to run your code.
\par 
\par Please note, it is not possible to execute a usual php/html page using RunCode, as it uses the eval function.  Basically this means that you cannot break out of a set of <?php ?> tags.  All code must be as though it was within one set of tags.  If you wish to do this, save your script to a file first and then execute it using \cf2\strike Execute\cf4\strike0\{linkID=470\}\cf3 .
\par 
\par \i Note: Ensure that you do not enclose your code in <?php ?> tags.\lang6153\i0\f0 
\par \pard\sa115 
\par 
\par }
490
TpsvPHP_VariableByName
TpsvPHP VariableByName Method
Methods;VariableByName



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.VariableByName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function  VariableByName(AName : string) : TPHPVariable;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns PHP variable by name.\f2  This simply calls \cf2\strike TPHPVariables.ByName\cf4\strike0\{linkID=180\}\cf3\f0 
\par 
\par }
500
TpsvPHP_StartupModule
TpsvPHP StartupModule Method
Methods;StartupModule



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.StartupModule method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure StartupModule; virtual;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Use this method to start PHP engine explicitly
\par 
\par }
510
TpsvPHP_ShutdownModule
TpsvPHP ShutdownModule Method
Methods;ShutdownModule



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.ShutdownModule method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure ShutdownModule; virtual;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Use this method to stop PHP engine explicitly
\par 
\par }
520
php4delphi_TpsvPHP_Events_Popup
php4delphi_TpsvPHP_Events_Popupgc




Imported



FALSE
15
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP Events  
\par \cf2\b0\strike\fs20 TpsvPHP\strike0\{link=TpsvPHP_Component>main\}\{keepn\} 
\par \cf0 
\par \strike AfterExecute\strike0\{linkID=600>main\}
\par \strike BeforeExecute\strike0\{linkID=590>main\}
\par \strike OnLogMessage\strike0\{linkID=530>main\}
\par \strike OnModuleShutdown\strike0\{linkID=560>main\}
\par \strike OnModuleStartup\strike0\{linkID=550>main\}
\par \strike OnRequestShutdown\strike0\{linkID=580>main\}
\par \strike OnRequestStartup\strike0\{linkID=570>main\}
\par \strike OnScriptError\strike0\{linkID=540>main\}
\par 
\par }
530
TpsvPHP_OnLogMessage
TpsvPHP OnLogMessage Event
Events;OnLogMessage



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.OnLogMessage event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property OnLogMessage : TPHPLogMessage;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Occurs when PHP interpreter writes message to log file
\par 
\par }
540
TpsvPHP_OnScriptError
TpsvPHP OnScriptError Event
Events;OnScriptError



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.OnScriptError event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property OnScriptError : \cf2\strike TPHPErrorEvent\cf4\strike0\{linkID=545\}\cf3 ;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Occurs on script error. Write an OnScriptError event handler to perform specific actions when an error occurs within the PHP script
\par 
\par }
545
Scribble545
php4Delphi_Types




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\fs32 Types in php4Delphi unit.
\par \cf2\{keepn\}\cf1 
\par \cf0\lang1033\b0\f1\fs20 
\par \pard\sb55\cf3\lang6153\f2 TPHPLogMessage = procedure (Sender : TObject; AText : string) of object;
\par \pard TPHPErrorEvent = procedure (Sender : TObject; AText : string; AType : integer) of object;\cf0\lang1033\f1 
\par }
550
TpsvPHP_OnModuleStartup
TpsvPHP OnModuleStartup Event
Events;OnModuleStartup



Imported;Updated



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.OnModuleStartup event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property OnModuleStartup : TNotifyEvent;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Occurs when SAPI module\lang2057\f2  is\lang6153\f0  started
\par 
\par }
560
TpsvPHP_OnModuleShutdown
TpsvPHP OnModuleShutdown Event
Events;OnModuleShutdown



Imported,Updated



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.OnModuleShutdown event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property OnModuleShutdown : TNotifyEvent;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Occurs when SAPI module\lang2057\f2  is\lang6153\f0  shutdown
\par 
\par }
570
TpsvPHP_OnRequestStartup
TpsvPHP OnRequestStartup Event
Events;OnRequestStartup



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.OnRequestStartup event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property OnRequestStartup : TNotifyEvent;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Occurs on request startup.
\par 
\par }
580
TpsvPHP_OnRequestShutdown
TpsvPHP OnRequestShutdown Event
Events;OnRequestShutdown



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.OnRequestShutdown event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property OnRequestShutdown : TNotifyEvent;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Occurs on request shutdown
\par 
\par }
590
TpsvPHP_BeforeExecute
TpsvPHP BeforeExecute Event
BeforeExecute;Events



Imported,Updated



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.BeforeExecute event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property BeforeExecute : TNotifyEvent;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Occurs before the psvPHP\lang2057\f2  Component\lang6153\f0  executes a script\lang2057\f2 .\lang6153\f0 
\par 
\par }
600
TpsvPHP_AfterExecute
TpsvPHP AfterExecute Event
AfterExecute;Events



Imported,Updated



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.AfterExecute event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AfterExecute : TNotifyEvent;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Occurs after the psvPHP\lang2057\f2  component has\lang6153\f0  execute\lang2057\f2 d\lang6153\f0  a script\lang2057\f2 .\lang6153\f0 
\par 
\par }
610
php4delphi_TpsvPHP_Properties_Popup
php4delphi_TpsvPHP_Properties_Popup scrib




Imported



FALSE
19
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP Properties  
\par \cf2\b0\strike\fs20 TpsvPHP\strike0\{link=TpsvPHP_Component>main\}\cf3\{keepn\}\cf2 
\par \cf0 
\par \strike About\strike0\{linkID=670>main\}
\par \strike ConstantCount\strike0\{linkID=660>main\}
\par \strike Constants\strike0\{linkID=690>main\}
\par \strike FileName\strike0\{linkID=680>main\}
\par \strike HandleErrors\strike0\{linkID=730>main\}
\par \strike HTMLErrors\strike0\{linkID=710>main\}
\par \strike KeepSession\strike0\{linkID=720>main\}
\par \strike ModuleActive\strike0\{linkID=630>main\}
\par \strike SessionActive\strike0\{linkID=640>main\}
\par \strike ThreadSafeResourceManager\strike0\{linkID=620>main\}
\par \strike VariableCount\strike0\{linkID=650>main\}
\par \strike Variables\strike0\{linkID=700>main\}
\par 
\par }
620
TpsvPHP_ThreadSafeResourceManager
TpsvPHP ThreadSafeResourceManager Property
Properties;ThreadSafeResourceManager



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.ThreadSafeResourceManager property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property ThreadSafeResourceManager : pointer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns a pointer to ZEND thread safe resources manager
\par 
\par }
630
TpsvPHP_ModuleActive
TpsvPHP ModuleActive Property
ModuleActive;Properties



Imported,Updated



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.ModuleActive property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property ModuleActive : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Indicates \lang2057\f2 whether or not \lang6153\f0 SAPI module\lang2057\f2  is active.\lang6153\f0 
\par 
\par }
640
TpsvPHP_SessionActive
TpsvPHP SessionActive Property
Properties;SessionActive



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.SessionActive property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property SessionActive : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Indicates activity of request
\par 
\par }
650
TpsvPHP_VariableCount
TpsvPHP VariableCount Property
Properties;VariableCount



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.VariableCount property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property VariableCount : integer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Indicates the number of PHP variables owned by the component.
\par 
\par }
660
TpsvPHP_ConstantCount
TpsvPHP ConstantCount Property
ConstantCount;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.ConstantCount property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property ConstantCount : integer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Indicates the number of PHP constants owned by the component.
\par 
\par }
670
TpsvPHP_About
TpsvPHP About Property
About;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.About property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property About : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents information about version of the component (only at design-time)
\par 
\par }
680
TpsvPHP_FileName
TpsvPHP FileName Property
FileName;Properties



Imported,Updated



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.FileName property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property FileName  : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 PHP script name. Uses for executing PHP script from \lang2057\f2 a \lang6153\f0 file\lang2057\f2 .  You can also just assign the Filename at the time you call the script using an overloaded version of \cf2\strike Execute\cf4\strike0\{linkID=470\}\cf3 .\lang6153\f0 
\par 
\par }
690
TpsvPHP_Constants
TpsvPHP Constants Property
Constants;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.Constants property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Constants : \cf2\strike TPHPConstants\cf4\strike0\{linkID=260\}\cf3 ;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0\f2 Returns a collection \f0 of PHP constants\f2  (TPHPConstants).\f0 
\par 
\par }
700
TpsvPHP_Variables
TpsvPHP Variables Property
Properties;Variables



Imported,Updated



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.Variables property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Variables : TPHPVariables;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Collection of the PHP variables. This collection \lang2057\f2 represents the values that would normally be in \cf0\lang6153\f0 the QUERY_STRING (the information after the '?' in an URL).\cf3 
\par 
\par 
\par }
710
TpsvPHP_HTMLErrors
TpsvPHP HTMLErrors Property
HTMLErrors;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.HTMLErrors property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property HTMLErrors : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Indicates whether the component displays an error message as HTML or plain text
\par 
\par }
720
TpsvPHP_KeepSession
TpsvPHP KeepSession Property
KeepSession;Properties



Imported,Updated



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.KeepSession property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property KeepSession : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 When KeepSession is false (by default) new request initiated every time to execute script. When KeepSession is true, only one request available (can be used if you want to execute the same script\lang2057\f2  \lang6153\f0 many times)\lang2057\f2 .\lang6153\f0 
\par 
\par }
730
TpsvPHP_HandleErrors
TpsvPHP HandleErrors Property
HandleErrors;Properties



Imported,Updated



FALSE
23
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TpsvPHP.HandleErrors property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TpsvPHP\strike0\{linkID=320\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property HandleErrors : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Indicates whether the component handles exceptions \lang2057\f2 that \lang6153\f0 are raised\f2  by the php script engine.
\par \f0 
\par When HandleErrors is True, exeptions are caught by \lang2057\f2 the \lang6153\f0 component. When ShowErrors is False, the exception \lang2057\f2 will not be \lang6153\f0 caught by component but by \lang2057\f2 the \lang6153\f0 PHP engine\lang2057\f2  instead\lang6153\f0 .
\par 
\par \b\i\f2 Note: \b0\i0 You should always set HandleErrors to True prior to calling \cf2\strike RunCode\cf4\strike0\{linkID=480\}\cf3  otherwise an error in the code may cause your entire application to crash abnormally.  When calling \cf2\strike Execute\cf4\strike0\{linkID=470\}\cf3  you can decide to set it to true or false.\f0 
\par 
\par \f2 Setting HandleErrors to false will allow your php script to be executed in the manner that it would normally be if being executed as part of a web page, all errors that occur that are non fatal will print their error message in the body of the text returned by the \cf2\strike execute\cf4\strike0\{linkID=470\}\cf3  method.  A fatal error will print out its error message in the returned text, and stop execution.
\par 
\par If you set HandleErrors to true then any error (of any type) that occurs will raise an exception within your delphi application.  If you assign a handler to \cf2\strike OnScriptError\cf4\strike0\{linkID=540\}\cf3  you can take an action (such as log the error or notify the user) when these errors occur.  The \cf2\strike HTMLErrors \cf4\strike0\{linkID=710\}\cf3 Property specifies whether you would like to recieve the error text with or without HTML formatting.  If a fatal error occurs execute will return an empty string.
\par 
\par  \f0 
\par 
\par }
740
PHPLibrary_Unit
PHPLibrary Unit
PHPLibrary Unit;Units



Imported



FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 PHPLibrary unit \{keepn\} 
\par \pard\sb55\cf2\b0\fs20 Contains TPHPLibrary component
\par \pard\sb95\b Classes
\par \pard\b0\strike TPHPLibrary\strike0\{linkID=750\}
\par \cf3 
\par \pard\sb95\cf2\b 
\par 
\par }
750
TPHPLibrary_Component
TPHPLibrary Component
Components;TPHPLibrary



Imported


TPHPLibrary;TPHPLibrary_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs20\{bmc bm2.WMF\}\cf2\b\fs24 TPHPLibrary Component  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=770>list\}\tab\tab\strike Methods\strike0\{linkID=760>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike PHPLibrary\strike0\{linkID=740\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 TPHPLibrary component extends the possibility of TpsvPHP component and adds additional functions to PHP script available at run-time.\cf0 
\par 
\par }
760
PHPLibrary_TPHPLibrary_Methods_Popup
PHPLibrary_TPHPLibrary_Methods_Popupossi+




Imported



FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary Methods  
\par \cf2\b0\strike\fs20 TPHPLibrary\strike0\{link=TPHPLibrary_Component>main\}\{keepn\} 
\par \cf0 
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike Destroy\strike0\{link=!AL(`TComponent_Destroy',1,`',`Main')\}
\par \strike Refresh\strike0\{linkID=830>main\}
\par 
\par }
770
PHPLibrary_TPHPLibrary_Properties_Popup
PHPLibrary_TPHPLibrary_Properties_Popup1+




Imported



FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary Properties  
\par \cf2\b0\strike\fs20 TPHPLibrary\strike0\{link=TPHPLibrary_Component>main\}\{keepn\} 
\par \cf0 
\par \strike About\strike0\{linkID=790>main\}
\par \strike Executor\strike0\{linkID=800>main\}
\par \strike Functions\strike0\{linkID=820>main\}
\par \strike LibraryEntry\strike0\{linkID=780>main\}
\par \strike LibraryName\strike0\{linkID=810>main\}
\par 
\par }
780
TPHPLibrary_LibraryEntry
TPHPLibrary LibraryEntry Property
LibraryEntry;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary.LibraryEntry property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPLibrary\strike0\{linkID=750\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property LibraryEntry : Tzend_module_entry;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns a pointer to internal zend_module_entry structure. Uses only for advanced programming using ZEND API.
\par 
\par }
790
TPHPLibrary_About
TPHPLibrary About Property
About;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary.About property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPLibrary\strike0\{linkID=750\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property About : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns information about component version
\par 
\par }
800
TPHPLibrary_Executor
TPHPLibrary Executor Property
Executor;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary.Executor property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPLibrary\strike0\{linkID=750\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Executor;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the psvPHP component
\par 
\par }
810
TPHPLibrary_LibraryName
TPHPLibrary LibraryName Property
LibraryName;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary.LibraryName property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPLibrary\strike0\{linkID=750\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property LibraryName;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the name of the library
\par 
\par }
820
TPHPLibrary_Functions
TPHPLibrary Functions Property
Functions;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary.Functions property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPLibrary\strike0\{linkID=750\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Functions;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Contains the collection of the functions 
\par 
\par }
830
TPHPLibrary_Refresh
TPHPLibrary Refresh Method
Methods;Refresh



Imported



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\froman\fcharset0 Times New Roman;}{\f3\froman Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPLibrary.Refresh method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPLibrary\strike0\{linkID=750\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 Procedure Refresh;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Refresh library description and populate changes to psvPHP component. You don\f2\rquote\f0 t have to call this method directly.
\par \cf0\f3\fs24 
\par 
\par }
840
PHPFunctions_Unit
PHPFunctions Unit
PHPFunctions Unit;Units



Imported



FALSE
19
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 PHPFunctions unit \{keepn\} 
\par \pard\sb55\cf2\b0\fs20 Contains TPHPFunctions class.
\par \pard\sb95\b Classes
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \strike TFunctionParam\strike0\{linkID=1010\}
\par \strike TFunctionParams\strike0\{linkID=1090\}
\par \strike TPHPFunction\strike0\{linkID=1160\}
\par \strike TPHPFunctions\strike0\{linkID=1270\}
\par \cf3 
\par \pard\sb95\cf2\b Types
\par \pard\sb55\b0 TParamType = (tpString, tpInteger, tpFloat, tpBoolean);
\par TPHPExecute = procedure(Sender : TObject; Parameters : TFunctionParams ; var ReturnValue : Variant;                          ThisPtr : pzval;  TSRMLS_DC : pointer) of object;
\par \pard\cf3 
\par 
\par \pard\sb95\cf2\b 
\par 
\par }
850
TZendVariable_Component
TZendVariable Component
Components;TZendVariable



Imported


TZendVariable;TZendVariable_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs20\{bmc bm7.WMF\}\cf2\b\fs24 TZendVariable Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=880>list\}\tab\tab\strike Methods\strike0\{linkID=860>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf1\b Unit
\par \pard\tx355\cf3\b0\strike PHPFunctions\strike0\{linkID=840\}
\par \pard\sb55\tx355\cf1\b Description
\par \pard\tx355\b0 Represents ZEND variable.\cf0 
\par 
\par }
860
PHPFunctions_TZendVariable_Methods_Popup
PHPFunctions_TZendVariable_Methods_PopupØ2




Imported



FALSE
9
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable Methods  
\par \cf2\b0\strike\fs20 TZendVariable\strike0\{link= TZendVariable_Component>main\}\{keepn\}
\par \cf0 
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike UnAssign\strike0\{linkID=870>main\}
\par 
\par }
870
TZendVariable_UnAssign
TZendVariable UnAssign Method
Methods;UnAssign



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.UnAssign method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure UnAssign;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Sets the value of the variable to NULL
\par 
\par }
880
PHPFunctions_TZendVariable_Properties_Popup
PHPFunctions_TZendVariable_Properties_Popup




Imported



FALSE
19
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable Properties  
\par \cf2\b0\strike\fs20 TZendVariable\strike0\{link= TZendVariable_Component>main\}\{keepn\}
\par \cf0 
\par \strike AsBoolean\strike0\{linkID=910>main\}
\par \strike AsDate\strike0\{linkID=950>main\}
\par \strike AsDateTime\strike0\{linkID=970>main\}
\par \strike AsFloat\strike0\{linkID=940>main\}
\par \strike AsInteger\strike0\{linkID=920>main\}
\par \strike AsString\strike0\{linkID=930>main\}
\par \strike AsTime\strike0\{linkID=960>main\}
\par \strike AsVariant\strike0\{linkID=980>main\}
\par \strike AsZendVariable\strike0\{linkID=900>main\}
\par \strike DataType\strike0\{linkID=990>main\}
\par \strike ISNull\strike0\{linkID=890>main\}
\par \strike TypeName\strike0\{linkID=1000>main\}
\par 
\par }
890
TZendVariable_ISNull
TZendVariable ISNull Property
ISNull;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.ISNull property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property ISNull : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Indicates whether the value assigned to the variable is NULL (blank). Inspect IsNull to discover if the value of the variable is NULL
\par 
\par }
900
TZendVariable_AsZendVariable
TZendVariable AsZendVariable Property
AsZendVariable;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsZendVariable property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsZendVariable : Pzval;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the variable in native ZEND format
\par 
\par }
910
TZendVariable_AsBoolean
TZendVariable AsBoolean Property
AsBoolean;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsBoolean property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsBoolean : boolean;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the variable when it represents a boolean value
\par 
\par }
920
TZendVariable_AsInteger
TZendVariable AsInteger Property
AsInteger;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsInteger property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsInteger : integer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the variable when it represents an integer value
\par 
\par }
930
TZendVariable_AsString
TZendVariable AsString Property
AsString;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsString property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsString  : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the variable when it represents a string
\par 
\par }
940
TZendVariable_AsFloat
TZendVariable AsFloat Property
AsFloat;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsFloat property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsFloat   : double;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the value when it represents a float value
\par 
\par }
950
TZendVariable_AsDate
TZendVariable AsDate Property
AsDate;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsDate property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsDate    : TDateTime;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the variable when it represents a date
\par 
\par }
960
TZendVariable_AsTime
TZendVariable AsTime Property
AsTime;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsTime property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsTime    : TDateTime;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the variable when it represents a time
\par 
\par }
970
TZendVariable_AsDateTime
TZendVariable AsDateTime Property
AsDateTime;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsDateTime property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsDateTime : TDateTime;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Specifies the value of the variable when it represents a date and a time
\par 
\par }
980
TZendVariable_AsVariant
TZendVariable AsVariant Property
AsVariant;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.AsVariant property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property AsVariant : variant;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the value of the variable as a Variant.
\par 
\par }
990
TZendVariable_DataType
TZendVariable DataType Property
DataType;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.DataType property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property DataType : integer;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the internal ZEND type of the variable
\par 
\par }
1000
TZendVariable_TypeName
TZendVariable TypeName Property
Properties;TypeName



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TZendVariable.TypeName property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TZendVariable\strike0\{linkID=850\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property TypeName : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Represents the name of the internal ZEND type of the variable
\par 
\par }
1010
TFunctionParam_Component
TFunctionParam Component
Components;TFunctionParam



Imported


TFunctionParam;TFunctionParam_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TFunctionParam Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=1060>list\}\tab\tab\strike Methods\strike0\{linkID=1020>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike PHPFunctions\strike0\{linkID=840\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 Represents the function parameters\cf0 
\par 
\par }
1020
PHPFunctions_TFunctionParam_Methods_Popup
PHPFunctions_TFunctionParam_Methods_Popup




Imported



FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParam Methods  
\par \cf2\b0\strike\fs20 TFunctionParam\strike0\{link=TFunctionParam_Component>main\}\{keepn\} 
\par \cf0 
\par \strike AssignTo\strike0\{linkID=1050>main\}
\par \strike GetDisplayName\strike0\{linkID=1030>main\}
\par \strike SetDisplayName\strike0\{linkID=1040>main\}
\par 
\par }
1030
TFunctionParam_GetDisplayName
TFunctionParam GetDisplayName Method
GetDisplayName;Methods



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParam.GetDisplayName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParam\strike0\{linkID=1010\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function GetDisplayName: string; override;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns the value of the DisplayName property.
\par 
\par }
1040
TFunctionParam_SetDisplayName
TFunctionParam SetDisplayName Method
Methods;SetDisplayName



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParam.SetDisplayName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParam\strike0\{linkID=1010\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure SetDisplayName(const Value: string); override;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Sets the value of the DisplayName property.
\par 
\par }
1050
TFunctionParam_AssignTo
TFunctionParam AssignTo Method
AssignTo;Methods



Imported



FALSE
14
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParam.AssignTo method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParam\strike0\{linkID=1010\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure AssignTo(Dest: TPersistent); override;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Copies the properties of an object to a destination object. 
\par Override the AssignTo method to extend the functionality of the Assign method of destination objects so that they handle newly created object classes. When defining a new object class, override the Assign method for every existing object class that should be able to copy its properties to the new class.  Override the AssignTo method for every existing class that the new class can copy to.
\par 
\par }
1060
PHPFunctions_TFunctionParam_Properties_Popup
PHPFunctions_TFunctionParam_Properties_Popupnj*




Imported



FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParam Properties  
\par \cf2\b0\strike\fs20 TFunctionParam\strike0\{link=TFunctionParam_Component>main\}\{keepn\} 
\par \cf0 
\par \strike Name\strike0\{link=!AL(`TComponent_Name',1,`',`Main')\}
\par \strike ParamType\strike0\{linkID=1080>main\}
\par \strike Value\strike0\{linkID=1070>main\}
\par 
\par }
1070
TFunctionParam_Value
TFunctionParam Value Property
Properties;Value



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParam.Value property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParam\strike0\{linkID=1010\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Value : variant;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the value of the function parameter.
\par 
\par }
1080
TFunctionParam_ParamType
TFunctionParam ParamType Property
ParamType;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParam.ParamType property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParam\strike0\{linkID=1010\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property ParamType : TParamType;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Represents the type of the function parameter.
\par 
\par }
1090
TFunctionParams_Component
TFunctionParams Component
Components;TFunctionParams



Imported


TFunctionParams;TFunctionParams_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TFunctionParams Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=1140>list\}\tab\tab\strike Methods\strike0\{linkID=1100>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike PHPFunctions\strike0\{linkID=840\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 Represents the parameters, passed to the function\cf0 
\par 
\par }
1100
PHPFunctions_TFunctionParams_Methods_Popup
PHPFunctions_TFunctionParams_Methods_Popupfuncti*




Imported



FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParams Methods  
\par \cf2\b0\strike\fs20 TFunctionParams\strike0\{link= TFunctionParams_Component>main\}\{keepn\}
\par \cf0 
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike GetOwner\strike0\{link=!AL(`TComponent_GetOwner',1,`',`Main')\}
\par \strike ParamByName\strike0\{linkID=1120>main\}
\par \strike SetItemName\strike0\{linkID=1110>main\}
\par \strike Values\strike0\{linkID=1130>main\}
\par 
\par }
1110
TFunctionParams_SetItemName
TFunctionParams SetItemName Method
Methods;SetItemName



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParams.SetItemName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParams\strike0\{linkID=1090\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure SetItemName(Item: TCollectionItem); override;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Sets the name of the collection item
\par 
\par }
1120
TFunctionParams_ParamByName
TFunctionParams ParamByName Method
Methods;ParamByName



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParams.ParamByName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParams\strike0\{linkID=1090\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function ParamByName(AName : string) : TFunctionParam;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns fuction parameter by parameter name.
\par 
\par }
1130
TFunctionParams_Values
TFunctionParams Values Method
Methods;Values



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParams.Values method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParams\strike0\{linkID=1090\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function Values(AName : string) : Variant;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Returns the value of the parameter by name of the parameter.
\par 
\par }
1140
PHPFunctions_TFunctionParams_Properties_Popup
PHPFunctions_TFunctionParams_Properties_Popupf t*




Imported



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParams Properties  
\par \cf2\b0\strike\fs20 TFunctionParams\strike0\{link= TFunctionParams_Component>main\}\{keepn\}
\par \cf0 
\par \strike Items\strike0\{linkID=1150>main\}
\par 
\par }
1150
TFunctionParams_Items
TFunctionParams Items Property
Items;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TFunctionParams.Items property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TFunctionParams\strike0\{linkID=1090\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Items[Index: Integer]: TFunctionParam; Default;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Provides indexed access to the items in the collection.
\par 
\par }
1160
TPHPFunction_Component
TPHPFunction Component
Components;TPHPFunction



Imported


TPHPFunction;TPHPFunction_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TPHPFunction Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=1230>list\}\tab\tab\strike Methods\strike0\{linkID=1170>list\}\tab\tab\strike Events\strike0\{link=\{keepn\} PHPFunctions_TPHPFunction_Events_Popup>list\}
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike PHPFunctions\strike0\{linkID=840\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 Implements one PHP script internal function\cf0 
\par 
\par }
1170
PHPFunctions_TPHPFunction_Methods_Popup
PHPFunctions_TPHPFunction_Methods_Popupc+




Imported



FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction Methods  
\par \cf2\b0\strike\fs20 TPHPFunction\strike0\{link= TPHPFunction_Component>main\}\{keepn\}
\par \cf0 
\par \strike AssignTo\strike0\{linkID=1200>main\}
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike Destroy\strike0\{link=!AL(`TComponent_Destroy',1,`',`Main')\}
\par \strike GetDisplayName\strike0\{linkID=1180>main\}
\par \strike SetDisplayName\strike0\{linkID=1190>main\}
\par 
\par }
1180
TPHPFunction_GetDisplayName
TPHPFunction GetDisplayName Method
GetDisplayName;Methods



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction.GetDisplayName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunction\strike0\{linkID=1160\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 function  GetDisplayName: string; override;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Returns the value of the DisplayName property.
\par 
\par }
1190
TPHPFunction_SetDisplayName
TPHPFunction SetDisplayName Method
Methods;SetDisplayName



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction.SetDisplayName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunction\strike0\{linkID=1160\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure SetDisplayName(const Value: string); override;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Sets the value of the DisplayName property.
\par 
\par }
1200
TPHPFunction_AssignTo
TPHPFunction AssignTo Method
AssignTo;Methods



Imported



FALSE
15
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction.AssignTo method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunction\strike0\{linkID=1160\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure AssignTo(Dest: TPersistent); override;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Copies the properties of an object to a destination object.
\par Override the AssignTo method to extend the functionality of the Assign method of destination objects so that they handle newly created object classes. When defining a new object class, override the Assign method for every existing object class that should be able to copy its properties to the new class.  Override the AssignTo method for every existing class that the new class can copy to.
\par 
\par 
\par }
1210
PHPFunctions_TPHPFunction_Events_Popup
PHPFunctions_TPHPFunction_Events_Popup+




Imported



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction Events  
\par \cf2\b0\strike\fs20 TPHPFunction\strike0\{link= TPHPFunction_Component>main\}\{keepn\}
\par \cf0 
\par \strike OnExecute\strike0\{linkID=1220>main\}
\par 
\par }
1220
TPHPFunction_OnExecute
TPHPFunction OnExecute Event
Events;OnExecute



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction.OnExecute event  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunction\strike0\{linkID=1160\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property OnExecute : TPHPExecute;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Occurs when function executes in PHP script. You have to create OnExecute event handler to use function in PHP script.
\par 
\par }
1230
PHPFunctions_TPHPFunction_Properties_Popup
PHPFunctions_TPHPFunction_Properties_Popuppt. Yo*




Imported



FALSE
11
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction Properties  
\par \cf2\b0\strike\fs20 TPHPFunction\strike0\{link= TPHPFunction_Component>main\}\{keepn\}
\par \cf0 
\par \strike FunctionName\strike0\{linkID=1250>main\}
\par \strike Parameters\strike0\{linkID=1260>main\}
\par \strike Tag\strike0\{link=!AL(`TComponent_Tag',1,`',`Main')\}
\par \strike ZendVar\strike0\{linkID=1240>main\}
\par 
\par }
1240
TPHPFunction_ZendVar
TPHPFunction ZendVar Property
Properties;ZendVar



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction.ZendVar property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunction\strike0\{linkID=1160\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property ZendVar: TZendVariable;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the function\f2\rquote\f0 s return value as native ZEND variable
\par 
\par }
1250
TPHPFunction_FunctionName
TPHPFunction FunctionName Property
FunctionName;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction.FunctionName property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunction\strike0\{linkID=1160\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property FunctionName : string;
\par \pard\sb95\b\f0 Description
\par \pard\sa115\b0 Represents the name of the function
\par 
\par }
1260
TPHPFunction_Parameters
TPHPFunction Parameters Property
Parameters;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunction.Parameters property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunction\strike0\{linkID=1160\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLISHED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Parameters: TFunctionParams;
\par \pard\sb95\b\f0 Description
\par \pard\sa75\b0 Represents the PHP functions parameters
\par 
\par }
1270
TPHPFunctions_Component
TPHPFunctions Component
Components;TPHPFunctions



Imported


TPHPFunctions;TPHPFunctions_Object
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\f0\fs24\{bmc bm2.WMF\}\cf2\b TPHPFunctions Class  
\par \cf3\b0\strike\fs20 Properties\strike0\{linkID=1300>list\}\tab\tab\strike Methods\strike0\{linkID=1280>list\}\tab\tab\{keepn\} 
\par \pard\sb75\tx355\cf4\b Unit
\par \pard\tx355\cf3\b0\strike PHPFunctions\strike0\{linkID=840\}
\par \pard\sb55\tx355\cf4\b Description
\par \pard\tx355\b0 Represents the collection of the functions, available in the library\cf0 
\par 
\par }
1280
PHPFunctions_TPHPFunctions_Methods_Popup
PHPFunctions_TPHPFunctions_Methods_Popupons, ava*




Imported



FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunctions Methods  
\par \cf2\b0\strike\fs20 TPHPFunctions\strike0\{link= TPHPFunctions_Component>main\}\{keepn\}
\par \cf0 
\par \strike Create\strike0\{link=!AL(`TComponent_Create',1,`',`Main')\}
\par \strike GetOwner\strike0\{link=!AL(`TComponent_GetOwner',1,`',`Main')\}
\par \strike SetItemName\strike0\{linkID=1290>main\}
\par 
\par }
1290
TPHPFunctions_SetItemName
TPHPFunctions SetItemName Method
Methods;SetItemName



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunctions.SetItemName method  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunctions\strike0\{linkID=1270\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PROTECTED
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 procedure SetItemName(Item: TCollectionItem); override;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Sets the name property of the colletion item.
\par 
\par }
1300
PHPFunctions_TPHPFunctions_Properties_Popup
PHPFunctions_TPHPFunctions_Properties_Popupem.




Imported



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunctions Properties  
\par \cf2\b0\strike\fs20 TPHPFunctions\strike0\{link= TPHPFunctions_Component>main\}\{keepn\}
\par \cf0 
\par \strike Items\strike0\{linkID=1310>main\}
\par 
\par }
1310
TPHPFunctions_Items
TPHPFunctions Items Property
Items;Properties



Imported



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fmodern Courier New;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang6153\b\f0\fs24 TPHPFunctions.Items property  \cf2\b0\fs20\{keepn\} 
\par \pard\sb95\cf3\b Applies To
\par \pard\b0\strike TPHPFunctions\strike0\{linkID=1270\}
\par \pard\sb95\b Visibility
\par \pard\b0\f1 PUBLIC
\par \pard\sb95\b\f0 Declaration
\par \pard\b0\f1 property Items[Index: Integer]: TPHPFunction; Default;
\par \pard\sb95\b\f0 Description
\par \pard\b0 Provides indexed access to the items in the collection.
\par 
\par }
1320
Scribble1320
Delphi Component Scripting
Component Scripting;Scripting



Writing



FALSE
39
{\rtf1\ansi\ansicpg1252\deff0\deflang6153{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\fnil Arial;}{\f4\fnil MS Sans Serif;}{\f5\fnil\fcharset0 MS Sans Serif;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green128\blue128;}
\viewkind4\uc1\pard\cf1\b\fs32 Delphi Component Scripting
\par \cf2\b0\strike\f1\fs20 TpsvPHP\cf3\strike0\{linkID=320\f2\}\b\f0\fs32\{keepn\}\cf1 
\par 
\par \cf0\b0\f3\fs20 
\par \f0 Since the introduction of php4Delphi 5.3 it has been possible to register and then call any published properties of delphi components.  This gives a new range of options for anyone using this component.
\par 
\par \b Getting Started.
\par \b0\f3 
\par \f0 To get started, you can take a look at the demo provided in the 'demos/psvPHP/components' directory.  This is a simple delphi application that shows how you go about scripting your delphi application.
\par 
\par Essentially all that is necessary is to call the php function \f4\fs16 register_delphi_component\f5 (ComponentName) \fs20 for each component you wish to be able to script.\f3 
\par 
\par \f0 The following code is used in the demo.
\par 
\par 
\par \cf4 //Register the two components we wish to work with.\cf0 
\par \f4 $btnClose = register_delphi_component("btnClose");
\par $frmTest =   register_delphi_component("frmTest");
\par 
\par \cf4\f5 //Call properties to change captions.\cf0\f4 
\par $btnClose->Caption = "&Exit";
\par $frmTest->Caption = "PHP4Delphi demo";
\par \f5 //Move the close button.\f4 
\par $btnClose->Top =  150;
\par 
\par \cf4\f5 //psvPHP has no problem getting to sub objects on a component\cf0\f4 
\par $btnClose->Font->Size = 10;
\par $btnClose->Cursor = -21;
\par $frmTest->Color = clGreen;
\par 
\par \cf4\f5 //Call a built in php function to call a delphi InputBox and then show in a message box.\cf0\f4 
\par $st = delphi_input_box("InputBox", "Type your message", "Done");
\par delphi_show_message($st);
\par 
\par 
\par \f5 Note:  Please note only published properties are available.  Methods and unpublished properties are not.\f3 
\par }
2
main="",(399,380,578,612),,(255,255,255),(192,192,192)
list="",(211,276,252,684),,(255,255,198),(192,192,192)
0
0
0
8

16711680
Arial
0
12
1
B...
0
0
0
0
0
0
*InternetLink
16711680
Courier New
0
10
1
....
0
0
0
0
0
0
*ParagraphTitle
-16777208
Arial
0
11
1
B...
0
0
0
0
0
0
*PopupLink
-16777208
Arial
0
8
1
....
0
0
0
0
0
0
*PopupTopicTitle
16711680
Arial
0
10
1
B...
0
0
0
0
0
0
*TopicText
-16777208
Arial
0
10
1
....
0
0
0
0
0
0
*TopicTitle
16711680
Arial
0
16
1
B...
0
0
0
0
0
0
<new macro>
16711680
Arial
0
12
1
B...
0
0
0
0
0
0
