<%-- 
    Document   : banhngot
    Created on : Oct 7, 2023, 6:43:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Account"%>
<!Doctype html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                    <li class="active"><a href="banhngot.jsp">Trang Chủ</a></li>
                     <li><a href="sanpham">Sản phẩm</a></li>
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
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>
      
          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="https://theme.hstatic.net/200000247827/1000692826/14/slideshow_2.png?v=902" alt="Image">
              <div class="carousel-caption">               
              </div>      
            </div>
      
            <div class="item">
              <img style="width: 1519.2px;height: 574.638px;" src="" alt="Image">
              <div class="carousel-caption">          
              </div>      
            </div>
            <div class="item">
                <img style="width: 1519.2px;height: 574.638px;" src="https://scontent.fhan2-3.fna.fbcdn.net/v/t39.30808-6/275610586_924199054931743_7116361325532617281_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=52f669&_nc_ohc=p34-pSN7BCkAX_ZdUN-&_nc_ht=scontent.fhan2-3.fna&oh=00_AfCLq7zniqIJ5eaNpOOHWvhJd5oYNS-jESSebDRSBVOKMw&oe=652196F0" alt="Image">
                <div class="carousel-caption">          
                </div>      
              </div>
            </div>
          </div>
    
      
          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" style="height: 574.638px;    margin-top: 52px;">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" style="height: 574.638px;    margin-top: 52px;">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
      </div>
      <div style="display: flex;    margin-top: 20px;
      margin-left: 29vw;">
  
        <div class="link1">
        <a href="" >
            <div class="hover-div anh1" >
                <img src="//theme.hstatic.net/200000247827/1000692826/14/hp_icon1.png?v=902" alt="Your Image" class="anhphu1" style="height: 46px;">
                <p class="text1">MIỄN PHÍ VẬN CHUYỂN</p>
            </div>
        </a>
    </div>

    <div class="link1">
        <a href="" >
            <div class="hover-div anh1" >
                <img src="//theme.hstatic.net/200000247827/1000692826/14/hp_icon2.png?v=902" alt="Your Image" class="anhphu1" style="height: 46px;">
                <p class="text1" style="margin-top: 15px;">ƯU ĐÃI BÁNH SINH NHẬT</p>
            </div>
        </a>
    </div>

    <div class="link1">
        <a href="" >
            <div class="hover-div anh1" >
                <img src="//theme.hstatic.net/200000247827/1000692826/14/hp_icon3.png?v=902" alt="Your Image" class="anhphu1" style="height: 46px;">
                <p class="text1">COMBO BÁNH & NƯỚC</p>
            </div>
        </a>
    </div>

</div>

<div style="display: flex;margin-top: 35px;    margin-left: 12vw;">

<div style="margin-right: 40px;">
    <a href="controller?luaChon=sanpham&loaibanh=banhSinhNhat" >
        <div class="link2 " >
            <img src="//theme.hstatic.net/200000247827/1000692826/14/banner_img1.jpg?v=902" alt="Your Image" class="anhphu2" >
        </div>
    </a>
</div>
<div style="margin-right: 40px;">
    <a href="controller?luaChon=sanpham&loaibanh=banhLe" >
        <div class="link2 " >
            <img src="//theme.hstatic.net/200000247827/1000692826/14/banner_img2.jpg?v=902" alt="Your Image" class="anhphu2" >
        </div>
    </a>
</div>
<div style="margin-right: 40px;">
    <a href="controller?luaChon=sanpham&loaibanh=GIFTSET" >
        <div class="link2 " >
            <img src="//theme.hstatic.net/200000247827/1000692826/14/banner_img3.jpg?v=902" alt="Your Image" class="anhphu2" >
        </div>
    </a>
</div>

</div>

<div  style="padding: 1px;background: #ebedef;margin-top: 60px;">
<div style="text-align: center; color: #BE9E72;">
    <h2 style="font-weight: 600;">BEST SELLER</h2>
</div>

