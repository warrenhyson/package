Lightning_Roster <- function(){
    url <- "https://www.hockey-reference.com/teams/TBL/2020.html#all_team_stats"
    css_tag <- '#roster .right+ .right , #roster .center+ .right , .left~ .left+ .right , #roster .center+ .center , #roster .sort_default_asc , #roster .left , #roster tbody .center'
    roster <- import_html(url,css_tag)
    
    roster <- split(roster, ceiling(seq_along(roster)/12))
    
    roster <- data.frame(matrix(unlist(roster), 
                                nrow=length(roster), byrow = T), 
                         stringsAsFactors = F)
    
    names(roster) = roster[1,]
    
    roster = roster[-1,]
}