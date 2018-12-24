	//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var idCheck = 0;
	var pwdCheck = 0;
	var phoneCheck = 0;
	var emailCheck = 0;
	var dnsCheck = 0;
	var addrCheck = 0;

//다음 지도 검색 API
	function sender_findPost() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';

						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						document.getElementById('postcode1').value = data.zonecode;
						document.getElementById('address1').value = fullAddr;
						document.getElementById('address2').focus();
					}
				}).open();
	}
	function receiver_findPost() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';

						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						document.getElementById('postcode2').value = data.zonecode;
						document.getElementById('address3').value = fullAddr;
						document.getElementById('address4').focus();
					}
				}).open();
	}
	//숫자만 입력하도록 강제하는 코드
	function InpuOnlyNumber(obj) {
		if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
			return true;
		} else {
			event.returnValue = false;
		}
	}


	
	//아이디 체크하여 가입버튼 비활성화, 중복확인.
	function checkId() {

		var inputed = $("#checkaa").val();
		var lengthRules1 = /^[a-zA-Z0-9]{4,15}$/;

		var password = 'password1';

		if (!lengthRules1.test(inputed)) {
			$("#checkaa").css("background-color", "#FFCECE");
			$("#signupbtn").prop("disabled", true);
			$("#signupbtn").css("background-color", "#aaaaaa");

			idCheck = 0;
			modal({
				type: 'alarm',
				title: '아이디',
				text: '아이디는 최소 4자 이상 입력하셔야 합니다',
				callback: function(result) {
				}
			});
			return false;
		} else {
			$.ajax({
				data : {
					id : inputed
				},
				url : "chk_id",
				success : function(data) {
					if (inputed == "" && data == '0') {
						;
						$("#checkaa").css("background-color", "#FFCECE");
						$("#signupbtn").prop("disabled", true);
						$("#signupbtn").css("background-color", "#aaaaaa");
						idCheck = 0;
						modal({
							type: 'alarm',
							title: '아이디',
							text: '아이디를 입력하세요',
							callback: function(result) {
							}
						});
					} else if (data == '0') {
						$("#checkaa").css("background-color", "#B0F6AC");
						idCheck = 1;
						modal({
							type: 'alarm',
							title: '아이디',
							text: '사용할 수 있는 아이디입니다',
							callback: function(result) {
							}
						});
						if (idCheck == 1 && pwdCheck == 1 && phoneCheck == 1 && emailCheck == 1 &&
								dnsCheck == 1 && addrCheck == 1) {
							$("#signupbtn").prop("disabled", false);
							$("#signupbtn").css("background-color", "#4CAF50");

						}
					} else if (data == '1') {
						modal({
							type: 'alarm',
							title: '아이디',
							text: '존재하는 아이디입니다 사용할 수 없습니다',
							callback: function(result) {
							}
						});
						$("#signupbtn").prop("disabled", true);
						$("#signupbtn").css("background-color", "#aaaaaa");
						$("#checkaa").css("background-color", "#FFCECE");
						idCheck = 0;
					}
				}
			});

		}
		console.log("id" + idCheck);
		console.log("pwd" + pwdCheck);
	}

	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
	function checkPwd() {

		// : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8~20자리
		var pwRules = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{2,20}).{8,20}$/;

		var inputed = $('#pass').val();

		if (!pwRules.test(inputed)) {
			$("#pass").css("background-color", "#FFCECE");
			$("#signupbtn").prop("disabled", true);
			$("#signupbtn").css("background-color", "#aaaaaa");

			pwdCheck = 0;
		} else {
			$("#pass").css("background-color", "#B0F6AC");
			var reinputed = $('#repwd').val();
			if (reinputed == ""
					&& (inputed != reinputed || inputed == reinputed)) {
				$("#signupbtn").prop("disabled", true);
				$("#signupbtn").css("background-color", "#aaaaaa");
				$("#repwd").css("background-color", "#FFCECE");
			} else if (inputed == reinputed) {
				$("#repwd").css("background-color", "#B0F6AC");
				pwdCheck = 1;
				if (idCheck == 1 && pwdCheck == 1 && phoneCheck == 1 && emailCheck == 1 && dnsCheck == 1 && addrCheck == 1) {
					$("#signupbtn").prop("disabled", false);
					$("#signupbtn").css("background-color", "#4CAF50");
				}
			} else if (inputed != reinputed) {
				pwdCheck = 0;
				$("#signupbtn").prop("disabled", true);
				$("#signupbtn").css("background-color", "#aaaaaa");
				$("#repwd").css("background-color", "#FFCECE");

			}

		}

	}

	
	function check_phone() {

		var phoneRules = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;

		var inputed = $('#chk_phone').val();
		
		
			if (!phoneRules.test(inputed)) {
				$("#chk_phone").css("background-color", "#FFCECE");
				$("#signupbtn").prop("disabled", true);
				$("#signupbtn").css("background-color", "#aaaaaa");

				phoneCheck = 0;
				return false;
				}else{
				$("#chk_phone").css("background-color", "#B0F6AC");
				phoneCheck = 1;
				if (idCheck == 1 && pwdCheck == 1 && phoneCheck == 1 && emailCheck == 1 && dnsCheck == 1 && addrCheck == 1) {
					$("#signupbtn").prop("disabled", false);
					$("#signupbtn").css("background-color", "#4CAF50");

				}
		}
	}
	
	function check_email() {

		// : 
		var emailRules = /^[a-z0-9_+.-]{4,100}$/;

		var inputed = $('#chk_email').val();
		
		
			if (!emailRules.test(inputed)) {
				$("#chk_email").css("background-color", "#FFCECE");
				$("#signupbtn").prop("disabled", true);
				$("#signupbtn").css("background-color", "#aaaaaa");

				emailCheck = 0;
				return false;}
			else{
				$("#chk_email").css("background-color", "#B0F6AC");
				emailCheck = 1;
				if (idCheck == 1 && pwdCheck == 1 && phoneCheck == 1 && emailCheck == 1  && dnsCheck == 1 && addrCheck == 1) {
					$("#signupbtn").prop("disabled", false);
					$("#signupbtn").css("background-color", "#4CAF50");

				}
		}
	}
	
	function check_dns() {

		//@ 뒷자리의 정규식
		var dnsRules = /^([a-z0-9-]+\.)+[a-z0-9]{2,4}$/


		var inputed = $('#chk_dns').val();
		
		
			if (!dnsRules.test(inputed)) {
				$("#chk_dns").css("background-color", "#FFCECE");
				$("#signupbtn").prop("disabled", true);
				$("#signupbtn").css("background-color", "#aaaaaa");

				 dnsCheck = 0;
				return false;}
			else{
				$("#chk_dns").css("background-color", "#B0F6AC");
				 dnsCheck = 1;
				if (idCheck == 1 && pwdCheck == 1 && phoneCheck == 1 && emailCheck == 1 && dnsCheck == 1 && addrCheck == 1) {
					$("#signupbtn").prop("disabled", false);
					$("#signupbtn").css("background-color", "#4CAF50");

				}
		}
	}
	

	
	function check_addr() {

		
				 addrCheck = 1;
				if (idCheck == 1 && pwdCheck == 1 && phoneCheck == 1 && emailCheck == 1 && dnsCheck == 1 && addrCheck == 1) {
					$("#signupbtn").prop("disabled", false);
					$("#signupbtn").css("background-color", "#4CAF50");

				}
		}
	
	 
	