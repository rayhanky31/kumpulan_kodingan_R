#1. Grafik garis
#Libarary ggplot2 -> Untuk visualisasi plot
library(ggplot2)
#Input data csv
datasmu=read.csv(file.choose(), header = TRUE)
#view data
View(datasmu)
#Pembuatan Visualisasi
ggplot()+
  #Pembuatan line data laki-laki
  geom_line(data=datasmu,mapping = aes(datasmu$Tahun,datasmu$Laki.laki,color="Laki-Laki",group=1))+
  #Pembuatan point data laki-laki
  geom_point(data=datasmu,mapping = aes(datasmu$Tahun,datasmu$Laki.laki,color="Laki-Laki"))+
  #Pembuatan line data perempuan
  geom_line(data=datasmu,mapping = aes(datasmu$Tahun,datasmu$Perempuan,color="Perempuan",group=1))+
  #Pembuatan point data perempuan
  geom_point(data=datasmu,mapping = aes(datasmu$Tahun,datasmu$Perempuan,color="Perempuan"))+
  #Untuk menampilkan tittle,subttle, caption pada visualisasi
  labs(title = "APM SMU Perkotaan+Perdesaan Menurut Jenis Kelamin",subtitle="Dari Tahun 2015-2021",
       caption="Sumber: Badan Pusat Statistik", y = "APM (%)", x = "Tahun 2015-2021")

#2. Histogram
#Library yang memberi warna pada histogram
library("RColorBrewer")
#Input data
datasmu=read.csv(file.choose(), header = TRUE)
#View data
View(datasmu)
#pemgmabilan data laki-laki saja
datalaki=datasmu$Laki.laki
#Visualisasi Histogram
hist(datalaki, main = "APM SMU Perkotaan+Perdesaan Pada Jenis Kelamin Laki-Laki",
     xlab = "Nilai APM Pada Laki-Laki", border = "red", col = brewer.pal(n = 7,name = "RdBu"))

#3. Grafik Batang
#Library ggplot2
library(ggplot2)
#Input data
datasmu=read.csv(file.choose(), header = TRUE)
#View data
View(datasmu)

#Visualisasi digram batang
APM_barchart <- ggplot(datasmu,
                       aes(x = reorder(datasmu$Tahun, datasmu$Laki.laki),
                           y =  datasmu$Laki.laki)) +
  geom_bar(stat = "identity", color='skyblue', fill='steelblue') +  #Untuk memberi warna
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label =  datasmu$Laki.laki), nudge_y = -0.5) + #Untuk meberi label didalam bar
  #Untuk memberi title, subtitle,caption pada diagram
  labs(title = "APM SMU Perkotaan+Perdesaan Menurut Jenis Kelamin Laki-Laki",subtitle="Dari Tahun 2015-2021",
       caption="Sumber: Badan Pusat Statistik", y = "APM (%)", x = "Tahun 2015-2021") + 
  coord_flip()#Membuat Vertikal pada bar
#Memanggil hasil visualisasi
APM_barchart
