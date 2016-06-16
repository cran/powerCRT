
\name{power.cra4f3}
\alias{power.cra4f3}
\title{Statistical Power Calculation in 4-Level Designs where Clusters are Randomly Assigned at Level-3 within Fixed Level-4 Units}

\description{
  \code{power.cra4f3} calculates statistical power for designs with 4-levels where clusters are randomly assigned at level-3 within fixed level-4 Units.
}

\usage{
  power.cra4f3(mdes=.25, alpha=.05, two.tail=TRUE,
       rho2, rho3,
       P=.50, R12=0, R22=0, R32=0, g3=0,
       n, J, K, L, ...)
}

\arguments{
  \item{mdes}{minimum detectable effect size.}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing. }
  \item{rho2}{proportion of variance in the outcome explained by level-2 units.}
  \item{rho3}{proportion of variance in the outcome explained by level-3 units.}
  \item{P}{average proportion of level-1 units randomly assigned to treatment within level-2 units.}
  \item{g3}{number of covariates at level-3.}
  \item{R12}{proportion of level-1 variance in the outcome explained by level-1 covariates.}
  \item{R22}{proportion of level-2 variance in the outcome explained by level-2 covariates.}
  \item{R32}{proportion of level-3 variance in the outcome explained by level-3 covariates.}
  \item{n}{harmonic mean of level-1 units across level-2 units (or simple average).}
  \item{J}{harmonic mean of level-2 units across level-3 units (or simple average).}
  \item{K}{harmonic mean of level-3 units across level-3 units (or simple average).}
  \item{L}{number of level-4 units.}
  \item{...}{to handle extra parameters passed from other functions, do not define any additional parameters.}
}


\details{

Power formula was derived within power analysis framework descibed by Hedges & Rhoads (2009). Further definition of design parameters can be found in Dong & Maynard (2013).

}

\value{
  \item{fun}{function name.}
  \item{par}{list of parameters used in power calculation.}
  \item{df}{model degrees of freedom}
  \item{M}{multiplier for MDES calcuation given model degrees of freedom, \eqn{\alpha} and \eqn{\beta} (1-power).}
  \item{power}{statistical power (1 - type II error).}
}


\examples{
\dontrun{

    power.cra4f3(rho3=.15, rho2=.15,
                 n=10, J=4, K=4, L=15)
  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{

Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.

Hedges, L. & Rhoads, C.(2009). Statistical Power Analysis in Education
Research (NCSER 2010-3006). Washington, DC: National Center for Special Education
Research, Institute of Education Sciences, U.S. Department of Education. This report is
available on the IES website at \url{http://ies.ed.gov/ncser/}.

}
\seealso{
  \code{\link{mdes.cra4f3}, \link{mrss.cra4f3}, \link{optimal.cra4f3}}
}
\keyword{power.cra4f3}
