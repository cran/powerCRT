mdes.ira3r1 <- function(power=.80, alpha=.05, two.tail=TRUE,
                        rho2, rho3, omega2, omega3,
                        P=.50, R12=0, RT22=0, RT32=0, g3=0,
                        n, J, K, ...){
  df = K-g3-1
  T1 <- ifelse(two.tail==TRUE,abs(qt(alpha/2,df)),abs(qt(alpha,df)))
  T2 = abs(qt(power,df))
  M <- ifelse(power>=.5,T1+T2,T1-T2)
  mdes = M*sqrt(rho3*omega3*(1-RT32)/K +
                rho2*omega2*(1-RT22)/(J*K) +
               (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*K*n))
  LCI = mdes*(1 - T1/M)
  UCI = mdes*(1 + T1/M)
  MLU <- cbind(mdes, LCI, UCI)
  colnames(MLU) <- c("mdes", "95% LCL", "95% UCL")
  fun <- "mdes.ira3r1"
  par <- list(power=power, alpha=alpha, two.tail=two.tail,
              rho2=rho2, rho3=rho3, omega2=omega2, omega3=omega3,
              P=P, g3=g3, R12=R12, RT22=RT22, RT32=RT32,
              n=n, J=J, K=K)
  return(list(fun=fun,par=par,df=df,M=M,mdes=round(MLU,digits=3)))
}

# example
# mdes.ira3r1(rho3=.20, rho2=.15, omega3=.10, omega2=.10, n=69, J=10, K=100)


power.ira3r1 <- function(mdes=.25, alpha=.05, two.tail=TRUE,
                         rho2, rho3, omega2, omega3,
                         P=.50, R12=0, RT22=0, RT32=0, g3=0,
                         n, J, K, ...){
  df = K-g3-1
  lamda <- mdes/sqrt(rho3*omega3*(1-RT32)/K +
                     rho2*omega2*(1-RT22)/(J*K) +
                    (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*K*n))
  power <- ifelse(two.tail==FALSE,
                  1-pt(qt(alpha,df,lower.tail=FALSE),df,lamda),
                  1-pt(qt(alpha/2,df,lower.tail=FALSE),df,lamda)+
                    pt(-qt(alpha/2,df,lower.tail=FALSE),df,lamda))
  fun <- "power.ira3r1"
  par <- list(mdes=mdes, alpha=alpha, two.tail=two.tail, 
              rho2=rho2, rho3=rho3, omega2=omega2, omega3=omega3,
              P=P, g3=g3, R12=R12, RT22=RT22, RT32=RT32,
              n=n, J=J, K=K)
  return(list(fun=fun,par=par,df=df,lamda=lamda,power=round(power,digits=3)))
}
# example
# power.ira3r1(rho3=.20, rho2=.15, omega3=.10, omega2=.10, n=69, J=10, K=100)


