#Requires -Version 5.1
<#
.SYNOPSIS
  由工作排程器每小時觸發：跳出視窗，提醒確認官網是否正常、是否鎖定基準版。
#>

Add-Type -AssemblyName System.Windows.Forms | Out-Null

$title = "祕魯55周年｜官網基準版提醒"
$msg = @"
請確認：官網「行程特色」貼上後，版位是否正常；並往下滑確認每日行程、地圖等官方區塊是否仍完整。

若目前一切正常，是否要把現況儲存為新的 Git「基準版」？
→ 請在 Cursor 請助理依「貼官網用/行程特色_安全版_RULES.md」建立新標籤並更新該文件；或自行提交後 git tag 再更新 RULES。

（本視窗由每小時排程顯示；按「確定」關閉即可。）
"@

[System.Windows.Forms.MessageBox]::Show(
  $msg,
  $title,
  [System.Windows.Forms.MessageBoxButtons]::OK,
  [System.Windows.Forms.MessageBoxIcon]::Information
) | Out-Null
