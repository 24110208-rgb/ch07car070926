# 1. Sử dụng hệ điều hành siêu nhẹ chứa sẵn Tomcat 10 chạy gói Jakarta phù hợp Render
FROM tomcat:10.1-jdk17-slim

# 2. Dọn dẹp các thư mục trang web mặc định của Tomcat để tránh bị kẹt lỗi
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Bốc toàn bộ thư mục web đã biên dịch thành công của Hân bỏ vào máy chủ Render
COPY build/web /usr/local/tomcat/webapps/ROOT

# 4. Mở cổng mạng Port 8080 để Render có thể cấp đường link công khai
EXPOSE 8080
CMD ["catalina.sh", "run"]
