<!-- :: Batch section
@echo off
setlocal
mshta.exe "%~F0"
goto :EOF
-->
<HTML>

<HEAD>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <HTA:APPLICATION ID="extsigningHTA" SCROLL="no" SYSMENU="no">
        <TITLE>Sign your extension</TITLE>
        <SCRIPT language="JavaScript">
            window.resizeTo(800, 600);
            window.moveTo((screen.width - 800) / 2, (screen.height - 600) / 2);
            function doExit(reply) {
                var fso = new ActiveXObject("Scripting.FileSystemObject");
                if (reply === "done") {
                    try {
                        var objShell = new ActiveXObject("WScript.shell");
                        objShell.run('C:\\Windows\\System32\\cmd.exe /Q /C "web-ext sign --api-key=' + document.getElementById("apikey").value + ' --api-secret=' + document.getElementById("apisecret").value + '&(pause)"');
                        //var i = 0;
                        //while (execOut.Status === 0) {
                        //    objShell.run('timeout /T 1', 0, true);
                        //}
                        //fso.GetStandardStream(1).WriteLine("Results is as Follows <"+i+">\r\n");
                        //switch (execOut.Status) {
                        //    case 1:
                        //        reply = "OUT: " + execOut.StdOut.ReadAll();
                        //        break;
                        //    case 2:
                        //        reply = "ERR: " + execOut.StdErr.ReadAll();
                        //        break;
                         //   default:
                        //        reply = "UNKOWN_RETURN_CODE: " + execOut.Status;
                        //        break;
                        //}
                    } catch (error) {
                        reply = "an error occured" + (error.message ? " :" + error.message : "") + "\r\n Error Object:\r\n" + JSON.stringify(error);
                    }
                } else {
                    reply = "user canceled the operation";
                }
                //fso.GetStandardStream(1).WriteLine(reply);
                window.close();
            }
        </SCRIPT>
</HEAD>

<BODY>
    <label for="apikey">API Key:</label>
    <input type="text" id="apikey" name="apikey"><br><br>
    <label for="apisecret">API Secret:</label>
    <input type="text" id="apisecret" name="apisecret"><br><br>
    <button onclick="javascript:doExit('done');">OK</button>
    <button onclick="javascript:doExit('cancel');">Cancel</button>
</BODY>

</HTML>