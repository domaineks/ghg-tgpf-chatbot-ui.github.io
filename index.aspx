 
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

<!-- Content Security Policy 設定 -->
<meta http-equiv="Content-Security-Policy" content="
  default-src 'self';
  script-src 'self' 'unsafe-inline' 'unsafe-eval' https://www.google.com https://www.gstatic.com;
  frame-src 'self' https://www.google.com;
  style-src 'self' 'unsafe-inline';
  img-src 'self' data: https://www.gstatic.com;
  connect-src 'self' https://www.google.com;
">

<title>AI 智能對話 - 經濟部產業發展署產業節能減碳資訊網</title>
<meta name="keywords" content="節能減碳,產業節能減碳,氣候變遷," />
<meta name="description" content="節能減碳已成為國際間最受關注的課題，為協助廠商降低能資源耗用與溫室氣體排放，提升我國產業生產效率與競爭力，提供「節能減碳技術輔導與諮詢」、「抵換專案示範輔導」以及「節能減碳人才訓練」等服務，協助廠商診斷節能減碳潛力，落實節能減碳改善，或依循環保署溫室氣體抵換專案推動原則與程序，取得減量額度，獲得生產成本降低以及碳資產之雙重效益。" />
<meta name="googlebot" content="index,follow" />
<meta name="robots" content="index,follow" />
<meta name="revisit-after" content="1 days" />
<meta name="subject" content="經濟部產業發展署產業溫室氣體管理與調適計畫專案 委辦" />
<meta name="author" content="財團法人台灣綠色生產力基金會 製作" />

<!-- HTML5 shim 和 Respond.js 讓IE8支援HTML5元素和媒體查詢 -->
<!--[if lt IE 9]>
  <script src="../scripts/html5shiv.js"></script> 
  <script src="../scripts/css3-mediaqueries.js"></script>
  <script src="../scripts/respond.min.js"></script>
<![endif]-->

<!-- ============= 2025.12.09 Modified Start ============= -->

<!-- CSS Source -->
<!-- 修改 CSS Source 與 Jquery Source 引用位址 -->
<link rel="stylesheet" href="../Content/cssStyle/html5reset-1.6.1.css" />
<link rel="stylesheet" href="../Content/cssStyle/chat.css" />	

<!-- Load reCAPTCHA -->
<script src="https://www.google.com/recaptcha/enterprise.js?render=6LesLiQsAAAAAIXYoxSUuSA0yAJAPbXf-cdev_Cl"></script>

<!-- Jquery Source -->
<script src="../scripts/vser/jquery.min.js"></script>

<!-- ============= 2025.12.09 Modified End ============= -->

</head>

<body class="chat_bg">
<a href="#C" class="sr-only sr-only-focusable SSP" title="跳到主要內容區塊" tabindex="1">跳到主要內容區塊</a>
<div id="wrapper">
  <h1 class="sr-only">經濟部產業發展署產業節能減碳資訊網 - AI智能助理</h1>
	<header id="header">
		
		<div class="logo">
			<a href="../" tabindex="1" title="回首頁"><span class="sr-only">經濟部產業發展署產業節能減碳資訊網</span></a>
		</div>
		
		<div id="textsize" class="textsize ">
            <a href="javascript:l();" id="textsize_l" aria-label="網頁字級變大" role="button" ><i class="sizeL">大</i></a>
 			 <!-- <a href="javascript:m();" id="textsize_m" aria-label="網頁字級一般" class="ts-on" role="button" aria-pressed="true"><i class="sizeM">中</i></a>-->
            <a href="javascript:s();" id="textsize_s" aria-label="網頁字級變小" role="button" ><i class="sizeS">小</i></a>
        </div>
		
	</header>
	<div class="pps_txt">
		為保護您的權益，請詳細閱讀 「 <a href="javascript:void(0);" id="agree" role="button" title="打開隱私權政策內容">隱私權政策</a>」 如您已充分瞭解並同意，請繼續進行對談服務。
	</div>

  <!-- ============= 2025.12.09 Modified Start ============= -->

	<!-- 對話框開始 -->
	<dl class="talk_box" id="C">
		<dt>
 			<div class="talk">
				<p>你好，我是「智慧小芽」，請問今天想讓小芽為你做些什麼呢？</p>
				<p>在開始之前，小芽先跟你說明一下：<br>小芽會盡力以最合理、最可靠的AI生成技術產出對話內容，但仍有可能出現些許不準確或疏漏的地方。如果你發現需要調整的部分，歡迎隨時告訴小芽，小芽會努力改進、提供更貼近你需求的資訊唷！</p>				
			</div>			
		</dt>
		<noscript>
			<p style="text-align: center">您的瀏覽器不支援Javascript，請開啟瀏覽器的Javascript功能，才能正常操作本網頁功能!</p>
			<style>#go_down, #textsize{ display: none;}</style>
		</noscript>
	</dl>
	<!-- 對話框結束 -->

  <!-- ============= 2025.12.09 Modified End ============= -->
	
	
	<button id="go_down" aria-label="捲動到視窗下方">捲動到視窗下方</button>
	
	<form id="chat_input">
		<div class="input_box">
 			<label class="sr-only" for="chat_keywords">關鍵字</label>
			<input type="text" id="chat_keywords" class="chat_keywords" aria-label="請輸入關鍵字或對話內容" placeholder="請輸入關鍵字">
			<label class="sr-only" for="chat_submit">關鍵字</label>	
			<input id="chat_submit" class="chat_submit" type="submit" aria-label="送出你的對話內容" value="送出">
		</div>
	
	</form>

  <!-- ============= 2025.12.09 Modified Start ============= -->

	<!-- 增加與顯示對話訊息的區塊 -->
	<dl class="talk_box" id="chatMessages"></dl>

  <!-- ============= 2025.12.09 Modified End ============= -->

