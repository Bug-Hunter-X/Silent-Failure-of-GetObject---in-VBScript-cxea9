The solution involves explicitly checking the return value of GetObject() to see if it's Nothing. If it is, appropriate error handling should be implemented.

Corrected Code:
```vbscript
Dim objFSO
Set objFSO = GetObject("Scripting.FileSystemObject")

If objFSO Is Nothing Then
  MsgBox "Failed to get FileSystemObject! Check if the object is registered correctly.", vbCritical
  WScript.Quit 1 ' Exit with an error code
End If

' ... rest of the code using objFSO ...

'Example of more robust error handling using On Error Resume Next:
On Error Resume Next
Set objFSO = GetObject("Scripting.FileSystemObject")
If Err.Number <> 0 Then
  MsgBox "Error getting FileSystemObject: " & Err.Description, vbCritical
  Err.Clear
  WScript.Quit 1
End If
On Error GoTo 0
```
This revised code gracefully handles the case where `GetObject()` fails, providing informative error messages and preventing further execution if necessary.  The use of an error code (WScript.Quit 1) aids in identifying the failure from a calling script.