
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.input-form {
	width: 80%;
	align: center;
	margin: 0 auto;
}
.btn{
	background:white;
	border-top:1px solid #bbb;
	border-right: 2px solid #aaa;
	border-bottom: 2px solid #aaa;
	border-left:1px solid #bbb;
}

</style>
</head>
<body>
	<div id="primary-info5" class="input-form">
		<table>
			<tr>
				<td style="width: 20%; font-size: 0.7em;">거래 은행 / 예금주</td>
				<td style="width: 80%;">
					<div style="border: 1px solid #ddd; background: #f8f8f8; height:30px; padding-top:10px; padding-button:10px;text-align: center;">
						은행명 &nbsp;
						<select name="bankcode" id="bankcode">
							<option value=''>선택하세요
							<option value='003'>기업은행
							<option value='004'>국민은행
							<option value='011'>농협중앙회
							<option value='012'>단위농협
							<option value='020'>우리은행
							<option value='031'>대구은행
							<option value='005'>외환은행
							<option value='023'>SC제일은행
							<option value='032'>부산은행
							<option value='045'>새마을금고
							<option value='027'>한국씨티은행
							<option value='034'>광주은행
							<option value='039'>경남은행
							<option value='007'>수협
							<option value='048'>신협
							<option value='037'>전북은행
							<option value='035'>제주은행
							<option value='064'>산림조합
							<option value='071'>우체국
							<option value='081'>하나은행
							<option value='088'>신한은행
							<option value='209'>동양종금증권
							<option value='243'>한국투자증권
							<option value='240'>삼성증권
							<option value='230'>미래에셋
							<option value='247'>우리투자증권
							<option value='218'>현대증권
							<option value='266'>SK증권
							<option value='278'>신한금융투자
							<option value='262'>하이증권
							<option value='263'>HMC증권
							<option value='267'>대신증권
							<option value='270'>하나대투증권
							<option value='279'>동부증권
							<option value='280'>유진증권
							<option value='287'>메리츠증권
							<option value='291'>신영증권
							<option value='238'>대우증권
						</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 예금주 &nbsp;
						<input type="text" size="10" name="accpnm" id="accpnm">
					</div>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="font-size: 0.7em;">계좌번호<input type="hidden"></td>
				<td>
					<div style="border: 1px solid #ddd; background: #f8f8f8; height: 50px; padding-top:10px; align:center; text-align:center;">
						계좌번호 &nbsp;
						<input type="text" size="25" placeholder="'-'를 제외하고 입력하세요." name="accnum" id="accnum">
						&nbsp; <input type="checkbox" id="sbm-flag" name="checkacc"
							style="display: none"> <label id="sbm-no"
							style="background: #f11; color: white; border-radius: 3px; padding: 3px;">미인증</label>
						<label id="sbm-ok"
							style="background: green; color: white; border-radius: 3px; padding: 3px; display: none">인증됨</label>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div align="center">
						<br>
						<button class="btn btn-primary btn-xs" id="confirmacc"
							onclick="fnSearchAccessToken()">조회하기</button>
						<label for="" style="display: none" id="question">해당 계좌를
							사용하시겠습니까?</label><br />
						<button class="btn btn-primary btn-xs" id="ok-btn"
							onclick="using();" style="display: none">사용하기</button>
						<button class="btn btn-primary btn-xs" id="no-btn"
							onclick="window.close();" style="display: none">취소</button>
					</div>

				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
	<div>
		<table>

			<colgroup>
				<col style="width: 180px" />
				<col style="width: *" />
			</colgroup>
			<tbody>
				<form name="authCodeFrm" id="authCodeFrm" method="GET"
					action="https://testapi.open-platform.or.kr/oauth/2.0/authorize">

					<tr>
						<th>
							<!-- <span class="ess">Client ID</span> -->
						</th>
						<td><span><input type="hidden" id="client_id"
								name="client_id" style="width: 200px"
								value="l7xx61fc229f6dd040f1894a729558258a72"></span>
					</tr>
				</form>
				<tr>
					<th>
						<!-- <span>Client Secret</span> -->
					</th>
					<td><span><input type="hidden" id="client_secret"
							name="client_secret" style="width: 200px"
							value="6f763a14fddd48f39bb4a0e76e43e71a"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>Access Token</span> -->
					</th>
					<td><span><input type="hidden" id="access_token"
							name="access_token" style="background: #e0e0e0"></span> <!-- <button type="button" onclick="fnSearchAccessToken()">토큰발급</button> --></td>
				</tr>
				<tr>
					<th>
						<!-- <span>은행코드</span> -->
					</th>
					<td><span><input type="hidden" class="txt"
							id="bank_code_std" name="bank_code_std"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>계좌번호</span> -->
					</th>
					<td><span><input type="hidden" class="txt"
							id="account_num" name="account_num"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>예금주 생년월일</span> -->
					</th>
					<td><span><input type="hidden" class="txt"
							id="account_holder_info" name="account_holder_info"
							value="880101" /></span>
				</tr>
				<tr>
					<th>
						<!-- <span>요청일시</span> -->
					</th>
					<td><span style="width: 200px"><input type="hidden"
							class="txt" id="tran_dtime" title="요청일시 입력" name="tran_dtime" /></span>
						<!-- <button type="button" onclick="fnSearchRealName()">계좌실명조회</button> --></td>
				</tr>
				<!-- <tr>
					<th><span>계좌실명조회결과</span></th>
					<td>
						<textarea style="height:220px;width:250px" id="real_name" name="real_name"></textarea>
					</td>
				</tr> -->
			</tbody>
		</table>

	</div>

	<script type="text/javascript">
		$.support.cors = true;
		var reqDate = new Date();
		var year = reqDate.getFullYear() +"";
		var month = (reqDate.getMonth() + 1) > 10?reqDate.getMonth() + 1 + "":"0" + (reqDate.getMonth() + 1);
		var date = (reqDate.getDate() > 10?reqDate.getDate() + "":"0" + reqDate.getDate());
		var hour = reqDate.getHours() > 9?reqDate.getHours() + "":"0" + reqDate.getHours();
		var min = reqDate.getMinutes() > 10?reqDate.getMinutes() + "":"0" + reqDate.getMinutes();
		var sec = reqDate.getSeconds() > 10?reqDate.getSeconds() + "":"0" + reqDate.getSeconds();

		var currentTime = year + month + date + hour + min + sec;
		console.log(currentTime)
		$("#tran_dtime").val(currentTime);
		/* 사용자인증 Access Token 획득 */
		function fnSearchAccessToken() {
			$("#bank_code_std").val($("#bankcode").val());
			$("#account_num").val($("#accnum").val());
			/* var client_id = $("#client_id").val();
			var client_secret = $("#client_secret").val(); */
			var client_id = "l7xx61fc229f6dd040f1894a729558258a72";
			var client_secret = "6f763a14fddd48f39bb4a0e76e43e71a";
			var grant_type = "client_credentials";
			var scope = "oob";
			$.ajax({
				//url: "/tpt/test/getOauthToken",
				url : "https://testapi.open-platform.or.kr/oauth/2.0/token",
				type : "POST",
				//cache: false,
				contenType : "application/json",
				data : {
					"client_id" : client_id,
					"client_secret" : client_secret,
					"grant_type" : grant_type,
					"scope" : scope
				},
				dataType : "json",
				success : function(data, data2, data3) {
					var list = JSON.parse(data3.responseText);
					$("#access_token").val(list.access_token);
					$("#user_seq_no").val(list.user_seq_no);
					fnSearchRealName();
				},
				error : function(data, data2, data3) {
					alert('error!!!');
				}
			});
		}
		/* 계좌실명조회API */
		function fnSearchRealName() {
			var bank_code_std = $("#bank_code_std").val();
			var account_num = $("#account_num").val();
			var account_holder_info = $("#account_holder_info").val();
			var tran_dtime = $("#tran_dtime").val();
			var access_token = "Bearer " + $("#access_token").val();
			var resData = {
				"bank_code_std" : bank_code_std,
				"account_num" : account_num,
				"account_holder_info" : account_holder_info,
				"tran_dtime" : tran_dtime
			};
			$
					.ajax({
						url : "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
						beforeSend : function(request) {
							request.setRequestHeader("Authorization",
									access_token);
						},
						type : "POST",
						data : JSON.stringify(resData),
						dataType : "json",
						success : function(data, data2, data3) {
							console.log(data)
							if (data.account_holder_name == $("#accpnm").val()) {

								$("#sbm-flag").attr("checked", true);
								$("#sbm-ok").show();
								$("#sbm-no").hide();
								var checkacc = "인증됨";
								var pro_no = $
								{
									pro_no
								}
								;
								var bankcode = $('[name=bankcode]').val();
								var accpnm = $('[name=accpnm]').val();
								var accnum = $('[name=accnum]').val();


								alert('인증 성공!!!');
								$("#confirmacc").hide();
								$("#sbm-flag").attr("checked", true);
										$("#sbm-ok").show();
								$("#sbm-no").hide();
								$("[name=accpnm]").attr("readonly",
												"readonly");
								$("[name=accnum]").attr("readonly",
												"readonly");
								$("[name=bankcode]").not(":selected")
												.attr("disabled", "disabled");


								$("#question").show();
								$("#no-btn").show();
								$("#ok-btn").show();


							} else {
								alert('인증 실패');
								$("#sbm-flag").attr("checked", false);
								$("#sbm-ok").hide();
								$("#sbm-no").show();
							}
						},
						error : function(data, data2, data3) {
							alert('error!!!');
						}
					});
		}

		function using(){
			var bankcode = document.getElementById("bankcode");
			var bankName = bankcode.options[bankcode.selectedIndex].text;

			var accpnm = document.getElementById("accpnm");
			var sellerName = accpnm.value;
			var accnum = document.getElementById("accnum");
			var accnumber = accnum.value;

			$("#bankCode",opener.document).val(bankName);
			$("#accountHolder",opener.document).val(sellerName);
			$("#accountNo",opener.document).val(accnumber);

			window.close();
	 		/* opener.document.getElementById('bankCode').value = bankName; */

			/* opener.document.getElementById("bankCode").value = bankCode;
			$("bankCode", opener.document).value(bankCode); */
		}
	</script>

</body>
</html>






















