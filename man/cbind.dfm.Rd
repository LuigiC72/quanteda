% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dfm-classes.R
\name{cbind.dfm}
\alias{cbind.dfm}
\alias{rbind.dfm}
\title{Combine dfm objects by Rows or Columns}
\usage{
\method{cbind}{dfm}(...)

\method{rbind}{dfm}(...)
}
\arguments{
\item{...}{\link{dfm}, numeric, or matrix  objects to be joined column-wise
(\code{cbind}) or row-wise (\code{rbind}) to the first.  Numeric objects
not confirming to the row or column dimension will be recycled as normal.}
}
\description{
Combine a \link{dfm} with another dfm, or numeric, or matrix object, 
returning a dfm with the combined documents or features, respectively.
}
\details{
\code{cbind(x, y, ...)} combines dfm objects by columns, returning a
  dfm object with combined features from input dfm objects.  Note that this 
  should be used with extreme caution, as joining dfms with different 
  documents will result in a new row with the docname(s) of the first dfm, 
  merging in those from the second.  Furthermore, if features are shared 
  between the dfms being cbinded, then duplicate feature labels will result. 
  In both instances, warning messages will result.

\code{rbind(x, y, ...)} combines dfm objects by rows, returning a dfm
  object with combined features from input dfm objects.  Features are matched
  between the two dfm objects, so that the order and names of the features
  do not need to match.  The order of the features in the resulting dfm
  is not guaranteed.  The attributes and settings of this new dfm are not
  currently preserved.
}
\examples{
# cbind() for dfm objects
(dfm1 <- dfm(c("a b c d", "c d e f")))
(dfm2 <- dfm(c("a b", "x y z")))
cbind(dfm1, dfm2)
cbind(dfm1, 100)
cbind(100, dfm1)
cbind(dfm1, matrix(c(101, 102), ncol = 1))
cbind(matrix(c(101, 102), ncol = 1), dfm1)


# rbind() for dfm objects
(dfm1 <- dfm(c(doc1 = "This is one sample text sample."), verbose = FALSE))
(dfm2 <- dfm(c(doc2 = "One two three text text."), verbose = FALSE))
(dfm3 <- dfm(c(doc3 = "This is the fourth sample text."), verbose = FALSE))
rbind(dfm1, dfm2)
rbind(dfm1, dfm2, dfm3)
}
\keyword{dfm}
\keyword{internal}
