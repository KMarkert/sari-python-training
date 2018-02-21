' Set your settings
    strFileURL = "https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe"
    strHDLocation = "Miniconda3-latest-Windows-x86_64.exe"

' Fetch the filec
    Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")

    objXMLHTTP.open "GET", strFileURL, false
    objXMLHTTP.send()

If objXMLHTTP.Status = 200 Then
Set objADOStream = CreateObject("ADODB.Stream")
objADOStream.Open
objADOStream.Type = 1 'adTypeBinary

objADOStream.Write objXMLHTTP.ResponseBody
objADOStream.Position = 0    'Set the stream position to the start

Set objFSO = Createobject("Scripting.FileSystemObject")
If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile strHDLocation
Set objFSO = Nothing

objADOStream.SaveToFile strHDLocation
objADOStream.Close
Set objADOStream = Nothing
End if

Set objXMLHTTP = Nothing


set objShell=wscript.createObject("wscript.shell")
const DontWaitUntilFinished = false, ShowWindow = 1, DontShowWindow = 0, WaitUntilFinished = true

objShell.run "Miniconda3-latest-Windows-x86_64.exe" ,ShowWindow, WaitUntilFinished

objShell.run "conda config --add channels conda-forge", DontShowWindow, WaitUntilFinished
objShell.run "conda install numpy", ShowWindow, WaitUntilFinished
objShell.run "conda install matplotlib", ShowWindow, WaitUntilFinished
objShell.run "conda install jupyter", ShowWindow, WaitUntilFinished
objShell.run "pip install pandas", ShowWindow, WaitUntilFinished
objShell.run "pip install folium", ShowWindow, WaitUntilFinished
objShell.run "conda install rasterio", ShowWindow, WaitUntilFinished
objShell.run "conda install geopandas", ShowWindow, WaitUntilFinished
objShell.run "pip install rasterstats", ShowWindow, WaitUntilFinished

set objShell= Nothing'