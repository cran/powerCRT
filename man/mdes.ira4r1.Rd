
\name{mdes.ira4r1}
\alias{mdes.ira4r1}
\title{MDES calculation in 4-Level Designs where Individuals are Randomly Assigned at Level-1}

\description{
  \code{mdes.ira4r1} calculates minimum detectable effect size (MDES) for designs with 4-levels where individuals are randomly assigned at level-1.
}

\usage{
  mdes.ira4r1(power=.80, alpha=.05, two.tail=TRUE, 
       rho2, rho3, rho4, omega2, omega3, omega4,
       P=.50, R12=0, RT22=0, RT32=0, RT42=0, g4=0,
       n, J, K, L, ...)
}

\arguments{
  \item{power}{statistical power (1 - type II error).}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing. }
  \item{rho2}{proportion of variance in the outcome explained by level-2 units.}
  \item{rho3}{proportion of variance in the outcome explained by level-3 units.}
  \item{rho4}{proportion of variance in the outcome explained by level-4 units.}
  \item{omega2}{treatment effect heterogeneity as ratio of treatment effect variance among level-2 units to the residual variance at level-2.}
  \item{omega3}{treatment effect heterogeneity as ratio of treatment effect variance among level-3 units to the residual variance at level-3.}
  \item{omega4}{treatment effect heterogeneity as ratio of treatment effect variance among level-4 units to the residual variance at level-4.}
  \item{P}{average proportion of level-1 units randomly assigned to treatment within level-2 units.}
  \item{g4}{number of covariates at level-4.}
  \item{R12}{proportion of level-1 variance in the outcome explained by level-1 covariates.}
  \item{RT22}{proportion of treatment effect variance among level-2 units explained by level-2 covariates.}
  \item{RT32}{proportion of treatment effect variance among level-3 units explained by level-3 covariates.}
  \item{RT42}{proportion of treatment effect variance among level-4 units explained by level-4 covariates.}
  \item{n}{harmonic mean of level-1 units across level-2 units (or simple average).}
  \item{J}{harmonic mean of level-2 units across level-3 units (or simple average).}
  \item{K}{harmonic mean of level-3 units across level-3 units (or simple average).}
  \item{L}{number of level-4 units.}
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

  mdes.ira4r1(rho4=.05, rho3=.15, rho2=.15,
              omega4=.50, omega3=.50, omega2=.50,
              n=10, J=4, L=27, K=4)
  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{

Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.

}
\seealso{
  \code{\link{power.ira4r1}, \link{mrss.ira4r1}, \link{optimal.ira4r1}}
}
\keyword{mdes.ira4r1}
