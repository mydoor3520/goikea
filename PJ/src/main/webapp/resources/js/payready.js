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
	$(document).ready(function() {
		$("#mds_3").click(function() {
			if ($("#mds_3").prop('checked')) {
				console.log(true);
				$("#r_name").val($("#s_name").val());
				$("#postcode2").val($("#postcode1").val());
				$("#address3").val($("#address1").val());
				$("#address4").val($("#address2").val());
				$("#r_phone").val($("#s_phone").val());
				$("#r_email").val($("#s_email").val());

			} else {
				console.log(false);
				$("#r_name").val('');
				$("#postcode2").val('');
				$("#address3").val('');
				$("#address4").val('');
				$("#r_phone").val('');
				$("#r_email").val('');
			}
		});

		$("#pay_method_card").click(function() {
			console.log($("#pay_method_card"));
			//info
			modal({
				type : 'info',
				title : '알림',
				text : '카드결제 서비스 준비중입니다.',
				autoclose : false,
			});
			$("#pay_method_card").prop('checked', false);
		});
		$("#pay_method_phone").click(function() {
			console.log($("#pay_method_card"));
			//info
			modal({
				type : 'info',
				title : '알림',
				text : '휴대폰결제 서비스 준비중입니다.',
				autoclose : false,
			});
			$("#pay_method_phone").prop('checked', false);
		});
		$("#pay_method_account").click(function() {
			console.log($("#pay_method_card"));
		});
	});