</div>
<!-- End wrapper -->
	
	<section id="agrees"  style="display: none">
		<article class="box">
			<button id="ag_close" aria-label="同意並關閉隱私權政策">關閉</button>
            <div class="over_box">
				<strong class="ag_tit">隱私權政策</strong>
				  <div class="s_tit">蒐集個人資料告知事項暨個人資料同意書</div>
				   <p class="strong"><strong>蒐集個人資料告知事項：</strong></p>
				  <p class="txt">「經濟部產業發展署」(以下簡稱本署)委託「財團法人台灣綠色生產力基金會」執行【製造部門低碳生產推廣計畫】，為遵守個人資料保護法規定，在您提供個人資料予本署前，依法告知下列事項：</p>
				  <ol>
					<li>本署或本署授權之專案管理單位，因【006工業行政、182其他諮詢與顧問服務】而獲取您下列個人資料類別：【C001辨識個人者、C011個人描述、C061現行之受僱情形】或其他得以直接或間接識別您個人之資料。</li>
					<li>本署將依個人資料保護法及相關法令之規定下，依本署隱私權保護政策，蒐集、處理及利用您的個人資料。</li>
					<li>本署將於蒐集目的之存續期間合理利用您的個人資料。</li>
					<li>除蒐集之目的涉及國際業務或活動外，本署僅於中華民國領域內利用您的個人資料。</li>
					<li>本署將於原蒐集之特定目的、本次以外之產業之推廣、宣導及輔導、以及其他公務機關請求行政協助之目的範圍內，合理利用您的個人資料。</li>
					<li>您可依個人資料保護法第3條規定，就您的個人資料向本署或本署授權之專案管理單位（許小姐，電話：02-2910-6067 轉538），行使下列權利：<br>
					  (1) 查詢或請求閱覽。　　(2) 請求製給複製本。<br>
					  (3) 請求補充或更正。　　(4) 請求停止蒐集、處理或利用。　　(5) 請求刪除。<br>
					  依個人資料保護法第14條規定，本署得酌收行政作業費用。</li>
					<li>若您未提供正確之個人資料，本署或本署授權之專案管理單位將無法為您提供特定目的之相關業務。</li>
					<li>本署因業務需要而委託其他機關處理您的個人資料時，將善盡監督之責。</li>
					<li>您瞭解此一同意書符合個人資料保護法及相關法規之要求，且同意本署留存此同意書，供日後取出查驗。</li>
				  </ol>
				   <p class="txt">&nbsp;</p>             
				  <p class="strong"><strong>個人資料之同意提供：</strong></p>
				  <ol>
					<li>本人已充分知悉貴署上述告知事項。</li>
					<li>本人同意貴署或貴署授權之專案管理單位，蒐集、處理、利用本人之個人資料，以及其他公務機關請求行政協助目的之提供。</li>
				  </ol>
			 </div><!--/over_box-->
       </article>
 	</section><!--/pops-->
	
 <script src="../scripts/vser/chat.js"></script>	
</body>
</html>
