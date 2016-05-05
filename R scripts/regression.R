library(ggplot2)
data = read.csv(file.choose(), head = TRUE)
data$DISTANCE2 = ifelse(data$DISTANCE == 99999, NA, data$DISTANCE)
data$DISTANCE_CAT = ifelse(data$DISTANCE2 == 0, 0, 
                           ifelse(data$DISTANCE2 == 1, 1, 
                                  ifelse(data$DISTANCE2 >1&data$DISTANCE2 <= 5, 2,
                                         ifelse(data$DISTANCE2 > 5&data$DISTANCE2 <=9, 3, 4))))

# plot(data$DISTANCE2_CAT, data$DONATION_AMOUNT,xlab = "Distance", ylab = "Donation Amount", col = "blue")
summary(data$DONATION_AMOUNT)

ggplot(data, aes(DONATION_AMOUNT, fill = DISTANCE_CAT))+
  geom_density(alpha = 0.2) +
  xlim(c(0,1000))
  

data$DISTANCE_CAT = factor(data$DISTANCE_CAT)
ggplot(data, aes(factor(DISTANCE_CAT), DONATION_AMOUNT)) + 
  geom_jitter(alpha = 0.5, aes(color=STUDENTS_REACHED), position = position_jitter(width=.4)) +
  ylim(c(0, 10000)) +
  ggtitle("Donation amount vs State Distance") + 
  labs(x="State distance", y="Donation amount") + 
  theme(legend.position=c(1,1), legend.justification=c(1,1))

m1 = lm(DONATION_AMOUNT~DISTANCE_CAT+SCHOOL_METRO+POVERTY_LEVEL+GRADE_LEVEL+STUDENTS_REACHED, data = data)
summary(m1)
par(mfrow=c(2,2))
plot(m1)

a1 = aov(data$DONATION_AMOUNT~data$DISTANCE_CAT)
TukeyHSD(x=a1, 'data$DISTANCE_CAT', conf.level = 0.95)