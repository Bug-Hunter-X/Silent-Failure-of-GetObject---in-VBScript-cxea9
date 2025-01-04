Function GetObject() is used to get an object, but it may fail silently if the object doesn't exist, leading to unexpected behavior later in the code.  This is especially problematic if error handling isn't implemented to check the return value of GetObject().

Example:
```vbscript
Dim objFSO
Set objFSO = GetObject("Scripting.FileSystemObject")

If objFSO Is Nothing Then
  MsgBox "Failed to get FileSystemObject!"
  WScript.Quit
End If

' ... rest of the code using objFSO ...
```
Without the explicit check `If objFSO Is Nothing Then`, errors will only surface later when the code attempts to use `objFSO`, making debugging harder.