% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\name{sample_submission}
\alias{sample_submission}
\title{sample_submission.csv.gz}
\usage{
sample_submission(path = "../datasets", force = FALSE)
}
\arguments{
\item{path}{(string) chosen dir to store the data}

\item{force}{(boolean) If file already exists, should it be downloaded again anyway?}
}
\value{
data.frame
}
\description{
Download and load of sample_submission.csv.gz
}
\examples{

sample_submission <- sample_submission()

}
