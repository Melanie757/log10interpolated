#' Title
#'
#' @param x
#'
#' @return vector of interpolated log10(x)
#' @export
#'
#' @examples log10int(5)

#generic function
log10int <- function (x, ...) {
  UseMethod("mylog", x)
}

#S3 methods

#S3 method for numerics
log10int.numeric <- function(x, ...){
  ret <- numeric(length(x))
  i <- 1
  for (v in x) {
    r <- which.min(abs(f$k-v)) #row of the nearest value to x
    ans <- f[r,"logk"]
    nb <- f[r,"k"]
    if(abs(v-nb) > 1e-03) {
      #approximate ln with taylor series (possible since v/nb = 1+(v-nb)/nb
      #and abs((v-nb)/nb < 1)) (v-nb in (-0.01, 0.01), nb >= 1)
      y <- (v-nb)/nb
      appr <- y-y^2/2+y^3/3-y^4/4
      #log(x) = log(ans)+log(e)*ln(x/nb) + correction factor (tried out which factor reduced the error)
      ans <- ans + 0.43429*appr + 3.0557e-07
    }
    ret[i] <- ans
    i <- i+1
  }
  return(ret)
}

#S3 default method
log10int.default <- function(x, ...){
  warning(paste("log10int only takes arguments of type numeric, not  ", class(x)))
}
