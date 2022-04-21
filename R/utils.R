time_since_last_call <- local({
        time <- 0

        function() {
                if (time == 0) {
                        cat("First call, setting time")
                        time <<- Sys.time()
                        return(invisible())
                }

                cat((Sys.time() - time) * 1000, " milliseconds", "\n", sep = "")
                time <<- Sys.time()
                invisible()
        }
})
