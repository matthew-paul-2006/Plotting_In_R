params <-
list(isSlides = "no")

## ----setup, include=FALSE------------------------------------------------------------------------------
suppressPackageStartupMessages(require(knitr))
knitr::opts_chunk$set(echo = TRUE, tidy = T)
if(params$isSlides == "yes"){AsSlides=T}else{AsSlides=F}


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides != "yes"){
  cat("# Plotting in R with ggplot2
  

"    
  )
  
}



## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Grammar of Graphics

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Grammar of Graphics
  

"    
  )
  
}



## ----complex_ggplot2,eval=F----------------------------------------------------------------------------
## 
## ggplot(data = <default data set>,
##        aes(x = <default x axis variable>,
##            y = <default y axis variable>,
##            ... <other default aesthetic mappings>),
##        ... <other plot defaults>) +
## 
##        geom_scatter(aes(size = <size variable for this geom>,
##                       ... <other aesthetic mappings>),
##                   data = <data for this point geom>,
##                   stat = <statistic string or function>,
##                   position = <position string or function>,
##                   color = <"fixed color specification">,
##                   <other arguments, possibly passed to the _stat_ function) +
## 
##   scale_<aesthetic>_<type>(name = <"scale label">,
##                      breaks = <where to put tick marks>,
##                      labels = <labels for tick marks>,
##                      ... <other options for the scale>) +
## 
##   ggtitle("Graphics/Plot")+
##   xlab("Weight")+
##   ylab("Height")+
## 
##   theme(plot.title = element_text(color = "gray"),
##         ... <other theme elements>)
## 


## ----present_cleanEralt_ggplot2, echo=FALSE------------------------------------------------------------
library(ggplot2)

patients_clean <- read.delim("data/patient-data-cleaned.txt",
                             sep="\t")



## ----simple_ggplot2,eval=T,warning=FALSE,fig.height=4.5,fig.width=9------------------------------------
ggplot(data=patients_clean,
       aes(y=Weight,x=Height,colour=Sex,
           size=BMI,shape=Pet)) + 
  geom_point()



## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Getting Started With ggplot2

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Getting Started With ggplot2
  

"    
  )
  
}



## ----load_packages_ggplot2, echo=FALSE, eval=TRUE,warning=F,message=F----------------------------------
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(lubridate))


## ----present_clean_ggplot2-----------------------------------------------------------------------------
library(ggplot2)
patients_clean <- read.delim("data/patient-data-cleaned.txt",sep="\t")

class(patients_clean)
dim(patients_clean)


## ----present_clean2_ggplot2----------------------------------------------------------------------------
patients_clean[1:2,]


## ----present_clean3_ggplot2----------------------------------------------------------------------------
patients_clean$Smokes[1:5]
patients_clean$Height[1:5]


## ----present_clean4_ggplot2----------------------------------------------------------------------------
summary(patients_clean)


## ----ggplot_only_ggplot2,echo=!AsSlides,eval=!AsSlides-------------------------------------------------
pcPlot <- ggplot(data=patients_clean)
class(pcPlot)
pcPlot$data[1:4,]


## ----ggplot_onlyFS1_ggplot2,echo=AsSlides,eval=AsSlides------------------------------------------------
## pcPlot <- ggplot(data=patients_clean)
## class(pcPlot)


## ----ggplot_onlyFS2_ggplot2,echo=AsSlides,eval=AsSlides------------------------------------------------
## pcPlot$data[1:4,]


## ----missing_rest_ggplot2------------------------------------------------------------------------------
pcPlot$mapping
pcPlot$theme
pcPlot$layers


## ----ggplot_aes_ggplot2--------------------------------------------------------------------------------
pcPlot <- ggplot(data=patients_clean)

pcPlot <- pcPlot+aes(x=Height,y=Weight)

pcPlot$mapping
pcPlot$theme
pcPlot$layers


## ----ggplot_aes_geom_ggplot2,fig.height=4,fig.width=7,eval=!AsSlides,echo=!AsSlides--------------------
pcPlot <- ggplot(data=patients_clean)