<div class="best">

    <div style="display: flex;margin-left: 14vw;    margin-top: 30px;">
        <div class="sell1" style="width: 522px;margin-right: 20px;">
            <a href="controller?luaChon=sanpham" style="font-family: cursive;">
                <div class="link3 navbar-brand" >
                    <div>
                        <p class="tenbanh1">Berry Fruit Vanilla</p>
                        <p style="font-size: 13px; width: 270px;color: black;">Dòng Bánh kem lạnh ( Mousse ) , vị  Vanilla nhân các loại quả mọngKích thước : Bánh có 1 size duy nhất 18cm cao 4cm dành cho 6-8 người dùng  Vị chua thanh nhẹ của...</p>
                        
                         <p style="color: black;margin-top: 13px;">585.000đ</p>
                    </div>
                    <div>
                    <img src="https://product.hstatic.net/200000247827/product/berry_8257781ff0a941d0aba3676a1cbef138.jpg" alt="Your Image" class="anhphu3" >
                </div>
                </div>
            </a>
        </div>

        <div class="sell1" style="width: 522px;margin-left: 20px;">
            <a href="controller?luaChon=sanpham" style="font-family: cursive;">
                <div class="link3 navbar-brand" >
                    <div>
                        <p class="tenbanh1">Burnt Caramel Signature</p>
                        <p style="font-size: 13px; width: 270px;color: black;">Dòng Bánh kem lạnh ( Mousse ) , vị Caramel valhora & nhân caramel mặn dẻo Kích thước : Bánh có 1 size duy nhất 18cm cao 4cm dành cho 6-8 người dùng...</p>
                        
                         <p style="color: black;margin-top: 13px;">570.000đ</p>
                    </div>
                    <div>
                    <img src="https://product.hstatic.net/200000247827/product/z3511381330617_501d94b4e9303306c860f15162c9b0e1_5259cb1cb41b490e9260e47830096b3b.jpg" alt="Your Image" class="anhphu3" >
                </div>
                </div>
            </a>
        </div>
    </div>

    <div style="display: flex;margin-left: 14vw;    margin-top: 30px;">
        <div class="sell1" style="width: 522px;margin-right: 20px;">
            <a href="controller?luaChon=sanpham" style="font-family: cursive;">
                <div class="link3 navbar-brand" >
                    <div>
                        <p class="tenbanh1">Creamy Choco</p>
                        <p style="font-size: 13px; width: 270px;color: black;">Dòng bánh nhiều bạt gato ( Gateux ) , vị bánh Gato Socola Kích thước : Bánh có duy nhất 1 size 20cm , cao 7cm và dành cho 6-8 người dùng Vị bánh dễ ăn bởi...</p>
                        
                         <p style="color: black;margin-top: 13px;">585.000đ</p>
                    </div>
                    <div>
                    <img src="https://product.hstatic.net/200000247827/product/z3511381326444_ddedfebe0048a881066d1b3051fb1438_bdf3cd1e2bcc41199736b3f80de30c58.jpg" alt="Your Image" class="anhphu3" >
                </div>
                </div>
            </a>
        </div>

        <div class="sell1" style="width: 522px;margin-left: 20px;">
            <a href="controller?luaChon=sanpham" style="font-family: cursive;">
                <div class="link3 navbar-brand" >
                    <div>
                        <p class="tenbanh1">Mandarin Orange Coconut</p>
                        <p style="font-size: 13px; width: 270px;color: black;">Dòng Bánh kem lạnh ( Mousse ), vị Dừa nhân cam quýt Kích thước : Bánh có 1 size duy nhất 18cm cao 4cm dành cho 6-8 người dùngBánh là sự hòa quyện giữa vị thơm...</p>
                        
                         <p style="color: black;margin-top: 13px;">570.000đ</p>
                    </div>
                    <div>
                    <img src="https://product.hstatic.net/200000247827/product/504b01bf-14f2-4fcf-a07c-14a3b346bdd7_4b2794c5f4a548f99f94c1292243799a.jpg" alt="Your Image" class="anhphu3" >
                </div>
                </div>
            </a>
        </div>
    </div>

    <div style="display: flex;margin-left: 14vw;    margin-top: 30px;">
        <div class="sell1" style="width: 522px;margin-right: 20px;">
            <a href="controller?luaChon=sanpham" style="font-family: cursive;">
                <div class="link3 navbar-brand" >
                    <div>
                        <p class="tenbanh1">Mango Coconut</p>
                        <p style="font-size: 13px; width: 270px;color: black;">Dòng bánh nhiều bạt gato ( Gateux ) ,vị bánh Gato Xoài Dừa Kích thước : Bánh có duy nhất 1 size 20cm , cao 7cm và dành cho 6-8 người dùng Bạt gato vị dừa kết...</p>
                        
                         <p style="color: black;margin-top: 13px;">450.000đ</p>
                    </div>
                    <div>
                    <img src="https://product.hstatic.net/200000247827/product/img_6422_75f262ed48ca4487baf9037441e2a9c5.jpeg" alt="Your Image" class="anhphu3" >
                </div>
                </div>  
            </a>
        </div>

        <div class="sell1" style="width: 522px;margin-left: 20px;">
            <a href="controller?luaChon=sanpham" style="font-family: cursive;">
                <div class="link3 navbar-brand" >
                    <div>
                        <p class="tenbanh1">Mango Pineapple Roll Gato</p>
                        <p style="font-size: 13px; width: 270px;color: black;">Mango Pineapple Roll Gato - Dòng bánh Gato, vị Gato Xoài Dứa & Lá NếpKích thước : Bánh có duy nhất 1 size 18cm  , cao 7cm và dành cho 6-8 người dùng Chua nhẹ từ...</p>
                        
                         <p style="color: black;margin-top: 13px;">530.000đ</p>
                    </div>
                    <div>
                    <img src="https://product.hstatic.net/200000247827/product/z3650398976499_c720bcf2a03dc3ef867784810d04159c_a4c4cfb677644356a24091e7bad6ebfb.jpg" alt="Your Image" class="anhphu3" >
                </div>
                </div>
            </a>
        </div>

        
    </div>
    <div style="display: flex;   margin-top: 40px;padding-bottom: 20px;">
        <a class="xemthem navbar-brand" href="controller?luaChon=sanpham" style='margin-left: 46%;margin-top: -10px;'>Xem tất cả </a>

        
    </div>
