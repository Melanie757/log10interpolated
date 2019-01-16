#' Interpolated log10
#'
#' log10int interpolates the log10 between 1 and 100. Therefor it uses a table with the log10 values
#' between 1 and 100 in steps of 0.01, computed with the R log10 function. The accuracy of the interpolation
#' is in the order of 1e-5. It is a generic function and S3 methods exists for the class numeric and
#' default.
#'
#' @param x a numeric or vector of numerics
#'
#' @param ... further arguments passed to or from other methods
#'
#' @return numeric or vector of numerics, containing the interpolated log10 values of x.
#' If no object of the class numeric is given to the function, a warning is printed.
#'
#' @examples log10int(5)
#' log10int(c(3.77, 6.228))
#'
#' @export

#generic function
log10int <- function (x, ...) {
  UseMethod("log10int", x)
}

#S3 methods

#' Interpolated log10
#'
#' This method interpolates the log10 between 1 and 100 for values of the class numeric. Therefor it uses a
#' table with the log10 values between 1 and 100 in steps of 0.01, computed with the R log10 function.
#' The accuracy of the interpolation is in the order of 1e-5. It is a generic function and S3 methods exists
#' for the class numeric and default.
#'
#' @param x a numeric or vector of numerics
#'
#' @param ... further arguments passed to or from other methods
#'
#' @return numeric or vector of numerics, containing the interpolated log10 values of x
#'
#' @examples log10int(5)
#' log10int(c(3.77, 6.228))
#' @export
#S3 method for numerics
log10int.numeric <- function(x, ...){
  ret <- numeric(length(x))
  i <- 1
  for (v in x) {
    r <- which.min(abs(log10data$k-v)) #row of the nearest value to x
    ans <- log10data[r,"logk"]
    nb <- log10data[r,"k"]
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

#' Interpolated log10
#'
#' This is the default mwthod of log10int. It prints a warning if an object of another type than numeric
#' is given to the function.
#'
#' @param x a numeric or vector of numerics
#'
#' @param ... further arguments passed to or from other methods
#'
#' @return a warning that the method cannot handle the given class of data
#' @export
#S3 default method
log10int.default <- function(x, ...){
  warning(paste("log10int only takes arguments of type numeric, not  ", class(x)))
}
