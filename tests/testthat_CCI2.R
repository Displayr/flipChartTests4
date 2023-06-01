## timings from https://app.travis-ci.com/github/Displayr/flipChartTests4/builds/260571899
## test-annotationoverlay.R: 43s
## test-annotations.R: 87.4
## test-customhover.R: 63
## test-markerborder.R: 35.5
## unordereddata: 8
if (identical(Sys.getenv("CIRCLECI"), "true"))
{
    test.files <- list.files("tests/testthat", pattern = "\\.R$")
    test.files <- gsub("test-|\\.R$", "", test.files)
    test.filter <- grep("^annotation", test.files,
                        invert = TRUE, value = TRUE)    
    if (!dir.exists("reports"))
        dir.create("reports")
    out.file <- paste0("reports/test_results", Sys.getenv("CIRCLE_NODE_INDEX"), ".xml")
    exit.code <- flipDevTools::RunTestsOnCircleCI(filter = paste0(test.filter, collapse = "|"),
                                                  load_package = "none", output_file = out.file)
    ## Ignore exit code so job continues to save snapshots
    ## q(status = exit.code, save = "no")
}
