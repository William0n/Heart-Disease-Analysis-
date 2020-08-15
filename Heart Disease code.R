library(tidyverse)
heartData <- read.csv("Heart Disease Data.csv")

# checking for NA values in general

table(is.na(heartData))

# do older people have greater odds of heart disease
# do patients with higher cholesteral levels have a higher chance of heart disease
# are patients with higher levels of chest pain more likelye to suffer from heart disease

### Data Processing

# Correcting 'target' variable locations and removing low frequency points 

heartData$newTarget <- ifelse(heartData$target == 1, 0, 1)
heartData <- heartData[which(heartData$age > 34), ]
heartData <- subset(heartData,  heartData$age < 74)
heartData <- heartData[, -c(6 , 10, 11)]

# Converting covariates into factor variables 

heartData$cp <- as.factor(heartData$cp)
heartData$newTarget <- as.factor(heartData$newTarget)
heartData$sex <- as.factor(heartData$sex)
heartData$exang <- as.factor(heartData$exang)
heartData$ca <- as.factor(heartData$ca)
heartData$restecg <- as.factor(heartData$restecg)
heartData$thal <- as.factor(heartData$thal)

# Removing NA data and dropping the associated factor level 
heartData <- heartData[which(heartData$ca != 4), ] 
heartData$ca <- droplevels(heartData$ca)

heartData <- heartData[which(heartData$thal != 0), ] 
heartData$thal <- droplevels(heartData$thal)


### EDA
ggplot(heartData, aes(x = age)) +
  geom_histogram(binwidth = 5, col = 'black', fill = 'grey') + 
  xlab('Age') + ylab('Count')

ggplot(heartData, aes(x = as.factor(newTarget), fill= as.factor(sex))) +
  geom_bar() +
  xlab("Target") + ylab("Total Count") + labs(fill = "Sex")

    
ggplot(heartData, aes(x = sex, fill = cp)) +  ### presence of heart pain 0 = none, 3 bad pain
  geom_bar(width = 0.) +
  xlab("Sex") + ylab("Total Count") + labs(fill = "Chest Pain") +  
  geom_bar(position = "dodge")

ggplot(heartData, aes(x = cp, fill = newTarget)) +  ### presence of heart pain 0 = none, 4 bad pain
  geom_bar(width = 0.5) +
  xlab("Chest Pain Levels") + ylab("Total Count") + labs(fill = "HD Pressence")

ggplot(heartData, aes(x = newTarget, y = age)) +  ### presence of heart pain 0 = none, 4 bad pain
  geom_boxplot() +
  theme_bw() +
  xlab("Heart Disease") + ylab("Age") 

# ggplot(heartData, aes(x = cp, y = age)) +  
#   geom_boxplot() +
#   theme_bw() +
#  xlab("Chest Pain") + ylab("Age") 



# Modeling 

model1 <- glm(newTarget ~ age + sex + ca + chol + trestbps + exang + thalach + cp + restecg, 
              family = "binomial", data = heartData)

modelSummary <- summary(model1)

