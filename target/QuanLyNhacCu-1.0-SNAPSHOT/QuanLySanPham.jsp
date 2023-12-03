<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">    
<title>Quản lý sản phẩm</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/> 
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">     
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
<link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
<link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/> 
<link href="css/manager.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/QuanLySanPham.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css">
<link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css">
</head>
<style>
        body 
        {
            background: linear-gradient(to right, #3498db, #f1c40f, #e74c3c);
        }
        .btn-export {
            background: linear-gradient(to right, #00ff00, #ff0000);
            margin-top: 30px;
            color: #fff; /* Màu chữ là màu trắng */
            border: none; /* Loại bỏ viền nút */
            padding: 10px 20px; /* Điều chỉnh padding theo ý muốn */
            border-radius: 5px; /* Bo tròn góc của nút */
            cursor: pointer; /* Biến con trỏ thành dấu nhấn khi di chuột vào nút */
        }
        .btn-export:hover {
            /* Hiệu ứng khi di chuột vào nút */
            filter: brightness(1.2); /* Tăng độ sáng */
        }
</style>
    <body>
        <header>
            <jsp:include page="LeftAdmin.jsp"></jsp:include>
            </header>
            <main>
                <div class="container pt-4">
                    <section class="mb-4">
                        <div class="card">
                            <div class="card-header py-3 row">
                                <div class="col-sm-3">
                                    <h1 class="mb-0 text-left" id="">
                                        <strong>Quản lý sản phẩm</strong>
                                    </h1>
                                </div>
                                <div class="col-sm-9 text-right">
                                    <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i></a>
                                </div>
                            </div>

                        <c:if test="${error!=null }">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        <c:if test="${mess!=null }">
                            <div class="alert alert-success" role="alert">
                                ${mess}
                            </div>
                        </c:if>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listP}" var="o">
                                            <tr>
                                                <td>${o.id}</td>
                                                <td>${o.name}</td>
                                                <td>
                                                    <img src="${o.image}">
                                                </td>
                                                <td>${o.price} $</td>
                                                <td>
                                                    <a href="loadProduct?pid=${o.id}"><button type="button" class="btn btn-warning"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button></a>
                                                    <c:if test = "${o.tinhTrang == 1}">
                                                        <a href="delete?pid=${o.id}&tinhTrang=1"><button type="button" class="btn btn-danger"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button></a>
                                                    </c:if>
                                                    <c:if test ="${o.tinhTrang != 1}">
                                                        <a href="delete?pid=${o.id}&tinhTrang=0"><button type="button" class="btn btn-warning">Khôi Phục</button></a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <form action="xuatExcelProductControl" method="get"> 
                                    <button type="submit" class="mb-0 text-center btn btn-primary btn-export">Xuất file Excel</button> 
                                </form> 

                                <div class="clearfix">
                                    <ul class="pagination">
                                        <c:if test="${tag != 1}">
                                            <li class="page-item"><a href="manager?index=${tag-1 }">Previous</a></li>
                                            </c:if> 	
                                            <c:forEach begin="1" end="${endPage }" var="i">
                                            <li class="${tag==i?"page-item active":"" }"><a href="manager?index=${i }" class="page-link">${i }</a></li>  
                                            </c:forEach>
                                            <c:if test="${tag != endPage}">
                                            <li class="page-item"><a href="manager?index=${tag+1 }" class="page-link">Next</a></li>
                                            </c:if> 	
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

        </main>

        <!-- THÊM SẢN PHẨM -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formEditProduct" action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm sản phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình thứ 1</label>
                                <input id="img" name="image" type="file" class="form-control" >
                                <input id="Nameimg" name="Nameimg" value="" type="hidden">

                            </div>
                            <div class="form-group">
                                <label>Hình thứ 2</label>
                                <input id="img2" name="image2" type="file" class="form-control" >
                                <input id="Nameimg2" name="Nameimg2" value="" type="hidden">
                            </div>
                            <div class="form-group">
                                <label>Hình thứ 3</label>
                                <input id="img3" name="image3" type="file" class="form-control" >
                                <input id="Nameimg3" name="Nameimg3" value="" type="hidden">
                            </div>
                            <div class="form-group">
                                <label>Hình thứ 4</label>
                                <input id="img4" name="image4" type="file" class="form-control" >
                                <input id="Nameimg4" name="Nameimg4" value="" type="hidden">
                            </div>
                            <div class="form-group">
                                <label>Mức giá</label>
                                <input name="price" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Tiêu đề</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Mẫu mã</label>
                                <input name="model" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Màu sắc</label>
                                <input name="color" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Phân phối</label>
                                <input name="delivery" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea name="description" class="form-control" ></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">  
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                            <input type="button" id="submitFormProduct" class="btn btn-success" value="Thêm sản phẩm">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script>
            <c:url var="UrlUploadImg" value="/UploadFile" />
            <c:url var="urlSaveProduct" value="/add" />
            $("#submitFormProduct").click(function () {
                var formData = new FormData();
                formData.append('fileQuantity', 4);
                formData.append('file1', $("#img")[0].files[0]);
                formData.append('file2', $("#img2")[0].files[0]);
                formData.append('file3', $("#img3")[0].files[0]);
                formData.append('file4', $("#img4")[0].files[0]);
                $.ajax({
                    url: '${UrlUploadImg}',
                    type: 'POST',
                    contentType: false,
                    processData: false,
                    data: formData,
                    success: function (result) {
                        $("#formEditProduct").submit();
                    },
                    error: function (error) {
                        alert("Upload file fail: "+error);
                    }
                });
            });
        </script>

        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
    <style>
        /* Tô đậm các chữ form thêm sp */
        label {
        font-weight: bold;
            font-size:20px;
        }
    </style>
</html>