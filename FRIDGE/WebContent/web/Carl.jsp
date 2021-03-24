<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.team2.bean.FoodBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">--%>
<%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>--%>

</head>
<body style="background-color: #6FB7B7">
<jsp:useBean id="food" scope="request" class="com.team2.bean.FoodBean" />

          
                        <div class="st1" style="margin:0">
                            <span style="color:white"><h1 style="font-size:200%;padding:20px 26px;">Smart Recipes</h1></span>
                            <span class=t1 style="width:100px;font-size:150%;font-weight:300%;line-height:2em;border-radius:5px;padding:20px 26px;">Grain and Vegetables:</span> 
                           
                            
                            <select id="rice" name="rice" style="width:150px;font-size:150%;font-weight:300%">
                            <option value="">Select</option>                      
                            <% List<FoodBean> foods = (ArrayList<FoodBean>)request.getAttribute("foods");
                               for(FoodBean food1 : foods){%>
                               <option value=<%=food1.getCal() %>><%=food1.getName() %></option>
                                 <% }%>
                            </select>          
                            <span id="demo" style="width:100px;font-size:150%;font-weight:300%; margin-left:20px;margin-top:100px" ></span>
							
                           
                        </div>
        
                        <div class="st1">
                             <span class=t1 style="width:100px;font-size:150%;font-weight:300%;line-height:2em;padding:20px 26px;margin:10px 0;border-radius:5px;" >Meat and Protein:</span>
                            <select id="protein" class=t1 name="protein" style="width:150px;font-size:150%;font-weight:300%;">
                                <option value="">Select</option>
                                <% List<FoodBean> foodmeats = (ArrayList<FoodBean>)request.getAttribute("foodmeats");
                               for(FoodBean foodmeats1 : foodmeats){%>
                               <option value=<%=foodmeats1.getCal() %>><%=foodmeats1.getName() %></option>
                                 <% }%>
                            </select><span id="demo1" style="width:100px;font-size:150%;font-weight:300%; margin-left:20px"></span>
                            
                        </div>
        
                        <div class="st1">
                             <span class=t1 style="width:100px;font-size:150%;font-weight:300%;line-height:2em;padding:20px 26px;margin:10px 0;border-radius:5px;" >Fruits:</span>
                            <select class=t1 id="fruit" style="width:150px;font-size:150%;font-weight:300%;">
                                <option value="">Select</option>
                                <% List<FoodBean> foodfruits = (ArrayList<FoodBean>)request.getAttribute("foodfruits");
                               for(FoodBean foodfruits1 : foodfruits){%>
                               <option value=<%=foodfruits1.getCal() %>><%=foodfruits1.getName() %></option>
                                 <% }%>
                            </select><span id="demo2" style="width:100px;font-size:150%;font-weight:300%;margin-left:20px"></span>
                            
                        </div>
        
                        <div class="st1">
                            <span class=t1 style="width:100px;font-size:150%;font-weight:300%;line-height:2em;padding:20px 26px;margin:10px 0;border-radius:5px;" >Other:</span>
                            <select class=t1 id="other" style="width:150px;font-size:150%;font-weight:300%;">
                                <option value="">Select</option>
                                <% List<FoodBean> foodothers = (ArrayList<FoodBean>)request.getAttribute("others");
                               for(FoodBean foodothers1 : foodothers){%>
                               <option value=<%=foodothers1.getCal() %>><%=foodothers1.getName() %></option>
                                 <% }%>
                            </select><span id="demo3" style="width:100px;font-size:150%;font-weight:300%;margin-left:20px"></span>
                            
                        </div>
                    
                    <button id="button" type="submit" class="" style="width:150px;margin-left:200px;margin-top:20px;border-radius: 5px;background-color:#FFED97;border-style:outset;;font-size:100%;font-weight:300%;text-align:center">Recommend</button>
                    <a href="web/FridgeMainnew.jsp"><button type="submit" class="btn btn-danger" style="width:100px;margin-top:20px;border-radius: 5px;background-color:#FFED97;border-style:outset;;font-size:100%;font-weight:300%;text-align:center">Home</button></a>
                    <span class="img" style="display:none; border:none" >
					<img src="http://localhost:8080/FRIDGE/image/tomatoegg.jpg" alt="display image on button click" class="img-responsive img-thumbnail" style="border-radius: 8px;outline-style: none;border:0;"/>
					</span>
					
					<span class="img1" style="display:none" >
					<img src="http://localhost:8080/FRIDGE/image/broccolichicken.jpg" alt="display image on button click" class="img-responsive img-thumbnail"/>
					</span>
					
					<span class="img2" style="display:none;border:none" >
					<img src="http://localhost:8080/FRIDGE/image/bananaicecream.jpg" alt="display image on button click" class="img-responsive img-thumbnail"/>
					</span>
            
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>  
    <script>
    $("#rice").change(function(){
		var rice=$(this).val();
		$("#demo").html(rice+"kcal")
	}); 
    $("#protein").change(function(){
		var protein=$(this).val();
		$("#demo1").html(protein+"kcal")
	}); 
    $("#fruit").change(function(){
		var fruit=$(this).val();
		$("#demo2").html(fruit+"kcal")
	}); 
    $("#other").change(function(){
		var other=$(this).val();
		$("#demo3").html(other+"kcal")
	}); 
    
    $("#button").click(function(){
    	if  ($("#rice").find("option:selected").text()=="tomato" && $("#protein").find("option:selected").text()=="egg")
   		$(".img").toggle();
    	if  ($("#rice").find("option:selected").text()=="broccoli" && $("#protein").find("option:selected").text()=="chicken")
       	$(".img1").toggle();
    	if  ($("#fruit").find("option:selected").text()=="banana" && $("#other").find("option:selected").text()=="ice cream")
       	$(".img2").toggle();
	});
    
    
    	
    </script>
</body>
</html>