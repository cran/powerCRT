\name{powerCRT}
\alias{powerCRT}
\title{Introduction to \code{powerCRT}}
\description{
  \code{powerCRT} is inspired by \emph{PowerUp!},  a statistical power analysis tool to calculate minimum detectable effect size (MDES) and top level minimum required sample size (MRSS) for various experimental and quasi-experimental designs including cluster randomized trials (Dong & Maynard, 2013). \code{powerCRT} package, however, solely focuses on cluster randomized trials and adds several additional features. The package bases its framework on three fundemental concepts in statistical power analysis; power, MDES, and MRSS. Congruent with this framework, \code{powerCRT} additionally provides tools to calculate power, MRSS for any level, and optimal sample sizes under various constraints (Hedges & Borenstein, 2014; Raudenbush, 1997; Raudenbush & Liu, 2000). Optimal sample sizes can be estimated in the following forms, (i) under budgetary constraints given marginal costs per unit, (ii) under power constraints given marginal costs per unit, (iii) under MDES constraints given marginal costs per unit, and (iv) under sample size constraints for one or more levels along with any of the i,ii, iii options. Congruent with the three fundemental concepts the package also provides tools for graphing two and three dimensional relationships to investiage relative standing of design parameter under investigation.

A design parameter (one of the MDES, MRSS, power, or optimal sample size) can be requested by using approriate function given design characteristics. Except for graphing functions, each function begins with an \strong{output} name, following by a period, and a \strong{design} name. There are four types of output; \code{mdes},  \code{power}, \code{mrss}, and \code{optimal}, and 14 types of design; \code{ira1r1}, \code{ira2r1}, \code{ira2f1}, \code{ira2c1}, \code{cra2r2}, \code{ira3r1}, \code{cra3r2}, \code{cra3f2}, \code{cra3r3}, \code{ira4r1}, \code{cra4r2}, \code{cra4r3}, \code{cra4f3}, and \code{cra4r4}. The first three letters of the design stands for the type of assignment, for individual assignment \code{ira}, and for cluster random assignment \code{cra}. It is followed by a number indicating number of levels. A single letter followed by a number indicates whether a block is considered to be \code{r}, random; \code{f}, fixed; or \code{c}, constant and the level at which random assingment takes place. Note that if random assignment takes place at lower levels it is a blocked design. So, to find MDES for 2-level cluster randomized blocked design where random assignment is at level-1, function \code{mdes.cra2r1} is used.

Each function requires slightly different arguments depending on the output it produces and the design. Most of the arguments have default values to provide users a starting point. For all functions default values are
\itemize{
  \item{\code{mdes} = .25}
  \item{\code{power} (\eqn{1-\beta}) = .80}
  \item{\code{alpha} (\eqn{\alpha}) = .05}
  \item{\code{two.tail} = \code{TRUE}}
  \item{\code{P} = .50}
}
and depending on the design
\itemize{
  \item{any of one of \code{g1, g2, g3, g4} = 0}
  \item{any sequence of \code{R12, R22, R32, R42} = 0}
  \item{any sequence of \code{RT22, RT32, RT42} = 0}
}
Users should be aware of default values and change them if necessary. Depending on the function minimum required arguments are
\itemize{
  \item{any sequence of \code{rho2, rho3, rho4}}
  \item{any sequence of \code{omega2, omega3, omega4}}
  \item{any one of, any sequence of, or any combination of \code{n, J, K, L}}
}
For definition of above-mentioned parameters see Dong & Maynard (2013) and Hedges & Rhoads (2009), or help files for individual functions. For reference intraclass correlation (\code{rho2, rho3}) values see Hedberg and Hedges (2014), Hedges and Hedberg (2007, 2013), Schochet (2008), Spybrook, Westine, and Taylor (2016). For reference variance (\code{R12, R22, R32}) values see Bloom, Richburg-Hayes, and Black (2007), Deke et al. (2010), Hedges and Hedberg (2013), Spybrook, Westine,and Taylor (2016), Westine, Spybrook, and Taylor (2013). For reference sample size values see Spybrook, Westine, and Taylor (2016). Users can also obtain design parameters for various levels using publicly available state or district data.

Click for the \href{http://rpubs.com/metinbulus/powerCRT}{vignette} demonstrating how to use \code{powerCRT} package.

Please email me any issues or suggestions.
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}

\references{
Bloom, H. S., Richburg- Hayes, L. & Black, A. R. (2007).  Using Covariates to Improve Precision for Studies that Randomize Schools to Evaluate Educational Interventions.  \emph{Educational Evaluation and Policy Analysis, 29(1)}, 0-59.

Deke, John, Dragoset, Lisa, and Moore, Ravaris (2010). Precision Gains from Publically Available School Proficiency Measures Compared to Study-Collected Test Scores in Education Cluster-Randomized Trials (NCEE 2010-4003). Washington, DC: National Center for Education Evaluation and Regional Assistance, Institute of Education Sciences, U.S. Department of Education.  \url{http://ies.ed.gov/ncee/pubs/20104003/}

Dong & Maynard (2013). PowerUp!: A Tool for Calculating Minum Detectable Effect Sizes and Minimum Required Sample Sizes for Experimental and Quasi-Experimental Design Studies,\emph{Journal of Research on Educational Effectiveness, 6(1)}, 24-6.

Hedges, L. V., & Borenstein, M. (2014). Conditional Optimal Design in Three- and Four-Level Experiments. \emph{Journal of Educational and Behavioral Statistics, 39(4)}, 257-281

Hedberg, E., & Hedges, L. V.(2014). Reference Values of Within-District Intraclass Correlations of Academic Achivement by District Characteristics: Results From a Meta-Analysis of District-Specified Values. \emph{Evaluation Review, 38(6)}, 546-582.

Hedges, L. V., & Hedberg, E. (2007). Interclass correlation values for planning group-randomized trials in education. \emph{Educational Evaluation and Policy Analysis, 29(1)}, 60-87.

Hedges, L. V., & Hedberg, E. (2013). Interclass Correlations and Covariate Outcome Correlations for Planning Two- and Three-Level Cluster-Randomized Experiments in Education. \emph{Evaluation Review, 37(6)}, 445-489.

Hedges, L. & Rhoads, C.(2009). Statistical Power Analysis in Education Research (NCSER 2010-3006). Washington, DC: National Center for Special Education Researc , Institute of Education Sciences, U.S. Department of Education. This report is available on the IES website at \url{http://ies.ed.gov/ncser/}.

Raudenbush, S. W. (1997). Statistical analysis and optimal
design for cluster randomized trials. \emph{Psychological Methods,
2}, 173-185.

Raudenbush, S. W., & Liu, X. (2000). Statistical power and
optimal design for multisite trials. \emph{Psychological Methods, 5}, 199-213.

Schochet, P. Z. (2008). Statistical Power for Random Assignment Evaluations of Education Programs. \emph{Journal of Educational and Behavioral Statistics, 33(1)}, 62-87

Spybrook, J., Westine, C. D., & Taylor, J. A. (2016). Design Parameters for Impact Research in Science Education: A Multisite Anlaysis. \emph{AERA Open, 2(1)}, 1-15.

Westine, C. D., Spybrook, J.,  & Taylor, J. A. (2013). An Empirical Investigation of Variance Design Parameters for Planning Cluster-Randomized Trials of Science Achievement. \emph{Evaluation Review, 37(6)}, 490-519.

}

\keyword{intro.powerCRT}
