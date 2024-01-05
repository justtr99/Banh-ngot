<%-- 
    Document   : changePassword
    Created on : Oct 8, 2023, 1:22:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Simple Login Form</title>
<l<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="login.css"/>
<style>
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
            z-index: 2;
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
                    <li ><a href="banhngot.jsp">Trang Chủ</a></li>
                    <li><a href="controller?luaChon=sanpham">Sản Phẩm</a></li>
                    <li><a href="kiemTraDon">Kiểm tra đơn hàng</a></li>

                </ul> 
                <%  Account account=(Account)session.getAttribute("ACCOUNT");                    
                    String name=null;
                    if(account!=null){
                    name=account.getUserName();
                    if(account.getRole()==2){
                %>
                <ul class="nav navbar-nav navbar-right">
                   <li><a href="controller?luaChon=gioHang"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                   <li><div class="dropdown" style="width: 105px;">
                           <p style="color: #9d9d9d;margin-top: 16px;height: 20px;margin-left: 10px"><%=name%></p>
    <div class="dropdown-content" style="margin-left: -50px">
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
                <ul class="nav navbar-nav navbar-right">
                   <li><a href="controller?luaChon=gioHang"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                   <li><div class="dropdown" style="width: 105px;">
                           <p style="color: #9d9d9d;margin-top: 16px;height: 20px;margin-left: 10px"><%=name%></p>
    <div class="dropdown-content" style="margin-left: -50px">
        <a href="changePassword.jsp"><p style="color:black">Change password</p></a>

        <a href="logout"><p style="color:black">Log out</p></a>
    </div>
</div></a></li>
                </ul>
                    <%}
              else if(account.getRole()==1){%>
<ul class="nav navbar-nav navbar-right">
                   <li><a href="controller?luaChon=gioHang"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                   <li><div class="dropdown" style="width: 105px;">
                          <p style="color: #9d9d9d;margin-top: 16px;height: 20px;margin-left: 10px"><%=name%></p>
    <div class="dropdown-content" style="margin-left: -50px">
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
                                <h2> TẤT CẢ SẢN PHẨM</h2>
                            </div>
                            <div class="breadcrumb-small">
                                <a href="banhngot.jsp" title="Quay trở về trang chủ">Trang chủ</a>
                                <span aria-hidden="true">/</span>
                                <span>Tất cả sản phẩm</span>
                            </div>
                        </div>
                    </div>
<!--                    ::after-->
                </div>
            </div>
        </section>
    
    
<div class="login-form">
    <form action="controller">
        <h2 class="inner text-center breadcrumb-content breadcrumb-big">Đổi mật khẩu</h2> 
        <hr>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Mật khẩu cũ" required="required" name="txtOldPassword">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Mật khẩu mới" required="required" name="txtNewPassword">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Nhập lại mật khẩu mới" required="required" name="txt2NewPassword">
        </div>
        <%
            String an=(String)request.getAttribute("AN");
            if(an!=null){
            String check=(String)request.getAttribute("CHECK");
            if(check!=null){
        %>
        <p><%= check %></p>
        <%}}%>
        <div class="form-group">
            <button name="luaChon" value="ChangePass" type="submit" class="btn btn-primary btn-block" style="background-color: #BE9E72; border: 2px solid #BE9E72;">Đổi mật khẩu</button>
        </div>       
        <hr>
    </form>
    
<!--    <p class="text-center"><a href="#">Đăng kí</a></p>-->


  
</div>
    <footer class="site-footer">
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
</body>
</html>