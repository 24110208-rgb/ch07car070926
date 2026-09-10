<%-- 
    Document   : index
    Created on : Sep 7, 2026, 9:43:11 AM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </body>
</html>
