
             #Philip Mudambo R project 2
#1.a)Define an array in data science field.
#an array is a collection of one-dimensional, two-dimensional or multi-dimensional elements of the same data type, arranged in a specific order and stored in a contiguous block of memory.

#b)Create two vectors v1 and v2 of different length.Such that v1 has three values and v2 six values.
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6, 7)
     
#c)Create an array of dimensions (3,3,3).
# create a 3-dimensional array with dimensions (3, 3, 3)
array1 <- array(data = 1:9, dim = c(3, 3, 3))
array1

#d)How many matrices are present in our array?
#Each dimension represents a matrix and there are three matrices along each dimension thus a total of 9 matrices in the array.
   
#e)Name matrices present in your array as MAT1,MAT2,MAT3.
dimnames(array1) <- list( c("R1", "R2", "R3"), c("C1", "C2", "C3"),c("MAT1", "MAT2", "MAT3"))
array1


#2)By use ggplot2 package, solve the following tasks.
#a)Using Iris dataset, produce simple scatter plot of petal.length against sepal.width.
library(ggplot2)
data(iris)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
geom_point()

#b)Add legend that describes species of leaves on question 2a using your own colours.
legend("topright", legend = levels(iris$Species), col = rainbow(length(levels(iris$Species))), pch = 16)
   
#c)Draw histogram of hp variable under mtcars dataset. Colour your graph.
data(mtcars)
color1 <- "blue"
hist(mtcars$hp, col = color1)
     
#d)customize your graphs in questions 2a and 2c to any scale f your interest 
data(mtcars)
color1 <- "blue"
par(mar = c(4, 4, 2, 2))
hist(mtcars$hp, col = color1)

ggplot(mtcars, aes(x = hp)) +
geom_histogram(fill = "#0072B2", color = "#0072B2", alpha = 0.8) +
labs(x = "Horsepower", y = "Frequency") +
scale_x_continuous(limits = c(0, 350), expand = c(0, 0)) +
scale_y_continuous(expand = c(0, 0)) +
theme_classic() +
theme(
    plot.margin = unit(c(0.2, 0.2, 0.2, 0.2), "cm"),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(size = 1)
  )

#3)Use lattice package to perfom the following tasks
#a)Produce a scatter plot of petal.width against petal.width.
library(lattice)
data(iris)
xyplot(petal.width ~ petal.length, data = iris, type = c("p", "r"), col = "blue", pch = 16, xlab = "Petal Length", ylab = "Petal Width")

#b)Colour your graph points grouped by species
library(lattice)
data(iris)

# Create scatter plot with colored points
xyplot(petal.width ~ petal.length, data = iris, groups = species, type = c("p", "r"), col = c("red", "blue", "green"), pch = 16, xlab = "Petal Length", ylab = "Petal Width", panel = function(x, y, ...) {
      panel.xyplot(x, y, ...)
      panel.text(x, y, labels = iris$species, col = c("red", "blue", "green"))
      })

#c)Change your x axes label in part b to lenth_petal and y axis to length_sepal
xyplot(length_sepal ~ length_petal, data = iris, groups = species, type = c("p", "r"), col = c("red", "blue", "green"), pch = 16, xlab = "length_petal", ylab = "length_sepal", panel = function(x, y, ...) {
      panel.xyplot(x, y, ...)
      panel.text(x, y, labels = iris$species, col = c("red", "blue", "green"))
      })


#d)Draw a density plot using ToothGrowth datasets
data(ToothGrowth)
vcdata <- subset(ToothGrowth, supp == "VC")$len
ojdata <- subset(ToothGrowth, supp == "OJ")$len
vcdensity <- density(vc_data)
ojdensity <- density(oj_data)
par(mar = c(1, 1, 1, 1))
plot(vcdensity, main = "ToothGrowth Dataset - Length Density", xlab = "Length", col = "red")
lines(ojdensity, col = "blue")
legend("topright", legend = c("VC", "OJ"), col = c("red", "blue"), lty = 1)
  
#e)Explain use of break function in graphics.Produce histogram using ToothGrowth dataset applying break length of your choice.
#Break function is used in loops to prematurely exit a loop when a certain condition is met. In graphics programming, when you want to stop iterating through a loop if a certain criteria is met. For example, when writing a program to search through an image to find a specific object, one could use a for loop to iterate through each pixel in the image and within the loop, the if statement could be used to check if the current pixel matches the object being searched and if it does, then the break function will be used to exit the loop and stop searching through the image because waht was being searced has been found.
data(ToothGrowth)
hist(ToothGrowth$len, breaks = "Sturges")




