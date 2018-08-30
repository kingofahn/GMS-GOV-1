<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content-box">
	<table style="width:410px; margin:auto; border: 1px solid grey; font-size: 15px; text-align: center;">
			<tr>
				<td>아이디</td>
				<td>${user.userid}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>********</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>${user.age}</td>
			</tr>
			<tr>
				<td>팀아이디</td>
				<td>${user.teamid}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${user.gender}</td>
			</tr>
			<tr>
				<td>역할</td>
				<td>${user.roll}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${user.phone}</td>
			</tr>
			<tr>
				<td>수강과목</td>
				<td>${user.subject}</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
	</table>
</div>
