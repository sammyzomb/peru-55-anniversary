# 祕魯 55 周年｜官網行程特色

與 **夏古號官網正式** 使用**同一官網後台**的「**行程特色**」自訂 HTML 欄位；CMS 行為與上限（例如 `<style>` 數量、欄位長度）**沿用夏古號實測結論**，細節以 `貼官網用/行程特色_安全版_RULES.md` 為準。

## 檔案分工

| 檔案 | 用途 |
|------|------|
| `貼官網用/行程特色_貼上版.html` | **唯一上線來源**：全選複製，貼入後台「行程特色」 |
| `貼官網用/行程特色_開發版.html` | 日常編輯（註解較多），定稿後同步貼上版 |
| `貼官網用/行程特色_安全版_RULES.md` | 後台禁忌、基準標籤（tag）、還原指令 |
| `專案最新備註.md` | 離開／回來時的現況與待辦 |

## 遠端儲存庫

- **GitHub**：https://github.com/sammyzomb/peru-55-anniversary  
- 本機已設定 `origin`，主線為 `main`。

換電腦：`git clone https://github.com/sammyzomb/peru-55-anniversary.git`，再以 **`專案最新備註.md`** 與 **RULES 內的 Git 標籤** 對照版本。

## 可選：每小時提醒

見 `scripts/README.md`（Windows 工作排程器；與夏古號專案腳本相同邏輯，任務名稱為 `Peru55-BaselineHourlyReminder`）。