</div>
</div>

<div style="display: flex;margin-left: 12vw;margin-top: 46px;">

    <div class="zoomable-container img1" style="    margin-right: 40px;">
        <img class="zoomable-image imgphu1" src="https://theme.hstatic.net/200000247827/1000692826/14/hb_img1.png?v=902" alt="Your Image">
        <a class="image-link" href="https://www.example.com"></a>
    </div>

    <div class="zoomable-container img1">
        <img class="zoomable-image imgphu1 " src="https://theme.hstatic.net/200000247827/1000692826/14/hb_img2.png?v=902" alt="Your Image" >
        <a class="image-link" href="https://www.example.com"></a>
    </div>

</div>
<div class="text2">
    <h2>NGHỆ THUẬT ĐEM TRÁI CÂY TƯƠI 100% VÀO TRONG TỪNG CHIẾC BÁNH ENTREMET</h2>
</div>

<div class="container justify-content-center" style="margin-top: 25px;">

    <div class="col-md-8">
        <img class="img-fluid" src="//theme.hstatic.net/200000247827/1000692826/14/img_intro-1.png?v=902" style="width: 730px;height: 730px;">
    </div>

    <div class="col-md-4">
<div><img class="img-fluid" src="//theme.hstatic.net/200000247827/1000692826/14/img_intro-2.png?v=902" style="width: 350px;height: 350px;"></div>
<div style="    margin-top: 30px;"><img class="img-fluid" src="//theme.hstatic.net/200000247827/1000692826/14/img_intro-3.png?v=902" style="width: 350px;height: 350px;"></div>
    </div>

