#'////////////////////////////////////////////////////////////////////////////
#' FILE: server.R
#' AUTHOR: David Ruvolo
#' CREATED: 2021-03-02
#' MODIFIED: 2021-03-02
#' PURPOSE: start R plumber
#' STATUS: in.progress
#' PACKAGES: plumber; palmerpenguis
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

app <- plumber::Plumber$new()


# mount client at root
app$mount("/", plumber::PlumberStatic$new("./client/dist"))


#* @filter cors
cors <- function(req, res) {
    res$setHeader("Access-Control-Allow-Origin", "*")
    res$setHeader("Access-Control-Allow-Methods", "*")
    res$setHeader("Access-Control-Allow-Headers", "Content-Type")
    plumber::forward()
}


# endpoint: `/api/data`
app$handle(
    methods = "GET",
    path = "/api/data",
    serializer = plumber::serializer_json(
        na = "string",
        type = "application/json"
    ),
    handler = function(req) {
        list(json = palmerpenguins::penguins[1:10, ])
    }
)


app$run(port = 8000)