# base image
FROM quay.io/drsylent/cubix/block2/homework-base:java21

# argumentum az alkalmazás nevéhez (pl. frontapp vagy backapp)
ARG app_name
ENV CUBIX_HOMEWORK="tamasmarton"
ENV APP_DEFAULT_MESSAGE=""

# image label
LABEL cubix.homework.owner="tamasmarton"

# másoljuk be a buildelt JAR fájlt
COPY ${app_name}/target/*.jar /app/app.jar

# alkalmazás futtatása
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
