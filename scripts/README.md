# 基準版提醒腳本（可選）

- `baseline-reminder.ps1`：被排程觸發時跳出提示視窗。
- `Register-BaselineReminderTask.ps1`：註冊每小時工作（工作名稱 **`Peru55-BaselineHourlyReminder`**）。
- `Unregister-BaselineReminderTask.ps1`：解除該工作。

在**本專案根目錄**執行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\Register-BaselineReminderTask.ps1
```

若與夏古號專案同機註冊，兩邊工作名稱不同，可並存。若要以**同一個**排程提醒兩案，可改為手動執行腳本而不註冊排程。
