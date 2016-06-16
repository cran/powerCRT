
\name{mrss.cra4r4}
\alias{mrss.cra4r4}
\title{MRSS calculation for 4-Level Designs where Clusters are Randomly Assigned at Level-4}

\description{
  \code{mrss.cra4r4} calculates minimum required sample size for one of the levels in designs with 4-levels where clusters are randomly assigned at level-4.
}

\usage{
  mrss.cra4r4(mdes=.25, power=.80, alpha=.05, two.tail=TRUE,
              gm=2, ncase=10, constrain="power",
              n=NULL, J=NULL, K=NULL, L=NULL, L0=10, tol=.10,
              rho2, rho3, rho4,
              P=.50, R12=0, R22=0, R32=0, R42=0, g4=0)
}
\arguments{
  \item{mdes}{minimum detectable effect size.}
  \item{power}{statistical power (1 - type II error).}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing.}
  \item{gm}{grid multiplier to increase the range of sample size search for each level.}
  \item{ncase}{number of cases to show in the output.}
  \item{constrain}{parameter to constrain; \code{"cost"}, \code{"power"}, or \code{"mdes"}.}
  \item{n}{harmonic mean of level-1 units across level-2 units (or simple average).}
  \item{J}{harmonic mean of level-2 units across level-3 units (or simple average).}
  \item{K}{harmonic mean of level-3 units across level-3 units (or simple average).}
  \item{L}{number of level-4 units.}
  \item{L0}{starting value for estimating number of level-4 units.}
  \item{tol}{tolerance to stop the search algorithm.}
  \item{rho2}{proportion of variance in the outcome explained by level-2 units.}
  \item{rho3}{proportion of variance in the outcome explained by level-3 units.}
  \item{rho4}{proportion of variance in the outcome explained by level-4 units.}
  \item{P}{average proportion of level-1 units randomly assigned to treatment within level-2 units.}
  \item{g4}{number of covariates at level-4.}
  \item{R12}{proportion of level-1 variance in the outcome explained by level-1 covariates.}
  \item{R22}{proportion of level-2 variance in the outcome explained by level-2 covariates.}
  \item{R32}{proportion of level-3 variance in the outcome explained by level-3 covariates.}
  \item{R42}{proportion of level-4 variance in the outcome explained by level-4 covariates.}
}


\details{

If level-4 sample size (\code{L}) is unknown an iterative procedure described in Dong & Maynard (2013) is implemented to obtain MRSS due to model degrees of freedom dependency on \code{L}. For other levels (\code{n, J} or \code{K}) MRSS calculation is simply solving for the unknown. MRSS equations return values that are not an integer. Rounding may yield MDES and power values different from what was specified. A better solution is approximated using brute force. This may not be possible, however, if other sample sizes are considered to be fixed.

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

     mrss.cra4r4(rho4=.05, rho3=.05, rho2=.10,
                 n=10, J=2, K=3)

  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{


Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.


}

\seealso{
  \code{\link{mdes.cra4r4}, \link{power.cra4r4}, \link{optimal.cra4r4}}
}
\keyword{mrss.cra4r4}
