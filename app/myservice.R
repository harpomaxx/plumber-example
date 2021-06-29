library(randomForest)
library(plumber)

# loading the model for classifier 
model<-get(load("./rf_model.rda"))

#  prediction function
#* @get /mypredict
#* @serializer unboxedJSON
function(s_len,s_width,p_len,p_width){
  newdata=data.frame(
  Sepal.Length=s_len,
  Sepal.Width=s_width,
  Petal.Length=p_len,
  Petal.Width=p_width
  )
  prediction<-predict(model,newdata)
  return(list(class=prediction))
}
