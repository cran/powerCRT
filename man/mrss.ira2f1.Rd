
\name{mrss.ira2f1}
\alias{mrss.ira2f1}
\title{MRSS calculation for 2-Level Designs where Individuals are Randomly Assigned at Level-1 within Fixed Level-2 units}

\description{
  \code{mrss.ira2f1} calculates minimum required sample size for one of the levels in designs with 2-levels where individuals are randomly assigned at level-1 within fixed level-2 units.
}

\usage{
  mrss.ira2f1(mdes=.25, power=.80, alpha=.05, two.tail=TRUE,
              gm=2, ncase=10, constrain="power",
              n=NULL, J=NULL, J0=10, n0=10, tol=.10,
              P=.50, g1=0, R12=0)
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
  \item{J}{level-2 sample size.}
  \item{n0}{starting value for estimating number of level-1 units.}
  \item{J0}{starting value for estimating number of level-2 units.}
  \item{tol}{tolerance to stop the search algorithm.}
  \item{P}{average proportion of level-1 units randomly assigned to treatment within level-2 units.}
  \item{g1}{number of covariates at level-1.}
  \item{R12}{proportion of level-1 variance in the outcome explained by level-1 covariates.}
}


\details{

If level-1 or level-2 sample size (\code{n} and \code{J}) is unknown an iterative procedure described in Dong & Maynard (2013) is implemented to obtain MRSS due to model degrees of freedom dependency on \code{n} and \code{J}. MRSS equations return values that are not an integer. Rounding may yield MDES and power values different from what was specified. A better solution is approximated using brute force. This may not be possible, however, if other sample sizes are considered to be fixed.

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

     mrss.ira2f1(n=83)

  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{


Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.


}

\seealso{
  \code{\link{mdes.ira2f1}, \link{power.ira2f1}, \link{optimal.ira2f1}}
}
\keyword{mrss.ira2f1}