# gm = grid multiplier: default 2
# ncase = numer of fixed samples in the output
# constrain = "power", or "mdes" :  default "power"
mrss.ira3r1 <- function(mdes=.25, power=.80, alpha=.05, two.tail=TRUE,
                        gm=2, ncase=10, constrain="power",
                        n=NULL, J=NULL, K=NULL, K0=10, tol=.10,
                        rho2, rho3, omega2, omega3,
                        P=.50, R12=0, RT22=0, RT32=0, g3=0){
  
  # sample size for one level allowed to be null, the rest must be specified
  check.NULL <- c(is.null(n),is.null(J),is.null(K))
  if(length(check.NULL[check.NULL==TRUE])>1){
    stop("Specify two of the n, J, K.")
  }
  
  # equality constraints on power
  eq.power <- function(nJK){
    n <- nJK[1]
    J <- nJK[2]
    K <- nJK[3]
    df = (K-g3-1)[[1]]
    lamda <- mdes/sqrt(rho3*omega3*(1-RT32)/K +
                       rho2*omega2*(1-RT22)/(J*K) +
                      (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*K*n))
    power1 <- ifelse(two.tail==FALSE,
                    1-pt(qt(alpha,df,lower.tail=FALSE),df,lamda),
                    1-pt(qt(alpha/2,df,lower.tail=FALSE),df,lamda)+
                      pt(-qt(alpha/2,df,lower.tail=FALSE),df,lamda))
    power0 <- power1-power
    return(power0)
  }
  
  # equality constraints on mdes
  eq.mdes <- function(nJK){
    n <- nJK[1]
    J <- nJK[2]
    K <- nJK[3]
    df = (K-g3-1)[[1]]
    T1 <- ifelse(two.tail==TRUE,abs(qt(alpha/2,df)),abs(qt(alpha,df)))
    T2 = abs(qt(power,df))
    M <- ifelse(power>=.5,T1+T2,T1-T2)
    mdes1 = M*sqrt(rho3*omega3*(1-RT32)/K +
                   rho2*omega2*(1-RT22)/(J*K) +
                  (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*K*n))
    mdes0 <-mdes1-mdes
    return(mdes0)
  }
  
  # find minimum required sample size per higher unit
  if(is.null(K)){
    i <- 0
    conv <- FALSE
    while(i<=100 & conv==FALSE){
      df = K0-g3-1
      if(df<= 0 | is.infinite(df)){break}
      T1 <- ifelse(two.tail==TRUE,abs(qt(alpha/2,df)),abs(qt(alpha,df)))
      T2 = abs(qt(power,df))
      M <- ifelse(power>=.5,T1+T2,T1-T2)
      K1 <- (M/mdes)^2 * (rho3*omega3*(1-RT32) +
                          rho2*omega2*(1-RT22)/J +
                         (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*n))
      K0 <- (K1+K0)/2
      i <- i+1
    }
    K <- ifelse(df>0,round(K0),NA)
  }else if(is.null(J)){
    df = K-g3-1
    T1 <- ifelse(two.tail==TRUE,abs(qt(alpha/2,df)),abs(qt(alpha,df)))
    T2 = abs(qt(power,df))
    M <- ifelse(power>=.5,T1+T2,T1-T2)
    J <- (rho2*omega2*(1-RT22) +
         (1-rho3-rho2)*(1-R12)/(P*(1-P)*n))/
         (K*(mdes/M)^2 - rho3*omega3*(1-RT32))
    J <- round(J)
  }else if(is.null(n)){
    df = K-g3-1
    T1 <- ifelse(two.tail==TRUE,abs(qt(alpha/2,df)),abs(qt(alpha,df)))
    T2 = abs(qt(power,df))
    M <- ifelse(power>=.5,T1+T2,T1-T2)
    n <- (1-rho3-rho2)*(1-R12)/(P*(1-P))/
         (J*K*(mdes/M)^2 - J*rho3*omega3*(1-RT32) -
          rho2*omega2*(1-RT22))
    n <- round(n)
  }
  
  nJK1 <- c(n,J,K)
  if(any(nJK1<=0)|any(is.na(nJK1))){stop("Solution not feasible due to nonpositive sample size estimation.")}
  
  # round solution
  est.mdes <- eq.mdes(nJK1) + mdes
  est.power <- eq.power(nJK1) + power
  round.mrss <- cbind(nJK1[1], nJK1[2], nJK1[3], est.mdes, est.power)
  colnames(round.mrss) <- c("n", "J", "K", "mdes", "power")
 
  # grid to approximate an integer solution
  if(gm<=0){stop("'gm' should be >= 1")}
  if(ncase<=1){stop("'ncase' should be >= 2")}
  gridnJK <- expand.grid( c(nJK1[1]-gm*3):(nJK1[1]+gm*3),
                          c(nJK1[2]-gm*2):(nJK1[2]+gm*2),
                          c(nJK1[3]-gm*1):(nJK1[3]+gm*1))
  
  # ensure nonzero postive cells while considering cells associated with df
  gridnJK <- as.matrix(gridnJK[gridnJK[,1]>0 &
                                   gridnJK[,2]>0 &
                                   gridnJK[,3]>g3+1, ])
  
  # difference from specified power (default, .80), mdes (default, .25), or cost
  integer.mrss <- matrix(NA,nrow(gridnJK),5)
  integer.mrss[,1:3] <- gridnJK
  for(i in 1:nrow(gridnJK)){
    integer.mrss[i,4] <- eq.mdes(gridnJK[i,])
    integer.mrss[i,5] <- eq.power(gridnJK[i,])
  }
  
  # output result
  if(constrain=="power"){
    idx <- order(abs(integer.mrss[,5]),
                 decreasing=FALSE)[1:ncase]
    integer.mrss <- integer.mrss[idx,]
    integer.mrss[,4] <- integer.mrss[,4] + mdes
    integer.mrss[,5] <- integer.mrss[,5] + power
    colnames(integer.mrss) <- c("n", "J", "K", "mdes", "power")
  }else if(constrain=="mdes"){
    idx <- order(abs(integer.mrss[,4]),
                 decreasing=FALSE)[1:ncase]
    integer.mrss <- integer.mrss[idx,]
    integer.mrss[,4] <- integer.mrss[,4] + mdes
    integer.mrss[,5] <- integer.mrss[,5] + power
    colnames(integer.mrss) <- c("n", "J", "K", "mdes", "power")
  }
  fun <- "mrss.ira3r1"
  par <- list(mdes=mdes, power=power, alpha=alpha, two.tail=two.tail,
              gm=gm, ncase=ncase, constrain=constrain,
              n=n, J=J, K=K, K0=K0, tol=tol, 
              rho2=rho2, rho3=rho3, omega2=omega2, omega3=omega3,
              P=P, g3=g3, R12=R12, RT22=RT22, RT32=RT32)
  return(list(fun=fun,par=par,round.mrss=round(round.mrss, digits=3),
              integer.mrss=round(integer.mrss, digits=3)))
}
  
