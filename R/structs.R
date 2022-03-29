## #' @useDynLib raylib.R, .registration = TRUE
## #' @export
## Vector2_new <- function() {
##         out <- .Call("create_Vector2", NULL)
##         class(out) <- c("Vector2", class(out))
##         out
## }

#' @useDynLib raylib.R, .registration = TRUE
#' @export
Vector2 <- function() {
        out <- .Call("create_Vector2", NULL)
        class(out) <- c("Vector2", class(out))
        return(out)
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
Vector2_set <- function(x, value) {
        stopifnot(inherits(x, "Vector2") && length(value) == 2 && is.numeric(value))
        .Call("set_Vector2", x, as.double(value))
        return(x)
}

#' @export
print.Vector2 <- function(x) {
        vec <- .Call("get_Vector2", x)
        cat(class(x)[1])
        cat("\n")
        print.default(vec)
        invisible(x)
}
