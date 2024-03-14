<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="registration.Account"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="sanphamstyle.css"/>

<style>
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
    
}

.close-button {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
}

.scrollable-content {
    max-height: 80%; /* Đặt chiều cao tối đa cho nội dung có thể cuộn */
    overflow: auto; /* Kích hoạt thanh cuộn nếu nội dung vượt quá chiều cao tối đa */
}
.text4{
    
    font-size: 22px;
    color: #BE9E72;
    font-weight: bold !important;
    font-family: cursive;
}

.inputnumber{
    padding: 0px;border: 1px solid rgba(74, 72, 72, 0.64)    ;
    height: 30px;
    border-radius: 5px;
    text-align: center;
    font-weight: 700;
    color:#BE9E72 ;
}
.link4{
    width: 490px;background-color: #BE9E72;
    height: 35px;
    margin-left: 55px;
    color: #fff;
    margin-top: 9px;
    border-radius: 5px;
    text-align: center;
    padding-top: 1px;
    font-family: cursive;
}
#input2{
    font-weight: 700;
    margin-top: 9px;
    width: 100%;
    margin-top: -9px;
    padding-bottom: 8px;
    background-color:#BE9E72;
    color:white;
    border: 0px;
    margin-top: 2px
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
                    <li class="active"><a href="controller?luaChon=sanpham">Sản Phẩm</a></li>
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
<section id="breadcrumb-wrapper" style="margin-bottom: 0px;">
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
    
    <div class="menusp" style="padding-top: 15px;">
             
            <ul style="display: flex; list-style: none; justify-content: center;">
                <li style="width: 100px;height: 18.4px;"><a class="linksp" style="text-decoration: none;" href="controller?luaChon=sanpham&loaibanh=NewIn"><p style="color: #000;font-size: 20px;font-family: cursive;">New In</p></a></li>
                <li style="width: 164px;height: 18.4px;"></li><a class="linksp" style="text-decoration: none;"  href="controller?luaChon=sanpham&loaibanh=banhSinhNhat"><p style="color: #000;font-size: 20px;font-family: cursive;">Bánh sinh nhật</p></a></li>
                <li style="width: 115px;height: 18.4px;"></li><a class="linksp" style="text-decoration: none;"  href="controller?luaChon=sanpham&loaibanh=GIFTSET"><p style="color: #000;font-size: 20px;font-family: cursive;">GIFTSET</p></a></li>
                <li style="width: 104px;height: 18.4px;"></li><a class="linksp" style="text-decoration: none;"  href="controller?luaChon=sanpham&loaibanh=banhLe"><p style="color: #000;font-size: 20px;font-family: cursive;">Bánh lẻ</p></a></li>
                <li style="width: 112px;height: 18.4px;"></li><a class="linksp" style="text-decoration: none;"  href="controller?luaChon=sanpham&loaibanh=doUong"><p style="color: #000;font-size: 20px;font-family: cursive;">Đồ uống</p></a></li>
            </ul>

        </div>

  
<div class="sanpham1">
    <div style="display: flex;">
    <h3 style=" font-weight: 700;font-family: cursive;color: black;margin-left: 177px;">Bánh sinh nhật</h3>
    <div style="margin-left: 814px;margin-top: 19px;display: flex;"> 
    <div>
    <p style="margin-left: -119px;margin-top: 2px;color: black;font-size: 17px;font-family: cursive;">Sắp xếp theo: </p>
     </div>
    <div class="dropdown" style="border: solid 1px black;width: 125px;height: 30px;text-align: center;">
            
        <label style="font-weight: 100;color: black;margin-left: -5px;margin-top: 4px;font-family: cursive;" class="dropdown-label" for="dropdown-toggle">Chọn tùy chọn</label>
        <div class="dropdown-content">
            <a style="color: black;font-family: cursive;width: 170px;" href="sapxep?luachon=thapDenCao&url=banhSinhNhat.jsp">Giá từ thấp tới cao</a>
            <a style="color: black;font-family: cursive;width: 170px;" href="sapxep?luachon=caoDenThap&url=banhSinhNhat.jsp">Giá từ cao tới thấp</a>
            <a style="color: black;font-family: cursive;width: 170px;" href="sapxep?luachon=cuNhat&url=banhSinhNhat.jsp">Mới nhất</a>
            <a style="color: black;font-family: cursive;width: 170px;" href="sapxep?luachon=moiNhat&url=banhSinhNhat.jsp">Cũ nhất</a>
        </div>
    </div>
