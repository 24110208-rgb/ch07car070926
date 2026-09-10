/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.io.Serializable;

public class LineItem implements Serializable {
    private Product product;
    private int quantity;

    public LineItem() {}

    public LineItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    // Tính tổng tiền của riêng dòng này (Số lượng x Đơn giá)
    public double getTotal() {
        return product.getPrice() * quantity;
    }

    // Định dạng tiền tệ hiển thị cho cột Amount
    public String getTotalCurrency() {
        return String.format("$%.2f", this.getTotal());
    }
}
