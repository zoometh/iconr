## Resubmission 3

This is the third resubmission, responding to feedback from Gregor Seyer after the second resubmission

* Rd-tags. Missing Rd-tags:
  + labels_shadow.Rd: \value
  + side_plot.Rd: \value
  
Done

* Rd-tags. More about the structure of the output (class) and also what the output means

Done

* Please make sure that you do not change the user's options, `par()` or working directory
  
    `oldpar <- par(no.readonly = TRUE)`  
    `on.exit(par(oldpar))`

... have been added before all calls of the `par()` function. The current package version does not contains any changes of user's working directory (`setwd()`)


## Resubmission 2

This is the second resubmission, responding to feedback from Uwe Ligges after the first resubmission

* Write the url in the form <https://hal.archives-ouvertes.fr/hal-02913656>

Done

## Resubmission 1

This is the first resubmission, responding to feedback from Uwe Ligges after the first submission

* Not more than 5 MB for a CRAN package, please.

Done

* Is there some reference about the method you can add in the Description field in the form Authors (year) <doi:.....>?

Done

## Test environments
* local Windows 8 install, R 4.0.3
* win-builder (devel and release)
* ubuntu 16.04 (on travis-ci), R 4.0.3
* macOS 10.15.7, R 3.6.3
* Rhub

## R CMD check results

0 errors | 0 warnings | 0 note

## Downstream dependencies

There are currently no downstream dependencies for this package