pcPlot <- pcPlot+aes(x=Height,y=Weight)
pcPlot <- pcPlot+geom_point()
pcPlot
pcPlot$mapping
pcPlot$theme
pcPlot$layers



## ----ggplot_aes_geomFS1_ggplot2,fig.height=5,fig.width=8,eval=AsSlides,echo=AsSlides-------------------
## pcPlot <- ggplot(data=patients_clean)
## 
## pcPlot <- pcPlot+aes(x=Height,y=Weight)
## pcPlot <- pcPlot+geom_point()
## 


## ----ggplot_aes_geomFS2_ggplot2,fig.height=5,fig.width=8,eval=AsSlides,echo=AsSlides-------------------
## 
## pcPlot$mapping
## pcPlot$theme
## pcPlot$layers
## 


## ----ggplot_aes_geom_display_ggplot2,fig.height=6,fig.width=8------------------------------------------
pcPlot



## ----ggplot_simple_geom_point_ggplot2, fig.height=5, fig.width=8---------------------------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight))
pcPlot+geom_point()


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Geoms

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Geoms
  

"    
  )
  
}



## ---- line_simple_ggplot2, fig.height=5, fig.width=8---------------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))

pcPlot_line <- pcPlot+geom_line() 

pcPlot_line



## ---- smooth_simple_ggplot2, fig.height=4.5, fig.width=8-----------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))

pcPlot_smooth <- pcPlot+geom_smooth() 

pcPlot_smooth



## ---- bar_simple_ggplot2, fig.height=5, fig.width=9----------------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex))

pcPlot_bar <- pcPlot+geom_bar() 

pcPlot_bar




## ---- histogram_simple_ggplot2, fig.height=4, fig.width=8,warning=FALSE--------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height))

pcPlot_hist <- pcPlot+geom_histogram() 

pcPlot_hist



## ---- density_simple_ggplot2, fig.height=4.5, fig.width=8----------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height))

pcPlot_density <- pcPlot+geom_density() 

pcPlot_density



## ---- boxplot_simple_ggplot2, fig.height=5, fig.width=8------------------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height))

pcPlot_boxplot <- pcPlot+geom_boxplot() 

pcPlot_boxplot


## ---- violin_simple_ggplot2, fig.height=4.5, fig.width=8-----------------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height))

pcPlot_violin <- pcPlot+geom_violin() 

pcPlot_violin


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Aesthetics

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Aesthetics
  

"    
  )
  
}



## ---- scatter_coloured_ggplot2, fig.height=4, fig.width=9----------------------------------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight))
pcPlot+geom_point(colour="red")


## ---- scatter_simple_ggplot2, fig.height=4, fig.width=4,tidy=FALSE-------------------------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,
                             y=Weight))
pcPlot+geom_point()


## ---- scatter_aes_sexcolor_ggplot2, fig.height=4, fig.width=9------------------------------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight,color=Sex))
pcPlot + geom_point()


## ---- scatter_aes_sexShape_ggplot2, fig.height=4.5, fig.width=9,eval=F,echo=T--------------------------
## pcPlot <- ggplot(data=patients_clean,
##                  mapping=aes(x=Height,y=Weight,shape=Sex))
## pcPlot+geom_point()


## ---- scatter_aes_sexShapeB_ggplot2, fig.height=4.5, fig.width=9,eval=T,echo=FALSE---------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight,shape=Sex))
pcPlot+geom_point(size=2)


## ---- aes_in_geom_ggplot2,eval=!AsSlides,echo=!AsSlides------------------------------------------------
pcPlot <- ggplot(data=patients_clean)
pcPlot+geom_point(aes(x=Height,y=Weight,colour=Sex))
pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes))
pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes,shape=Sex))
pcPlot+geom_violin(aes(x=Sex,y=Height,fill=Smokes))


## ---- aes_in_geomFS1_ggplot2,eval=AsSlides,echo=AsSlides-----------------------------------------------
## pcPlot <- ggplot(data=patients_clean)


## ---- aes_in_geomFS2_ggplot2,eval=AsSlides,echo=AsSlides-----------------------------------------------
## pcPlot+geom_point(aes(x=Height,y=Weight,colour=Sex))


