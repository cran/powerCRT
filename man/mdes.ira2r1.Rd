
\name{mdes.ira2r1}
\alias{mdes.ira2r1}
\title{MDES calculation in 2-Level Designs where Individuals are Randomly Assigned at Level-1}

\description{
  \code{mdes.ira2r1} calculates minimum detectable effect size (MDES) for designs with 2-levels where individuals are randomly assigned at level-1.
}

\usage{
  mdes.ira2r1(power=.80, alpha=.05, two.tail=TRUE,
              rho2, omega2,
              P=.50, g2=0, R12=0, RT22=0, 
              n, J, ...)
}

\arguments{
  \item{power}{statistical power (1 - type II error).}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing. }
  \item{rho2}{proportion of variance in the outcome explained by level-2 units.}
  \item{omega2}{treatment effect heterogeneity as ratio of treatment effect variance among level-2 units to the residual variance at level-2.}
  \item{P}{average proportion of level-1 units randomly assigned to treatment within level-2 units.}
  \item{g2}{number of covariates at level-2.}
  \item{R12}{proportion of level-1 variance in the outcome explained by level-1 covariates.}
  \item{RT22}{proportion of treatment effect variance among level-2 units explained by level-2 covariates.}
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

 mdes.ira2r1(rho2=.35, omega2=.10,
             n=83, J=480)
 
  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{

Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.

}
\seealso{
  \code{\link{power.ira2r1}, \link{mrss.ira2r1}, \link{optimal.ira2r1}}
}
\keyword{mdes.ira2r1}
