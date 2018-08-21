#define WIN32_LEAN_AND_MEAN
#define WINVER 0x0400
#include <stdbool.h>
#include <windows.h>

// Functions
typedef BOOL (__cdecl *pFindFirstFile)(LPCTSTR lpFileName, LPWIN32_FIND_DATA lpFindFileData);
typedef BOOL (__stdcall *pFindNextFile)(HANDLE hFindFile, LPWIN32_FIND_DATA lpFindFileData);
typedef BOOL (__stdcall *pFreeLibrary)(HMODULE hModule);

extern void __cdecl DebugText_Write(const char *text);

int GetFileMatchCount(bool matchOnlyDirs, const char *rootPath, const char *matchStr)
{
    WIN32_FIND_DATA FindFileData;
    HANDLE hFind;
    char matchRoot[256];
    
    HINSTANCE KERNEL32_DLL = LoadLibraryA("KERNEL32.DLL");
    pFindFirstFile FindFirstFile = GetProcAddress(KERNEL32_DLL, "FindFirstFileA");
    pFindNextFile FindNextFile = GetProcAddress(KERNEL32_DLL, "FindNextFileA");
    pFreeLibrary FreeLibrary = GetProcAddress(KERNEL32_DLL, "FreeLibrary");
    int result = 0;
    
    // Get root path with match suffixed
    lstrcpyA(matchRoot, rootPath);
    lstrcatA(matchRoot, matchStr);
    
    // Find the first file
    hFind = FindFirstFile(matchRoot, &FindFileData);
    if(hFind == INVALID_HANDLE_VALUE){
        goto GetFileMatchCount_Return;
    }
    
    // Count files
    do{
        if(FindFileData.cFileName[0] == '.'){continue;}
        
        if(matchOnlyDirs){
            if(FindFileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY){
                result++;
            }
        } else {
            result++;
        }
        DebugText_Write(FindFileData.cFileName);
    } while (FindNextFile(hFind, &FindFileData) != 0);
    
    // Return
GetFileMatchCount_Return:
    FreeLibrary(KERNEL32_DLL);
    return result;
}

int main() {
    return GetFileMatchCount(0, "a", "b");
}