## ---- aes_in_geomFS3_ggplot2,eval=AsSlides,echo=AsSlides-----------------------------------------------
## pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes))


## ---- aes_in_geomFS4_ggplot2,eval=AsSlides,echo=AsSlides-----------------------------------------------
## pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes,shape=Sex))


## ---- aes_in_geomFS5_ggplot2,eval=AsSlides,echo=AsSlides-----------------------------------------------
## pcPlot+geom_violin(aes(x=Sex,y=Height,fill=Smokes))


## ---- helpforArguments_ggplot2-------------------------------------------------------------------------
?geom_point


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Facets

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Facets
  

"    
  )
  
}



## ---- facet_grid_SmokesBySex_ggplot2, fig.height=4, fig.width=9----------------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_grid(Smokes~Sex)


## ---- facet_grid_BySex_ggplot2, fig.height=4, fig.width=9----------------------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_grid(~Sex)


## ---- facet_grid_SexBy_ggplot2, fig.height=4, fig.width=9----------------------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_grid(Sex~.)


## ---- facet_Wrap_BySmokes_ggplot2, fig.height=4, fig.width=9-------------------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_wrap(~Smokes)


## ---- facet_wrap_smokesBySexandPet_ggplot2, fig.height=4.5, fig.width=9--------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_wrap(~Pet+Smokes+Sex)


## ---- facet_grid_smokesBySexandPet_ggplot2, fig.height=5, fig.width=9----------------------------------
pcPlot + facet_grid(Smokes~Sex+Pet)


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Plotting Order

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Plotting Order
  

"    
  )
  
}



## ----plotOrderBoxplot_ggplot2, fig.height=4, fig.width=9-----------------------------------------------
ggplot(patients_clean, aes(x=Sex, y=Weight)) + geom_boxplot()


## ----plotOrderCatBoxplot_ggplot2-----------------------------------------------------------------------
levels(patients_clean$Sex)


## ----plotOrderControlBoxplot_ggplot2, fig.height=4, fig.width=9----------------------------------------
patients_clean$Sex <- factor(patients_clean$Sex, 
                             levels=c("Male","Female"))
ggplot(patients_clean,aes(x=Sex, y=Weight)) + geom_boxplot()


## ----plotOrderControlBoxplotEval_ggplot2,echo=FALSE,eval=FALSE-----------------------------------------
## patients_clean %>%
##   mutate(Sex = factor(Sex,levels=c("Male","Female"))) %>%
##   ggplot(aes(x=Sex, y=Weight)) + geom_boxplot()


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Scales

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Scales
  

"    
  )
  
}



## ----scaleCont_ggplot2, facet_grid_smokesBySex_scalex, fig.height=4.5, fig.width=9---------------------

pcPlot + geom_point() + facet_grid(Smokes~Sex)+
  scale_x_continuous(name="height ('cm')",
                     limits = c(100,200),
                     breaks=c(125,150,175),
                     labels=c("small","justright","tall"))



## ----scaleDiscrete_ggplot2, facet_grid_smokesBySex_scaleDisceteX, fig.height=5, fig.width=9------------
pcPlot <- ggplot(data=patients_clean,aes(x=Sex,y=Height))
pcPlot +
  geom_violin(aes(x=Sex,y=Height)) +
  scale_x_discrete(labels=c("Women", "Men"))



## ----scaleFullControl_ggplot2, facet_grid_smokesBySex_scaleDisceteXContinuousY, fig.height=5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,aes(x=Sex,y=Height,fill=Smokes))
pcPlot +
  geom_violin(aes(x=Sex,y=Height)) +
  scale_x_discrete(labels=c("Women", "Men"))+
  scale_y_continuous(breaks=c(160,180),labels=c("Short", "Tall"))


## ----scaleOthers_ggplot2, facet_grid_height_weight, fig.height=3, fig.width=8--------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=Sex))
pcPlot + geom_point(size=4)
                  


## ---- facet_grid_height_weight_manualScale_ggplot2, fig.height=4, fig.width=9--------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=Sex))
pcPlot + geom_point(size=4) + 
  scale_colour_manual(values = c("Green","Purple"),
                     name="Gender")
                  


