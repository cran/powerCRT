
\name{optimal.ira1r1}
\alias{optimal.ira1r1}
\title{Optimal Sample Size Calculation in Designs where Individuals are Randomly Assigned to Treatment and Control}

\description{
  \code{optimal.ira1r1} calculates optimal sample sizes  for designs where individuals are randomly assigned to treatment and control. Optimal sample size can be estimated in the following forms, (i) under budgetary constraints given marginal costs per unit, (ii) under power contraints given marginal costs per unit, (iii) under MDES contraints given marginal costs per unit, and (iv) under sample size contraints for one or more levels along with any of the i,ii, iii options.
}

\usage{
  optimal.ira1r1(cn, cost=NULL, n=NULL,
                 power=.80, mdes=.25, alpha=.05, two.tail=TRUE,
                 N0=c(10), ncase=10, gm=10,
                 constrain="cost", optimizer="auglag_cobyla",
                 P=.50, g1=0, R12=0)
}

\arguments{
  \item{cn}{marginal cost per unit.}
  \item{cost}{total cost or budget.}
  \item{n}{included for consistency, it should remain \code{NULL}.}
  \item{power}{statistical power (1 - type II error).}
  \item{mdes}{minimum detectable effect size.}
  \item{alpha}{probability of type I error.}
  \item{two.tail}{logical; \code{TRUE} for two-tailed hypothesis testing, \code{FALSE} for one-tailed hypothesis testing.}
  \item{N0}{starting values for n.}
  \item{ncase}{number of cases to show in the output.}
  \item{gm}{grid multiplier to increase the range of sample size search.}
  \item{constrain}{one of the followings can be constrained at a specified cost or value: \code{"cost"}, \code{"power"}, or \code{"mdes"}.}
  \item{optimizer}{algorithm to find optimal sample sizes given total cost, power, or MDES. Available algorithms: \code{"auglag_cobyla"}, \code{"auglag_lbfgs"}, \code{"auglag_mma"}, or \code{"auglag_slsqp"}.}
  \item{P}{proportion of units randomly assigned to treatment.}
  \item{g1}{number of covariates.}
  \item{R12}{proportion of variance in the outcome explained by covariates.}
}


\details{

Optimal sample sizes (Raudenbush, 1997; Raudenbush & Liu, 2000) are estimated  using \code{nloptr} (Ypma, 2014) package, an implementation of NLopt (Johnson, n.d.) in \R (R Development Core Team, 2008). More specifically, Augmented Lagrangian method is used for global optimization (AUGLAG, Birgin & Martines, 2008; Conn, Gould, & Toint, 1991) in conjuction with one of the following local optimization algorithms: Constrained Optimization by Linear Approximations (COBYLA, Powell, 1994), Low Storage BFGS (LBFGS, Liu & Nocedal, 1989), Method of Moving Asymptotes (MMA, Svanberg, 2002), or Sequental Least-Squares Quadratic Programming (SLSQP, Kraft, 1988). See \href{http://ab-initio.mit.edu/wiki/index.php/NLopt_Algorithms}{NLopt website} for a brief summary.

Further definition of design parameters can be found in Dong & Maynard (2013).

}

\value{
  \item{fun}{function name.}
  \item{par}{list of parameters used in optimal sample estimation.}
  \item{nloptr}{list of \code{nloptr} log and output.}
  \item{round.optim}{solution after rounding.}
  \item{integer.optim}{best integer solutions around \code{round.optim} solution.}
}


\examples{
\dontrun{

     optimal.ira1r1(cn=1, cost=560,
                    constrain="cost")

  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{
Birgin, E. G., Martinez, J. M. (2008) Improving ultimate convergence of an augmented Lagrangian method. \emph{Optimization Methods and Software 23(2)}, 177-195.


Conn, A. R., Gould, N. I. M., & Toint, P.L. (1991). A globally convergent augmented Lagrangian algorithm for optimization with general constraints and simple bounds. \emph{SIAM J. Numer. Anal. 28(2)}, 545-572.

Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.

Hedges, L. & Rhoads, C.(2009). Statistical Power Analysis in Education
Research (NCSER 2010-3006). Washington, DC: National Center for Special Education
Research, Institute of Education Sciences, U.S. Department of Education. This report is available on the IES website at \url{http://ies.ed.gov/ncser/}.

Johnson, S. G. (n.d.). The NLopt nonlinear-optimization package. Package available at \url{http://ab-initio.mit.edu/nlopt}.

Kraft, D. (1988). A software package for sequential quadratic programming. Obersfaffeuhofen, Germany: DFVLR.

Liu, D. C., & Nocedal, J. (1989). On the limited memory BFGS method for large scale optimization. \emph{Mathematical programming, 45(1-3)}, 503-528.

Powell, M. J. (1994). A direct search optimization method that models the objective and constraint functions by linear interpolation. In Advances in optimization and numerical analysis (pp. 51-67). Springer Netherlands.

R Development Core Team (2008). R: A language and environment for statistical computin . R Foundation for Statistical Computing, Vienna, Austria. ISBN 3-900051-07-0, \url{http://www.R-project.org}.

Raudenbush, S. W. (1997). Statistical analysis and optimal
design for cluster randomized trials. \emph{Psychological Methods,
2}, 173-185.

Raudenbush, S. W., & Liu, X. (2000). Statistical power and
optimal design for multisite trials. \emph{Psychological Methods, 5}, 199-213.

Svanberg, K. (2002). A class of globally convergent optimization methods based on conservative convex separable approximations. \emph{SIAM journal on optimization, 12(2)}, 555-573.

Ypma, J. (2014). \code{nloptr}: R interface to NLopt. R package version 1.0.4. Package available at \url{https://cran.r-project.org/package=nloptr}

}
\seealso{
  \code{\link{mdes.ira1r1}, \link{power.ira1r1}, \link{mrss.ira1r1}}
}
\keyword{optimal.ira1r1}
