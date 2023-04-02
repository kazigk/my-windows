#SingleInstance Force
SetWorkingDir(A_ScriptDir)
TraySetIcon("imageres.dll", 175)
SetCapsLockState('AlwaysOff')

LocalAppData := EnvGet("LocalAppData")
VDA_PATH := A_ScriptDir . "\VirtualDesktopAccessor.dll"
hVirtualDesktopAccessor := DllCall("LoadLibrary", "Str", VDA_PATH, "Ptr")

GoToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GoToDesktopNumber", "Ptr")
MoveWindowToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "MoveWindowToDesktopNumber", "Ptr")
GetCurrentDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GetCurrentDesktopNumber", "Ptr")
IsWindowOnCurrentVirtualDesktopProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr","IsWindowOnCurrentVirtualDesktop", "Ptr")

MoveCurrentWindowToDesktop(n) {
  activeHwnd := WinGetID("A")
  DllCall(MoveWindowToDesktopNumberProc, "Ptr", activeHwnd, "Int", n, "Int")
}

MoveOrGoToDesktopNumber(n) {
  if (GetKeyState("LShift")) {
    MoveCurrentWindowToDesktop(n)
    return
  }

  if (GetKeyState("LButton")) {
    MoveCurrentWindowToDesktop(n)
  }

  DllCall(GoToDesktopNumberProc, "Int", n, "Int")
}

GimmeTerminal() {
  DetectHiddenWindows('On')
  if (terminalHwnd := WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")) { ; more reliable than ahk_exe WindowsTerminal.exe
    if (!DllCall(IsWindowOnCurrentVirtualDesktopProc, "Ptr", terminalHwnd, "Int")) {
      currentDesktop := DllCall(GetCurrentDesktopNumberProc, "Int")
      DllCall(MoveWindowToDesktopNumberProc, "Ptr", terminalHwnd, "Int", currentDesktop, "Int")
    }
    WinActivate
  } else {
    Run(LocalAppData . '\Microsoft\WindowsApps\wt.exe')
  }
}

CapsLock & 1::MoveOrGoToDesktopNumber(0)
CapsLock & 2::MoveOrGoToDesktopNumber(1)
CapsLock & 3::MoveOrGoToDesktopNumber(2)
CapsLock & 4::MoveOrGoToDesktopNumber(3)
CapsLock & Enter::GimmeTerminal()
