context("Custom hovertext")
library(flipStandardCharts)
library(flipChartTests)

data.with.stats <- structure(c(2.75482093663912, 6.06060606060606, 12.6721763085399,
       18.4573002754821, 24.7933884297521, 15.9779614325069, 6.06060606060606,
       8.26446280991736, 4.95867768595041, 100, 3.77906976744186, 15.9883720930233,
       7.84883720930233, 18.0232558139535, 19.7674418604651, 13.0813953488372,
       10.7558139534884, 4.06976744186047, 6.68604651162791, 100, 3.25318246110325,
       10.8910891089109, 10.3253182461103, 18.2461103253182, 22.3479490806223,
       14.5685997171146, 8.34512022630834, 6.22347949080622, 5.7991513437058,
       100, 0.442913092343004, 0.0000228306627828578, 0.0351514682974756,
       0.881274082835059, 0.108843509396061, 0.275202305069102, 0.0240561692086175,
       0.0210216801333983, 0.326003170694519, NA, 0.442913092343004,
       0.0000228306627828578, 0.0351514682974756, 0.881274082835059,
       0.108843509396061, 0.275202305069102, 0.0240561692086175, 0.0210216801333983,
       0.326003170694519, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA
), .Dim = c(10L, 3L, 2L), .Dimnames = list(c("Less than $15,000",
     "$15,001 to $30,000", "$30,001 to $45,000", "$45,001 to $60,000",
     "$60,001 to $90,000", "$90,001 to $120,000", "$120,001 to $150,000",
     "$150,001 to $200,000", "$200,001 or more", "NET"), c("Male",
    "Female", "NET"), c("Column %", "p")), name = "Income by Gender", questions = c("Income","Gender"))

tmp.template <- matrix(paste0("%{x}: %{y}<br> p = ", 
                              sprintf("%.2e", data.with.stats[-10,,2])), 9, 3)
chart.type <- c("Area", "Bar", "Column", "BarMultiColor", "ColumnMultiColor", "Line", "Radar")
for (func in chart.type)
{
    tname <- paste0("customhover-", tolower(func))
    chart <- get(func, mode = "function")
    test_that(tname,
    {
        pp <- suppressWarnings(chart(data.with.stats[-10,,], hovertext.template = tmp.template))
        expect_true(TestWidget(pp, tname, delay = 2))
    })
    
    tname <- paste0("customhover-smallmult-", tolower(func))
    test_that(tname,
    {
        pp <- SmallMultiples(data.with.stats[-10,,], func, hovertext.template = tmp.template)
        expect_true(TestWidget(pp, tname, delay = 2, mouse.xpos = 0.25, mouse.ypos = 0.25))
    })
}

for (func in chart.type[1:3])
{
    tname <- paste0("customhover-stacked-", tolower(func))
    test_that(tname,
    {
        chart <- get(func, mode = "function")
        pp <- chart(type = "Stacked", data.with.stats[-10,,], hovertext.template = tmp.template)
        expect_true(TestWidget(pp, tname, delay = 2))
    })
}
