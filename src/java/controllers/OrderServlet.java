package controllers;

import business.Cart;
import business.LineItem;
import business.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet", ""})
public class OrderServlet extends HttpServlet {

    // Danh sách data cứng để tìm kiếm sản phẩm dựa vào Code
    private List<Product> getInitialProducts() {
        List<Product> products = new ArrayList<>();
        products.add(new Product("86b", "86 (the band) - True Life Songs and Pictures", 14.95));
        products.add(new Product("pf1", "Paddlefoot - The first CD", 12.95));
        products.add(new Product("pf2", "Paddlefoot - The second CD", 14.95));
        products.add(new Product("jr1", "Joe Rut - Genuine Wood Grained Finish", 14.95));
        return products;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //1. Kiểm tra xem người dùng có bấm vào một album nào cụ thể chưa
        String productCode = request.getParameter("productCode");
        // 2. LOGIC LẬT TRANG: Nếu đã chọn album -> Hiện Form đăng ký (Trang 2)
        if (productCode != null) {
            // Gán nhãn bảo trang index.jsp hãy hiện Form Đăng ký lên đi
            request.setAttribute("manHinh", "show_register");

            // Lưu lại cái mã đĩa mà người dùng vừa chọn để tí nữa dùng ở trang tải nhạc
            request.setAttribute("selectedProductCode", productCode);
        } else{

        
        //Tạo 4 đối tượng của List of albums
        Product p1 = new Product("86", "86 (the band) - True Life Songs and Pictures", 14.95);
        Product p2 = new Product("paddle1", "Paddlefoot - The First CD", 12.95);
        Product p3 = new Product("paddle2", "Paddlefoot - The Second CD", 14.95);
        Product p4 = new Product("joerut", "Joe Rut - Genuine Wood Grained Finish", 14.95);

        // Tạo một danh sách trống để chứa các Product
        java.util.List<Product> listAlbum = new java.util.ArrayList<>();
        // Lần lượt bỏ 4 album vào giỏ
        listAlbum.add(p1);
        listAlbum.add(p2);
        listAlbum.add(p3);
        listAlbum.add(p4);
        
        
        // Đính kèm danh sách này vào request và đặt nhãn tên là "products"
        request.setAttribute("products", listAlbum);
        request.setAttribute("manHinh", "show_index");
         }
        // Chuyển tiếp toàn bộ dữ liệu này sang cho file index.jsp xử lý giao diện
        request.getRequestDispatcher("/index.jsp").forward(request, response);
        //request.getRequestDispatcher("/đường_dẫn_file.jsp").forward(request, response);

    /* 
        String action = request.getParameter("action");
        if (action == null) {
            action = "shop"; // Mặc định vào trang danh sách đĩa CD
        }

        if (action.equals("shop")) {
            request.setAttribute("products", getInitialProducts());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (action.equals("viewCart")) {
            // Hiển thị trực tiếp trang giỏ hàng
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }
    */
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Sử dụng HttpSession để lưu trạng thái giỏ hàng xuyên suốt các request
        HttpSession session = request.getSession();
        
        // Lấy giỏ hàng từ Session ra, nếu chưa có thì tạo mới tinh
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        String action = request.getParameter("action");
        String productCode = request.getParameter("productCode");

        // Trường hợp 1: Nhấn "Add To Cart" từ trang danh sách (không truyền action cụ thể)
        if (action == null) {
            Product selectedProduct = null;
            for (Product p : getInitialProducts()) {
                if (p.getCode().equals(productCode)) {
                    selectedProduct = p;
                    break;
                }
            }
            if (selectedProduct != null) {
                LineItem item = new LineItem(selectedProduct, 1);
                cart.addItem(item);
            }
        } 
        // Trường hợp 2: Nhấn nút "Update" số lượng trong giỏ hàng
        else if (action.equals("update")) {
            try {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cart.updateItem(productCode, quantity);
            } catch (NumberFormatException e) {
                // Nếu người dùng nhập chữ bậy bạ vào ô số lượng thì bỏ qua không update
            }
        } 
        // Trường hợp 3: Nhấn nút "Remove Item" để xóa món khỏi giỏ
        else if (action.equals("remove")) {
            cart.removeItem(productCode);
        }

        // Cập nhật lại giỏ hàng mới nhất vào Session trạng thái của máy chủ
        session.setAttribute("cart", cart);

        // 1. Tạo ra danh sách các bài hát mẫu của Album (Dữ liệu cứng để hiển thị)
        Product s1 = new Product("8601", "You Are a Star", 0.0);
        Product s2 = new Product("8602", "Don't Make No Difference", 0.0);
        Product s3 = new Product("8603", "True Life Songs", 0.0);    
        // 2. Gom tất cả bài hát này vào một cái giỏ mới đặt tên là listSongs
        List<Product> listSongs = new ArrayList<>();
        listSongs.add(s1);
        listSongs.add(s2);
        listSongs.add(s3);
        // 3. Đính kèm giỏ bài hát vào hệ thống, đặt trùng tên nhãn dán là "products"
        request.setAttribute("products", listSongs);

        // Chuyển tiếp giao diện sang hiển thị file trang giỏ hàng cart.jsp
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }
}
