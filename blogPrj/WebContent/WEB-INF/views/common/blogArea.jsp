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

<script src="js/angular/angular.js"></script>

앙 블로그띠

<c:forEach items="${newMyMessageList }" var="item">
	<div ng-app="myApp">
	    <div ng-controller="MainCtrl">
	         {{ text }}<br>
	         {{ text02 }}
	         
	    </div>
	</div>
</c:forEach>

<script>
var myApp = angular.module('myApp', []);

var m_id = '${login.m_id}';
var listSize = '${fn:length(newMyMessageList)}';

if(m_id != " "){
	alert("사이즈 : "+listSize);

	for(var j=0;j<listSize;j++){
		
		var list1 = new Array();
		<c:forEach items="${newMyMessageList}" var="item1">

			myApp.controller('MainCtrl', ['$scope', function ($scope) {
		    
		    $scope.text = '${item1.message_sender}';
		    $scope.text02 = '${item1.message_receiver}';
		    
		}]);
		
		</c:forEach>
		
		
	}
	
}

</script>


