# Generate banner image
# Modified from https://www.r-graph-gallery.com/136-stacked-area-chart/

library(ggplot2)
 
set.seed(345)

sector_labels <- paste0("S0", as.character(1:7))
year_labels <- as.character(seq(1970, 2100, 10))

Sector <- rep(sector_labels,times=length(year_labels))
Year <- as.numeric(rep(year_labels,each=length(sector_labels)))
Value <- runif(length(year_labels) * length(sector_labels), 10, 100)

data <- data.frame(Sector,Year,Value)
 
my_fun=function(vec){ as.numeric(vec[3]) / sum(data$Value[data$Year==vec[2]]) *100 }
data$prop=apply(data , 1 , my_fun)
 
ggplot(data, aes(x=Year, y=prop, fill=Sector)) + 
    geom_area(alpha=0.6 , size=1, colour="black") + 
    theme_void() +
    theme(
        legend.title=element_blank(),
        legend.text=element_blank()
    ) +
    coord_fixed(ratio=1 / 3.)
ggsave("../assets/banner.png", width=6, height=2)


