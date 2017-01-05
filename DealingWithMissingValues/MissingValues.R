#file Prep
library(readr)
library(dplyr)
titanic3 <- read_csv("C:/Users/sirianong/Desktop/Data_Science/Exercises/Data_Wrangle_3.4_Ex/titanic3.csv")
str(titanic3)

##Q1:port of embarkation
titanic3$embarked <- factor(titanic3$embarked)
levels(titanic3$embarked)

sum(is.na(titanic3$embarked))
summary(titanic3$embarked)

titanic3$embarked[is.na(titanic3$embarked)] <- "S" 

##Q2: Age
a <- mean(titanic3$age,na.rm=TRUE)
titanic3$age[is.na(titanic3$age)] <- a
summary(titanic3$age)
str(titanic3$age)
## we may use median also

##Q3: Lifeboat
str(titanic3$boat)
titanic3$boat[is.na(titanic3$boat)] <- "None"


##Q4: Cabin
titanic3 <- titanic3 %>% mutate(has_cabin_number = ifelse(is.na(cabin) == TRUE,0,1))
select(titanic3,has_cabin_number,cabin)


##Export table
write.csv(titanic3,file = "titanic_clean.csv")
