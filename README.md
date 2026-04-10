# 祕魯 55 周年｜官網行程特色

與 **夏古號官網正式** 使用**同一官網後台**的「**行程特色**」自訂 HTML 欄位；CMS 行為與上限（例如 `<style>` 數量、欄位長度）**沿用夏古號實測結論**，細節以 `貼官網用/行程特色_安全版_RULES.md` 為準。

## 官方行程頁（對照用）

- **LIM15D**（祕魯 15 日・55 周年慶團）：https://www.tcawg.com/travel/tours/LIM15D-%E7%A7%98%E9%AD%AF-%E5%8D%B0%E5%8A%A0%E5%B8%9D%E5%9C%8B-%E9%A6%AC%E4%B8%98%E6%AF%94%E4%B8%98-%E4%BA%9E%E9%A6%AC%E9%81%9C%E9%9B%A8%E6%9E%97-%E5%BD%A9%E8%99%B9%E5%B1%B1-15%E6%97%A5-55%E5%91%A8%E5%B9%B4%E6%85%B6%E7%89%B9%E6%83%A0%E5%9C%98.html  
- 完整對照說明與待辦連動見根目錄 **`專案最新備註.md`**。

## 檔案分工

| 檔案 | 用途 |
|------|------|
| `貼官網用/行程特色_貼上版.html` | **唯一上線來源**：全選複製，貼入後台「行程特色」 |
| `貼官網用/行程特色_開發版.html` | 日常編輯（註解較多），定稿後同步貼上版 |
| `貼官網用/行程特色_安全版_RULES.md` | 後台禁忌、基準標籤（tag）、還原指令 |
| `貼官網用/行程特色_設計系統.md` | 字級階層、祕魯色票、字型與裝飾／動畫慣例（對應 HTML 內 token） |
| `專案最新備註.md` | 離開／回來時的現況與待辦 |

## 遠端儲存庫

- **GitHub**：https://github.com/sammyzomb/peru-55-anniversary  
- 本機已設定 `origin`，主線為 `main`。

換電腦：`git clone https://github.com/sammyzomb/peru-55-anniversary.git`，再以 **`專案最新備註.md`** 與 **RULES 內的 Git 標籤** 對照版本。

## 可選：每小時提醒

見 `scripts/README.md`（Windows 工作排程器；與夏古號專案腳本相同邏輯，任務名稱為 `Peru55-BaselineHourlyReminder`）。
