
\name{mdes.ira1r1}
\alias{mdes.ira1r1}
\title{MDES calculation in Designs where Individuals are Randomly Assigned to Treatment and Control}

\description{
  \code{mdes.ira1r1} calculates minimum detectable effect size (MDES) for designs where individuals are randomly assigned to treatment and control.
}

\usage{
  mdes.ira1r1(power=.80, alpha=.05, two.tail=TRUE,
              P=.50, g1=0, R12=0,
              n, ...)
}

\arguments{
  \item{power}{statistical power (1 - type II error).}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing. }
  \item{P}{proportion of units randomly assigned to treatment.}
  \item{g1}{number of covariates.}
  \item{R12}{proportion of variance in the outcome explained by covariates.}
  \item{n}{sample size.}
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

 mdes.ira1r1(n=55)
 
  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{

Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.

}
\seealso{
  \code{\link{power.ira1r1}, \link{mrss.ira1r1}, \link{optimal.ira1r1}}
}
\keyword{mdes.ira1r1}
