/**
 * 
 */
var isUidOk = false;
var isUidEngOk =false;
var isPasswordOk = false;
var isNameOk = false;
var isNickOk = false;
var isEmailOk = false;
var isHpOk = false;

$(function(){
	// 아이디 중복체크&&아이디 영문 소문자 확인
	var regUid = /^[a-z]+[a-z0-9]{3,10}$/;
	
	$('input[name=uid]').focusout(function(){
		var uid = $(this).val();
		var jsonData = {'uid': uid};
		
		$.ajax({
			url: '/Jboard1/user/Proc/checkUid.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){				
				if(data.result == 0){
					
					isUidOk = true;
					$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
					
					if(regUid.test(uid) == true){
						isUidEngOk = true;	    							
					}else{
						isUidEngOk = false;
						$('.resultId').css('color', 'red').text('아이디는 영문 소문자, 숫자 조합 4~10자까지 입니다.');
					}
				}else{
					isUidOk = false;
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
				}
			}
		});
		
	});
	
	// 비밀번호 일치 여부 확인
	$('input[name=pass1]').focusout(function(){
		
		var pass1 = $('input[name=pass1]').val();
		var pass2 = $('input[name=pass2]').val();
	
		if(pass1== pass2){
			isPasswordOk = true;
			$('.resultPass').css('color', 'green').text('비밀번호가 일치합니다.');
		}else{
			isPasswordOk = false;
			$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
		}
		
	});
	
	
	$('input[name=pass2]').focusout(function(){
		
		var pass1 = $('input[name=pass1]').val();
		var pass2 = $('input[name=pass2]').val();
	
		if(pass1== pass2){
			isPasswordOk = true;
			$('.resultPass').css('color', 'green').text('비밀번호가 일치합니다.');
		}else{
			isPasswordOk = false;
			$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
		}
		
	});
	
	
	//이름한글여부
	var regName = /^[ㄱ-힣]{2,10}$/;
	
	$('input[name=name]').focusout(function(){
		
		var name = $(this).val();
		
		if(regName.test(name) == true){
			isNameOk=true;
			$('.resultName').text('');
		}else{
			isNameOk=false;
			$('.resultName').css('color','red').text('한글2~10자까지 입력해주세요.');
		}
		
		
	});
	
	// 별명 중복체크
	$('input[name=nick]').focusout(function(){
		var nick = $(this).val();
		var jsonData = {'nick': nick};
		
		$.ajax({
			url: '/Jboard1/user/Proc/checkNick.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){				
				if(data.result == 0){
					
					isNcikOk = true;
					$('.resultNick').css('color', 'green').text(' ');
					
				}else{
					isNickOk = false;
					$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임입니다.');
				}
			}
		});
		
	});

	// 이메일 중복체크
	$('input[name=email]').focusout(function(){
		var email = $(this).val();
		var jsonData = {'email': email};
		
		$.ajax({
			url: '/Jboard1/user/Proc/checkEmail.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){				
				if(data.result == 0){
					
					isNcikOk = true;
					$('.resultEmail').css('color', 'green').text(' ');
					
				}else{
					isNickOk = false;
					$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일입니다.');
				}
			}
		});
		
	});

	// 휴대폰번호 중복체크
	$('input[name=hp]').focusout(function(){
		var hp = $(this).val();
		var jsonData = {'hp': hp};
		
		$.ajax({
			url: '/Jboard1/user/Proc/checkHp.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){				
				if(data.result == 0){
					
					isNcikOk = true;
					$('.resultHp').css('color', 'green').text(' ');
					
				}else{
					isNickOk = false;
					$('.resultHp').css('color', 'red').text('이미 등록된 전화번호입니다.');
				}
			}
		});
		
	});

});   