
\name{mrss.cra3f2}
\alias{mrss.cra3f2}
\title{MRSS calculation for 3-Level Designs where Clusters are Randomly Assigned at Level-2 within Fixed Level-3 Units}

\description{
  \code{mrss.cra3f2} calculates minimum required sample size for one of the levels in designs with 3-levels where clusters are randomly assigned at level-2 within fixed level-3 unit.
}

\usage{
  mrss.cra3f2(mdes=.25, power=.80, alpha=.05, two.tail=TRUE,
              gm=2, ncase=10, constrain="power",
              n=NULL, J=NULL, K=NULL, K0=10, J0=10, tol=.10,
              rho2,
              P=.50, g2=0, R12=0, R22=0)
}

\arguments{
  \item{mdes}{minimum detectable effect size.}
  \item{power}{statistical power (1 - type II error).}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing.}
  \item{gm}{grid multiplier to increase the range of sample size search for each level.}
  \item{ncase}{number of cases to show in the output.}
  \item{constrain}{parameter to contrain; \code{"cost"}, \code{"power"}, or \code{"mdes"}.}
  \item{n}{harmonic mean of level-1 units across level-2 units (or simple average).}
  \item{J}{harmonic mean of level-2 units across level-3 units (or simple average).}
  \item{K}{level-3 sample size.}
  \item{J0}{starting value for estimating number of level-2 units.}
  \item{K0}{starting value for estimating number of level-3 units.}
  \item{tol}{tolerance to stop the search algorithm.}
  \item{rho2}{proportion of variance in the outcome explained by level-2 units.}
  \item{P}{average proportion of level-1 units randomly assigned to treatment within level-2 units.}
  \item{g2}{number of covariates at level-2.}
  \item{R12}{proportion of level-1 variance in the outcome explained by level-1 covariates.}
  \item{R22}{proportion of level-2 variance in the outcome explained by level-2 covariates.}
}


\details{

If level-2 and level-3 sample sizes (\code{J} and \code{K}) are unknown an iterative procedure described in Dong & Maynard (2013) is implemented to obtain MRSS due to model degrees of freedom dependency on \code{J} and \code{K}. For other levels (\code{n}) MRSS calculation is simply solving for the unknown. MRSS equations return values that are not an integer. Rounding may yield MDES and power values different from what was specified. A better solution is approximated using brute force. This may not be possible, however, if other sample sizes are considered to be fixed.

Further definition of design parameters can be found in Dong & Maynard (2013).

}

\value{
  \item{fun}{function name.}
  \item{par}{list of parameters used in MRSS calculation.}
  \item{round.mrss}{solution after rounding.}
  \item{integer.mrss}{best integer solutions around \code{round.mrss} solution.}
}


\examples{
\dontrun{

     mrss.cra3f2(rho3=.06, rho2=.17,
                 n=15, J=3)

  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{


Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.


}

\seealso{
  \code{\link{mdes.cra3f2}, \link{power.cra3f2}, \link{optimal.cra3f2}}
}
\keyword{mrss.cra3f2}
