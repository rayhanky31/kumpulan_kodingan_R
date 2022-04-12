# Rayhan Kurnia Yusda
# F1E119066

# 1.Pengurutan Data
# Input Data
data <- read.csv(file.choose(), header = TRUE)
View(data) # View data
summary(data) # Ringkasan data
str(data) # Liat struktur data

# Mengurutkan baris data yang laki-laki saja
order(data$Laki.laki)

# Menampilkan data nilai APM SMU laki-laki saja
data_urut <- data[order(data$Laki.laki), ]
View(data_urut)


# Rayhan Kurnia Yusda
# F1E119066

# 2.Menghapus Data Yang Sama
# Input Data
data <- read.csv(file.choose(), header = TRUE)
View(data) # View data
summary(data) # Ringkasan data
str(data) # Liat struktur data


# (!duplicated) akan mencari data yang sama, Data yang tersimpan adalah data yang pertama
data_tidak_sama <- data[!duplicated(data$Laki.laki), ]

# Menampilkan Hasil Setelah menghapus duplicate
View(data_tidak_sama)


# Rayhan Kurnia Yusda
# F1E119066

# 3.Mencari Dan Mengganti Data
# Input Data
data <- read.csv(file.choose(), header = TRUE)
View(data) # View data
summary(data) # Ringkasan data
str(data) # Liat struktur data

# JalanKan Library(car)
library(car)

# Akan mengganti R,A,Y = 0
ganti_apm_laki <- recode(data$Laki.laki, '"R" = ""; "A"=0; "Y"=0')
ganti_apm_laki

# Menampilkan Hasil Setelah Mengganti Data
# Membuat data frame dengan skor pengganti (bernilai 0)
data2 <- data.frame(data$Tahun, ganti_apm_laki, data$Perempuan)
View(data2)


# Rayhan Kurnia Yusda
# F1E119066

# 4.Membersihkan Data Non Numerik
# Input Data
data <- read.csv(file.choose(), header = TRUE)
View(data) # View data
summary(data) # Ringkasan data
str(data) # Liat struktur data

# Mencoba rata-rata pada data  APM SMU laki-laki yang ada non-numeric
mean(data$Laki.laki)

# Remove dan rm dapat digunakan untuk menghapus obyek
mean_data_laki <- function(..., na.rm = TRUE) mean(..., na.rm = TRUE)
mean_data_laki(data$Laki.laki)