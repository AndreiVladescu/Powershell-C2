Invoke-WebRequest -Uri "https://static.wikia.nocookie.net/p__/images/1/11/Shrek_exits_his_outhouse.jpg/revision/latest/scale-to-width-down/1000?cb=20151126003346&path-prefix=protagonist" -OutFile "$([Environment]::GetFolderPath('Desktop'))\shrek.jpg"
$setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
Add-Type -TypeDefinition $setwallpapersrc
[Wallpaper]::SetWallpaper("$([Environment]::GetFolderPath('Desktop'))\shrek.jpg")