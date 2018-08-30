<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="content-box" style="width:410px; margin: auto; border: 1px solid grey;">
			<form id="modifyForm" name="modifyForm">
				<table id="mypage-table">
					<tr>
						<td rowspan="3" colspan="2">
						<img src="">
						</td>
						<td>ID</td>
						<td>
						<input type="hidden" name="userid" value="${user.userid}"/>
						${user.userid}
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${user.name}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="password"
							placeholder="********"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>${user.gender}</td>
						<td>팀</td>
						<td><select name="teamid" id="teamid">
								<option value="" selected="selected">NONE</option>
								<option value="nolja">야놀자</option>
								<option value="jieunHouse">지은집</option>
								<option value="turtleKing">터틀킹</option>
								<option value="codingZzang">코딩스타</option>
						</select></td>
					</tr>
					<tr>
						<td>나이</td>
						<td>${user.age}</td>
						<td>역할</td>
						<td><input type="radio" id="roll_1" name="roll"
							value="leader" /> 팀장 <input type="radio" id="roll_2" name="roll"
							value="front" /> 프론트개발 <input type="radio" id="roll_3"
							name="roll" value="back" /> 백단개발 <input type="radio" id="roll_4"
							name="roll" value="android" /> 안드로이드개발 <input type="radio"
							id="roll_5" name="roll" value="minfe" /> 민폐</td>
					</tr>
				</table>
				<input type="button" id="modifyForm_btn" value="Update!!!" />
			</form>
			<form method="POST" class="TEST" enctype="multipart/form-data" 
					action="${ctx}/member.do?action=fileupload&page=retrieve">
			  파일업로드: <input type="file" name="upfile"><br/>
			  <input type="submit" value="파일업로드"> 
			</form>
</div>

	<script>
		var form = document.getElementById("updateForm");
		var team = document.getElementById("teamid");
		for (var i = 0; i < team.options.length; i++) {
			if (team.options[i].value === '${user.teamid}') {
				team.options[i].setAttribute("selected", "selected");
			}
		}
		form.teamid.setAttribute("selected", "selected");
		for (var i = 1; i <= 5; i++) {
			if (document.getElementById('roll_' + i).value === '${user.roll}') {
				document.getElementById('roll_' + i).checked = true;
			}
		}
		
		$('#modifyForm_btn').click(function(){
			$('#modifyForm').attr({action:"${ctx}/member/modify/", method:"POST"}).submit();
        });
		
</script>