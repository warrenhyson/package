Lightning_Scoring <- function(){
    
    #Packages needed
    require(lubridate)
    require(dplyr)
    require(rvest)
    
    #Converting the html to a vector using rvest
    url <- "https://www.hockey-reference.com/teams/TBL/2020.html#all_team_stats"
    css_tag <- '#skaters .right , #skaters .poptip , #skaters td'
    
    Scoring_stats <- import_html(html = url, css_tag = css_tag)
    
    #spliting the vector into 29 pieces 
    Scoring_stats <- split(Scoring_stats, ceiling(seq_along(Scoring_stats)/29))
    
    #Converting the list into a dataframe
    Scoring_stats <- data.frame(matrix(unlist(Scoring_stats), 
                                       nrow=length(Scoring_stats), byrow = T), 
                                stringsAsFactors = F)
    
    #Cleaning up the names
    names <- as.character(unlist(Scoring_stats[1,]))
    
    colnames(Scoring_stats) <- names
    
    Scoring_stats <- Scoring_stats[-1, -1]
    
    #making the columns the right variable type 
    i <- grep('[0:9]', Scoring_stats)
    r <- grep(':', Scoring_stats, ignore.case = F) 
    i <- i[! i %in% r]
    
    ### look into
    #Scoring_stats[] <- lapply(Scoring_stats,function(x) as.numeric(as.character(x)))
    
    Scoring_stats[, i] <-  sapply(Scoring_stats[, i], as.numeric)
    Scoring_stats$ATOI <- ms(Scoring_stats$ATOI)
    
    Scoring_stats$Pos <- factor(Scoring_stats$Pos)
    
    #removing 'Total Stats'
    l <- nrow(Scoring_stats)
    
    Scoring_stats <- Scoring_stats[-l, ]
    
    return(Scoring_stats) 
}