<%@ page language="java" contentType="text/html; charset=UTF-8"
     import="java.util.*,com.team2.bean.FoodBean,com.mongodb.*"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Smart Refrigerator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../style/rwd.css">
    <link rel="stylesheet" media="screen and  (max-width: 780px)" href="../style/rwd780.css" />
    

</head>
<body>
<jsp:useBean id="tem" scope="request" class="com.team2.bean.FoodBean" />
    <div id="allpage">
        <header>
            <h1>Smart Refrigerator</h1>
            <nav>
                <ul class="menu">
                <div class="st1 row justify-content-between">
                	<div class="col-3">
                    <li><form method="post" action=""><button type="submit">Home</button></form></li>
                    </div>
                    <div class="col-3">
                    <li><form method="post" action="../SearchAllFood"><button type="submit">Storage</button></form></li>
                    </div>
                    <div class="col-3">
                    <li><form method="post" action="../Cal"><button type="submit">Smart Recipes</button></form></li>
                    </div>
                    <div class="col-3">
                    <li><a href="https://www.happy-shopping.tw" target="_blank">Shopping List</a></li>
                    </div>
                </div>
                </ul>
            </nav>            
        </header>
      <div id="content">
            <article class="article">
                <section class="section">
                    <!-- <fieldset class="env"> -->
						<div class="st1 row justify-content-between">
                           <div class="col-9">
                            <span class="t1" style="font-size:23px;padding-top:50%;margin-right:5px;padding-bottom:50%;margin-top:100px;font-weight:300%;" >Temperature:</span>
                             <span style="font-size:23px;padding-top:50%;margin-right:5px;padding-bottom:50%;margin-top:100px;font-weight:300%;">
                             <% MongoClient mongoClient=new MongoClient("localhost",27017); %>
	               			 <% DB database=mongoClient.getDB("sensors"); %>
	            			 <% DBCollection collection = database.getCollection("dht11"); %>
	            			 <% DBCursor cursor = collection.find(); %>
            			     <% System.out.println("從資料集中讀取資料："); %>
            			     <% String temperature=""; %>
            			     <% String humity=""; %>
            			     <% while(cursor.hasNext()){ %>
            			    	<%  BasicDBObject bdbObj = (BasicDBObject) cursor.next(); %>
            			         <% if(bdbObj != null){ %>
            			             <%  temperature=bdbObj.getString("溫度"); %>
            			             <%  humity=bdbObj.getString("濕度"); %>
            			            <%  } %>
            			        <%  } %>
                            <%= temperature %>
                            </span>
                            <span class="t1" style="font-size:23px;padding-top:50%;margin-right:5px;padding-bottom:50%;margin-top:100px;font-weight:300%;">°C</span><br>
                            <p></p>
                            <p></p>
                            <span class="t1" style="font-size:23px;margin-right:5px;margin-top:100px;font-weight:300%;" >Humidity:</span>
                            <span class="t1" style="font-size:23px;margin-right:5px;padding-top:50%;margin-top:100px;font-weight:300%;"><%= humity %></span>
                            <span class="t1" style="font-size:23px;pmargin-right:5px;adding-top:50%;margin-top:100px;font-weight:300%;">%</span>
                            </div>
                            <div style="margin-top:10px" class="col-3 text-center d-grid gap-2">
                            <button ><a href="http://192.168.137.10:5438"><img src="power.jpg" class="rounded"></a></button>
                        </div>
        			  </div>
                       
                        
                     
                    <!-- </fieldset> -->
                </section>                
            </article>
            <aside class="aside">
                    <section class="section">
                        <div class="st1">
                        
<%--                         <jsp:useBean id="food" class="com.team2.bean.FoodBean" />
                        <%food.getFoodno()%> --%>
                            <span class=t1 >Grain and Vegetables:</span>
                            <select class=t1 name="rice">
                                <option value="">Select</option>
                                <option value="broccoli">Broccoli</option>
                                <option value="tomato">Tomato</option>
                                <option value="garlic">Garlic</option>
                            </select>
                        </div>
        
                        <div class="st1">
                            <span class="t1" >Meat and Protein:</span>
                            <select class=t1 name="protein">
                                <option value="">Select</option>
                                <option value="milk">Milk</option>
                                <option value="egg">Egg</option>
                                <option value="chicken">Chicken</option>
                            </select>
                            
                        </div>
        
                        <div class="st1">
                            <span class="t1" >Fruits:</span>
                            <select class=t1 name="fruit">
                                <option value="">Select</option>
                                <option value="banana">Banana</option>
                            </select>
                            
                        </div>
        
                        <div class="st1">
                            <span class="t1" >Other:</span>
                            <select class=t1 name="fruit">
                                <option value="">Select</option>
                                <option value="icecream">Ice Cream</option>
                                <option value="honey">Honey</option>
                            </select>
                            
                        </div>
                    </section>
            </aside>
        </div>  <!--end content-->
        <div>
            
<!--             <img class="logo-img" src="../image/friedegg.jpg" title="food1" alt="food1">
            <img class="logo-img" src="../image/pork.jpg" title="food2" alt="food2"> -->
        </div>
        <!-- <footer>
                <p>2014 All Rights Reserved Quality Art Technology CO. </p>
        </footer> -->
    </div>  
    
  	

    
</body>
</html>