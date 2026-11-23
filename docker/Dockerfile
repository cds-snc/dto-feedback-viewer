FROM eclipse-temurin:21.0.13.1_2-jre-alpine
# DocumentDB's TLS certificate is signed by the AWS RDS CA; add it to Java's default truststore,
# which keeps the public CAs that outbound HTTPS calls (e.g. RDAP) need.
RUN mkdir /tmp/rds && cd /tmp/rds \
    && wget -q -O bundle.pem https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem \
    && awk '/BEGIN CERTIFICATE/ {n++} {print > ("rds-ca-" n ".pem")}' bundle.pem \
    && for cert in rds-ca-*.pem; do \
        keytool -importcert -noprompt -cacerts -storepass changeit -alias "aws-$cert" -file "$cert"; \
    done \
    && cd / && rm -rf /tmp/rds
RUN mkdir -p /app
COPY target/PageSuccess-0.0.1-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
