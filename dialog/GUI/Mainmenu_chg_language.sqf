
disableSerialization;

_lang= (_this select 0);

_filename = format["dialog\Html\ac_Info_%1.html",_lang];

_dlg = uiNamespace getVariable "ac_INFO_DLG";

_control =  _dlg displayCtrl 10001;
_control htmlLoad _filename;

