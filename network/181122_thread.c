#include <pch.h>
#include <windows.h>
#include <stdio.h>

struct Point3D
{
	int x, y, z;
};

DWORD WINAPI MyThread(LPVOID arg) {
	Point3D *pt = (Point3D *)arg;
	while (true)
	{
		printf("Running MyThread() %d : %d, %d, %d \n",
			GetCurrentThreadId(), pt->x, pt->y, pt->z);
		Sleep(1000);
	}
	return 0; //스레드 종료
}
int main(int argc, char *argv[]) {
	//create first thread
	Point3D pt1 = { 10,20,30 };
	//CreateThread ( null , auto malloc, thread start address , get thread func argument, 0 or CREATE_SUSPENDED, threadID)
	HANDLE hThread1 = CreateThread(NULL, 0, MyThread, &pt1, 0, NULL);
	if (hThread1 == NULL) return 1;
	CloseHandle(hThread1);

	//create second thread
	Point3D pt2 = { 20,30,40 };
	HANDLE hThread2 = CreateThread(NULL, 0, MyThread, &pt2, 0, NULL);
	if (hThread2 == NULL) return 1;
	CloseHandle(hThread2);

	while (true)
	{
		printf("Running main() %d\n", GetCurrentThreadId());
		Sleep(1000);
	}
	return 0;
}
