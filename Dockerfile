# Sử dụng máy chủ Tomcat 10 bản chuẩn hóa quốc tế phù hợp Render
FROM tomcat:10-jdk17

# Dọn dẹp sạch sẽ các thư mục mặc định trên máy chủ đám mây
RUN rm -rf /usr/local/tomcat/webapps/*

# Bốc trực tiếp thư mục web đã biên dịch thành công của Hân làm trang chủ ROOT
COPY build/web /usr/local/tomcat/webapps/ROOT

EXPOSE 8080
CMD ["catalina.sh", "run"]
