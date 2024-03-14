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
<link rel="stylesheet" href="GioHang.css"/>
    <style>
        .gioh1{
    background-color: white;
    text-align: center;
    padding: 51px;
    margin: 0px;
    font-family: cursive;
    font-weight: 700;
}
        .quantity-container {
            display: flex;
            align-items: center;
        }

        .quantity {
            width: 50px;
            text-align: center;
            margin: 0 10px;
        }

        /* CSS để tùy chỉnh kích thước của ô kiểm */
        .myCheckbox {
            width: 18px; /* Đặt chiều rộng */
            height: 18px; /* Đặt chiều cao */
        }

        .xemthem {
            font-weight: 500;
            color: #fff;
            transition: background 1.0s;
            background: #2b2d29;
            border-radius: 11px;
            z-index: 10;
            font-size: 13px;
            position: relative;
        }

        .xemthem:hover {
            background: #222321ba;
            color: #fff;
        }.dropdown {
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

            @media (max-width:767px)
            {
                .social-icons li.title
                {
                    display:block;
                    margin-right:0;
                    font-weight:600
                }
            }
          
/* CSS để tùy chỉnh kích thước của ô kiểm */
.myCheckbox {
    width: 18px; /* Đặt chiều rộng */
    height: 18px; /* Đặt chiều cao */
    }
    .xemthem{
    font-weight: 500;
    color: #fff;
    transition: background 1.0s;
    background: #2b2d29;
    border-radius: 11px;
    z-index: 10;
    
    font-size: 13px;
    position: relative;   
}.xemthem:hover{
    background: #222321ba;
    color: #fff;
}
#fixed-div {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #f0f0f0;
            padding: 10px;
            text-align: center;
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
                    <li><a href="kiemTraDon">Kiểm tra đơn hàng</a></li>

                </ul> 
                <%  Account account=(Account)session.getAttribute("ACCOUNT");                    
                    String name=null;
                    if(account!=null){
                    name=account.getUserName();
                    if(account.getRole()==2){
                %>
                <ul class="nav navbar-nav navbar-right">
                   <li class="active"><a href=""><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
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
                   <li><a href=""><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
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
                   <li><a href=""><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                   <li><div class="dropdown" style="width: 105px;">
                           <p style="color: #9d9d9d;margin-top: 16px;height: 20px;"><%=name%></p>
    <div class="dropdown-content">
        <a href="changePassword.jsp"><p style="color:black">Change password</p></a>
        <a href="controller?luaChon=updateItem"><p style="color:black">Item management</p></a>
        <a href="listOrder"><p style="color:black">Order management</p></a>
        <a href="logout"><p style="color:black">Log out</p></a>
    </div>
</div></a></li>
                </ul>
                
                <%}}else{%>
                 <ul class="nav navbar-nav navbar-right">
                    <li><a href=""><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span> Add to card</a></li>
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
<%}%>   
               
                
            </div>
        </div>
    </nav>   

<div class="gioh1" >
    
    <h1 style="margin: 0px;">Giỏ hàng của bạn</h1>
</div>

<div class="giohang">
    <div class="chonall">        
        <p style="font-weight: 100;margin-left: 30px;margin-top: 9px;">Sản phẩm</p>
        <div style="display: flex; margin-left: 500px;">
            <p style="margin-right: 90px;margin-top: 8px">Đơn giá</p>
            <p style="margin-right: 90px;margin-top: 8px">Số lượng</p>
            <p style="margin-right: 90px;margin-top: 8px;margin-left:14px;">Số tiền</p>
            <p style="margin-right: 90px;margin-top: 8px">Thao tác</p>
        </div>
    </div>

    <%
        Account acc=(Account)session.getAttribute("ACCOUNT");
        ArrayList<Cart> cart=(ArrayList<Cart>) request.getAttribute("CARTS");
        ArrayList<Item> item=(ArrayList<Item>) request.getAttribute("LISTITEM");
        int a=0;
        if(cart!=null&&acc!=null){
for(Cart carts:cart){
if(carts.getUsername().equals(acc.getUserName())){
a=carts.getPrice();
String url="deleteGioHang?itemid="+carts.getCartId();
int ttt=0;
for(Item dto2:item ){
if(dto2.getID()==carts.getItemID())
     ttt=dto2.getQuantity();
        }
int id=carts.getCartId();
    %>    
    <div class="chonall" style="height: 150px; display: flex;">
        <input type="checkbox" class="myCheckbox" style="margin-top: 55px; margin-left: 20px;" value="<%=id%>" >
        <img src="<%=carts.getImg()%>"
             alt="" style="width: 180px; height: 120px; margin-left: 20px; border-radius: 3px; margin-top: 3px;">
        <p style="margin-top: 50px; margin-left: 20px; width: 200px;"><%=carts.getItemName()%> </p>
        <p class="price" style="margin-top: 50px; margin-left: 130px;  "><%=carts.getPrice()%>đ</p>
         <input type="hidden" name="gia" value="<%=id%>">
        <div class="quantity-container" style="margin-top: -10px; margin-left: 80px;">    
            <form style="margin-left: -27px;" action="updateCart">
            <input name="soluong" type="number" class="quantity" value="<%=carts.getQuantity()%>" min="1" max="<%=ttt%>" >
            <input type="hidden" name="id" value="<%=id%>">
            <input style="background-color: #121111d9;color: aliceblue;border-radius: 7px" type="submit" value="Confirm">
            </form>
            <p style="margin-top: 10px; margin-left: 45px; width: 50px;" class="result"><span class="result-value"></span>đ
            </p>
            <div style="display: flex; margin-left: 45px;">
                <a class="xemthem navbar-brand" href="<%=url%>"
                   style='text-decoration: none; margin-left: 50px'>Xóa </a>
            </div>
        </div>
    </div>
       
    <%}}}%>
</div>
    
<script>    
    const quantityInputs = document.querySelectorAll(".quantity");
    const resultTexts = document.querySelectorAll(".result");
    const resultValues = document.querySelectorAll(".result-value");
    const multiplier = <%=a%>; // Số cố định bạn muốn nhân với giá trị nhập vào
    const prices = document.querySelectorAll(".price");
    console.log(prices);
console.log(multiplier);
    function updateResult(index) {
         const price = parseInt(prices[index].textContent);
        const currentValue = parseInt(quantityInputs[index].value);
        resultValues[index].textContent = (currentValue * price);
    }

    quantityInputs.forEach((input, index) => {
        input.addEventListener("input", () => {
            updateResult(index);
        });
    });

    // Khởi tạo kết quả ban đầu
    quantityInputs.forEach((input, index) => {
        updateResult(index);
    });
    
    
</script>
    
    
   <div id="fixed-div" class="chonall" style="width: 1200px;height: 100px;background-color: #fff ;z-index: 100">
  <div  class="thanhtoan">
  <input  type="checkbox" class="selectAll" id="selectAll" style="width: 18px;height: 18px;margin-left: 45px;">
  <label style="font-weight: 100;margin-left: 10px;font-size: 19px;" for="myCheckbox">Chọn tất cả sản phẩm</label>
  <p style="margin-left: 500px;font-size: 20px;" class="total">Tổng tiền: <span id="total-value">0</span>đ</p>
  <div style="display: flex;margin-left: 45px;">
      <form action="thanhToan">
   <input type="submit" class="xemthem navbar-brand" style='text-decoration: none;margin-left: 10px;margin-top: -11px;font-size:19px;border: 0px' value="Thanh toán"> 
   <input type="hidden" name="chon" id="selectedInput" value="">
      </form>    
</div>
</div>
</div>
<div  style="height: 180px;"></div>

    





<script>
       
        const checkboxes = document.querySelectorAll('.myCheckbox');
        const selectedInput = document.getElementById('selectedInput');
        const selectAllCheckbox = document.getElementById('selectAll');
        let selectedValueString = '';

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                updateSelectedValues(checkbox);
            });
        });

        selectAllCheckbox.addEventListener('change', function () {
            checkboxes.forEach(checkbox => {
                checkbox.checked = selectAllCheckbox.checked;
                updateSelectedValues(checkbox);
            });
        });

        function updateSelectedValues(checkbox) {
            const value = checkbox.value;

            if (checkbox.checked) {
                selectedValueString += value + ', ';
            } else {
                selectedValueString = selectedValueString.replace(value + ', ', '');
            }

            selectedInput.value = selectedValueString.slice(0, -2); // Cập nhật giá trị trong input
        }
    
    const quantities = document.querySelectorAll(".quantity");
    const totalValue = document.getElementById("total-value");

    function updateTotal() {
        
        let total = 0;
        checkboxes.forEach((checkbox, index) => {
            if (checkbox.checked) {
                const quantity = parseInt(quantities[index].value);
                const price = parseInt(prices[index].textContent);
                total += quantity * price;
            }
        });
       totalValue.innerHTML = total;
        
    }

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener("change", updateTotal);
    });

    quantities.forEach(quantityInput => {
        quantityInput.addEventListener("input", updateTotal);
    });
    // Lấy tất cả các checkbox có class "select-all"
var selectAllCheckboxes = document.querySelectorAll('.selectAll');

// Lấy tất cả các checkbox có class "other-checkbox"
var otherCheckboxes = document.querySelectorAll('.myCheckbox');

// Đặt sự kiện onchange cho mỗi checkbox có class "select-all"
selectAllCheckboxes.forEach(function(checkbox) {
    checkbox.addEventListener('change', function() {
        otherCheckboxes.forEach(function(otherCheckbox) {
            otherCheckbox.checked = checkbox.checked;
            updateTotal();
        });
    });
});
</script>
</body>
</html>
