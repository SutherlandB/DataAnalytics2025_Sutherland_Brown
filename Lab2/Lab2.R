library("ggplot2")
library("readr")

## read ds
NY_HOUSE <- read_csv("/Users/sutherlandbrown/Downloads/NY-House-Dataset.csv")

ds <- NY_HOUSE

ggplot(ds, aes(x = log10(PROPERTYSQFT), y = log10(PRICE))) +
  geom_point()

## filter data
ds <- ds[ds$PRICE<195000000,]

ds <- ds[ds$PROPERTYSQFT!=2184.207862,]

ds$PROPERTYSQFT[ds$BROKERTITLE=="Brokered by Douglas Elliman - 575 Madison Ave"][85]

## column names
names(ds)

## fit linear model
lmod <- lm(PRICE~PROPERTYSQFT, data = ds)

lmod <- lm(log10(PRICE)~log10(PROPERTYSQFT), data = ds)

#Linear Models
model1 <- lm(log10(PRICE) ~ PROPERTYSQFT, data = ds)
model2 <- lm(log10(PRICE) ~ PROPERTYSQFT + BATH, data = ds)
model3 <- lm(log10(PRICE) ~ PROPERTYSQFT + BEDS + BATH, data = ds)


## print model output
summary(lmod)
summary(model1)
summary(model2)
summary(model3)


ggplot(ds, aes(x = log10(PROPERTYSQFT), y = PRICE)) +
  geom_point() + stat_smooth(method = "lm", col = "red") 


## scatter plot of 2 variables
plot(PRICE~PROPERTYSQFT, data = ds)
abline(lmod)

plot(log10(PRICE)~log10(PROPERTYSQFT), data = ds)
abline(lmod)

## scatter plot of 2 variables
ggplot(ds, aes(x = PROPERTYSQFT, y = PRICE)) +
  geom_point()

ggplot(ds, aes(x = PROPERTYSQFT, y = PRICE)) +
  geom_point() +
  stat_smooth(method = "lm", col="blue")

ggplot(ds, aes(x = log10(PROPERTYSQFT), y = log10(PRICE))) +
  geom_point() +
  stat_smooth(method = "lm", col="blue")