FROM node:18-alpine
# 在容器内创建工作目录
WORKDIR /lego-backend
# 下载依赖
COPY package.json package-lock.json /lego-backend
# RUN npm i
# 使用淘宝的 npm 镜像并增加超时时间，然后安装依赖
RUN npm config set registry https://registry.npmmirror.com \
    && npm config set fetch-timeout 60000 \
    && npm install
# 构建项目
COPY . /lego-backend
RUN npm run build
EXPOSE 3302
CMD npm run start:prod