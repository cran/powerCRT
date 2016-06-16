
\name{plotT1T2}
\alias{plotT1T2}
\title{Plotting Type I and Type II Error Rates}

\description{
  \code{plotT1T2} plots type I error rate (\eqn{\alpha}) and type II error rate (\eqn{\beta}) using central and noncentral \code{t} distributions from objects returned from \code{powerCRT} functions.
}

\usage{
  plotT1T2(design)
}

\arguments{
  \item{design}{an object returned from one of the \code{powerCRT} functions.}
}


\details{
\code{plotT1T2} plots Type I error rate (\eqn{\alpha}) and Type II error rate (\eqn{\beta}) using  central and noncentral \code{t} distributions from objects returned from \code{powerCRT} functions.

}


\examples{
\dontrun{

     design1 <- mdes.ira2r1(rho2=.35, omega2=.10,
                            n=83, J=480)
     plotT1T2(design1)

  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\seealso{
  \code{\link{plotPars}}
}

\keyword{plotT1T2}
