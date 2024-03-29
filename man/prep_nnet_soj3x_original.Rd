% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utils.R
\name{prep_nnet_soj3x_original}
\alias{prep_nnet_soj3x_original}
\title{Prepare ActiGraph data for entry into the Sojourn neural network}
\usage{
prep_nnet_soj3x_original(
  df,
  variable = c("counts", "counts.2", "counts.3", "vect.mag"),
  suffix = ""
)
}
\arguments{
\item{df}{The ActiGraph data}

\item{variable}{The variable to prepare}
}
\description{
Prepare ActiGraph data for entry into the Sojourn neural network
}
\keyword{internal}
