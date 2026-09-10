
# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template
# Bước 1: Sử dụng hình ảnh Tomcat chính thức làm môi trường chạy
FROM tomcat:9.0-jdk11-openjdk-slim

# Bước 2: Xóa các ứng dụng mặc định không cần thiết của Tomcat để tránh xung đột
RUN rm -rf /usr/local/tomcat/webapps/*

# Bước 3: Copy file .war từ thư mục dist trong máy bạn vào thư mục webapps của Tomcat
# Nó sẽ tự động giải nén và chạy ứng dụng tại đường dẫn /ch07car070926
COPY dist/ch07car070926.war /usr/local/tomcat/webapps/ch07car070926.war

# Bước 4: Mở cổng 8080 để máy tính có thể truy cập vào môi trường Docker
EXPOSE 8080

# Bước 5: Lệnh kích hoạt Tomcat Server khi khởi động container
CMD ["catalina.sh", "run"]
