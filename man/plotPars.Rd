
\name{plotPars}
\alias{plotPars}
\title{Plotting MDES, power, and MRSS}

\description{
  \code{plotPars} produces plots for MDES, power and MRSS using objects returned from \code{powerCRT} functions.
}

\usage{
  plotPars(design, pars=c("power","mdes",NA), type="p",
            left.right.angle=30, up.down.angle=30, nlevels=10,
            mdes.seq=NULL, power.seq=NULL, mrss.seq=NULL,...)
}

\arguments{
  \item{design}{an object returned from one of the \code{powerCRT} functions.}
  \item{pars}{character vector; valid values are \code{"mdes"}, \code{"power"}, and depending on the design, any one of the \code{"n"}, \code{"J"}, \code{"K"}, or \code{"L"}. Default vector \code{c("power","mdes",NA)} produces a three dimensional plot where \code{NA} is replaced by top level sample size. To override the default user should replace \code{NA} with any one of the \code{"n"}, \code{"J"}, \code{"K"}, or \code{"L"}. Including only two parameters produces two dimensional plot. One of the parameters must be either \code{"mdes"}, or \code{"power"}.}
  \item{type}{character value; \code{"p"} for plot, \code{"c"} for contour.}
  \item{left.right.angle}{numeric value; rotates 3D graph from left to right.}
  \item{up.down.angle}{numeric value; rotates 3D graph from up to down.}
  \item{nlevels}{number of contour levels.}
  \item{mdes.seq}{sequence for MDES.}
  \item{power.seq}{sequence for power.}
  \item{mrss.seq}{sequence for MRSS.}
  \item{...}{other graphical parameters.}

}


\details{
\code{plotPars} produces plots for MDES, power and MRSS using objects returned from \code{powerCRT} functions. User can plot 2D, 3D or contour plots by specifying \code{pars} and \code{type} arguments. By default object returned from \code{mdes} functions produces plots where MDES is on top axis (either y or z), similarly, object returned from \code{power} functions produces plots where power is on top axis (either y or z). However user can switch between \code{mdes} and \code{power} functions to obtain an alternative plot. For objects returned from \code{mrss} or \code{optimal} functions by default MDES is on top axis (either y or z). User can change this by specifying \code{pars} arguments where its first argument matches with parameter to be plotted on top axis (either y or z).

}


\examples{
\dontrun{

     design1 <- mdes.ira2r1(rho2=.35, omega2=.10,
                            n=83, J=480)
     # MDES against power & J (3D plot)
     plotPars(design1)
     # MDES against power & J (contour plot)
     plotPars(design1, type="c")
     # MDES against J (2D plot)
     plotPars(design1, pars=c("mdes","J"))

  }
}

\author{
  Metin Bulus \email{bulus.metin@gmail.com}
}


\seealso{
  \code{\link{plotT1T2}, \link{contour}, \link{persp}, \link{plot}}
}
\keyword{plotPars}
