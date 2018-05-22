# can't use alpine, because zipalign needs glibc
# 2 stage build could be used, but then we woudln't support any modifications to the java part via shell

FROM debian:stretch

RUN mkdir -p /app/ && apt-get update && apt-get install -y --no-install-recommends \
  ant make openjdk-8-jre-headless openjdk-8-jdk-headless python3 

COPY . /app/
WORKDIR /app/

RUN make java

VOLUME /app/apk/

ENTRYPOINT ["./docker_entrypoint.sh"]
