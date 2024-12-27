library(dplyr)

iris=read.csv("~/Datasets/iris.csv")
names(iris)=c('sepal_length','sepal_width','petal_length','petal_width','type')
features=c('sepal_length','sepal_width','petal_length','petal_width')
target='type'
head(iris)
train_size=floor(0.8*nrow(iris))
train_index=sample(seq(1, nrow(iris)), train_size)
X_train=iris[train_index, features]
X_test=iris[-train_index, features]
y_train=iris[train_index, target]
y_test=iris[-train_index, target]
test_pred=class::knn(train = X_train, test = X_test, cl=y_train, k=1)
confusion_matrix=table(test_pred, y_test); confusion_matrix
accuracy=sum(diag(confusion_matrix))/length(y_test)
paste0("1 Nearest neighbor accuracy: ",round(accuracy,3))
