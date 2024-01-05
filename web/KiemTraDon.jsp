<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Account"%>
<%@page import="registration.Order"%>
<%@page import="registration.Item"%>
<%@page import="registration.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<!Doctype html>
<html>
<head>
<meta charset="utf-8">

<l<meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      
    <link rel="stylesheet" href="login.css"/>
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

      /* Style cho dropdown */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Style cho các mục trong dropdown */
        .dropdown-content a {
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        /* Màu khi di chuột qua các mục */
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .site-footer
            {
                background: url(//theme.hstatic.net/200000247827/1000692826/14/footer_bg.jpg?v=905);
                position: relative;
                z-index: 1;
                margin-top: 90px;
                padding:45px 0 20px;
                font-size:15px;
                line-height:24px;
                color:#737373;
            }

            .site-footer hr
            {
                border-top-color:#bbb;
                opacity:0.5
            }
            .site-footer hr.small
            {
                margin:20px 0
            }
            .site-footer h6
            {
                color:#fff;
                font-size:16px;
                text-transform:uppercase;
                margin-top:5px;
                letter-spacing:2px
            }

            @media (max-width:767px)
            {
                .social-icons li.title
                {
                    display:block;
                    margin-right:0;
                    font-weight:600
                }
            }
            

        
        
        .donHang{
            font-family: cursive;
            background-color: rgb(195 195 195 / 42%);
            padding: 50px;    margin-top: -30px;
    margin-left: -30px;
  
    padding-top: 119px;
    padding-bottom: 119px;
        }
        .text{
            display: flex;
            width: 1200px;
            background-color: white;
            height: 50px;
            margin-left: 160px;
            border-radius: 10px;
        }
        .text1{
            margin-right: 150px;
            margin-top: 14px;
           color: black;
        }
        .don{
            margin-top: 30px;
            display: flex;
            width: 1200px; 
            margin-left: 160px;
            border-radius: 10px;
            background-color: white;
            height: 80px;           
        }
  </style>
</head>

<body>     

    <nav class="navbar navbar-inverse" style="margin: 0px;" >
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>                        
                </button>
                <a class="navbar-brand" href="banhngot.jsp" style="padding-top: -3px;">
                    <img src="https://theme.hstatic.net/200000247827/1000692826/14/logo.png?v=902" style="margin: none; width: 247px; height: 14px;">
                </a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="banhngot.jsp">Trang Chủ</a></li>
                    <li><a href="controller?luaChon=sanpham">Sản Phẩm</a></li>
                    <li  class="active"><a href="kiemTraDon">Kiểm tra đơn hàng</a></li>

                </ul> 
                <%  Account account=(Account)session.getAttribute("ACCOUNT");                    
                    String name=null;
                    if(account!=null){
                    name=account.getUserName();
                    if(account.getRole()==2){
                %>
                <ul class="nav navbar-nav navbar-right" style="z-index:100">
                   <li><a href="controller?luaChon=gioHang"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                   <li><div class="dropdown" style="width: 105px;">
                           <p style="color: #9d9d9d;margin-top: 16px;height: 20px;margin-left: 10px"><%=name%></p>
    <div class="dropdown-content" style="z-index:100;margin-left: -50px">
        <a href="changePassword.jsp"><p style="color:black">Change password</p></a>
        <a href="listAccount"><p style="color:black">Account management</p></a>
        <a href="controller?luaChon=updateItem"><p style="color:black">Item management</p></a>
        <a href="listOrder"><p style="color:black">Order management</p></a>
        <a href="doanhThu"><p style="color:black">Store revenue</p>
        <a href="logout"><p style="color:black">Log out</p></a>
    </div>
</div></a></li>
                </ul><%}
else if(account.getRole()==0){
                %>
                <ul class="nav navbar-nav navbar-right" style="z-index:100">
                   <li><a href="controller?luaChon=gioHang"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                   <li><div class="dropdown" style="width: 105px;">
                           <p style="color: #9d9d9d;margin-top: 16px;height: 20px;margin-left: 10px"><%=name%></p>
    <div class="dropdown-content" style="z-index:100;margin-left: -50px">
        <a href="changePassword.jsp"><p style="color:black">Change password</p></a>
       
        <a href="logout"><p style="color:black">Log out</p></a>
    </div>
</div></a></li>
                </ul>
                    <%}
              else if(account.getRole()==1){%>
<ul class="nav navbar-nav navbar-right" style="z-index:100">
                   <li><a href="controller?luaChon=gioHang"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                   <li><div class="dropdown" style="width: 105px;">
                           <p style="color: #9d9d9d;margin-top: 16px;height: 20px;margin-left: 10px"><%=name%></p>
    <div class="dropdown-content" style="z-index:100;margin-left: -50px">
        <a href="changePassword.jsp"><p style="color:black">Change password</p></a>
        <a href="controller?luaChon=updateItem"><p style="color:black">Item management</p></a>
        <a href="listOrder"><p style="color:black">Order management</p></a>
        <a href="logout"><p style="color:black">Log out</p></a>
    </div>
</div></a></li>
                </ul>
                
                <%}}else{%>
                 <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
<%}%>   
               
                
            </div>
        </div>
    </nav>
   <section id="breadcrumb-wrapper">
            <div class="breadcrumb-overlay">
                <div class="wrapper">
                    <div class="inner text-center">
                        <div class="breadcrumb-content">
                            <div class="breadcrumb-big">
                                <h2> KIỂM TRA ĐƠN HÀNG</h2>
                            </div>
                            <div class="breadcrumb-small">
                                <a href="banhngot.jsp" title="Quay trở về trang chủ">Trang chủ</a>
                                <span aria-hidden="true">/</span>
                                <span>Kiểm tra đơn hàng</span>
                            </div>
                        </div>
                    </div>
<!--                    ::after-->
                </div>
            </div>
        </section>  
<div class="donHang" >
    <div class="text" style="display:flex;color: black;padding-top: 10px">
            <p style="width: 150px;margin-left: 100px"  >Ngày đặt</p>
            <p style="width: 150px;margin-left: 80px"  >Ngày nhận</p>
            <p style="width: 150px;margin-left: 120px"  >Tổng tiền</p>
            <p style="width: 150px;margin-left: 60px" >Trạng thái</p>
            <p style="width: 150px;margin-left: 70px"  >Chi tiết</p>
        </div>
     <% 
         String name1=account.getUserName();
         if(name!=null){
         ArrayList<Order> listOrder=(ArrayList<Order>) request.getAttribute("LISTORDER");
         ArrayList<Item> listItem=(ArrayList<Item>) request.getAttribute("LISTITEM");
         ArrayList<OrderDetail> listDetail=(ArrayList<OrderDetail>) request.getAttribute("LISTDETAIL");
         for(Order listord:listOrder){
         
         if(listord.getUsername().equals(name)){
      %>
        <div class="don">
            <div style="margin-left: 90px;display: flex;margin-top: 15px;">
             <p class="text1"><%=listord.getNgayTao()%></p>
             <p class="text1"><%=listord.getNgayNhan()%></p>
             <p class="text1" style="margin-left: 50px;"><%=listord.getTotal()%>đ</p>
             <%
                if(listord.getTinhTrang()==1){ 
             %>
             <p class="text1" style="margin-left: -20px;">Đã chuyển đi</p>
             <%} else{%>
             <p class="text1" style="margin-left: -20px;">Đang chờ hàng</p>
             <%}%>
             <div >
                <a class="xemthem<%=listord.getOrdersID()%> navbar-brand" href="" style='text-decoration: none;margin-left: -40px;'><p style="font-size: 14px;color: black">Xem chi tiết</p></a>        
</div>
            </div>
            <div class="overlay<%=listord.getOrdersID()%>" style="z-index: 100;display: none;position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 100000;">
                <div class="centered-div<%=listord.getOrdersID()%>" style="position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);background-color: #fff;padding: 20px;border: 1px solid #ccc;max-height: 500px;overflow-y: auto;width: 1000px;height: 500px;">
                    <span class="close-button<%=listord.getOrdersID()%>" style="position: absolute;top: 10px;right: 10px;cursor: pointer;" onclick="closeOverlay<%=listord.getOrdersID()%>()">&#10006;</span>
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
                        
                        if(listord.getOrdersID()==detail.getOrdersid()) {
                        
                         for(Item item:listItem){   
                         
                                if(item.getID()==detail.getItemid()) {      
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
                      <%if(listord.getTinhTrang()==0){
                      String url="deleteDon?ID="+listord.getOrdersID()+"&xoa=xoa2";
                      %>
                   <div style="margin-left: 42%;margin-top: 50px;">
                       <a class="xemthem navbar-brand" href=<%=url%>>Hủy đơn hàng</a> 
                        </div>
                          <%}%>             
                    <!-- Thêm nhiều nội dung khác ở đây để thử cuộn -->
                </div>
                        
            </div>
        
        
        </div>

        <script>
    var showDivLinks<%=listord.getOrdersID()%> = document.querySelectorAll(".xemthem<%=listord.getOrdersID()%>");

    showDivLinks<%=listord.getOrdersID()%>.forEach(function(link) {
        link.addEventListener("click", function(e) {
            e.preventDefault();
            var overlay<%=listord.getOrdersID()%> = document.querySelector(".overlay<%=listord.getOrdersID()%>");
            overlay<%=listord.getOrdersID()%>.style.display = "block";
        });
});

function closeOverlay<%=listord.getOrdersID()%>() {
    var overlay<%=listord.getOrdersID()%> = document.querySelector(".overlay<%=listord.getOrdersID()%>");
    overlay<%=listord.getOrdersID()%>.style.display = "none";
}
</script>
    

        
      



         <%}}}%>
         </div>
              <footer class="site-footer" style="margin-top:0px">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6 style=" color: #BE9E72;font-weight: bold; margin-left: 18px; font-size: 20px;">ARTEMIS PASTRY</h6>
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3" style="  width: 72%; color: #BE9E72">
                            <p><i class="glyphicon glyphicon-map-marker "></i> 20 Ngô Quyền, Hoàn Kiếm, Hà Nội</p>
                            <p><i class="glyphicon glyphicon-map-marker"></i> 67 Văn Cao, Ba Đình, Hà Nội</p>
                            <p><i class="glyphicon glyphicon-map-marker"></i> 58 Trung Hòa, Cầu Giấy, Hà Nội</p>
                            <p><i class="glyphicon glyphicon-earphone"></i> PRE-ORDER: 0123123234</p>
                            <p><i class="glyphicon glyphicon-envelope"></i> artemis.pastry05@gmail.com</p>
                        </div>
                    </div>
                </div>
                <hr>
            </div>

            <div class="ft-copyrights">
                <div class="wrapper">
                    <div class="inner">
                        <p class="text-center" style="color: #BE9E72; font-weight: bold; font-size: 25px; "> ART OF CELEBRATION CAKES</p>
                    </div>
                </div>
            </div>
        </footer>
<!--              <script>
        var showDivLinks = document.querySelectorAll(".xemthem");

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
    </script>-->
</body>

</html>