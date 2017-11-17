library(tmcn)
library(tmcn.word2vec)
library(tmcn.crfpp)
data(GBK)
head(GBK)


txt1 <- c("\u4E2D\u56FDR\u8BED\u8A00\u4F1A\u8BAE")

txt2 <- iconv(txt1, "UTF-8", "GBK")

txt3 <- txt1

Encoding(txt3) <- "GBK"

isUTF8(txt1)

isGBK(txt2)

isGBK(txt3)


setCN()
txt1 <- c("中国R语言会议")
toUTF8(txt1)
catUTF8(txt1)
revUTF8("<U+4E2D><U+56FD>R<U+4F1A><U+8BAE>")


txt1 <- c("中国R语言会议")
 toTrad(txt1)

 toTrad( "中國R語言會議",rev = TRUE)

 
 toPinyin(txt1, capitalize = TRUE) 
 
 txt1 <- c("\t(x1)a(aa2)a ", " bb(bb)") 
 
 strextract(txt1, "\\([^)]*\\)")
 
 
 strstrip(c("\taaaa ", " bbbb "))
 
 
 require(tmcn.crfpp)
TestFilePath<-system.file("tests",package="tmcn.crfpp")
WorkPath <- tempdir()
 # Learn
  TempletFile <- file.path(TestFilePath,
                               "testdata", "chunking_template")
 TrainingFile <- file.path(TestFilePath,
                             "testdata", "chunking_train")
 ModelFile1 <- file.path(WorkPath, "output", "model1")
 res1 <- crflearn(TempletFile, TrainingFile, ModelFile1)
 # Test
  KeyFile <- file.path(TestFilePath, "testdata",
                           "chunking_key")
 ResultFile1 <- file.path(WorkPath, "output", "result1")
 test1 <- crftest(res1$model_file, KeyFile, ResultFile1) 
 
 
 ###################################################################3
 require(tmcn.word2vec)
 TestFilePath <- system.file("tests",
                                package = "tmcn.word2vec")
WorkPath <- tempdir()
 TrainingFile1 <- file.path(TestFilePath,
                               "testdata", "questions-words.txt")
 ModelFile1 <- file.path(WorkPath, "output",
                            "model1.bin")
 res1 <- word2vec(TrainingFile1, ModelFile1)
 distance(res1$output_file, "think")[1:3,]
 
 