# example
# mrss.ira3r1(rho3=.20, rho2=.15, omega3=.10, omega2=.10, n=12, J=3)
# mrss.ira3r1(rho3=.20, rho2=.15, omega3=.10, omega2=.10, n=12, K=14)
# mrss.ira3r1(rho3=.20, rho2=.15, omega3=.10, omega2=.10, J=3, K=14)

# require ("nloptr")
# nJK0 = starting values, default: c(10,10,10)
# ncase = numer of optimal samples in the output
# gm = grid multiplier to search best integer solutions
# constrain = "mdes", "power", or "cost"
# optimizer = "auglag_cobyla","auglag_lbfgs", "auglag_mma", or "auglag_slsqp"
optimal.ira3r1 <- function(cn, cJ, cK, cost=NULL, n=NULL, J=NULL, K=NULL,
                           power=.80, mdes=.25, alpha=.05, two.tail=TRUE,
                           nJK0=c(10,10,10), ncase=10, gm=2, 
                           constrain="cost", optimizer="auglag_cobyla",
                           rho2, rho3, omega2, omega3,
                           P=.50, g3=0, R12=0, RT22=0, RT32=0){
  
  # equality constraints on cost
  eq.cost <- function(nJK){
    n <- nJK[1]
    J <- nJK[2]
    K <- nJK[3]
    cost0 <- cK*K + cJ*J*K + cn*n*J*K - cost
    return(cost0)
  }
  
  # equality constraints on power
  eq.power <- function(nJK){
    n <- nJK[1]
    J <- nJK[2]
    K <- nJK[3]
    df = (K-g3-1)[[1]]
    lamda <- mdes/sqrt(rho3*omega3*(1-RT32)/K +
                       rho2*omega2*(1-RT22)/(J*K) +
                      (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*K*n))
    power1 <- ifelse(two.tail==FALSE,
                     1-pt(qt(alpha,df,lower.tail=FALSE),df,lamda),
                     1-pt(qt(alpha/2,df,lower.tail=FALSE),df,lamda)+
                       pt(-qt(alpha/2,df,lower.tail=FALSE),df,lamda))
    power0 <- power1-power
    return(power0)
  }
  
  # equality constraints on mdes
  eq.mdes <- function(nJK){
    n <- nJK[1]
    J <- nJK[2]
    K <- nJK[3]
    df = (K-g3-1)[[1]]
    T1 <- ifelse(two.tail==TRUE,abs(qt(alpha/2,df)),abs(qt(alpha,df)))
    T2 = abs(qt(power,df))
    M <- ifelse(power>=.5,T1+T2,T1-T2)
    mdes1 = M*sqrt(rho3*omega3*(1-RT32)/K +
                   rho2*omega2*(1-RT22)/(J*K) +
                  (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*K*n))
    mdes0 <-mdes1-mdes
    return(mdes0)
  }

  # minimize cost given power or mdes
  min.cost <- function(nJK){
    n <- nJK[1]
    J <- nJK[2]
    K <- nJK[3]
    cost <- cK*K + cJ*J*K + cn*n*J*K
    return(cost)
  }
  
  # minimize treatment variance given cost
  min.var <- function(nJK){
    n <- nJK[1]
    J <- nJK[2]
    K <- nJK[3]
    sigmaT2 <- rho3*omega3*(1-RT32)/K +
               rho2*omega2*(1-RT22)/(J*K) +
              (1-rho3-rho2)*(1-R12)/(P*(1-P)*J*K*n)
    return(sigmaT2)
  }
  
  fn.constr <- switch(constrain,
                      "power"= "eq.power",
                      "mdes"= "eq.mdes",
                      "cost"= "eq.cost"
  )
  
  fn.min <- switch(constrain,
                   "power"= "min.cost",
                   "mdes"= "min.cost",
                   "cost"= "min.var"
  )
  
  local.optim <- switch(optimizer,
                        "auglag_cobyla"="COBYLA",
                        "auglag_lbfgs"="LBFGS",
                        "auglag_mma"="MMA",
                        "auglag_slsqp"="SLSQP"
  )
  
  # constrain specified sample sizes, define limits
  n0  <- ifelse(!is.null(n), n, nJK0[1])
  nLB <- ifelse(!is.null(n), n, 1)
  nUB <- ifelse(!is.null(n), n, Inf)
  J0  <- ifelse(!is.null(J), J, nJK0[2])
  JLB <- ifelse(!is.null(J), J, 1)
  JUB <- ifelse(!is.null(J), J, Inf)
  K0  <- ifelse(!is.null(K), K, nJK0[3])
  KLB <- ifelse(!is.null(K), K, g3+2)
  KUB <- ifelse(!is.null(K), K, Inf)
  nJK0  <- c(n0,J0,K0)
  nJKLB <- c(nLB,JLB,KLB)
  nJKUB <- c(nUB,JUB,KUB)
  
  # given equality contraints find real numbers that minimizes the treatment variance or cost
  nlopt.nJK <- nloptr::auglag(x0=nJK0, fn=fn.min, heq=fn.constr, 
                               localsolver=local.optim, localtol=1e-8, 
                               lower=nJKLB, upper=nJKUB)
  if(nlopt.nJK$convergence<0 | all(nlopt.nJK$par==nJK0)){warning("Solution may not be feasible. Change default settings.")}
  
  # round solution
  nJK1 <- round(nlopt.nJK$par)
  est.cost <-  min.cost(nJK1)
  est.mdes <- eq.mdes(nJK1) + mdes
  est.power <- eq.power(nJK1) + power
  round.optim <- cbind(nJK1[1], nJK1[2], nJK1[3], est.cost, est.mdes, est.power)
  colnames(round.optim) <- c("n", "J", "K", "cost", "mdes", "power")
  
  # grid to approximate an integer solution
  if(gm<=0){stop("'gm' should be >= 1")}
  if(ncase<=1){stop("'ncase' should be >= 2")}
  gridnJK <- expand.grid( c(nJK1[1]-gm*3):(nJK1[1]+gm*3),
                          c(nJK1[2]-gm*2):(nJK1[2]+gm*2),
                          c(nJK1[3]-gm*1):(nJK1[3]+gm*1))
  
  # ensure nonzero postive cells while considering cells associated with df
  gridnJK <- as.matrix(gridnJK[gridnJK[,1]>0 &
                               gridnJK[,2]>0 &
                               gridnJK[,3]>g3+1, ])
  
  # difference from specified power (default, .80), mdes (default, .25), or cost
  integer.optim <- matrix(NA,nrow(gridnJK),6)
  integer.optim[,1:3] <- gridnJK
  for(i in 1:nrow(gridnJK)){
    integer.optim[i,4] <- min.cost(gridnJK[i,])
    integer.optim[i,5] <- eq.mdes(gridnJK[i,])
    integer.optim[i,6] <- eq.power(gridnJK[i,])
  }
  
  # output result
  if(constrain=="power"){
    idx <- order(abs(integer.optim[,6]),
                 decreasing=FALSE)[1:ncase]
    integer.optim <- integer.optim[idx,]
    integer.optim[,5] <- integer.optim[,5] + mdes
    integer.optim[,6] <- integer.optim[,6] + power
    colnames(integer.optim) <- c("n", "J", "K", "cost", "mdes", "power")
  }else if(constrain=="mdes"){
    idx <- order(abs(integer.optim[,5]),
                 decreasing=FALSE)[1:ncase]
    integer.optim <- integer.optim[idx,]
    integer.optim[,5] <- integer.optim[,5] + mdes
    integer.optim[,6] <- integer.optim[,6] + power
    colnames(integer.optim) <- c("n", "J", "K", "cost", "mdes", "power")
  }else if(constrain=="cost"){
    idx <- order(abs(integer.optim[,4]-cost),
                 decreasing=FALSE)[1:ncase]
    integer.optim <- integer.optim[idx,]
    integer.optim[,5] <- integer.optim[,5] + mdes
    integer.optim[,6] <- integer.optim[,6] + power
    colnames(integer.optim) <- c("n", "J", "K", "cost", "mdes", "power")
  }
  fun <- "optimal.ira3r1"
  par <- list(cn=cn, cJ=cJ, cK=cK, cost=cost, n=n, J=J, K=K,
              power=power, mdes=mdes, alpha=alpha, two.tail=two.tail,
              nJK0=nJK0, ncase=ncase, gm=gm, 
              constrain=constrain, optimizer=optimizer,
              rho2=rho2, rho3=rho3, omega2=omega2, omega3=omega3,
              P=P, g3=g3, R12=R12, RT22=RT22, RT32=RT32)
  nloptr <- list(pars=nlopt.nJK$par,
                 obj.value=nlopt.nJK$value,
                 iter=nlopt.nJK$iter,
                 global.solver=nlopt.nJK$global_solver,
                 local.solver=nlopt.nJK$local_solver,
                 convergence=nlopt.nJK$convergence,
                 message=nlopt.nJK$message)
  return(list(fun=fun,
              par=par,
              nloptr=nloptr,
              round.optim=round(round.optim, digits=3),
              integer.optim=round(integer.optim, digits=3)
              )
         )
}

