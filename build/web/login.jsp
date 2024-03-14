<%-- 
    Document   : login
    Created on : Oct 7, 2023, 6:34:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                        <li><a href="banhngot.jsp">Trang Chủ</a></li>
                        <li><a href="controller?luaChon=sanpham">Sản Phẩm</a></li>
                        <li><a href="#">Kiểm tra đơn hàng</a></li> 

                    </ul>   
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href=""><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                        <li class="active"><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
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
        <h2 class="inner text-center breadcrumb-content breadcrumb-big">ĐĂNG NHẬP</h2> 
        <hr>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Email" required="required" name="txtUsername">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Mật khẩu" required="required" name="txtPassword">
        </div>
        <div class="form-group">
            <button name="luaChon" value="Login" type="submit" class="btn btn-primary btn-block" style="background-color: #BE9E72; border: 2px solid #BE9E72;">Đăng nhập</button>
        </div>
        <div class="clearfix">
            <a href="#" class="float-right" style="color: #BE9E72">Quên mật khẩu?</a>
        </div>
        <hr>
        <p class="text-center"><a href="register.jsp"style="color: #BE9E72">Đăng kí</a></p>
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