<%-- 
    Document   : ThanhToan
    Created on : Oct 22, 2023, 4:25:06 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="registration.Account"%>
<%@page import="registration.Cart"%>
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
    <link rel="stylesheet" href="thanhtoan.css"/>
    </head>

    <body>
        <div>
             <div class="col-md-8" >
                <div style="text-align: center;">
                    <img style="margin-left: 100px;" class="logo1" src="https://www.hoteljob.vn/uploads/images/18-12-25-16/logodennentrang-01(1).jpg    " alt="">
                 </div>
                <div class="col-md-7">
                 <div style="margin-left: 100px;">
                    <div style="display: flex;">
                    <h4 style="font-weight: 700;">Thông tin nhận hàng</h4>
                    <a class="link1" href="" style="text-decoration: none;">
                        <img src="https://static-00.iconduck.com/assets.00/logout-icon-512x512-4vujhvch.png" alt="" style="width: 14px;height: 14px;margin-right: 5px;">
                          <h7 style="margin-top: -3px;">Log out</h7    >
                    </a>
                </div>
                     <form action="xacNhanThanhToan">
                         <input placeholder="Email..." name="email"  class="input1" type="text" id="text" required><br>
                <input placeholder="Họ và tên" name="ten" class="input1" type="text" id="text" required><br>
                <input placeholder="Số điện thoại" name="sdt" class="input1" type="text" id="text" required><br>
                <input placeholder="Địa chỉ" name="diachi" class="input1" type="text" id="text" required> <br>
                <textarea placeholder="Ghi chú" name="gichu" class="input1" style="height: 167px;" ></textarea>
                 </div>                
                </div>
                <div class="col-md-5">
                    <h4 style="font-weight: 700;">Vận chuyển</h4>                   
                        <div class="checkbox-wrapper-24">
                            <input type="checkbox" id="check-24" name="check" value="" />
                            <label for="check-24">
                              <span></span>Thanh toán khi giao hàng (COD)
                              <p style="font-weight: 100; margin-top: 20px;">Bạn chỉ phải thanh toán khi nhận được hàng</p>
                            </label>
                          </div>
                          <div class="checkbox-wrapper-25">
                            <input type="checkbox" id="check-25" name="check" value="" />
                            <label for="check-25">
                              <span></span>Thanh toán trước (chuyển khoản)
                              <img style="width: 150px;margin-left: 100px;margin-top: 20px" src="https://scontent.fhan3-1.fna.fbcdn.net/v/t1.15752-9/394436549_1829948397408177_5750910333282596552_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=yHM8msCazoEAX_MdcI_&_nc_ht=scontent.fhan3-1.fna&oh=03_AdRiN-QMCUmj_TrrS4S5BWRYe59BtoPeKfT_WFfooVMEeg&oe=6566A3D4" alt="">
                            </label>
                          </div>
                
                
                        </div>
             </div>
            
             <div class="col-md-4" style="background-color: #f0f0f0;height: 110vh;">
                 <div style="display: flex">
                     
                <h4 style="font-weight: 700;margin-top: 50px;margin-left: 33px;font-size: 21px;">Đơn hàng</h4>
                <%
                    String pick=(String)request.getAttribute("CHON");
                    Account acc=(Account) session.getAttribute("ACCOUNT");
                    int total=0;
                    if(acc!=null){
                %>
                <p style="margin-top: 47px;margin-left: 200px;font-size: 21px;"><%=acc.getUserName()%></p>
                <%}else{%>
               <a style="margin-top: 50px;margin-left: 200px;font-size: 21px;text-decoration: none;color: black" href="login.jsp"><span class=" glyphicon glyphicon-log-in"></span> Login</a>
                <%}%>
                </div>
                
                    <div id="myDiv" class="resizeable-div" style="width: 400px;margin-left: 50px;" >
                    <%
                        if(acc!=null){
                    String [] chon=(String []) request.getAttribute("LISTTHANHTOAN");
                    if(chon[0].length()>0){
                     ArrayList<Cart> cart=(ArrayList<Cart>) request.getAttribute("LIST");
                      for(Cart dto:cart){
                      for(int i=0;i<chon.length;i++){ 
                      int id=Integer.parseInt(chon[i]);
                      if(dto.getCartId()==id){
                      
                
                %>
               <%int tong=dto.getQuantity()*dto.getPrice();
               total+=tong;
               %>
                   <div style="display:flex;margin-top: 20px;font-family: cursive;">
                    <div style="border-right: 1px solid;margin-right: 10px;">
                        <p class="quantity" style="margin-top: 45px;margin-right: 10px;"><%=dto.getQuantity()%></p>
                </div>
                <input type="hidden" name="pick" value="<%=pick%>">
                       <img style="width: 100px;border-radius: 10px;height: 120px;margin-top: 20px" src="<%=dto.getImg()%>" alt="">
                         <p style="margin-top: 30px;margin-left: 10px;width: 90px;"><%=dto.getItemName()%></p>
                         <p class="total" style="margin-top: 39px;margin-left: 109px;"><%=tong%>đ</p>
                  
                        
                       
                </div>
                <%}}}}}%>
                </div>
                <div style="display: flex; margin-top: 20px;">
                    <input style="margin-right: 20px;" placeholder="Nhập mã giảm giá" class="input2" type="text" id="text"><br>
                    <div >
                        <a class="xemthem navbar-brand" href="" style='text-decoration: none;margin-right: 20px;width: 98px; height: 47px; text-align: center;'><p style="font-size: 14px;">Áp dụng</p></a>        
</div>
                  </div >

<div class="tien" >
<div style="display: flex;margin-top: 10px;">
  <p style="font-size: 17px;">Tiền hàng</p>
  <p style="font-size: 17px;margin-left: 230px;"><%=total%>đ</p>
</div>
<div style="display: flex;margin-top: 10px;">
    <p style="font-size: 17px;">Tiền ship</p>
    <p style="font-size: 17px;margin-left: 235px;">30000đ</p>
  </div>
  <div style="display: flex;margin-top: 10px;">
    <p style="font-size: 17px;">Giảm giá</p>
    <p style="font-size: 17px;margin-left: 230px;"></p>
  </div>
</div>


<div class="tien2" >
<div style="display: flex;margin-top: 10px;">
    <p style="font-size: 17px;">Tiền hàng</p>
    <p style="font-size: 17px;margin-left: 230px;"><%=total+30000%>đ</p>
  </div>
</div>   

<div style="display: flex;margin-top: 20px;margin-left: 50px;">

   <a style="text-decoration: none;width: 250px;margin-top: 10px;" class="link3" href="gioHang">Quay về giỏ hàng</a>
   <input class="xemthem navbar-brand" type="submit" name="chon" value="Thanh toán" style='text-decoration: none;margin-right: 20px;width: 150px; height: 47px; text-align: center;border: 0px'>
    
</form>
</div>
             </div>

        </div>
        <script>
            
          const myDiv = document.getElementById('myDiv');
let isQuarterDiv = false;

myDiv.addEventListener('click', function () {
  if (myDiv.clientHeight >= 350) {
    myDiv.classList.add('quarter-div');
    myDiv.style.resize = 'none'; // Vô hiệu hóa kéo dài
  } else {
    myDiv.classList.remove('quarter-div');
    myDiv.style.resize = 'vertical'; // Kích hoạt kéo dài
  }
});

          
          </script> 
    </body>

</html>