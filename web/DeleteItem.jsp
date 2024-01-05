<%-- 
    Document   : listAccount
    Created on : Oct 8, 2023, 2:03:15 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Item"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
      .close-button{
          font-weight: 500;
    color: #fff;
    transition: background 1.0s;
    background: #2b2d29;
    border-radius: 11px;
    z-index: 10;   
    font-size: 16px;
    position: relative; 
      }
      .close-button:hover{
    background: #222321ba;
    color: #fff;
}
      .xemthem{
    font-weight: 500;
    color: #fff;
    transition: background 1.0s;
    background: #2b2d29;
    border-radius: 11px;
    z-index: 10;
    
    font-size: 16px;
    position: relative;   
}.xemthem:hover{
    background: #222321ba;
    color: #fff;
}
 
 .overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    z-index: 1;
}

.centered-div {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ccc;
    text-align: center;
}


  </style>
    </head>
    <body>
        <div style="text-align: center;font-family: cursive;">
        <h1>Table of items</h1>
        </div>
        
        <%
         ArrayList<Item> listItem=(ArrayList<Item>)request.getAttribute("LISTITEM");
         if(listItem!=null){
  
        %>
        
        <table class="table table-hover" border="1" style="margin-top: 50px;table-layout: fixed">
            <thead style="background-color: #26262a;color: #ffffff">
                <tr style="font-family: cursive;">
                    <th>ID</th>
                    <th>ItemName</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Introduction</th>
                    <th>Quantity</th>
                    <th>TypeID</th>
                    <th>Img</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>                 
                <%
                   for(Item list:listItem){                  
                   String url="deleteItem?ID="+Integer.toString(list.getID());
                   String a=Integer.toString(list.getID());
                %>
                    <tr style="font-family: cursive;">
                    
                    <td>
                       <%=list.getID()%>
                    </td>
                    <td>
                       <%=list.getItemName()%>
                    </td>
                    <td>
                        <%=list.getPrice()%>
                    </td>
                    <td>
                        
                        <%=list.getDescription()%>
                    </td> 
                    <td>
                       <%=list.getIntroduction()%>
                    </td>
                    <td>
                        <%=list.getQuantity()%>
                    </td> 
                    <td>
                        <%=list.getTypeID()%>
                    </td> 
                    <td>
                        <img style="width: 152px;" src=<%=list.getImg()%> alt="alt"/>
                    </td> 
                    <td>
                        <div>
    <div class="clickable-div" style="cursor: pointer;"><p class="xemthem" style="width: 67px;padding:8px;">Delete</p></div>      
       <div class="overlay">
                    <div class="centered-div">
        <h3>Do you want to delete this item?</h3>
        <div style="margin-top:30px">
            <a  class="xemthem navbar-brand" style="width: 67px;padding:8px;height: 39px;" href="<%=url%>" ><p>Delete</p></a>
            <button style="width: 69px;height: 39px;margin-left: 224px;border:0px" class="close-button">Cancel</button>
        </div>
    </div>
        </div>                                          
    </div>
                    </td>
                </tr>

               <%}%>

                

            
 </tbody>
        </table>
        <%}%>

<div style="display:flex;justify-content: center;margin-top: -60px">
                <div style="display: flex;   margin-top: 100px;padding-bottom: 20px;">
            <a class="xemthem navbar-brand" href="InsertItem.jsp" style='text-decoration: none;margin-right: 50px'>Insert Item </a>        
        </div>
            <div style="display: flex;   margin-top: 100px;padding-bottom: 20px;">
        <a class="xemthem navbar-brand" href="banhngot.jsp" style='text-decoration: none;margin-left: 50px'>Home </a>        
    </div>
            <div style="display: flex;   margin-top: 100px;padding-bottom: 20px;    margin-left: 50px;">
        <a class="xemthem navbar-brand" href="controller?luaChon=updateItem" style='text-decoration: none;margin-left: 50px'>Update Item </a>        
    </div>
        </div>

<script>
    var deleteButtons = document.querySelectorAll(".clickable-div");
    deleteButtons.forEach(function(button, index) {
        button.addEventListener("click", function() {
            var overlay = document.querySelectorAll(".overlay")[index];
            overlay.style.display = "block";

            var closeButton = overlay.querySelector(".close-button");
            closeButton.addEventListener("click", function() {
                overlay.style.display = "none";
            });
        });
    });
    </script>
    </body>
</html>
