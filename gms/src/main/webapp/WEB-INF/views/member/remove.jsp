<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="contentBox" style="width:410px; height:200px;">
	<form id="removeForm" name="removeForm">
		비밀번호 재입력 
		<input type="hidden" name="userid" value="${user.userid}"/>
		<input type="password" name="password" id="password" placeholder="비밀번호를  입력(8~20자)" />
		<input type="button" id="removeForm_btn" value="Delete!!!"/>
	</form>
</div>