#include <stdio.h>
#include <windows.h>

DWORD WINAPI MyThread(LPVOID arg){
    while (1);
    return 0;
}

int main()
{
    SYSTEM_INFO si;
    GetSystemInfo(&si);

    for (int i =0;i<(int)si.dwNumberOfProcessors;i++){
        HANDLE hThread = CreateThread(NULL,0,MyThread,NULL,0,NULL);
        if (hThread == NULL) return 1;
        SetThreadPriority(hThread, THREAD_PRIORITY_TIME_CRITICAL);
        CloseHandle(hThread);
    }
    Sleep(1000);
    while(1) {printf("주 스레드 실행\n"); break;}
    return 0;
}
