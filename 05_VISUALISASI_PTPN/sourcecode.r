# Rayhan Kurnia Yusda
library(ggplot2) # Untuk Visualisasi/Plot
data <- read.csv(file.choose(), header = TRUE)

# Tampilkan data
View(data)

# Cek Missing Value
summary(data)


# No 1_Bentuk bertumpuk
library(dplyr) # untuk manipulasi data
library(scales) # menambahkan label untuk setiap segmen
# membuat ringkasan dataset (manipulasi data)
plotdata <- data %>%
    group_by(GenderID, RoleID) %>%
    dplyr::summarize(n = n()) %>%
    mutate(
        pct = n / sum(n),
        lbl = scales::percent(pct)
    )
ggplot(
    plotdata,
    aes(
        x = factor(GenderID), # mengatur urutan kategori untuk kelas variabel
        y = pct,
        fill = factor(RoleID)
    )
) +
    geom_bar(
        stat = "identity",
        position = "fill"
    ) +
    scale_y_continuous(
        breaks = seq(0, 1, .2),
        label = percent
    ) +
    geom_text(aes(label = lbl),
        size = 3,
        position = position_stack(vjust = 0.5)
    ) +
    # scale_fill_brewer(palette = "Set1") + # mengubah skema warna isian
    theme_minimal() + # menghapus latar belakang abu-abu dan mengubah warna kisi
    labs(
        y = "Percent",
        fill = "Profile",
        x = "Gender",
        title = "Persebaran Gender Terhadap Profile/Bidang"
    ) +
    theme(axis.text.x = element_text(angle = 360))

# No 1 Bentuk_2
ggplot(data, aes(x = GenderID, fill = RoleID)) +
    theme_minimal() + # Menggunakan Tema Minimal(Untuk mengha)
    geom_bar(position = position_dodge(preserve = "single")) +
    labs(
        y = "Jumlah",
        fill = "Profile/Pekerjaan",
        x = "Gender",
        title = "Persebaran Gender Terhadap Profile/Bidang di PTPN VI"
    )

# Perfromance Kehadiran PTPN
ggplot(data, aes(x = Absences, fill = RoleID)) +
    theme_minimal() + # Menggunakan Tema Minimal(Untuk mengha)
    geom_bar(position = position_dodge(preserve = "single")) +
    labs(
        y = "Jumlah Orang",
        fill = "Profile/Pekerjaan",
        x = "Jumlah Absen",
        title = "Persebaran Performance Absen  di PTPN VI"
    )