</div>
</div>
    <div class="container">
       
<%
    ArrayList<Item> listItem=(ArrayList<Item>)request.getAttribute("LISTITEM");
    if(listItem!=null){ 
    int i=0;
    for(Item list:listItem){
    if(list.getTypeID()==1){
%>
<div class=" col-md-6  items" style="display: flex;width: 541px;height: 176px;font-family: cursive;">
    <div>
        
    <a class="show-div-link" href="" style="width: 381px;height: 176px; text-decoration: none;">
        <div style="width: 381px;height: 176px;color: black;">   
        <p style="font-weight: 700;"><%= list.getItemName() %></p>
        <p style="height: 85.2px;    font-size: 15px;"><%= list.getIntroduction() %></p>
        <div style="display:flex">
        
        <p style="font-size: 18px;font-weight: 700;"><%= Math.round(list.getPrice()  )%><%="đ"%></p>
        <%if(list.getQuantity()>0){%>
        <p style="margin-left: 200px;">Còn lại: <%=list.getQuantity()%></p>
        <%} else{%>
         <p style="margin-left: 200px;">Hết Hàng</p>
         <%}%>
        </div>
     </div></a>
             <div class="overlay" style="z-index:2000">
        <div class="centered-div" style="padding: 0px;">
            <button class="close-button"><img style="width: 10px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSkBKbhGamdqx3Bab4sQqUwkljoYvQ-WasvA&usqp=CAU" alt=""></button>
            <div class="scrollable-content" style="height: 550px;width:600px;border-radius: 5px;border-radius: 5px;;">
               <img src=<%= list.getImg()%> style="width: 100%;" alt="">
            <div style="margin-left: 15px;"> 
               <p class="text4"><%= list.getItemName() %></p>
               <p class="text4" style="font-size: 19px;"><%= Math.round(list.getPrice()  )%><%="đ"%></p>
               <form action="insertCart" >
                    <input type="hidden" name="IdCart" value="<%=list.getID()%>">
                    <input type="hidden" name="Type" value="<%=list.getTypeID()%>">
                    <input type="hidden" name="Soluong" value="<%=list.getQuantity()%>">
                    <input style="width: 192.8px;"  class="inputnumber" type="number" name="Inputnumber" min="1" value="1" max="<%=list.getQuantity()%>" >
           
            <p style="margin-top: 20px;">Mô tả</p>
            <p style="font-size: 18px;
            font-family: monospace;color: black"><%= list.getDescription()  %></p>
        </div>
            </div>            
            <div style="position: absolute;background-color:#fff;height: 50px;width: 100.2%;box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);">
         
                <a  href="" style="text-align: center;text-decoration: none;">
                    <div class="link4" >
                        <input type="submit" name="hi" id="input2" value="Thêm vào giỏ">
                         </form>
                    </div>
                </a>
            </div>
        </div>
    </div>
    </div>
     <div style="margin-left: 15px;">
    <a class="show-div-link" href=""><img style="width: 124px;height: 124px;" src=<%= list.getImg() %> alt=""></a>
    </div>

</div>
   
<%}}%>

</div>
<%
}
%>
</div>



<div class="clear1"></div>
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
<script>
    var showDivLinks = document.querySelectorAll(".show-div-link");

showDivLinks.forEach(function(link) {
    link.addEventListener("click", function(e) {
        e.preventDefault();
        var overlay = this.nextElementSibling;
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