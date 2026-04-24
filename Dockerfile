# Gunakan image Node.js versi 18 (atau sesuaikan dengan versi lokal lu)
FROM node:18-alpine

# Set working directory di dalam container
WORKDIR /app

# Salin file konfigurasi package dulu biar build-nya cepat (caching)
COPY package*.json ./

# Install semua dependencies
RUN npm install

# Salin seluruh kode lu (termasuk index.js) ke dalam container
COPY . .

# Beri tahu Docker bahwa aplikasi ini butuh port 3000
EXPOSE 3000

# Perintah untuk menjalankan server
CMD ["node", "index.js"]