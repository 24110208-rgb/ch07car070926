# Sử dụng máy chủ Tomcat 10 bản chuẩn hóa quốc tế phù hợp Render
FROM tomcat:10-jdk17

# Dọn dẹp sạch sẽ các thư mục mặc định trên máy chủ đám mây
RUN rm -rf /usr/local/tomcat/webapps/*

# Bốc trực tiếp file .war đã biên dịch sẵn của Hân bỏ vào làm trang chủ ROOT
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng mạng cấp link công khai
EXPOSE 8080
CMD ["catalina.sh", "run"]
