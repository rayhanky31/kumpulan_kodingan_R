library(ggplot2)
mpg$drv <- factor(mpg$drv,
    levels = c("f", "r", "4"),
    labels = c("front-wheel", "rear-wheel", "4-wheel")
)

# Diagram batang bertumpuk
ggplot(
    mpg,
    aes(
        x = class,
        fill = drv
    )
) +
    geom_bar(position = "fill") +
    theme_minimal() + # menggunakan tema minimal
    labs(y = "Proportion")


library(scales)
data(Salaries, package = "carData")

# 1
ggplot(
    Salaries,
    aes(
        x = yrs.since.phd,
        y = salary
    )
) +
    geom_point(
        color = "red",
        size = 2,
        alpha = 1
    ) +
    geom_smooth(
        size = 1,
        color = "blue"
    ) +
    scale_y_continuous(
        label = scales::dollar,
        limit = c(50000, 250000)
    ) +
    scale_x_continuous(
        breaks = seq(0, 60, 10),
        limits = c(0, 60)
    ) +
    theme_minimal() +
    labs(x = "pengalaman", y = "", title = "pengalaman vs gaji") +
    theme_minimal()

# 2
ggplot(
    Salaries,
    aes(
        x = yrs.since.phd,
        y = salary, color = rank
    )
) +
    geom_point() +
    theme_minimal() +
    labs(
        title = "gaji berdasarkan pengalaman dan tingkatan"
    )
# 3
ggplot(Salaries, aes(x = yrs.since.phd, y = salary, color = rank, shape = sex)) +
    geom_point(size = 3, alpha = 0.6) +
    theme_minimal() +
    labs(title = "gaji berdasarkan pengalaman,jenis kelamin dan tingkatan")