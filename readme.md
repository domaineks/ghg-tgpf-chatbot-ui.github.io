# GHG TGPF Chatbot UI

## 修改項目

### 程式碼部分
1. index.aspx
   - 加入對話框區塊
   - 調整 script, css, jquery 引用路徑
   - 增加 reCAPTCHA 功能
   - 刪除 原本寫死的對話內容與時間戳記
2. chat.js
   - 新增 智能對話模組 API 呼叫功能
3. chat.css
   - 調整 #inputArea z-index 當對話區上下滾動時不覆蓋輸入框

### 其他部分
- 資料夾結構根據原始檔案路徑調整