<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Item"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row::after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
.xemthem{
    font-weight: 500;
    color: #fff;
    transition: background 1.0s;
    background: #2b2d29;
    border-radius: 11px;
    z-index: 10;
    padding: 15px 30px;
    font-size: 16px;
    position: relative;   
}.xemthem:hover{
    background: #222321ba;
    color: #fff;
}
</style>
</head>
<body>
    
    
    <div style="text-align: center;">
        <h2 style='font-family: cursive;'>Update Item</h2>
</div>
    <%
    Item item=(Item)request.getAttribute("ITEM");
    if(item!=null){   
    %>
    <form action="updateItem">
<div class="container">
    <input type="hidden" name="ID" value="<%=item.getID()%>">
  <div class="row">
    <div class="col-25">
      <label style='font-family: cursive;' for="fname">Name Item</label>
    </div>
      
    <div class="col-75">
        <input type="text" id="fname" name="itemName" value="<%=item.getItemName()%>">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label style='font-family: cursive;' for="lname">Price</label>
    </div>
    <div class="col-75">
        <input type="number" id="lname" name="itemPrice" value="<%=(int)item.getPrice()%>" min="0">
    </div>
  </div>
      <div class="row">
    <div class="col-25">
      <label style='font-family: cursive;' for="quantity">Quantity</label>
    </div>
    <div class="col-75">
        <input type="number" id="quantity" name="quantity" value="<%=item.getQuantity()%>" min="1">
    </div>
  </div>
  <div  class="row">
    <div class="col-25">
      <label style='font-family: cursive;' for="country">Type</label>
    </div>
    <div class="col-75">
      <select style='font-family: cursive;' id="country" name="itemType">
          <option value="<%=item.getTypeID()%>"><%=item.getTypeID()%></option>
        <option style='font-family: cursive;'  value="1">1-(Bánh sinh nhật)</option>
        <option style='font-family: cursive;' value="2">2-(GIFTSET)</option>
        <option style='font-family: cursive;' value="3">3-(Bánh lẻ)</option>
        <option style='font-family: cursive;' value="4">4-(Đồ uống)</option>
      </select>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label style='font-family: cursive;' for="subject">Description</label>
    </div>
    <div class="col-75">
      <textarea id="subject" name="description" style="height:200px"><%=item.getDescription()%></textarea>
    </div>
  </div>
      <div class="row">
    <div class="col-25">
      <label style='font-family: cursive;' for="introduction">Introduction</label>
    </div>
    <div class="col-75">
      <input type="text" id="introduction" name="introduction" value="<%=item.getIntroduction()%>">
    </div>
  </div>
      <div class="row">
    <div class="col-25">
      <label style='font-family: cursive;' for="img">Link image</label>
    </div>
    <div class="col-75">
      <input type="text" id="img" name="img" value="<%=item.getImg()%>">
    </div>
  </div>
  <br>
  <%
      String check=(String)request.getAttribute("CHECK");
      if(check!=null){
   %>
      <p style="text-align: center;font-size: 20px;font-family: cursive;"><%=check%></p>
   <%}%>
  <div style='    text-align: center;' class="row">
      <input style="color: azure;
    background-color: #060505d9;
    font-family: cursive;float: none" type="submit" value="Update">
  </div>
</div>
        <div style="display:flex;justify-content: center;margin-top: -60px">
            <div style="display: flex;   margin-top: 100px;padding-bottom: 20px;">
        <a class="xemthem navbar-brand" href="controller?luaChon=updateItem" style='text-decoration: none;margin-right: 50px'>Back </a>        
    </div>
            <div style="display: flex;   margin-top: 100px;padding-bottom: 20px;">
        <a class="xemthem navbar-brand" href="banhngot.jsp" style='text-decoration: none;margin-left: 50px'>Home </a>        
    </div>
        </div>
 </form>
    <%}%>
    
</body>
</html>


