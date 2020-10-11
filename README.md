# log10interpolated

This package provides an interpolation of log10 using a lookup table.
The table contains the log10 values between 1 and 100 in steps of 0.01, computed with the R function log10.
Between this values the log10 is interpolated depending on the nearest value stored in the lookup table.

This implementation is based on an idea from https://www.dsprelated.com/showarticle/1047.php.
