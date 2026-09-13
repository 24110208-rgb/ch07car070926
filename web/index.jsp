<%-- 
    Document   : index
    Created on : Sep 7, 2026, 9:43:11 AM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, business.Product"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Murach's Java Servlets and JSP</title>
        <style>
            body { 
                font-family: Arial, sans-serif; 
                margin: 30px; 
            }
            h2 { 
                color: #007f5f; 
                font-weight: bold;
                margin-bottom: 20px;
            }
            table { 
                width: 100%; 
                border-collapse: collapse; 
                margin-top: 15px; 
            }
            th, td { 
                border: 1px solid #000; 
                padding: 10px; 
                text-align: left; 
            }
            th { 
                background-color: #fff; 
                font-weight: bold; 
            }
            .price-col { 
                text-align: right; 
                width: 12%; 
            }
            .action-col { 
                text-align: center; 
                width: 15%; 
            }
            input[type="submit"] { 
                padding: 4px 10px; 
                cursor: pointer; 
                background-color: #f0f0f0;
                border: 1px solid #a0a0a0;
                border-radius: 2px;
            }
            input[type="submit"]:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>
    <body>
        <%
            // 1. Kiểm tra xem Servlet đang yêu cầu hiển thị màn hình nào
            String manHinh = (String) request.getAttribute("manHinh");

            // 2. Nếu là màn hình đăng ký (Trang 2) thì chỉ hiện Form đăng ký
            if ("show_register".equals(manHinh)) {
        %>        
        <h2>Download registration</h2>
        <p>To register for our downloads, enter your name and email address below. Then, click on the Submit button.</p>

        <form action="OrderServlet" method="post">
            <label>Email:</label>
            <input type="email" name="email" required />
            <br/><br/>

            <label>First Name:</label>
            <input type="text" name="firstName" required />
            <br/><br/>

            <label>Last Name:</label>
            <input type="text" name="lastName" required />
            <br/><br/>

            <input type="submit" value="Register" />
        </form>  
        
        <%
        // 3. Ngược lại, mặc định ban đầu vào sẽ hiện Danh sách Album (Trang 1)
        } else {
         %>
        <h2>List of albums</h2>
        <%
            java.util.List<business.Product> danhSachCuaToi = (java.util.List<business.Product>) request.getAttribute("products");

            if (danhSachCuaToi != null) {
                for (business.Product album : danhSachCuaToi) {
        %>
                    <a href="OrderServlet?productCode=<%= album.getCode() %>"><%= album.getDescription() %></a>
                    <br/>
        <%
                }
            }
        %>
        <%
            }
        %>
    
    <%--  
        <h2>CD list</h2>
        
        <table>
            <thead>
                <tr>
                    <th>Description</th>
                    <th style="text-align: right; width: 12%;">Price</th>
                    <th style="width: 15%;"></th>
                </tr>
            </thead>
            <tbody>
                <%
                    java.util.List<business.Product> products = (java.util.List<business.Product>) request.getAttribute("products");
                    if (products != null) {
                        for (business.Product product : products) {
                %>
                    <tr>
                        <td><%= product.getDescription() %></td>
                        <td class="price-col"><%= product.getPriceCurrency() %></td>
                        <td class="action-col">
                            <form action="cart" method="post">
                                <input type="hidden" name="productCode" value="<%= product.getCode() %>">
                                <input type="submit" value="Add To Cart">
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    --%>

    </body>
</html>
