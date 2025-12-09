
document.addEventListener('DOMContentLoaded', () => {
  const btn = document.querySelector('#go_down');

  btn.addEventListener('click', () => {
    if (btn.classList.contains('up')) {
      // 有 .up → 捲到頂端
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    } else {
      // 沒有 .up → 捲到底部
      window.scrollTo({
        top: document.body.scrollHeight,
        behavior: 'smooth'
      });
    }
  });

  // 監聽捲動事件，判斷是否在頂端或底部
  window.addEventListener('scroll', () => {
    const scrollTop = window.scrollY || document.documentElement.scrollTop;
    const scrollBottom = document.documentElement.scrollHeight - window.innerHeight - scrollTop;

    if (scrollTop === 0) {
      // 在頂端 → 移除 .up，恢復往下功能
      btn.classList.remove('up');
      btn.textContent = '捲動到視窗下方';
      btn.setAttribute('aria-label', '捲動到視窗下方');
    } else if (scrollBottom === 0) {
      // 在底部 → 加上 .up，切換成往上功能
      btn.classList.add('up');
      btn.textContent = '捲動到視窗上方';
      btn.setAttribute('aria-label', '捲動到視窗上方');
    }
  });
}); 

$(function () {
  // 初始字體大小比例 (62.5% ≈ 10px 基準)
  var size = 62.5;
  var maxSize = 75;   // 上限
  var minSize = 55;   // 下限
  var step    = 2.5;  // 每次增減幅度

  // 變大
  $("#textsize_l").on("click", function (e) {
    e.preventDefault();
    if (size + step > maxSize) {
      alert("已是最大的字級!!");
    } else {
      size += step;
      $("body").css("font-size", size + "%");
    }
  });

  // 變小
  $("#textsize_s").on("click", function (e) {
    e.preventDefault();
    if (size - step < minSize) {
      alert("已是最小的字級!!");
    } else {
      size -= step;
      $("body").css("font-size", size + "%");
    }
  });
});

//顯示隱私政策
 document.addEventListener('DOMContentLoaded', () => {
  const agrees = document.querySelector('#agrees');

  document.querySelector('#agree').onclick = () => {
    agrees.style.display = 'block';
  };

  document.querySelector('#ag_close').onclick = () => {
    agrees.style.display = 'none';
  };
});


// ------------------ 2025.12.09 Added Start ------------------

/* ============================================
 * 說明：新增智能對話模組（Chatbot API）
 * ============================================ */

//======================= Chatbot 設定 =======================

const API_BASE_URL = 'https://chat.domaineks-ai.workers.dev';
const RECAPTCHA_SITE_KEY = '6LesLiQsAAAAAIXYoxSUuSA0yAJAPbXf-cdev_Cl';

let isLoading = false;

function getUserId() {
    let userId = localStorage.getItem('dominai-visitor-id');
    if (!userId) {
        userId = `web_${Date.now()}_${Math.random().toString(36).substring(2, 15)}`;
        localStorage.setItem('dominai-visitor-id', userId);
    }
    return userId;
}

// ======================= DOM Ready =======================
$(function () {
    const $form = $("#chat_input");
    const $input = $("#chat_keywords");
    const $talkBox = $("#chatMessages");

    // 1) 頁面載入時先撈歷史訊息
    loadHistory($talkBox);

    // 2) 攔截表單 submit（滑鼠點「送出」或輸入框按 Enter 都會觸發）
    $form.on("submit", async function (e) {
        e.preventDefault();

        const text = $input.val().trim();
        if (!text) return;

        // 取得 reCAPTCHA token
        try {
            const recaptchaToken = await getRecaptchaToken();
            console.log('0001');
            // 顯示使用者訊息
            appendUserMessage($talkBox, text);

            // 清空輸入框
            $input.val("");

            // 呼叫後端 API，並帶上 token
            sendMessageToApi($talkBox, text, recaptchaToken);
        } catch (error) {
            console.error("reCAPTCHA 驗證失敗:", error);
            alert("驗證失敗，請重新整理頁面再試");
        }
    });

    // 3) 額外保險：在輸入框按 Enter 也送出（某些瀏覽器不會觸發 form submit）
    $input.on("keypress", function (e) {
        if (e.key === "Enter") {
            e.preventDefault();
            $form.trigger("submit");
        }
    });
});

