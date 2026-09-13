<%-- 
    Document   : cart
    Created on : Sep 7, 2026, 10:19:18 AM
    Author     : LAPTOP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, business.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>The Downloads Page</title>
        <style>
            table { border-collapse: collapse; width: 40%; }
            th, td { border: 1px solid black; padding: 6px; text-align: left; }
        </style>
    </head>
    <body>

        <h2>Downloads</h2>
        <h3>86 (the band) - True Life Songs and Pictures</h3>

        <table>
            <thead>
                <tr>
                    <th>Song title</th>
                    <th>Audio Format</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Product> danhSachBaiHat = (List<Product>) request.getAttribute("products");
                    if (danhSachBaiHat != null) {
                        for (Product song : danhSachBaiHat) {
                %>
                            <tr>
                                <td><%= song.getDescription() %></td>
                                <td><a href="#" style="color: purple;">MP3</a></td>
                            </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>    
    
    
    <%--
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Murach's Java Servlets and JSP</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 30px; }
            h2 { color: #007f5f; font-weight: bold; }
            table { width: 100%; border-collapse: collapse; margin-top: 15px; }
            th, td { border: 1px solid #000; padding: 10px; text-align: left; vertical-align: middle; }
            th { background-color: #fff; font-weight: bold; }
            .qty-input { width: 30px; text-align: center; padding: 2px; }
            .btn-small { padding: 3px 8px; cursor: pointer; margin-left: 5px; }
            .note-text { margin-top: 15px; font-weight: bold; font-size: 14px; }
            .btn-action { padding: 6px 15px; margin-top: 10px; cursor: pointer; display: block; width: 150px; text-align: center; }
        </style>
    </head>
    <body>
        <h2>Your cart</h2>
        
        <table>
            <thead>
                <tr>
                    <th style="width: 15%;">Quantity</th>
                    <th>Description</th>
                    <th style="width: 10%;">Price</th>
                    <th style="width: 10%;">Amount</th>
                    <th style="width: 15%;"></th>
                </tr>
            </thead>
            <tbody>
                <%
                    business.Cart cart = (business.Cart) session.getAttribute("cart");
                    if (cart != null && !cart.getItems().isEmpty()) {
                        for (business.LineItem item : cart.getItems()) {
                %>
                    <tr>
                        <!-- Form cập nhật số lượng -->
                        <td>
                            <form action="cart" method="post" style="margin: 0; display: inline-block;">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
                                <input type="text" name="quantity" value="<%= item.getQuantity() %>" class="qty-input">
                                <input type="submit" value="Update" class="btn-small">
                            </form>
                        </td>
                        <td><%= item.getProduct().getDescription() %></td>
                        <td><%= item.getProduct().getPriceCurrency() %></td>
                        <td><%= item.getTotalCurrency() %></td>
                        <!-- Form xóa sản phẩm -->
                        <td style="text-align: center;">
                            <form action="cart" method="post" style="margin: 0;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
                                <input type="submit" value="Remove Item" class="btn-small">
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="5" style="text-align: center; padding: 20px;">Giỏ hàng trống!</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
        <p class="note-text">To change the quantity, enter the new quantity and click on the Update button.</p>
        
        <!-- Nút quay lại trang danh sách mua sắm -->
        <form action="cart" method="get" style="display: inline-block;">
            <input type="hidden" name="action" value="shop">
            <input type="submit" value="Continue Shopping" class="btn-action">
        </form>
        
        <!-- Nút thanh toán -->
        <input type="submit" value="Checkout" class="btn-action" style="margin-top: 5px;">
    </body>
    --%>
</html>
