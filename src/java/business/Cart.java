/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.io.Serializable;
import java.util.ArrayList; // Thư viện để làm danh sách ArrayList
import java.util.List;      // Thư viện để khai báo biến kiểu List (Dòng này sửa lỗi gạch đỏ của bạn)

public class Cart implements Serializable {
    private List<LineItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<LineItem> getItems() { return items; }

    // Hàm thêm sản phẩm vào giỏ hàng (Có check trùng để cộng dồn số lượng)
    public void addItem(LineItem item) {
        String code = item.getProduct().getCode();
        int quantity = item.getQuantity();
        
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getCode().equals(code)) {
                lineItem.setQuantity(lineItem.getQuantity() + quantity);
                return;
            }
        }
        items.add(item);
    }

    // Hàm xóa sản phẩm khỏi giỏ hàng
    public void removeItem(String productCode) {
        items.removeIf(item -> item.getProduct().getCode().equals(productCode));
    }
    
    // Hàm cập nhật số lượng mới khi nhấn nút Update
    public void updateItem(String productCode, int quantity) {
        for (LineItem item : items) {
            if (item.getProduct().getCode().equals(productCode)) {
                if (quantity <= 0) {
                    items.remove(item);
                } else {
                    item.setQuantity(quantity);
                }
                return;
            }
        }
    }
}
