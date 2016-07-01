### a docker file example, a node image
FROM google/debian:wheezy
RUN apt-get update -y && apt-get install --no-install-recommends \
    -y -q curl python build-essential git ca-certificates
RUN mkdir /nodejs && curl http://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz \
    | tar xvzf - -C /nodejs --strip-components=1
ENV PATH $PATH:/nodejs/bin
# Define working directory.
WORKDIR /data
# Define default command.
EXPOSE 3000
CMD []
ENTRYPOINT ["/nodejs/bin/npm", "start"]

# FROM: 指定base image
# WORKDIR: 指定docker執行起來時候的預設目錄位置
# EXPOSE: 指定所有發布的port
# CMD: 指定Instance啟動後所要執行的指令
# ENTRYPOINT: 指令Instance啟動後,程式的進入點
# RUN: 指定build過程中所要執行的指令與安裝動作
# ENV: 指令啟動後的環境變數, 在build的時候,可以定義一些變數,讓後面指令在執行時候可以參考...
# ARG : ARG在build時候是可以從外部以--build-arg帶入的變數,讓build的動作可結合外部的指令給定一些建構時候所需的參數...

# build dockerfile
cd /path/to/dockerfile
docker build .

# build with tag
docker build -t="your-name/image-name" .
