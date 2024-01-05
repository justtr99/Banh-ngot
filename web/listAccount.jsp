<%-- 
    Document   : listAccount
    Created on : Oct 8, 2023, 2:03:15 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Account"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
        <div style="text-align: center;font-family: cursive;margin-bottom: 50px">
        <h1>Table of accounts</h1>
        </div>
        <span style="margin-left:90px;">Nhập tên: </span>
        <input oninput="searchByName(this)" type="text" name="txt">
        <table class="table table-hover" border="1" style="margin-top: 50px">
            <thead style="background-color: #26262a;color: #ffffff">
                <tr>
                    <th>Numbers</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody id="container">
             <%  int i=1;
                    ArrayList<Account> list=(ArrayList<Account>)request.getAttribute("LISTACCOUNT");
                  if(list!=null){
                   for(Account acc:list ){
                      if(acc.getRole()<2){
                %>
                <form action="controller">
                <tr>
                    <td><%=i++%>
                    <td><%=acc.getUserName()%>
                     <input type="hidden" name="txtUsername" value="<%= acc.getUserName() %>" />
                    </td>
                    <td><%=acc.getPassWord()%></td>
                    <td><%=acc.getEmail()%></td>
                    <%if(acc.getRole()==1){
                                    %>
                                    <td>
                                        <input type="checkbox" name="chkAdmin" value="ADMIN" checked="checked" />
                                    </td>                              
                                    <%}else if(acc.getRole()==0){%>
                                     <td>
                                        <input type="checkbox" name="chkAdmin" value="ADMIN"/>
                                    </td>
                                    <%}%>
                                    <td>
                                        <div style="display:flex">
                                        <input style="    margin-right: 16px;" type="submit" value="Update" name="luaChon" />
                                        <input type="submit" value="Delete" name="luaChon" />
                                        </div>
                                    </td>
                </tr>
                
                </form>
                <%
                    }
                    }
                    }
else{%>

            <h1>There are no accounts</h1>
            <%}%>

            
            </tbody>
        </table>
<div style="display: flex;   margin-top: 100px;padding-bottom: 20px;">
        <a class="xemthem navbar-brand" href="banhngot.jsp" style='margin-left: 46%;margin-top: -10px;'>Home </a>

        
    </div>
        
            <script>
    
    
       function searchByName(param){
        var txtSearch=param.value; 
        $.ajax({
            url: "/banhngott/listAccountByAjax",
            type: "get",
            data: {
                txt: txtSearch
            },
            success: function(data){
                var row = document.getElementById("container");
                row.innerHTML = data;
            },

           
            error: function(xhr){
                
            }
        });
    }
    
</script>
    </body>
</html>
