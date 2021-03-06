# plots Type I  and Type II error rates
plotT1T2 <- function(design){

  # change object returned from 'optimal.design' and 'mrss.design'
  # to 'mdes' object type
  if(substr(design$fun,1,7)=="optimal"){
      design <- optimal.to.mdes(design)
  }else if(substr(design$fun,1,4)=="mrss"){
      design <- mrss.to.mdes(design)
  }

  # plot function
  t1t2 <- function(ncp, df, alpha, two.tail){
    # t-critical, and power
    talpha <- ifelse(two.tail==FALSE, abs(qt(alpha, df)), abs(qt(alpha/2,df)))
    beta= pt(talpha, df, ncp)
    power= 1-beta

    # define functions for central and non-central t distributions
    funt0 <- function(x){dt(x, df = df, ncp = 0)} # central
    funt1 <- function(x){dt(x, df = df, ncp = ncp)} #non-central

    # plot central t distribution
    plot(funt0, xlim=c(-3,7), ylim = c(0, 0.5), yaxs="i", xaxs="i", bty="l",
         main = expression(paste("Type I ",(alpha)," and "," Type II ",(beta)," Error Rates")),
         sub=paste("Type I =", round(alpha,digits=3), ",",
                   "Type II =", round(beta,digits=3), ",",
                   "Power =", round(power,digits=3)),
         xlab="", ylab="")
    par(new=TRUE)
    # plot non-central t distribution
    plot(funt1, xlim=c(-3,7), ylim = c(0, 0.5), yaxs="i", xaxs="i", yaxt="n", xaxt="n", bty="l",
         xlab="", ylab="")
    legend("topright", title="Shaded Areas", c(expression(alpha), expression(beta)),
           x.intersp = 0.5, y.intersp = 0.75,
           pch=c(19,19), col=c(adjustcolor(2, alpha.f=0.3),adjustcolor(4, alpha.f=0.3)))
    legend("right", title="Dashed Lines", c(ifelse(two.tail==TRUE,expression(t[alpha/2]),
                                                   expression(t[alpha])), expression(ncp)),
           x.intersp = 0.5, y.intersp = 0.75,
           lty=2, col=c(2,4))

    # axes labels and subtitle
    title(ylab="f(t)", line=2)
    title(xlab="t", line=2)

    # draw vertical lines
    abline(v=0, lty=2, col=4) # mean of central t in dashed blue line
    abline(v=ncp, lty=2, col=4) # mean of non-central t in dashed blue line
    abline(v=talpha, lty=2, col=2) # t-critical in dashed red line

    # shaded area in red for alpha
    xalpha0 <- seq(from=talpha, to=9, by=.001)
    yalpha0 <- rep(NA, length(xalpha0))
    for(i in 1:length(xalpha0)){yalpha0[i] <- funt0(xalpha0[i])}

    xalpha <- c(xalpha0,rev(xalpha0))
    yalpha <- c(yalpha0,rep(0, length(yalpha0)))
    polygon(x=xalpha, y=yalpha, col=adjustcolor(2, alpha.f=0.3))

    # shaded area in light blue for beta
    xbeta0 <- seq(from=-2,to=talpha, by=.001)
    ybeta0 <- rep(NA, length(xbeta0))
    for(i in 1:length(xbeta0)){ybeta0[i] <- funt1(xbeta0[i])}

    xbeta <- c(xbeta0,rev(xbeta0))
    ybeta <- c(ybeta0,rep(0, length(ybeta0)))
    polygon(x=xbeta, y=ybeta, col=adjustcolor(4, alpha.f=0.3))

    # distribution names
    text(0, .45, "ncp=0.00")
    text(ncp, .48, paste0("ncp=",round(ncp,2)))
  }
    # plot type I and type II error rates
    if(substr(design$fun,1,4)=="mdes"){
      return(t1t2(ncp=design$M,
                  df=design$df,
                  alpha=design$par$alpha,
                  two.tail=design$par$two.tail))
    }else if(substr(design$fun,1,5)=="power"){
      return(t1t2(ncp=design$lamda,
                  df=design$df,
                  alpha=design$par$alpha,
                  two.tail=design$par$two.tail))
    }

}

# example
# design1 <- mdes.cra4f3(rho3=.15, rho2=.15, n=10, J=4, L=27, K=4)
# design2 <- power.cra4f3(rho3=.15, rho2=.15, n=10, J=4, L=27, K=4)
# plotT1T2(design1)
# plotT1T2(design2)

