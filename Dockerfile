# Bước 1: Dùng máy chủ có sẵn Maven và Java để tự biên dịch code trên mạng
FROM maven:3.8.4-openjdk-17 AS build
COPY . /app
WORKDIR /app
# Ra lệnh cho Render tự chạy Clean and Build thành file .war công khai
RUN mvn clean package

# Bước 2: Sử dụng máy chủ Tomcat 10 chạy gói Jakarta phù hợp Render
FROM tomcat:10.1-jdk17-slim
RUN rm -rf /usr/local/tomcat/webapps/*
# Bốc trực tiếp file war vừa tự biên dịch xong ở trên bỏ vào làm trang chủ ROOT
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