## ---- facet_grid_height_weight_brewerScale_ggplot2, fig.height=5, fig.width=9--------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=Pet))
pcPlot + geom_point(size=4) + 
  scale_colour_brewer(palette = "Set2")
                  


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Continuous Scales

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Continuous Scales
  

"    
  )
  
}



## ---- facet_grid_height_weight_BMIalpha_ggplot2, fig.height=4.5, fig.width=9---------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,alpha=BMI))
pcPlot + geom_point(size=4) + 
  scale_alpha_continuous(range = c(0.5,1))
                  


## ---- facet_grid_height_weight_BMIsize_ggplot2, fig.height=5, fig.width=9------------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point(alpha=0.8) + 
  scale_size_continuous(range = c(3,6))
                  


## ---- facet_grid_height_weight_BMIsizeLimits_ggplot2, fig.height=4, fig.width=9,warning=FALSE----------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point() + scale_size_continuous(range = c(3,6),
                                              limits = c(25,40))
                  


## ---- facet_grid_height_weight_BMIsizewithBreaks_ggplot2, fig.height=4, fig.width=9--------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point() + 
  scale_size_continuous(range = c(3,6), 
                        breaks=c(25,30), 
                        labels=c("Good","Good but not 25"))


## ---- facet_grid_height_weight_BMIgradient_ggplot2, fig.height=4, fig.width=9--------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_colour_gradient(low = "White",high="Red")
                  


## ---- facet_grid_height_weight_BMIgradient2_ggplot2, fig.height=4, fig.width=9-------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_colour_gradient2(low = "Blue",mid="Black", high="Red",
                         midpoint = median(patients_clean$BMI))


## ---- facet_grid_height_weight_BMIgradient2plus_ggplot2, fig.height=3.5, fig.width=9-------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_colour_gradient2(low = "Blue",
                         mid="Black",
                         high="Red",
                         midpoint = median(patients_clean$BMI),
                         breaks=c(25,30),labels=c("Low","High"),
                         name="Body Mass Index")


## ---- facet_grid_smokesBySex_scaleDisceteXContinuouswY_ggplot2, fig.height=4, fig.width=9--------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI,shape=Sex))
pcPlot + geom_point(size=4,alpha=0.8)+ 
  scale_shape_discrete(name="Gender") +
  scale_colour_gradient2(low = "Blue",mid="Black",high="Red",
                         midpoint = median(patients_clean$BMI),
                         breaks=c(25,30),labels=c("Low","High"),
                         name="Body Mass Index")


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Transformations

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Transformations
  

"    
  )
  
}



## ---- stat_smooth_ggplot2, fig.height=5, fig.width=9---------------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))
pcPlot+geom_point()+stat_smooth()


## ---- stat_smoothlm_ggplot2, fig.height=4, fig.width=9-------------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))
pcPlot+geom_point()+stat_smooth(method="lm")


## ---- stat_smoothlmgroups_ggplot2, fig.height=4, fig.width=9-------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height,colour=Sex))
pcPlot+geom_point()+stat_smooth(method="lm")


## ---- stat_smoothlmgroupsOverridden_ggplot2, fig.height=4, fig.width=9---------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height,colour=Sex))
pcPlot+geom_point()+stat_smooth(aes(x=Weight,y=Height),method="lm",
                                inherit.aes = F)


## ---- stat_summary_ggplot2, fig.height=3.5, fig.width=9------------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height)) + geom_jitter()
pcPlot + stat_summary(fun=quantile, geom="point",
                    colour="purple", size=8)


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Themes

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Themes
  

"    
  )
  
}



## ---- theme_default_ggplot2, fig.height=4, fig.width=4-------------------------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot


## ---- theme_minimal_ggplot2, fig.height=4, fig.width=4,tidy=FALSE--------------------------------------
pcPlot+theme_minimal()


## ---- theme_custom_ggplot2, fig.height=7, fig.width=9,tidy=FALSE---------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+
  geom_point()
pcPlot+
  theme(
    text = element_text(colour="red")
      )


