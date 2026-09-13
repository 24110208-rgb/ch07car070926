# Bước 1: Dùng máy chủ có sẵn Maven và Java để tự biên dịch code trên mạng
FROM maven:3.8.4-openjdk-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package

# Bước 2: Sử dụng máy chủ Tomcat 10 bản chuẩn hóa quốc tế
FROM tomcat:10-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