// ======================= 取得 reCAPTCHA token =======================
async function getRecaptchaToken() {   
    return new Promise((resolve, reject) => {
        grecaptcha.enterprise.ready(() => {
            grecaptcha.enterprise.execute(RECAPTCHA_SITE_KEY, { action: 'LOGIN' })
                .then(token => {                    
                    console.log('✅ reCAPTCHA token 取得成功');
                    resolve(token);
                })
                .catch(error => {
                    console.error('❌ reCAPTCHA token 取得失敗:', error);
                    reject(error);
                });
        });
    });
}


// ======================= 載入歷史訊息 =======================
async function loadHistory($talkBox) {
    try {
        const userId = getUserId();

        const resp = await fetch(`${API_BASE_URL}/api/chat/history?userId=${encodeURIComponent(userId)}`, {
            method: 'GET'
        });

        if (!resp.ok) {
            console.error('載入歷史失敗，HTTP 狀態碼：', resp.status);
            return;
        }

        const data = await resp.json();
        if (!data || !Array.isArray(data.messages)) {
            return;
        }

        data.messages.forEach(msg => {
            appendMessage($talkBox, msg.text, !!msg.isUser);
        });
    } catch (err) {
        console.error('載入歷史發生錯誤：', err);
    }
}


// ======================= 發送訊息到 Chatbot API =======================
async function sendMessageToApi($talkBox, text, recaptchaToken) {

    if (isLoading) {
        console.warn("等待回覆中，請勿重複送出...");
        return;
    }

    isLoading = true;
    $("#chat_submit").prop("disabled", true); // 禁用按鈕

    showTypingIndicator($talkBox);

    try {
        const userId = getUserId();

        const resp = await fetch(`${API_BASE_URL}/api/chat`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                message: text,
                userId: userId,
                recaptchaToken: recaptchaToken
            })
        });

        if (!resp.ok) {
            console.error('呼叫 /api/chat 失敗，HTTP 狀態碼：', resp.status);
            removeTypingIndicator($talkBox);
            appendBotMessage($talkBox, '（抱歉，目前服務暫時無法回應，請稍後再試）');
            return;
        }

        const data = await resp.json();

        removeTypingIndicator($talkBox);

        if (data && typeof data.reply === "string") {
            appendBotMessage($talkBox, data.reply);
        } else {
            appendBotMessage($talkBox, '（系統沒有回傳可顯示的內容）');
        }
    }
    catch (err) {
        console.error('呼叫 Chatbot API 發生錯誤：', err);
        removeTypingIndicator($talkBox);
        appendBotMessage($talkBox, '（發送訊息時發生錯誤）');
    }
    finally {      
        isLoading = false;
        $("#chat_submit").prop("disabled", false);
    }
}



// ======================= UI 呈現 =======================
function appendUserMessage($talkBox, text) {
    appendMessage($talkBox, text, true);
}

function appendBotMessage($talkBox, text) {
    appendMessage($talkBox, text, false);
}

function escapeHtml(text) {
    const div = document.createElement("div");
    div.textContent = text;
    return div.innerHTML.replace(/\n/g, "<br/>");
}

function appendMessage($talkBox, text, isUser) {

    const safeText = escapeHtml(text);

    const timeStr = new Date().toLocaleTimeString('zh-TW', { hour12: false });

    const tagName = isUser ? "dd" : "dt";
    const roleClass = isUser ? "user" : "bot";

    const html = `
        <${tagName} class="${roleClass}">
            <div class="talk">
                <p>${safeText}</p>
                <time>${timeStr}</time>
            </div>
        </${tagName}>
    `;

    $talkBox.append(html);

    // 自動捲到最底
    window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" });
}


// ======================= 打字指示（正在輸入中） =======================
function showTypingIndicator($talkBox) {
    removeTypingIndicator($talkBox); // 先清一次，避免重複

    const html = `
        <dt class="bot typing" id="typing-indicator">
            <div class="talk">
                <p>
                    智慧小芽思考中 ...
                    <span class="typing-indicator">
                        <span></span><span></span><span></span>
                    </span>
                </p>
            </div>
        </dt>
    `;
    $talkBox.append(html);
}

function removeTypingIndicator($talkBox) {
    $talkBox.find("#typing-indicator").remove();
}

// ------------------ 2025.12.09 Added End ------------------