</div>


<div class="container justify-content-center " style="    margin-top: 30px;">

    <div class="col-md-4">
        <img class="img-fluid" src="//theme.hstatic.net/200000247827/1000692826/14/img_intro-4.png?v=902" style="width: 350px;height: 350px;">
    </div>
    <div class="col-md-4">
        <img class="img-fluid" src="//theme.hstatic.net/200000247827/1000692826/14/img_intro-5.png?v=902" style="width: 350px;height: 350px;">
    </div>
    <div class="col-md-4">
        <img class="img-fluid" src="//theme.hstatic.net/200000247827/1000692826/14/img_intro-6.png?v=902" style="width: 350px;height: 350px;">
    </div>

</div>

<div class="text2" style="  font-family: system-ui;">
    <h2>VỀ CHÚNG TÔI</h2>
</div>

<div class="container justify-content-center ">

    <div class="col-md-6" >
        <img src="//theme.hstatic.net/200000247827/1000692826/14/intro.png?v=902" alt="Ảnh về chúng tôi" style="border-radius: 12px;width: 555px;height: 833px;    margin-left: -25px;">
    </div>

    <div class="col-md-6" style="text-align: center;">
        <p  style="font-style: italic; font-size: 19px;   margin-right: 135px;">Art of Celebration Cakes</p>
        <p class="text3">Trong thần thoại Hy Lạp, người dân làm những chiếc bánh có hình tròn dâng lên đền thờ thần Artemis - Thần Mặt Trăng, cội nguồn của chiếc bánh sinh nhật được ra đời từ đó. Những cây nến cắm trên chiếc bánh tượng trưng cho lời nguyện ước của chủ nhân trong ngày sinh nhật gửi đến các vị thần, cầu mong điều ước thành sự thật. Câu chuyện này cũng là nguồn cảm hứng để cái tên Artemis Pastry ra đời, với những chiếc bánh sinh nhật gắn liền với thần thoại mang đậm tính nghệ thuật.</p>
        <p class="text3">“Nghệ thuật trong từng miếng bánh “
            Lấy nghệ thuật là niềm cảm hứng bất tận, chúng tôi luôn tâm niệm mỗi sản phẩm của Artemis đều như một kiệt tác nghệ thuật có giá trị được trưng bày trong viện bảo tàng. Mỗi thợ làm bánh như những hoạ sĩ khắc hoạ lên từng chiếc bánh – đam mê, tỉ mỉ, công phu và sáng tạo . Các sản phẩm luôn phải nghệ thuật cả về phần nhìn lẫn phần vị , sự kết hợp độc đáo trong từng lớp nhân.</p>
        <p class="text3">"Yêu bằng cả trái tim"
            Đề cao sức khoẻ khách hàng, mỗi sản phẩm của Artemis Pastry luôn được sử dụng những nguyên liệu được chọn lựa kĩ càng với tiêu chuẩn quốc tế , hoa quả tươi ngon tự nhiên, nói không với hoá chất và quan trọng hơn cả mỗi chiếc bánh của Artemis Pastry luôn đảm bảo TƯƠI MỚI MỖI NGÀY.</p>
        <p class="text3">Artemis Pastry hi vọng mang đến cho khách hàng sự hài lòng nhất, đặt niềm tin vào chất lượng và dịch vụ của Artemis, trải nghiệm của chính khách hàng và tin tưởng trao tặng người thân yêu trong những dịp đặc biệt.
            Tình cảm của quý khách chính là động lực nuôi dưỡng niềm đam mê bất tật với nghệ thuật của ARTEMIS PASTRY, mỗi ngày.</p>

            <div style="display: flex;   margin-top: 40px;padding-bottom: 20px;margin-right: 12vw;">
                <a class="xemthem navbar-brand" href="https://phela.vn/ve-chung-toi/" style='margin-left: 46%;margin-top: -10px;'>Xem thêm </a>
        
                
            </div>
    </div>

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