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
                   String str = Integer.toString(list.getID()); 
                   String url="inputUpdateItem?ID="+str;
                %>
        
                    <tr style="font-family: cursive;">
                    
                    <td>
                       <%=list.getID()%>
                    </td>
                    <td>
                       <%=list.getItemName()%>
                    </td>
                    <td>
                        <%=(int)list.getPrice()%>
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
                        <div style="">
                            <a class="xemthem navbar-brand" href=<%=url%> style='text-decoration: none;margin-right: 50px'><p style="font-size: 14px;">Update</p></a>        
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
        <a class="xemthem navbar-brand" href="tableList?chose=delete" style='text-decoration: none;margin-left: 50px'>Delete Item </a>        
    </div>
        </div>
    </body>
</html>
