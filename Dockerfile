FROM node:10.16-stretch-slim

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
RUN apt update
RUN apt install -y libvips-dev
RUN yarn install

WORKDIR /var/www

COPY package.json /var/www/package.json
COPY yarn.lock /var/www/yarn.lock
COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]

CMD ["yarn", "build"]
