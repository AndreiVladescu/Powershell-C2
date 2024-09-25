#include <windows.h>
#include <stdio.h>

int main(int argc, char** argv) {
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	ZeroMemory(&si, sizeof(si));
	si.cb = sizeof(si);

	SetConsoleCtrlHandler(0, 1);

	wchar_t wargv[260];
	MultiByteToWideChar(CP_ACP, 0, argv[0], -1, wargv, 260);

	while (1)
		if (!CreateProcessW(wargv, NULL, NULL, NULL, FALSE, CREATE_NEW_CONSOLE, NULL, NULL, &si, &pi)) {
			printf("Process creation failed: %d\n", GetLastError());
			return 1;
		}

	return 0;
}
