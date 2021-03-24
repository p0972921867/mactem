<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.team2.bean.FoodBean"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<title>Storage</title>
</head>
<body style='background-color:#6FB7B7'>
	<div align="center">
		<h2>Storage</h2>
	<table border=1 id="idtable">
	<tr style="background-color: #F0F0F0; color:#990000">
		<th>Food No<th>Name<th>Category<th>Expire Date<th>Preservation<th>Calories<th>Edit<th>Delete
	<%
		List<FoodBean> foods =(ArrayList<FoodBean>)request.getAttribute("foods");
				for(FoodBean food : foods){
		%>
			<tr style= "background-color: #F0F0F0">
			<td><%= food.getFoodno()%>
			<td><%= food.getName()%>
			<td><%= food.getCategory()%>
			<td><%= food.getExpiredate()%>
			<td><%= food.getPreservation()%>
			<td><%= food.getCal()%>
			<!-- <td><from method="post" action="UpdateData1"><a href="#" class="btn btn-primary">修改</a></from></td> -->
<!-- 			<td><input type="button" class="btn btn-primary" value="修改"></td>
			<td><input type="button" class="btn btn-danger" value="刪除"></td> -->
			<td><form method="post" action="UpdateFood1">
					<button type="submit" name="foodno" value="<%= food.getFoodno()%>" class="btn btn-primary">
						Edit
					</button>
				</form>
			<td><form method="post" action="DeleteFood">
					<button type="submit" name="foodno" value="<%= food.getFoodno()%>" class="btn btn-danger">
						Delete
					</button>
				</form>
		<%}%>
		
	</table>
	<h3>Total: <%=foods.size() %> items</h3>
	<a href="web/FridgeMainnew.jsp"><button type="submit" class="btn btn-info">Back to Home</button></a>
	</div>
</body>
</html>