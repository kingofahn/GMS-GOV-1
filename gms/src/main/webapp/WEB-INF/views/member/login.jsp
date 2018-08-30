<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="loginFormLayout" style="width: 450px; margin: 50px auto">
	<h1 > 로그인하고, 혜택받으세요! </h1>
		<form id="userLoginForm" name="userLoginForm">
			<input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요" required="required" style="font-size: 15px; width: 410px; height:50px"/><br>  
			<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required="required" style="font-size: 15px; width: 410px; height:50px"/>
		<a id="loginForm_btn">			
			<img src="${ctx}/resources/img/login_btn.jpg">
		</a>
		</form>
</div>


<script>
		$('#loginForm_btn').click(function(){
			$('#userLoginForm').attr({action:"${ctx}/member/login", method:"POST"}).submit();
        });
</script>	