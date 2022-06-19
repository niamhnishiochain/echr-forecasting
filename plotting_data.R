library(ggplot2)
library(ggthemes)
library(tidyverse)



articles <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 
             11, 12, 13, 14, 18)

c_violations <- c(559, 1446, 7, 1511, 4828, 
                35, 854, 65, 394, 131, 9, 
                1230, 195, 7)

c_non_violations <- c(161, 595, 10, 393, 736,
                    47, 358, 31, 142, 42, 
                    8, 170, 239, 32)

c_total_cases <- violations + non_violations

df <- data.frame(articles, 
                 c_violations, 
                 c_non_violations,
                 c_total_cases)

ggplot(df, aes(y=total_cases, x=articles) + 
  geom_bar(stat="identity") +
  labs(x = 'article',y = 'number of total cases') +
  theme_igray() + scale_colour_tableau()


ggplot(df, aes(y=violations, x=articles)) + 
  geom_bar(stat="identity") +
  labs(x = 'article',y = 'number of total cases') +
  scale_color_fivethirtyeight("cyl") +
  theme_fivethirtyeight()

ggplot(df, aes(y=non_violations, x=articles)) + 
  geom_bar() +
  lab(x = 'article',y = 'number of total cases')


data <- df %>% gather(key = "observation", value="c_", -c(1,3))

keep <- c("articles","observation", "c_")
data = data[keep]

empty_bar <- 2
nObsType <- nlevels(as.factor(data$observation))
to_add <- data.frame( matrix(NA, empty_bar*nObsType, ncol(data)))
colnames(to_add) <- colnames(data)
data <- rbind(data, to_add)
#data$id <- rep( seq(1, nrow(data)/nObsType) , each=nObsType)

