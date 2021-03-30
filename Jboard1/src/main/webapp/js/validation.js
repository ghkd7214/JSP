/**
 * 
 */

$(document).ready(function(){
	//전송데이터 유효성 검증
	
	$('#user > form').submit(function(){

		//아이디 중복 여부
		if(!isUidOk){
			alert("이미 사용중인 아이디입니다.\n아이디를 다시 입력하세요,");
			return false;
		}
		//아이디 영문 소문자 확인
		if(!isUidEngOk){
			alert("아이디는 영문 소문자이여야합니다.\n아이디를 다시 입력하세요,");
			return false;
		}
		//비밀번호 일치 여부
		if(!isPasswordOk){
			alert("비밀번호가 일치하지 않습니다\n다시 확인해주십시오.");
			return false;
		}
		//이름 한글 여부
		if(!isNameok){
			alert("한글을 입력해주세요.");
			return false;
		}
		//별명 중복 여부
		if(!isNickok){
			alert("별명을 확인해주세요.");
			return false;
		}
		//이메일 중복 여부
		if(!isEmailok){
			alert("이메일주소을 확인해주세요.");
			return false;
		}
		//휴대폰번호 중복여부		
		if(!isHpok){
			alert("휴대폰 번호를 확인해주세요.");
			return false;
		}
		
		return true;
	})
	
});	