# examples

# optimal sample given total cost
# optimal.ira3r1(cn=1, cJ=10, cK=100, cost=5600, constrain="cost", rho3=.15, rho2=.20, omega2=.50, omega3=.50)

# optimal sample given per unit costs and power 
# optimal.ira3r1(cn=1, cJ=10, cK=100, power=.80, constrain="power", rho3=.15, rho2=.20, omega2=.50, omega3=.50)

# optimal sample given per unit costs and mdes
# optimal.ira3r1(cn=1, cJ=10, cK=100, power=.80, constrain="mdes", rho3=.15, rho2=.20, omega2=.50, omega3=.50)

# conditional optimal sample (fixed n=10) given total cost
# optimal.ira3r1(cn=1, cJ=10, cK=100, n=10, cost=5600, constrain="cost", rho3=.15, rho2=.20, omega2=.50, omega3=.50)

# conditional optimal sample (fixed n=10) given per unit costs and power 
# optimal.ira3r1(cn=1, cJ=10, cK=100, n=10, constrain="power", rho3=.15, rho2=.20, omega2=.50, omega3=.50)

# conditional optimal sample (fixed n=10) given per unit costs and mdes
# optimal.ira3r1(cn=1, cJ=10, cK=100, n=10, constrain="mdes", rho3=.15, rho2=.20, omega2=.50, omega3=.50)

  