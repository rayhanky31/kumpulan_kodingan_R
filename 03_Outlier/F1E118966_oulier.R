# Rayhan Kurnia Yusda
# F1E119066

# Library
library(gridExtra)
# Input Data
data <- read.csv(file.choose(), header = TRUE)
View(data)

# Cek missing Value
is.na(data)
summary(data)

# Yang diambil hanya data laki-laki
dtlaki <- data$Male.Height.in.Cm
dtlaki
summary(dtlaki)

# Pengecekan/mencari data outlier menggunakan Metode mean dan Standard deviasi (SD)
# Mendapatkan median
med <- median(dtlaki)
# kurangi median dari setiap nilai dtlaki dan dapatkan deviasi absolut
abs_dev <- abs(dtlaki - med)
# Mendapatkan MAD
mad <- 1.4826 * median(abs_dev)

# dapatkan nilai ambang batas untuk outlier
Tmin <- med - (3 * mad)
Tmax <- med + (3 * mad)

# Mencari outlier
dtlaki[which(dtlaki < Tmin | dtlaki > Tmax)]


# # Hapus outlier
# x[which(dtlaki > Tmin & x < Tmax)]


# Visualisasi histogram, Q-Q plot, and boxplot
par(mfrow = c(1, 1))
hist(dtlaki, main = "Histogram")
boxplot(dtlaki, main = "Boxplot")
qqnorm(dtlaki, main = "Normal Q-Q plot")