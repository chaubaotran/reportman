<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="container-fluid manual">
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>
	
		<div class="row manual-main-frame">						
			<%@ include file="fragments/sidebar.jsp"%>	
						
			<div class="col-9 col-md-10">		
				<div class="accordion" id="accordionExample">
					<div class="card">
					    <div class="card-header" id="headingOne">
					        <h2 class="mb-0">
					        	<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">概要</button>
					        </h2>
					    </div>

						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
						  	<div class="card-body">
						  		<img class="logo-img" src="${pageContext.request.contextPath}/resources/img/logo.png" alt=logo_img" />
						  		<div>
							  		<p><strong>レポーマン</strong>とは、社内の日報作成や管理することが誰でも簡単にできる、タスベトナムのウェブサービスです。</p>
							  		<p>テンプレートで作成することにより、重要な項目だけに集中でき、書い手も読み手も手間を削減することができる効率なシステムです。</p>
							  		<p>新しい日報が登録されると、自動的に管理者に共有されます。また、毎月の日報状況を一覧から確認することや提出頻度も簡単に把握できます。</p>						  		
						  		</div>
						  		
						  	</div>
						</div>
  					</div>
  
  					<div class="card">
					    <div class="card-header" id="headingTwo">
				        	<h2 class="mb-0">
				        	<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">ユーザー説明 </button>
				        	</h2>
					    </div>
    					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      						<div class="card-body">
								<p>レポーマンシステムの利用者は<strong>研修生・指導者・アドミン</strong>に分けています。</p>
								<img src="${pageContext.request.contextPath}/resources/img/user.jpg" alt="user_img" />
								<p><strong>研修生</strong>と呼ばれるユーザーは標準権限を持ち、個人日報の作成・閲覧・編集のことができます。日報の作成且つ編集は本ユーザーの独特な権限であり、他ユーザーは日報の閲覧しかできません。</p>
								<p><strong>指導者</strong>とは研修生全員の日報を閲覧する権限のある利用者のことです。また、日報を読んだ際に、確認することもできます。</p>
								<p><strong>アドミンユーザー</strong>とは「全体の管理権限」を有する人のことを示しています。指導者の権限を全て持っているだけではなく、アカウント管理を行うこともできます。アカウント管理には登録や変更作業があります。研修生のアカウントは誰でも登録できますが、指導者やアドミンの権限を持つアカウントはアドミンしか登録できないことになっています。また、アドミンユーザーは登録しているアカウントの情報を変更することもできますがパスワードの変更は本人しかできないことになっています。</p>
					       </div>
    					</div>
					</div>
					
					<sec:authorize access="hasAnyRole('EMPLOYEE')">
						<div class="card">
							<div class="card-header" id="headingThree">
								<h2 class="mb-0">
									<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									 研修生向けの使用方法
									</button>
								</h2>
							</div>
							
							<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
								<div class="card-body">
								
									<h5><strong>日報作成</strong></h5>
									
									<p>日報作成するために以下の操作で行います。</p>
									<p>新規作成をクリックし、日報フォームが表示されます。</p>
									<p>日報フォームの各項目に記入し、提出ボタンを押します。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_1.jpg" alt="user_img" />
									
									<p>注意：いずれかの項目を記入しないままに提出したら、エラーメッセージが出ます。</p>								

									<img src="${pageContext.request.contextPath}/resources/img/manual_2.jpg" alt="user_img" />
									
									<h5><strong>日報一覧</strong></h5>
									
									<p>登録している日報を一覧から見ることができます。</p>
									<p>日報一覧をクリックすると、登録している日報の全部が表示されます。</p>
									<p>年と月で抽出することもできます。</p>
									<p>各日報には編集ボタンが付いています。このボタンを押したら、日報編集の画面に遷移します。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_3.jpg" alt="user_img" />
																	
									<h5><strong>日報編集</strong></h5>
									
									<p>日報編集画面では、該当日報の内容を変更することができます。</p>
									<p>日付の項目以外にすべての内容は変更可能になっています。</p>
									<p>変更を行ったら、編集ボタンを押すことで、新しい内容を登録できます。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_4.jpg" alt="user_img" />
									
									<h5><strong>毎月状況</strong></h5>
									
									<p>毎月状況画面では一月の日報作成頻度を一覧から見られます。</p>
									<p>毎月状況をクリックすると、今月の状況が表示されます。</p>
									<p>年と月で抽出することもできます。</p>
									<p>日報を書いた日付にはグリーンの丸いアイコンが貼り付けられます。グリーンアイコンをクリックすると、該当日報の編集画面に遷移します。</p>
									<p>一方、日報まだ書いていない日付にはブランクのバツアイコンが貼り付けられます。ブラックアイコンをクリックする、日報作成の画面に遷移します。日報の日付は自動的に該当する日付になります。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_5.jpg" alt="user_img" />
									
									<h5><strong>アカウント用メニュー</strong></h5>
									
									<p>一番右側にユーザーのアイコンがあります。これを押すと、アカウント用メニューが出てきます。</p>
									<p>メニューではアカウント編集・パスワード編集・ログアウトが選択できます。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_6.jpg" alt="user_img" />
									
									<h5><strong>アカウント編集</strong></h5>
									
									<p>アカウント編集する方法は以下の通りです。</p>
									<p>パスワード以外にユーザーの全ての情報はここで変更できます。</p>
									<p>しかし、ユーザー権限の項目はアドミンのユーザーしか変更できないことになっています。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_7.jpg" alt="user_img" />									

									<h5><strong>パスワード編集</strong></h5>
									
									<p>パスワード編集するために以下の手順で行います。</p>
									<p>現在パスワード・新しいパスワード・確認の順に記入します。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_8.jpg" alt="user_img" />
									
									<p>いずれかの項目を記入しないまま登録したら、エラーが出ます。</p>

									<img src="${pageContext.request.contextPath}/resources/img/manual_9.jpg" alt="user_img" />
									
									<p>現在パスワードを正しく提出しないと、以下のエラができます。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_10.jpg" alt="user_img" />
									
									<p>また、新しいパスワードと確認の内容を統一しないと、以下のエラも出ます。</p>
									
									<img src="${pageContext.request.contextPath}/resources/img/manual_11.jpg" alt="user_img" />

									<p>必ず以上の点をご注意ください。</p>



									








									
								</div>
							</div>
						</div>
				</sec:authorize>
				
				<sec:authorize access="hasAnyRole('MANAGER')">
						<div class="card">
							<div class="card-header" id="headingFour">
								<h2 class="mb-0">
									<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
									 指導者向けの使用方法
									</button>
								</h2>
							</div>
							
							<div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
								<div class="card-body">
								</div>
							</div>
						</div>
				</sec:authorize>
				
				<sec:authorize access="hasAnyRole('ADMIN')">
						<div class="card">
							<div class="card-header" id="headingFive">
								<h2 class="mb-0">
									<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
									 アドミン向けの使用方法
									</button>
								</h2>
							</div>
							
							<div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
								<div class="card-body">
								</div>
							</div>
						</div>
				</sec:authorize>
			</div>
		</div>
	</div>
