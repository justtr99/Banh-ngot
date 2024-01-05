<%-- 
    Document   : listAccount
    Created on : Oct 8, 2023, 2:03:15 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="registration.Order"%>
<%@page import="registration.OrderDetail"%>
<%@page import="registration.Item"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
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
            max-height: 500px; /* Đặt chiều cao tối đa cho div hiển thị */
            overflow-y: auto; /* Kích hoạt thanh cuộn nếu chiều cao vượt quá 500px */
        }

        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }
        .kaka{
    font-weight: 500;
    color: #fff;
    transition: background 1.0s;
    background: #2b2d29;
    border-radius: 11px;
    z-index: 10;
    
    font-size: 16px;
    position: relative;   
}.kaka:hover{
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
  </style>
    </head>
    <body>
        <div style="text-align: center;font-family: cursive;">
        <h1>Xác nhận đơn hàng</h1>
        </div>
        
        <%
          ArrayList<Order> list=(ArrayList<Order>)request.getAttribute("LISTORDER");
          ArrayList<Item> items=(ArrayList<Item>) request.getAttribute("LISTITEM");
                             ArrayList<OrderDetail> listDetail=(ArrayList<OrderDetail>) request.getAttribute("LISTDETAIL");
          if(list!=null){
        %>
        
        <table class="table table-hover" border="1" style="margin-top: 50px;table-layout: fixed">
            <thead style="background-color: #26262a;color: #ffffff">
                <tr style="font-family: cursive;">
                    <th>Date</th>
                    <th>Order ID</th>
                    <th>Username</th>
                    <th>Total price</th>
                    <th>Tên người nhận</th>
                    <th>Địa chỉ</th>
                    <th>SĐT</th>                    
                    <th>Tình trạng</th>
                </tr>
            </thead>
            <tbody>                 
                <%
                  for(Order dto:list){ 
                  String url="updateTinhTrang?ID="+dto.getOrdersID();
                  String url1="deleteDon?ID="+dto.getOrdersID()+"&xoa=xoa";
                %>
                       
                    <tr style="font-family: cursive;">
                    
                    <td>
                     <%=dto.getNgayTao()%>
                    </td>
                    <td>
                       <%=dto.getOrdersID()%>
                    </td>
                    <td>
                        <%=dto.getUsername()%>
                    </td>
                    <td>
                        <%=dto.getTotal()%>đ
                        
                    </td> 
                    <td>
                      <%=dto.getTenNguoiNhan()%>
                    </td>
                    <td>
                       <%=dto.getDiaChi()%>
                    </td> 
                    <td>
                        <%=dto.getSDT()%>
                    </td> 
                    <%
                      if(dto.getTinhTrang()==1){
                    %>
                    <td>
                        <p>Đã xác nhận đơn hàng</p>                        
                    </td> 
                    <%} else{%>
                    <td>
                        <a class="kaka<%=dto.getOrdersID()%> navbar-brand" style="color:black" href="">Chi tiết đơn hàng</a>
                           <div class="overlay<%=dto.getOrdersID()%>" style="z-index: 100;display: none;position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 100000;">
                <div class="centered-div<%=dto.getOrdersID()%>" style="position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);background-color: #fff;padding: 20px;border: 1px solid #ccc;max-height: 500px;overflow-y: auto;width: 1000px;height: 500px;">
                    <span class="close-button<%=dto.getOrdersID()%>" style="position: absolute;top: 10px;right: 10px;cursor: pointer;" onclick="closeOverlay<%=dto.getOrdersID()%>()">&#10006;</span>
                    <!-- Nội dung của div hiển thị -->
                    
                    <table border="1" style="color:black;width: 100%">
                        
                        <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Minh họa</th>
                                <th>Số lượng</th>
                                <th>Số tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                           <%
        
                             for(OrderDetail detail:listDetail){
                             if(detail.getOrdersid()==dto.getOrdersID()){
                               for(Item item:items){
                               
                               if(detail.getItemid()==item.getID()){
                           %>
                            <tr>
                                <td style="text-align: center;width: 200px"><%=item.getItemName()%></td>
                                <td style="text-align: center;padding: 10px">
                                    <img style="width: 150px;" src="<%=item.getImg()%>" alt="alt"/>
                                               </td>
                                <td style="text-align: center;"><%=detail.getQuantity()%></td>
                                <td style="text-align: center;"><%=detail.getTotalPrice()%></td>
                            </tr>
                          <%}}}}%>
                        </tbody>
                    </table>
                            
                    <!-- Thêm nhiều nội dung khác ở đây để thử cuộn -->
                    <div style="display:flex">
                     <a style="margin-left: 24%;margin-top: 35px;" class="xemthem navbar-brand" href="<%=url%>">Xác nhận đơn hàng</a>
                     <a style="margin-top: 35px;margin-left: 208px;" class="xemthem navbar-brand" href="<%=url1%>">Hủy đơn hàng</a>
                </div>
                </div>
                        
            </div>
        
            </td>
                    <%}%>
                </tr>
                <script>
    var showDivLinks<%=dto.getOrdersID()%> = document.querySelectorAll(".kaka<%=dto.getOrdersID()%>");

    showDivLinks<%=dto.getOrdersID()%>.forEach(function(link) {
        link.addEventListener("click", function(e) {
            e.preventDefault();
            var overlay<%=dto.getOrdersID()%> = document.querySelector(".overlay<%=dto.getOrdersID()%>");
            overlay<%=dto.getOrdersID()%>.style.display = "block";
        });
});

function closeOverlay<%=dto.getOrdersID()%>() {
    var overlay<%=dto.getOrdersID()%> = document.querySelector(".overlay<%=dto.getOrdersID()%>");
    overlay<%=dto.getOrdersID()%>.style.display = "none";
}
</script>
<%}%>
           

                

            
 </tbody>
        </table>
        <%}%>
<div style="display: flex;   margin-top: 100px;padding-bottom: 20px;">
        <a class="xemthem navbar-brand" href="banhngot.jsp" style='text-decoration: none;margin-left: 47%'>Home </a>        
    </div>
 <script>
        var showDivLinks = document.querySelectorAll(".kaka");

showDivLinks.forEach(function(link) {
    link.addEventListener("click", function(e) {
        e.preventDefault();
        var overlay = document.querySelector(".overlay");
        overlay.style.display = "block";
    });
});

function closeOverlay() {
    var overlay = document.querySelector(".overlay");
    overlay.style.display = "none";
}
    </script>
    </body>
</html>
