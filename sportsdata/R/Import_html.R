import_html <- function(html, css_tag){
    require(rvest)
    url <- read_html(html)
    Fun <- url%>%
        html_nodes(css_tag)%>%
        html_text()
}