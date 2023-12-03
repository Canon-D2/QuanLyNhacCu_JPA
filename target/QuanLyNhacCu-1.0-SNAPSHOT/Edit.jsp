<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Trang chỉnh sửa</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">   
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>

        <div class="container">
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="formEditProduct" name ="formEditProduct" action="edit" method="post">
                            <div class="modal-header">						
                                <h1 class="modal-title">CHỈNH SỬA SẢN PHẨM</h1>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <input value="${detail.id}" name="id" type="hidden" class="form-control" readonly required>
                                </div> 
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <input value="${detail.name}" name="name" type="text" class="form-control" required>
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
                                    <input value="${detail.price}" name="price" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Tiêu đề</label>
                                    <textarea name="title" class="form-control" required>${detail.title}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Mẫu mã</label>
                                    <textarea name="model" class="form-control" required>${detail.model}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Màu sắc</label>
                                    <textarea name="color" class="form-control" required>${detail.color}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Phân phối</label>
                                    <textarea name="delivery" class="form-control" required>${detail.delivery}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <textarea name="description" class="form-control" >${detail.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Thể loại</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCC}" var="o">
                                            <option value="${o.cid}">${o.cname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <input href="QuanLySanPham" type="submit" class="btn btn-danger" value="Hủy bỏ">
                                <input type="button" id="submitFormProduct" class="btn btn-success" value="Chỉnh sửa">
                            </div>
                        </form>
                    </div>
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
                        alert("Upload file fail: " + error);
                    }

                });
            });
        </script>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>