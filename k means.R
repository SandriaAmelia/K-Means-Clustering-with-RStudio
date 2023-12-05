# Data
data <- data.frame(
  nama = c('Agus', 'Arif', 'Iwan', 'Yasinta', 'Esti', 'Bayu', 'Beno', 'Ramadhan', 'Indah'),
  Tinggi_Badan = c(170, 180, 168, 160, 165, 172, 175, 168, 160),
  Berat_Badan = c(70, 75, 80, 60, 65, 80, 70, 60, 60)
)

# Inisialisasi centroid
centroids <- data.frame(
  Tinggi_Badan = c(172, 165),
  Berat_Badan = c(80, 65)
)

# Jumlah klaster yang diinginkan
k <- 2

# Menghitung jarak Euclidean antara setiap data dan centroid
distances <- matrix(NA, nrow = nrow(data), ncol = nrow(centroids))
for (i in 1:nrow(data)) {
  for (j in 1:nrow(centroids)) {
    distances[i, j] <- sqrt((data$Tinggi_Badan[i] - centroids$Tinggi_Badan[j])^2 + (data$Berat_Badan[i] - centroids$Berat_Badan[j])^2)
  }
}

# Mendapatkan label klaster untuk setiap data
labels <- apply(distances, 1, which.min)

# Menampilkan hasil klasterisasi dalam bentuk dataframe
result <- data.frame(data$nama, labels)
colnames(result) <- c("Nama", "Klaster")
result