## ---- theme_custom1_ggplot2, fig.height=3, fig.width=9-------------------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot + theme(text = element_text(colour="red"),
        axis.title.y = element_text(angle=0))


## ---- theme_custom2_ggplot2, fig.height=3, fig.width=9,eval=FALSE--------------------------------------
## 
## pcPlot <- ggplot(data=patients_clean,
##         mapping=aes(x=Weight,y=Height))+
##   geom_point()+
##   facet_grid(Sex~Smokes)
## pcPlot+
##   theme(
##     text = element_text(colour="red"),
##     axis.title.y = element_text(angle=0),
##     axis.line = element_line(linetype = 0),
##     panel.background=element_rect(fill="white"),
##     strip.background=element_rect(fill="cyan")
##     )


## ---- theme_custom22_ggplot2, fig.height=3, fig.width=9,eval=TRUE,echo=FALSE---------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+
  geom_point()+
  facet_grid(Sex~Smokes)
pcPlot+
  theme(
    text = element_text(colour="red"),
    axis.title.y = element_text(angle=0),
    axis.line = element_line(linetype = 0),
    panel.background=element_rect(fill="white"),
    strip.background=element_rect(fill="cyan")
    )


## ---- legendD_ggplot2, fig.height=4, fig.width=9-------------------------------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot


## ---- legendleft_ggplot2, fig.height=4, fig.width=9----------------------------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot+theme(legend.position="left")


## ---- legendText_ggplot2, fig.height=4, fig.width=9----------------------------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot+theme(legend.text = element_text(colour="darkred"),
             legend.title = element_text(size=20),
             legend.position = "bottom"
             )


## ---- theme_custom8_ggplot2, fig.height=4, fig.width=9-------------------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()+theme_bw()
pcPlot+
  theme(text = element_text(colour="red"))


## ---- theme_custom84_ggplot2,echo=!AsSlides,eval=!AsSlides---------------------------------------------
  oldTheme <- theme_bw()
  
  newTheme_Plus <- theme_bw() +
  theme(text = element_text(colour="red"))
  
  newTheme_Replace <- theme_bw() %+replace%
  theme(text = element_text(colour="red"))
  
  oldTheme$text
  newTheme_Plus$text
  newTheme_Replace$text


## ---- theme_custom84FS1_ggplot2,echo=AsSlides,eval=AsSlides--------------------------------------------
##   oldTheme <- theme_bw()
## 
##   newTheme_Plus <- theme_bw() +
##   theme(text = element_text(colour="red"))
## 
##   newTheme_Replace <- theme_bw() %+replace%
##   theme(text = element_text(colour="red"))


## ---- theme_custom84FS2_ggplot2,echo=AsSlides,eval=AsSlides--------------------------------------------
##   oldTheme$text


## ---- theme_custom84FS3_ggplot2,echo=AsSlides,eval=AsSlides--------------------------------------------
##   newTheme_Plus$text


## ---- theme_custom84FS4_ggplot2,echo=AsSlides,eval=AsSlides--------------------------------------------
## 
##   newTheme_Replace$text


## ---- theme_custom84FS4wd_ggplot2,echo=AsSlides,eval=FALSE---------------------------------------------
## newTheme <- theme_bw()
## theme_set(newTheme)
## myTheme <- theme_get()


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Titles and Labels

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Titles and Labels
  

"    
  )
  
}



## ---- theme_labs_ggplot2,fig.height=4, fig.width=9-----------------------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot+labs(title="Weight vs Height",y="Height (cm)")


## ---- theme_ggtitle_ggplot2,fig.height=4, fig.width=9--------------------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()
pcPlot+ggtitle("Weight vs Height")+ylab("Height (cm)")


## ---- results='asis',include=TRUE,echo=FALSE-----------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Saving Plots

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Saving Plots
  

"    
  )
  
}



## ---- ggsaving_ggplot2, eval=FALSE,fig.height=4, fig.width=9-------------------------------------------
## 
## pcPlot <- ggplot(data=patients_clean,
##         mapping=aes(x=Weight,y=Height))+geom_point()
## ggsave(pcPlot,filename = "anExampleplot.png",width = 15,
##        height = 15,units = "cm")

