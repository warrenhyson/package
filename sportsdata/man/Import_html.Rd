\name{Import_html}
\alias{Import_html}
\title{
Import HTML
\description{
Given a url and a css_tag it will about a vector of character variables that you are trying to scrape
}
\usage{
Import_html(html = html, css_tag = css_tag)
}

\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

# example of using import_hrml
# 
# This is the function used to get the stats

    url <- "https://www.hockey-reference.com/teams/TBL/2020.html#all_team_stats"
    css_tag <- '#skaters .right , #skaters .poptip , #skaters td'
    
    Scoring_stats <- import_html(html = url, css_tag = css_tag)
