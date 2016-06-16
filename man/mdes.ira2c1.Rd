
\name{mdes.ira2c1}
\alias{mdes.ira2c1}
\title{MDES calculation in 2-Level Designs where Individuals are Randomly Assigned at Level-1 within Constant Level-2 units}

\description{
  \code{mdes.ira2c1} calculates minimum detectable effect size (MDES) for designs with 2-levels where individuals are randomly assigned at level-1 within constant level-2 units.
}

\usage{
  mdes.ira2c1(power=.80, alpha=.05, two.tail=TRUE,
              P=.50, g1=0, R12=0, 
              n, J, ...)
}

\arguments{
  \item{power}{statistical power (1 - type II error).}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing. }
  \item{P}{average proportion of level-1 units randomly assigned to treatment within level-2 units.}
  \item{g1}{number of covariates at level-1.}
  \item{R12}{proportion of level-1 variance in the outcome explained by level-1 covariates.}
  \item{n}{harmonic mean of level-1 units across level-2 units (or simple average).}
  \item{J}{level-2 sample size.}
  \item{...}{to handle extra parameters passed from other functions, do not define any additional parameters.}
}
  
\value{
  \item{fun}{function name.}
  \item{par}{list of parameters used in MDES calculation.}
  \item{df}{model degrees of freedom}
  \item{M}{multiplier for MDES calcuation given model degrees of freedom, \eqn{\alpha} and \eqn{\beta} (1-power).}
  \item{mdes}{minimum detectable effect size and 95\% lower and upper confidence limits.}
}

\details{

MDES formula and further definition of design parameters can be found in Dong & Maynard (2013).

}

\examples{
\dontrun{

 mdes.ira2c1(n=55, J=3)
 
  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{

Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.

}
\seealso{
  \code{\link{power.ira2c1}, \link{mrss.ira2c1}, \link{optimal.ira2c1}}
}
\keyword{mdes.ira2c1}
