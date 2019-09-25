library(dplyr)
blotter_data <- read.csv("Blotter_Data_Archive.csv", header = T) %>% sample_frac(., 0.2)
blotter_data$INCIDENTTIME <- strptime(x = as.character(blotter_data$INCIDENTTIME),
                                      format = "%Y-%m-%dT%H:%M:%S") #From factor to datetime
blotter_data$time <- format(blotter_data$INCIDENTTIME, "%H:%M:%S") #From datetime to character
blotter_data$time <- as.POSIXct(x = blotter_data$time, format = "%H:%M:%S") #From character to continuous time var
blotter_data$date <- format(blotter_data$INCIDENTTIME, "%m-%d")
blotter_data$date <- as.POSIXct(x = blotter_data$date, format = "%m-%d")
blotter_data$type <- cut(blotter_data$HIERARCHY, c(-Inf, 9, 98, Inf), labels = c("Type 1 - Major Crime", "Type 2 - Minor Crime", "No Data"))
blotter_data$INCIDENTTIME <- as.POSIXct(blotter_data$INCIDENTTIME) #to avoid POSIXlt error