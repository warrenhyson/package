Lightning_Team_Stats <- function(){
    url <- "https://www.hockey-reference.com/teams/TBL/2020.html#all_team_stats"
    css_tag <- '#team_stats .sort_default_asc , #team_stats .center , #team_stats tr:nth-child(1) .right , #team_stats'
    
    team_stat <- import_html(url, css_tag = css_tag)
    
    team_stat = team_stat[-c(1,2, 54:97)]
    
    
    team_stat <- split(team_stat, ceiling(seq_along(team_stat)/26))
    
    team_stat <- data.frame(matrix(unlist(team_stat), 
                                   nrow=length(team_stat), byrow = T), 
                            stringsAsFactors = F)
    
    names(team_stat) = team_stat[1,]
    
    team_stat = team_stat[-1,]
    
    return(team_stat)
}