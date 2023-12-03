<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
        <meta charset="UTF-8">
        <title>Đặt hàng</title>
    </head>
    <style>
        body {
            background: linear-gradient(to bottom, #007BFF, #6F42C1); /* Chọn màu xanh dương (#007BFF) và màu tím (#6F42C1) tương ứng */
            background-attachment: fixed; /* Giữ màu nền cố định khi cuộn trang */
        }
        #logreg-forms {
            position: absolute;
            top: 47%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 400px; /* Điều chỉnh độ rộng tối đa của form */
            width: 100%;
            border-radius: 20px; /* Bo tròn góc của form */
    }
    </style>
    <body>
    	<jsp:include page="Menu.jsp"></jsp:include>
        <div id="logreg-forms">
            <form class="form-signin" action="order" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đặt hàng</h1>
                <c:if test="${error!=null }">
                    <div class="alert alert-danger" role="alert">${error}</div>
		</c:if>
		<c:if test="${mess!=null }">
                    <div class="alert alert-success" role="alert">${mess}</div>
		</c:if>
                <label for="name">Họ tên</label>
                <input name="name" type="text" id="name" class="form-control" placeholder="Name" required="" autofocus="">
                <label for="phoneNumber">Số điện thoại</label>
                <input name="phoneNumber" type="text" id="phoneNumber" class="form-control" placeholder="Phone number" required="" autofocus="">
                <label for="email">Email</label>
                <input name="email" type="text" id="email" class="form-control" placeholder="email" required="" autofocus="">
                <label for="deliveryAddress">Địa chỉ giao hàng</label>
                <input name="deliveryAddress" type="text" id="deliveryAddress" class="form-control" placeholder="Delivery Address" required="" autofocus=""><br>
                
                <div class="g-recaptcha" data-sitekey="6Lc7qQsmAAAAAD4KHU04xef_E6OYf0cUQPpSlgwz" data-callback="verifyCaptcha"></div>
                <input type="hidden" name="captchaVerified" id="captchaVerified" value="false">
                
                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-american-sign-language-interpreting"></i>Đặt hàng</button>               
            </form>           
            <br>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle()
                $('#logreg-forms .form-reset').toggle()
            }
            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle();
                $('#logreg-forms .form-signup').toggle(); 
            }
            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
            
            window.addEventListener("load",function loadAmountCart(){
                        	 $.ajax({
                                 url: "/QuanLyNhacCu/loadAllAmountCart",
                                 type: "get",
                                 data: {                                    
                                 },
                                 success: function (responseData) {
                                     document.getElementById("amountCart").innerHTML = responseData;
                                 }
                             });
                        },false);         
        </script>
        <script>
            $(document).ready(function () {
                $('form.form-signin').submit(function (event) {
                    var isCaptchaVerified = $('#captchaVerified').val();
                    if (isCaptchaVerified !== 'true') {
                        alert('Vui lòng xác thực CAPTCHA trước khi đặt hàng.');
                        event.preventDefault(); // Ngăn chặn gửi form nếu CAPTCHA chưa được xác thực
                    }
                });

                // Hàm gọi khi CAPTCHA được xác thực thành công
                window.verifyCaptcha = function () {
                    $('#captchaVerified').val('true');
                };
            });
        </script>
    </body>
</html>