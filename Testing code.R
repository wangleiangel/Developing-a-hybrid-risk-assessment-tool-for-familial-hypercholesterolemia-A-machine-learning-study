load(file = "D:\\博士研究生学习\\博一\\郭健师兄文件\\标书\\国青标书20210105\\FH机器学习文献\\FH标准\\文章文件210831_WL\\Data in Brief\\finalmodel.Rdata")#load the essential model and function
Testdata_try<-as.data.frame(t(c(63,8.23,0,1,1,0,0,1,0)))#input the value of the eight variables below
colnames(Testdata_try)<-c("age","LDL_c","pPVD","pStroke_fh","Lipidtreat",
                          "pCHD_fhTW","pCHDTW","Arcus","pStroke")#named the eight variables
Testdata_try$age<-as.numeric(Testdata_try$age)#changed their type
Testdata_try$LDL_c<-as.numeric(Testdata_try$LDL_c)
Testdata_try$pPVD<-as.numeric(Testdata_try$pPVD)
Testdata_try$pStroke_fh<-as.numeric(Testdata_try$pStroke_fh)
Testdata_try$Lipidtreat<-as.numeric(Testdata_try$Lipidtreat)
Testdata_try$pCHD_fhTW<-as.numeric(Testdata_try$pCHD_fhTW)
Testdata_try$Arcus<-as.numeric(Testdata_try$Arcus)
Testdata_try$pCHDTW<-as.numeric(Testdata_try$pCHDTW)
Testdata_try$pStroke<-as.numeric(Testdata_try$pStroke)


#test the FH risk
#"WSSTACKmodel_un" is the identifier settled with stacking model
Pre_result_Stack<- as.data.frame(predict(WSSTACKmodel,Testdata_try))
colnames(Pre_result_Stack)<-c("x")
#"iso.model_stack_un" is the isotonic regression model for probability reclibration
Pre_result_Stack_isotonic <- as.data.frame(fit.isoreg(iso.model_Stack, Pre_result_Stack$x))
colnames(Pre_result_Stack_isotonic)<-c("x")
#Results of Stacking model
Pre_result_Stack$x
#Probability after isotonic
Pre_result_Stack_isotonic$x
