<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script> <!-- Google captcha API -->
<link href="css/login.css" rel="stylesheet" type="text/css" />
<title>Quên mật khẩu</title>
</head>
<style>
    body {
        background: linear-gradient(to bottom right, #FFA500, #0074cc); /* Gradient từ cam đến xanh dương */
        margin: 0;
        height: 100vh;
        overflow: hidden;
    }

    .form-container {
        position: absolute;
        top: 45%;
        left: 50%;
        transform: translate(-50%, -50%);
        max-width: 400px;
        width: 100%;
        background: white; /* Màu nền của form */
        border-radius: 15px; /* Bo tròn góc form */
        padding: 20px; /* Khoảng cách giữa nội dung và viền form */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng cho form */
    }
    .form-signup {
        display: none;
    }
    .form-reset {
        display: block;
    }
    /* Thêm CSS để tạo bo tròn cho nút Retrieve */
    .btn-success {
        border-radius: 10px;
        background: linear-gradient(to right, #8A2BE2, #0000FF);
    }
</style>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
<div id="logreg-forms" class="form-container">
            <form class="form-signin" action="forgotPassword" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Quên mật khẩu</h1>
                <p class="text-success">${mess}</p>
                <p class="text-danger">${error}</p>
                <label for="username">Tài khoản</label>
                <input name="username" type="text" id="username" class="form-control" placeholder="Username" required="" autofocus=""><br>
                <label for="email">Email</label>
                <input name="email" type="text" id="email" class="form-control" placeholder="Email" required="" autofocus=""><br>
                
                <div class="g-recaptcha" data-sitekey="6Lc7qQsmAAAAAD4KHU04xef_E6OYf0cUQPpSlgwz" data-callback="verifyCaptcha"></div>
                <input type="hidden" name="captchaVerified" id="captchaVerified" value="false"><br>
                
                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Gửi yêu cầu</button> 
            </form>
</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
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
                        alert('Vui lòng xác thực CAPTCHA trước khi gửi yêu cầu.');
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