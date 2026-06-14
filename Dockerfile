FROM node:20

# গ্রাফিক্স ও ক্যানভাসের জন্য প্রয়োজনীয় টুলস
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
# এখানে আমরা জোরপূর্বক canvas ইনস্টল করার নির্দেশ দিচ্ছি
RUN npm install && npm install canvas

COPY . .

CMD ["node", "index.js"]
