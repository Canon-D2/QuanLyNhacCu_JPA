ĐỒ ÁN GIỮA KÌ CHUYÊN ĐỀ J2EE - PHIÊN BẢN JPA HIBERNATE

CHỦ ĐỀ: WEBSITE THƯƠNG MẠI NHẠC CỤ SGU-Music (Java Servlet + 3-Layer)

GIAO DIỆN GRADIENT FIGMA:
https://www.figma.com/file/6eXutbsNqT9VYfOywzks9q/Web-Design-%7C-Website-Design-%7C-Software-House-Website-%7C-Software-Company-Website-(Community)?type=design&node-id=1-377&mode=design&t=eQNPrP2jdoGJegXc-0

YÊU CẦU MÁY TÍNH PHẢI CÀI ĐẶT:

+ XAMPP (Có sẵn MYSQL, TOMCAT)
+ NETBEAN IDE 19
+ JDK 1.8
+ TOMCAT v9.0


HƯỚNG DẪN CHẠY CHƯƠNG TRÌNH:


+ Thêm JDK 1.8 vào biến môi trường trên Windows
+ Thêm server TOMCAT từ thư mục XAMPP (tài khoản: admin, mật khẩu: admin)
+ Tạo database tên "quanlynhaccu_jpa" trong phpMyAdmin trong Xampp
+ Thêm Project vào Netbean và thiết lập chúng chạy bằng JDK1.8 VÀ JAVA EE 7 Web
+ Clean & Built rồi sau đó Run Project (mặc định sẽ báo lỗi)
+ Trong Xampp, hãy Import file SQL sending vào database "quanlynhaccu_jpa"
+ Trong Table Cart -> Structure --> maCart --> Change --> tích vào ô "AI" khi đó sẽ xuất hiện AUTO_INCREMENT
+ Sau đó Run chương trình một lần nữa và sẽ thành công

Lưu ý: các bảng trong database sẽ được tạo tự động sau khi Run Project lần đầu, ta chỉ việc thêm dữ liệu từ file Sending.

TỔNG QUAN USER:

+ Đăng nhập, đăng ký, phân quyền
+ Xem sản phẩm, chi tiết sản phẩm, đánh giá từng sản phẩm
+ Cho sản phẩm vào giỏ hàng, thanh toán
+ Xem danh sách, chi tiết từng sản phẩm trong hóa đơn đã mua
+ Gửi mail xác nhận đặt hàng thành công + mail cấp lại mật khẩu
+ Xử lý bất đồng bộ khi tìm kiếm theo màu sắc, tên,...
+ Tích hợp API ChatGPT 3.5 làm trang liên hệ CSKH
+ Nhắn tin nội bộ Admin bằng WebSocket (Local)
+ Đọc báo trực tuyến RSS từ VN Express
+ Xác thực reCapche cho trang Login, Order, ForgotPassword

TỔNG QUAN ADMIN:

+ Trang tổng quan
+ CRUD tài khoản, sản phẩm, hóa đơn,...
+ Thống kê theo biểu đồ cột, tròn
+ Xuất file dữ liệu ra Excel
+ Xác nhận đã xử lý cho từng hóa đơn
+ Top 10 sản phẩm bán chạy, top 5 nhân viên xuất sắc, top 10 khách hàng tiềm năng

LƯU Ý:

+ Get API ChatGPT mới vào Contact.html 
+ Mật khẩu Email 2 lớp vào ForgotPassword.java, OrderControl.java
+ Project có thể không tương thích Eclipse hoặc IntelliJ IDEA
+ Phiên bản JDK và Tomcat cũ hoặc mới quá có thể dẫn đến lỗi mvn
