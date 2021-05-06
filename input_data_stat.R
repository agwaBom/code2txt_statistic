getwd()
setwd("/Users/hyunjinkim/Google 드라이브(khyunjin1993@g.skku.edu)/Human_Language_Intelligence_Lab/research/statistic/")
library(dplyr)
library(ggplot2)

clang_O0_source = read.csv(file="./clang_O0_source_len_list.csv", header = FALSE, sep=",")
clang_O1_source = read.csv(file="./clang_O1_source_len_list.csv", header = FALSE, sep=",")
clang_O2_source = read.csv(file="./clang_O2_source_len_list.csv", header = FALSE, sep=",")
clang_O3_source = read.csv(file="./clang_O3_source_len_list.csv", header = FALSE, sep=",")

clang_O0_target = read.csv(file="./clang_O0_target_len_list.csv", header = FALSE, sep=",")
clang_O1_target = read.csv(file="./clang_O1_target_len_list.csv", header = FALSE, sep=",")
clang_O2_target = read.csv(file="./clang_O2_target_len_list.csv", header = FALSE, sep=",")
clang_O3_target = read.csv(file="./clang_O3_target_len_list.csv", header = FALSE, sep=",")

gcc_O0_source = read.csv(file="./gcc_O0_source_len_list.csv", header = FALSE, sep=",")
gcc_O1_source = read.csv(file="./gcc_O1_source_len_list.csv", header = FALSE, sep=",")
gcc_O2_source = read.csv(file="./gcc_O2_source_len_list.csv", header = FALSE, sep=",")
gcc_O3_source = read.csv(file="./gcc_O3_source_len_list.csv", header = FALSE, sep=",")

gcc_O0_target = read.csv(file="./gcc_O0_target_len_list.csv", header = FALSE, sep=",")
gcc_O1_target = read.csv(file="./gcc_O1_target_len_list.csv", header = FALSE, sep=",")
gcc_O2_target = read.csv(file="./gcc_O2_target_len_list.csv", header = FALSE, sep=",")
gcc_O3_target = read.csv(file="./gcc_O3_target_len_list.csv", header = FALSE, sep=",")


clang_O0_source_vec = as.vector(t(clang_O0_source))
clang_O1_source_vec = as.vector(t(clang_O1_source))
clang_O2_source_vec = as.vector(t(clang_O2_source))
clang_O3_source_vec = as.vector(t(clang_O3_source))

clang_O0_target_vec = as.vector(t(clang_O0_target))
clang_O1_target_vec = as.vector(t(clang_O1_target))
clang_O2_target_vec = as.vector(t(clang_O2_target))
clang_O3_target_vec = as.vector(t(clang_O3_target))

gcc_O0_source_vec = as.vector(t(gcc_O0_source))
gcc_O1_source_vec = as.vector(t(gcc_O1_source))
gcc_O2_source_vec = as.vector(t(gcc_O2_source))
gcc_O3_source_vec = as.vector(t(gcc_O3_source))

gcc_O0_target_vec = as.vector(t(gcc_O0_target))
gcc_O1_target_vec = as.vector(t(gcc_O1_target))
gcc_O2_target_vec = as.vector(t(gcc_O2_target))
gcc_O3_target_vec = as.vector(t(gcc_O3_target))

View(test)

max(test, na.rm = TRUE)

typeof(clang_source)

boxplot(clang_O0_source_vec, 
        clang_O1_source_vec, 
        clang_O2_source_vec, 
        clang_O3_source_vec, 
        names = c("clang_O0","clang_O1","clang_O2","clang_O3"),col=c("red","green","blue","yellow"), horizontal = TRUE, outline=FALSE, xlab="sequence length", main ="Boxplot of Clang code sequence length")
#[1]   0  46  82 173 363
boxplot.stats(clang_O0_source_vec)$stats
#[1]   0   8  29  94 223
boxplot.stats(clang_O1_source_vec)$stats
#[1]   0  37 116 277 637
boxplot.stats(clang_O2_source_vec)$stats
#[1]   0  35 115 288 667
boxplot.stats(clang_O3_source_vec)$stats


