FROM node:12.18-alpine
RUN apk update && \
  apk add git curl python pkgconfig gcc libx11-dev libxkbfile-dev libsecret-dev fakeroot rpm make g++ && \
  git clone https://github.com/microsoft/vscode.git
WORKDIR /vscode
ENV npm_config_arch=arm64
RUN yarn
RUN yarn run gulp vscode-linux-arm64-min && yarn run gulp vscode-linux-arm64-build-deb
CMD ["sh"]