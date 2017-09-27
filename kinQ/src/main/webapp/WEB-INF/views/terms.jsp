<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<title>利用約款</title>
	<meta name="description" content="Ask me Responsive Questions and Answers Template">
	<meta name="author" content="vbegy">
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Main Style -->
	<link rel="stylesheet" href="./resources/css/style.css">
	
	<!-- Skins -->
	<link rel="stylesheet" href="./resources/css/purple.css">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
  
  <script type="text/javascript">
  
  	function changeToQnA(){
		var html = '';
		html+= '<div id="contact" class="row">';
		html+= '<div class="col-md-12"><div class="boxedtitle page-title"><h2>Contact Forms</h2></div></div>';
		html+= '<div class="col-md-8">';
		html+= '<div class="page-content">';
		html+= '<form class="form-style form-style-3 form-style-5">';
		html+= '<div class="form-inputs clearfix">';
		html+= '<p><label class="required">Name<span>*</span></label><input type="text" value="" aria-required="true"></p>';
		html+= '<p><label class="required">E-Mail<span>*</span></label><input type="text" value="" aria-required="true"></p>';
		html+= '<p><label>Website</label><input type="text" value=""></p></div>';
		html+= '<div class="form-textarea">';
		html+= '<p><label class="required">Message<span>*</span></label><textarea aria-required="true" cols="58" rows="5"></textarea></p></div>';
		html+= '<p class="form-submit"><input name="submit" type="submit" value="Submit" class="submit button medium color"></p>';
		html+= '</form></div></div>';
		
  		$('#termsTitle').html('キューアンドエー');
  		$('#innerTerms').html(html);
  	}
  	
  	function changeToTerms(){
  		var html = '';
  		
  		html+='<h3>緊Ｑコンテンツ供給者利用約款</h3>';					
  		html+='<pre><br>';
  		html+='<strong id="term1">第1条 [目的]</strong><hr>';
  		html+='本利用約款(以下「約款」といいます)は緊Ｑ(以下「会社」と言います)にコンテンツをアップロードして、緊Q利用者に提供-販売するコンテンツ供給者の権利と義務を規定するにその目的があります。<br>';
  		html+='<br><strong id="term2">第2条 〔用語の定義]</strong><hr>';
  		html+='コンテンツ供給者とは緊Ｑに加入して「緊Ｑ利用約款」に明示されたコンテンツをアップロードして提供・販売する個人や法人を表します。<br>';
  		html+='<br><strong id="term3">第3条  [使用の形態及びサービスの趣旨]</strong><hr>';
  		html+='会社はコンテンツ供給者が供給したデジタルコンテンツを一般大衆(B2C)、企業(B2B)、あるいは政府機関(B2G)に流通する役割をします。 コンテンツ供給者は仲介プラットフォーム利用料と決済代行サービス利用料を支払います。<br>';
  		html+='<br><strong id="term4">第4条 [約款準用]</strong><hr>';
  		html+='本利用約款と、緊Ｑ利用約款に衝突される事項がある場合、この約款が優先して適用され、本約款に明記されていない事項は緊Qの利用約款を準用します。<br>';
  		html+='<br><strong id="term5">第5条 [コンテンツ供給者の義務事項]</strong><hr>';
  		html+='(1) コンテンツ供給者は著作権問題があるコンテンツや教育目的がないコンテンツをアップロードしてはいけません。<br>';
  		html+='(2) コンテンツ供給者は、コンテンツのアップロード、質問に対する応答など事後管理に最善を尽くさなければならないです。<br>';
  		html+='(3) コンテンツ供給者は質問者の数を増やす会社側の努力に誠実に協力しなければなりません。<br>';
  		html+='(4) コンテンツ供給者は精算などに問題がある場合6ヵ月以内に書面あるいは電子メールを通じて会社側に異議を提起しなければなりません。 6ヵ月が超過する場合は精算に対する異議を提起することはできず、1年が過ぎれば、精算記録は自動的に廃棄されます。<br>';
  		html+='<br><strong id="term6">第6条 [不正利用禁止および違約罰]</strong><hr>';
  		html+='(1) 会社は、次の各号に該当する場合、不正利用行為と見ます。';
  		html+='-　緊Ｑ外部で緊Ｑ内のコンテンツの利用料を受け取る行為(オフラインで使用料を受け取る行為や外部に有料で販売される商品、会員券などに緊Qコンテンツの利用権限を含む行為も不正利用行為に含まれます)';
  		html+='-　広告の目的で完結性のないコンテンツをアップロードする行為';
  		html+='-　緊Qサービスについて事実関係と異なる内容を流布するなど、名誉毀損をする行為';
  		html+='-　反射的利益を目的に緊Q内の他の答えを否定的に描写したり、そのような内容を広報する行為';
  		html+='-　質問者のアカウント、パスワードを聞き出す行為';
  		html+='-　特定の顧客に価格を差別したり、無料で提供するため、反復的に価格や公開設定を変更する行為<br>';
  		html+='(2) 会社は1項で言及された不正行為を確認した場合、次のような措置を会社の決定によって取ることができ、利用者はコンテンツのアップロードや公開すると、この判断と措置について民事・刑事的に同意したものとみなします。';
  		html+='[1次発生時]サービス内メモ、電子メール、電話などを通じた警告';
  		html+='[2次発生時]支給前、収益分配の方を会社が違約罰として直ちに徴収、当該個人/法人の永久脱退や再加入禁止、コンテンツの削除、民事訴訟(言及された違約罰は被害賠償に含まれていない)、刑事告発<br>';
  		html+='(3) 2項の措置について異議がある場合、コンテンツ供給者は、法律代理人を通じてこれを会社で説明することができます。<br>';
  		html+='<br><strong id="term7">第7条 【講座制裁]</strong><hr>';
  		html+='(1) 第6条に明示された不正利用行為以外に、会社が必要と判断した場合、会社は会社内部2人と外部の1人で構成されたコンテンツ審議委員会の全会一致の議決を通じて、講座に対する制裁措置を取ることができます。<br>';
  		html+='(2) 制裁対象になる場合は次のようです。';
  		html+='講座の内容や品質に対するお客さんのクレームが2回以上累積された場合';
  		html+='質問者の評価が過度に低い場合';
  		html+='類似科学、極端的宗教、極端的政治思想、嫌悪、嫌悪に対するミラーリングなどのサービス内の嫌悪感を与えることができたり、混乱を引き起こす恐れのある内容が含まれた場合';
  		html+='コンテンツ供給者が法廷紛争中かマスコミに否定的な記事が出るなど、緊Qサービスの信頼度を落としかねない場合';
  		html+='その他の会社がサービスの健全な維持発展に向けて必要と判断する場合<br>';
  		html+='(3) 制裁は次のような形で行われます。';
  		html+='修正勧告、コンテンツの一時非公開処理、任意的コンテンツ修正、コンテンツの管理者変更など<br>';
  		html+='(4) 制裁をする場合、会社は、コンテンツ供給者に制裁措置以前あるいは制裁措置以来7日以内に制裁の理由と内容を電子メールあるいはサービス内メモ機能などを通じて通告します。';
  		html+='(5) 措置について異議がある場合、コンテンツ供給者はこれを電子メールあるいは1:1問い合わせ等を通じて会社に接受させることができ、この場合、会社は、コンテンツ審議委員会に再議決を要請します。 再議決が行われた事案については再び異議提起をなさることができません。<br>';
  		html+='<br><strong id="term8">第8条 [収益の配分や精算]</strong><hr>';
  		html+='(1) 会社は、コンテンツ供給者と原則的に(コンテンツ供給者):(会社)=約7:3で収益を分配し、精算過程、具体的な割合など詳細な内容はサービス内の別で公示します。<br>';
  		html+='(2) 1項にもかかわらず、会社が製作支援をしたり、積極的に販売促進活動をする場合、書面合意などを通じて収益分配率を調整することができます。<br>';
  		html+='<br><strong id="term9">第9条 [アップロードコンテンツの責任及び権利]</strong><hr>';
  		html+='(1) コンテンツ供給者がアップロードしたコンテンツに対する権利は、コンテンツ供給者に帰属され、アップロードのコンテンツ提供の瑕疵等に対するすべての責任はコンテンツ供給者にあります。 特に、コンテンツ供給者がアップロードしたコンテンツについて知識財産権関連の紛争が発生した場合にこれに対する責任はコンテンツ供給者にあります。<br>';
  		html+='(2) 1項にもかかわらず、会社は販売促進の目的でコンテンツ供給者がアップロードした紹介文、イメージ、講座の一部等を使用することができます。 会社が使用する行為には、当該著作物を第3プラットフォームなどにアップロードしたり、2次加工して配布又は利用するものも含まれます。<br>';
  		html+='(3) 1項にもかかわらず、コンテンツ供給者がコンテンツの製作過程で支援を受けたり、別途の合意を通じて販売促進活動を共同で施行した場合、会社は合意によって原則的にコンテンツに対する独占流通圏を持ち、コンテンツ供給者は、当該コンテンツを緊Qサービス以外で流通しようとする場合、会社の同意を求めなければなりません。<br>';
  		html+='<br><strong id="term10">第10条 〔価格設定および割引]</strong><hr>';
  		html+='(1) 質問者は自分がアップロードしたコンテンツに対する価格を設定することができます。 ただし、コンテンツ供給者が既に設定した価格を変更する場合、会社はこれを期間、回数、承認要請及びその組合の形を利用して制限することができます。<br>';
  		html+='(2) 会社は価格が不当と判断する場合1年に4回に限り、次のように価格を変更することができます。';
  		html+='合意後制限無しに価格を変更(メール送信後7日以内返信ない場合、同意とみなす)';
  		html+='合意がない場合、講師が設定した価格で30%範囲内で変更後メールで関連内容の通知<br>';
  		html+='<br><strong id="term11">第11条 [コンテンツ利用期間設定]</strong><hr>';
  		html+='(1) コンテンツ供給者は自分がアップロードした有料コンテンツに対しての利用期間を設定することができます。';
  		html+='(2) 1項にもかかわらず、会社は必要な場合、コンテンツ利用期間を任意に調整することができます。 この場合、会社はサービス内にその理由、趣旨などを明示したり、コンテンツ供給者にサービス内メモ、電子メールなどを送って事前に同意を受けます。<br>';
  		html+='<br><strong id="term12">第12条 [会社の義務]</strong><hr>';
  		html+='(1) 会社は、コンテンツ供給者の便利で楽なコンテンツアップロード及び管理に最善を尽くさなければならないです。<br>';
  		html+='(2) 会社はプラットフォームには、利益になって、特定のコンテンツ供給者には不利なプロモーションを原則的にせず、実施する場合、コンテンツ供給者に事前同意を得なければなりません。<br>';
  		html+='(3) 会社はサイバーマネー発行について愼重でなければならないし、これを一ヵ月の範囲として、加入者1人当たり10,000円以上を発給する場合、コンテンツ供給者全員の同意を受けなければなりません。 同意はメールでご案内をして1週以内に異議申し立てがない場合、行われたものとします。<br>';
  		html+='<br><strong id="term13">第13条 [紛争の解決]</strong><hr>';
  		html+='すべての紛争は韓国の法に根拠して解決し、管轄裁判所は、ソウル中央地方裁判所とします。';
  		html+='付則'; 
  		html+='本約款は2017年10月1日から施行されます。</pre>';
  		
  		$('#termsTitle').html('利用約款');
  		$('#innerTerms').html(html);
  	}
  </script>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />

	<div class="breadcrumbs">
		<section class="container">
		
				<div class="col-md-12">
					<h1>サービス案内</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<span class="current">利用約款</span>
					</div>
				</div>
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<section class="container main-content page-left-sidebar">
		<div class="row">
			<div class="col-md-9">
					
				<div id="alert" class="row">
				<div class="col-md-12"><div class="boxedtitle page-title"><h2 id="termsTitle">キューアンドエー</h2></div></div>
					<div class="col-md-12">
						<div class="page-content page-shortcode" style="padding: 4%">
						<div id="innerTerms">
								<div id="contact" class="row">
									<div class="col-md-12">
										<div class="boxedtitle page-title">
											<h2>Contact Forms</h2>
										</div>
									</div>
									<div class="col-md-8">
										<div class="page-content">
											<form class="form-style form-style-3 form-style-5">
												<div class="form-inputs clearfix">
													<p>
														<label class="required">Name<span>*</span></label><input type="text" value="" aria-required="true">
													</p>
													<p>
														<label class="required">E-Mail<span>*</span></label><input type="text" value="" aria-required="true">
													</p>
													<p>
														<label>Website</label><input type="text" value="">
													</p>
												</div>
												<div class="form-textarea">
													<p>
														<label class="required">Message<span>*</span></label>
														<textarea aria-required="true" cols="58" rows="5"></textarea>
													</p>
												</div>
												<p class="form-submit">
													<input name="submit" type="submit" value="Submit"
														class="submit button medium color">
												</p>
											</form>
										</div>
										</div>
									</div>

								</div>
								<!-- End page-content -->
					</div>
				</div><!-- End #alert -->
				
				</div><!-- End #columns -->
				
			</div><!-- End main -->
			
			<aside class="col-md-3 sidebar">
				<div class="widget widget_menu widget_menu_jquery">
					<ul>
						<div class="accordion">
						
						<li class="accordion-title"><a href="#" onclick="javascript:changeToQnA()"><i class="icon-thumbs-up"></i>Q&A</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="#">キューアンドエー</a></li>
							</ul>
							</div>
						
						<li class="accordion-title"><a href="#alert" onclick="javascript:changeToTerms()"><i class="icon-bullhorn"></i>利用約款</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="#term1">目的</a></li>
								<li><a href="#term2">用語の定義</a></li>
								<li><a href="#term3">サービスの趣旨</a></li>
								<li><a href="#term4">約款準用</a></li>
								<li><a href="#term5">義務事項</a></li>
								<li><a href="#term6">不正利用禁止・違約罰</a></li>
								<li><a href="#term7">講座制裁</a></li>
								<li><a href="#term8">収益の配分や精算</a></li>
								<li><a href="#term9">責任及び権利</a></li>
								<li><a href="#term10">価格設定</a></li>
								<li><a href="#term11">利用期間設定</a></li>
								<li><a href="#term12">会社 の義務</a></li>
								<li><a href="#term13">紛争の解決</a></li>
							</ul>
							</div>

						</div>
					</ul>
				</div><!-- End widget_menu -->
			</aside><!-- End sidebar -->
			
		</div><!-- End row -->
	</section><!-- End container -->
	<jsp:include page="footer.jsp" flush="false" />
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="./resources/js/jquery.easing.1.3.min.js"></script>
<script src="./resources/js/html5.js"></script>
<script src="./resources/js/twitter/jquery.tweet.js"></script> 
<script src="./resources/js/jflickrfeed.min.js"></script>
<script src="./resources/js/jquery.inview.min.js"></script>
<script src="./resources/js/jquery.tipsy.js"></script>
<script src="./resources/js/tabs.js"></script>
<script src="./resources/js/jquery.flexslider.js"></script>
<script src="./resources/js/jquery.prettyPhoto.js"></script>
<script src="./resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script src="./resources/js/jquery.scrollTo.js"></script>
<script src="./resources/js/jquery.nav.js"></script>
<script src="./resources/js/tags.js"></script>
<script src="./resources/js/jquery.bxslider.min.js"></script>
<script src="./resources/js/custom.js"></script>
<!-- End js -->

</body>
</html>