</div>
	
	<script>
		window.onload = function() {
			var path = window.location.pathname;
			var menu = document.querySelector(".drop-down-menu");
			var toggleBtn = document.querySelector(".toggle-btn");		
			var navLinks = Array.from(document.querySelectorAll(".nav-link"));
			
			const getTodayDate = () => {
				var date = new Date();
	
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
	
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
	
				var today = year + "-" + month + "-" + day;     
				return today;
			}	
			
			const getParam = (string) => {
				var url_string = window.location.href;
				var url = new URL(url_string);
				var paramValue = url.searchParams.get(string);
				return paramValue
				
			}
			
			/* Make sidebar active item stand out */
			navLinks.forEach(item => {
				if (item.getAttribute("href").startsWith(path)) {
					item.classList.add("active");
				} else {
					item.classList.remove("active");
				}
			})			
			/* Make report date max value is today */
			if (getParam("reportDate") == null) {
				document.getElementById("report-date").value = document.getElementById("report-date").value != null ? document.getElementById("report-date").value : getTodayDate();				
			} else {
				document.getElementById("report-date").value = getParam("reportDate");
			}
			
			document.getElementById("report-date").setAttribute("max", getTodayDate());
		
			/* Make drop down menu disappear when user clicks outside */
			document.addEventListener("click", function(e) {
				if (!menu.contains(e.target) && !toggleBtn.contains(e.target)) {
					menu.classList.remove("active");
				}			
			})
			
		}
			
		function confirmSubmit() {
			var agree=confirm("Are you sure you wish to submit this report? Once submitted, report cannot be deleted");
			if (agree)
			 return true ;
			else
			 return false ;
		}	
		
		function toggleMenu() {
			var menu = document.querySelector(".drop-down-menu");
			menu.classList.toggle("active");
		}	
	</script>
	
<%@ include file="fragments/footer.jsp"%>