length(clang_O0_source_vec)
length(clang_O1_source_vec) 
length(clang_O2_source_vec)
length(clang_O3_source_vec)
clang_code = data.frame(name=c(rep("clang_O0_source_vec",length(clang_O0_source_vec)),
                         rep("clang_O1_source_vec",length(clang_O1_source_vec)),
                         rep("clang_O2_source_vec",length(clang_O2_source_vec)),
                         rep("clang_O3_source_vec",length(clang_O3_source_vec))),
                  value=c(clang_O0_source_vec, 
                          clang_O1_source_vec, 
                          clang_O2_source_vec, 
                          clang_O3_source_vec))

library(tidyverse)
theme_set(theme_bw(base_size = 16))

clang_code%>%ggplot(aes(x=name, y=value, fill=name))+    
  geom_boxplot() +
  geom_jitter(color="black", size=0.5, alpha=0.1) +
  theme(legend.position="none",
        plot.title = element_text(size=11)) +
  ggtitle("Boxplot of Clang code sequence length") +
  ylab("sequence length")+
  xlab("compiler type")+
  coord_flip()+
  scale_y_log10()


boxplot(clang_O0_target_vec,
        clang_O1_target_vec, 
        clang_O2_target_vec, 
        clang_O3_target_vec, 
        names = c("clang_O0","clang_O1","clang_O2","clang_O3"),col=c("red","green","blue","yellow"), horizontal = TRUE, outline=FALSE, xlab="sequence length", main ="Boxplot of Clang function name sequence length")
#[1]   0  46  82 173 363
boxplot.stats(clang_O0_target_vec)$stats
#[1]   0   8  29  94 223
boxplot.stats(clang_O1_target_vec)$stats
#[1]   0  37 116 277 637
boxplot.stats(clang_O2_target_vec)$stats
#[1]   0  35 115 288 667
boxplot.stats(clang_O3_target_vec)$stats


boxplot(gcc_O0_source_vec, 
        gcc_O1_source_vec, 
        gcc_O2_source_vec, 
        gcc_O3_source_vec, 
        names = c("gcc_O0","gcc_O1","gcc_O2","gcc_O3"),col=c("red","green","blue","yellow"), horizontal = TRUE, outline=FALSE, xlab="sequence length", main ="Boxplot of Gcc code sequence length")
#[1]   0  46  82 173 363
boxplot.stats(gcc_O0_source_vec)$stats
#[1]   0   8  29  94 223
boxplot.stats(gcc_O1_source_vec)$stats
#[1]   0  37 116 277 637
boxplot.stats(gcc_O2_source_vec)$stats
#[1]   0  35 115 288 667
boxplot.stats(gcc_O3_source_vec)$stats

gcc_code = data.frame(name=c(rep("gcc_O0_source_vec",length(gcc_O0_source_vec)),
                         rep("gcc_O1_source_vec",length(gcc_O1_source_vec)),
                         rep("gcc_O2_source_vec",length(gcc_O2_source_vec)),
                         rep("gcc_O3_source_vec",length(gcc_O3_source_vec))),
                  value=c(gcc_O0_source_vec, 
                          gcc_O1_source_vec, 
                          gcc_O2_source_vec, 
                          gcc_O3_source_vec))

gcc_code%>%ggplot(aes(x=name, y=value, fill=name))+    
  geom_boxplot() +
  geom_jitter(color="black", size=0.5, alpha=0.1) +
  theme(legend.position="none",
        plot.title = element_text(size=11)) +
  ggtitle("Boxplot of Gcc code sequence length") +
  ylab("sequence length")+
  xlab("compiler type")+
  coord_flip()+
  scale_y_log10()



boxplot(gcc_O0_target_vec, 
        gcc_O1_target_vec, 
        gcc_O2_target_vec, 
        gcc_O3_target_vec, 
        names = c("gcc_O0","gcc_O1","gcc_O2","gcc_O3"),col=c("red","green","blue","yellow"), horizontal = TRUE, outline=FALSE, xlab="sequence length", main ="Boxplot of Gcc function name sequence length")
#[1]   0  46  82 173 363
boxplot.stats(gcc_O0_target_vec)$stats
#[1]   0   8  29  94 223
boxplot.stats(gcc_O1_target_vec)$stats
#[1]   0  37 116 277 637
boxplot.stats(gcc_O2_target_vec)$stats
#[1]   0  35 115 288 667
boxplot.stats(gcc_O3_target_vec)$stats

?read.delim()
