FROM ubuntu

# 设置固定的项目路径
ENV WORKDIR /chat
ENV CMDDIR $WORKDIR/scripts

ENV CONFIG_NAME $WORKDIR/config/config.yaml

# 将二进制文件复制到目标目录
COPY ./_output/bin/platforms/linux/amd64/ $WORKDIR/bin/linux-amd64/
COPY ./_output/bin/platforms/linux/arm64/ $WORKDIR/bin/linux-arm64/
COPY ./scripts $WORKDIR/scripts
COPY ./config/config.yaml $WORKDIR/config/config.yaml

# 创建用于挂载的几个目录，添加可执行权限
RUN mkdir $WORKDIR/logs && \
    chmod +x $WORKDIR/bin/linux-amd64/* $WORKDIR/bin/linux-arm64/*

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates curl

VOLUME ["/chat/bin","/chat/logs","/chat/config","/chat/scripts"]

WORKDIR $CMDDIR
CMD ["./docker_start_all.sh"]

