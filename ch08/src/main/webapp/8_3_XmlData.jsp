<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		XML(Extensible Markup Language)
		 - JSON과 더불어 이기종간의 데이터 전송을 위한 문서 포멧
		 - 사용자가 직접 태그를 정의
		 - JSON 보다 파싱 속도가 느리다는 단점
	*/
	
	
	//XML 생성
	String  xml  = "<members>";
			xml += "<member>";
			xml += "<uid>a101</uid>";
			xml += "<name>김춘추</name>";
			xml += "<hp>010-123-1111</hp>";
			xml += "<pos>101</pos>";
			xml += "</member>";
			xml += "<member>";
			xml += "<uid>a102</uid>";
			xml += "<name>김유신</name>";
			xml += "<hp>010-1234-2222</hp>";
			xml += "<pos>102</pos>";
			xml += "</member>";
	
	//xml 출력
	out.print(xml);
			
			
			
%>

