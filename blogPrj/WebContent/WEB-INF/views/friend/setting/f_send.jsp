<%@ page contentType="text/html; charset=UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value ="utf-8"/> 

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<!-- 이곳은 보낸신청 탭_내용 -->

<button type="button">신청취소</button>

<br><br>
		<table border="1" style="align: center">
			<col width="30px" />
			<col width="400px" />
			<col width="200px" />
			<col width="100px" />
			<col width="100px" />

			<tr style="background-color: #D8D8D8;">
				<th><input type="checkbox"></th>
				<th>신청한 사람</th>
				<th>메시지</th>
				<th>신청일</th>
				<th>관리</th>
			</tr>

			<tr>
				<td colspan="5" align="center"><br><br><br><h4>진행 중인 이웃신청이 없습니다</h4><br><br><br></td>
			</tr>
		</table>

		<div>
			<input type="checkbox">&nbsp;전체선택&nbsp;
			<button type="button">신청취소</button>
		</div>
<br><br>		
		
		
<!-- 페이징 -->
<div align="center">
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
<!-- 페이징 -->

<script>
//두번째탭보여주기
$(function () {
    $('#myTab li:eq(1) a').tab('show')
});
</script>