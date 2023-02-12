context("Unordered data")
library(flipStandardCharts)

unordered <- structure(c(10.7660810827377, 2.67668118502137, 15.477314241581, 
6.46853382596853, 15.6575253460176, 8.66246847988781, 17.5650660161087, 
20.0636470286816, 21.1153473660982, 32.946776520719, 17.4191808363266, 
27.3965398670424, 1.99948511113018, 1.78535309267924), .Dim = c(2L, 
7L), assigned.rownames = TRUE, .Dimnames = list(c("2021", "2020"
), c("Do not have this capability at all", "Have always run this on premises and do not plan to move to cloud", 
"Have moved this from the Cloud back to on-premises", "Expect to move to cloud within 24 months", 
"Currently use cloud and purchased it within the last 12 months", 
"Currently use cloud and purchased it more than 12 months ago", 
"Don't know")), statistic = "Row %")

test_that("Datalabels for unordered data",
{
    pp <- Column(unordered, type = "Stacked", data.label.show = TRUE)
    expect_true(TestWidget(pp, "unordereddata-numericaxis"))

    pp <- Column(unordered, x.tick.format = "%b %Y", data.label.show = TRUE)
    expect_true(TestWidget(pp, "unordereddata-dateaxis"))
})