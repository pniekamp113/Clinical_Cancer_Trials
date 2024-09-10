
library(dplyr)
library(ggplot2)

getwd()

data <- read.csv("ctg-studies.csv")

#general information on the studies
head(data)
names(data)
count(data)


#Calculate study status and plot
status_counts <- data %>%
  count(Study.Status)

print(status_counts)

ggplot(status_counts, aes(x = Study.Status, y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Number of Trials by Study Status", x = "Study Status", y = "Number of Trials") +
  theme(axis.text.x =  element_text(angle = 45, hjust = 1))


#Number of Trials involving CAR-T cells

keyword <- c("CAR-T", "CAR T", "Chimeric antigen receptor")

data$CAR_T_Trial <- grepl(paste(keyword, collapse = "|"),
                          data$Study.Title, ignore.case = TRUE) |
                    grepl(paste(keyword, collapse = "|"),
                          data$Brief.Summary, ignore.case = TRUE) |
                    grepl(paste(keyword, collapse = "|"),
                          data$Interventions, ignore.case = TRUE)



CAR_T_counts <- data %>% 
  count(CAR_T_Trial)
print(CAR_T_counts)

#Number of bispecific Trials
bispecific <- c("bispecific")

data$Bispecific_Trials <- grepl(paste(bispecific, collapse = "|"),
                              data$Study.Title, ignore.case = TRUE) |
                          grepl(paste(bispecific, collapse = "|"),
                              data$Brief.Summary, ignore.case = TRUE) |
                          grepl(paste(bispecific, collapse = "|"),
                                data$Interventions, ignore.case = TRUE)


Bispecific_counts <- data %>% 
  count(Bispecific_Trials)
print(Bispecific_counts)
