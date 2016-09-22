<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<fmt:requestEncoding value="utf-8"/>
<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<!-- 여기는 친구 목록 -->

<!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->
<ul class="list-inline">
  <li><a href ="fnewslist.do">전체</a></li>
  <li><a href="newlist.do">이웃 새글</a></li>
  <li><a href="foffriendlist.do">이웃의 이웃</a></li>
  <li><a href="friends.do">이웃목록</a></li>
</ul>
<!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->
<br>


<!-- 이웃종류/이웃/쪽지 -->
<div align="center">
<br>

<table style="text-align: center;">
<col width="100px"/><col width="300px"/><col width="100px"/>
<tr height="25px" style="background-color: #D8D8D8;">
  <th style="text-align: center;"><select name="_selFchk"><option selected="selected" value="1" onclick="sel1();">이웃전체</option><option value="2">이웃</option><option value="3">서로이웃</option></select></th>
  <th style="text-align: center;">이웃</th>
  <th style="text-align: center;">쪽지쓰기</th>
</tr>

<!-- 이웃이 있을때 -->
<c:if test="${not empty flist }">

<!-- sel이웃을 클릭하면 -->
<c:if test="${param.name==1}">
   <c:if test="${not empty flistF1 }">
   <c:forEach items="${flistF1 }" var="fl">
					<tr>
						<td>이웃</td>
						<td>${fl.fnd_fndid }| 블로그명</td>
						<td><button type="button" class="glyphicon glyphicon-pencil"></button></td>
					</tr>
	</c:forEach>
	</c:if>
	<c:if test="${empty flistF1 }">
	이웃이 없습니다.
	</c:if>
</c:if>

<!-- sel서로이웃을 클릭하면 -->
<c:if test="${param.name==2}">
   <c:if test="${not empty flistF2 }">
   
   <c:forEach items="${flistF2 }" var="fl">
					<tr>
						<td>이웃</td>
						<td>${fl.fnd_fndid }| 블로그명</td>
						<td><button type="button" class="glyphicon glyphicon-pencil"></button></td>
					</tr>
   </c:forEach>
   </c:if>
</c:if>

<!-- 전체조회 -->
<c:forEach items="${flist }" var="fl">
<tr>
  <td>
    <c:if test="${fl.fnd_chk == 1}">
    이웃
    </c:if>
    <c:if test="${fl.fnd_chk == 2}">
    서로이웃
    </c:if>
  </td>
  <td>${fl.fnd_fndid } | 블로그명</td>
  <td><button type="button" class="glyphicon glyphicon-pencil"></button></td>
</tr>
</c:forEach>
</c:if>



<!-- 이웃이 있을때 -->

<c:if test="${empty flist }">
  <div align="center" style="color:#666;">아직 이웃이 없습니다.
	<br>주제별 글 보기를 통해 관심 주제의 블로그 이웃을
          만들어보세요.</div>
</c:if>

</table>
</div>

<script>
$(function () {
    $('#myTab a:first').tab('show')
});


</script>