.onUnload <- function (libpath) {
        library.dynam.unload("raylib.R", libpath)
}

#' @useDynLib raylib.R, .registration = TRUE, .fixes = ".C_"
NULL
