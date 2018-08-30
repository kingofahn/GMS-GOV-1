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
		var form = $('#userLoginForm');
		$('#loginForm_btn').click(function(){
				form.action ="${ctx}/member/login";
				form.method ="post";  /* get으로 하면 노출됨 */
				var node = document.createElement('input');
					node.setAttribute('type','hidden');
					node.setAttribute('name','action')
					node.setAttribute('value','login')
					form.appendChild(node);
				form.submit();
});
</script>	