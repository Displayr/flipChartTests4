## timings from https://app.travis-ci.com/github/Displayr/flipChartTests4/builds/260571899
## test-annotationoverlay.R: 43s
## test-annotations.R: 87.4
## test-customhover.R: 63
## test-markerborder.R: 35.5
## unordereddata: 8
if (identical(Sys.getenv("CIRCLECI"), "true"))
{
    if (!dir.exists("reports"))
        dir.create("reports")
    out.file <- paste0("reports/test_results", Sys.getenv("CIRCLE_NODE_INDEX"), ".xml")
    exit.code <- flipDevTools::RunTestsOnCircleCI(filter = "^annotation",
                                                  load_package = "none", output_file = out.file)
    q(status = exit.code, save = "no")
}
