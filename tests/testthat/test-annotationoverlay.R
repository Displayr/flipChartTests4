# Testing annotation overlays which are similar but more flexible than
# the annotations attached to data labels

context("Annotation overlays")
library("flipStandardCharts")
library("flipChartTests")

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
"Female", "NET"), c("Column %", "p")), name = "Income by Gender", questions = c("Income",
"Gender"))

test_that("Overlay annotations",
{
    pp <- Column(data.with.stats[-10,-3,], type = "Column",
        overlay.annotation.list = list(list(type = "Arrow - up", data = "p",
        threstype = "below threshold", threshold = "0.05",
        relative.pos = 0.0,  valign = "top", halign = "center",
        offset = 5, color = "red", size = 20,
        font.family = "Arial"), list(type = "Arrow - down", data = "p",
        threstype = "above threshold", threshold = "0.05", color = "blue",
        relative.pos = 1.0,  valign = "top", halign = "center",
        size = 20, offset = 5, font.family = "Arial",
        font.weight = "normal", font.style = "normal")))
    expect_true(TestWidget(pp, "annot-overlay-arrows-top"))
    
    pp <- Column(data.with.stats[-10,-3,], type = "Stacked",
        overlay.annotation.list = list(list(type = "Caret - up", data = "p",
        threstype = "below threshold", threshold = "0.05",
        relative.pos = 1.0,  valign = "bottom", halign = "center",
        offset = 5, color = "red", size = 20,
        font.family = "Arial"), list(type = "Caret - down", data = "p",
        threstype = "above threshold", threshold = "0.05", color = "blue",
        relative.pos = 1.0,  valign = "bottom", halign = "center",
        size = 20, offset = 5, font.family = "Arial",
        font.weight = "normal", font.style = "normal")))
    expect_true(TestWidget(pp, "annot-overlay-caret-bottom"))

    pp <- Column(data.with.stats[-10,-3,], type = "Stacked", bar.gap = 0.3,
        data.label.show = TRUE,
        overlay.annotation.list = list(list(type = "Custom symbol",
        custom.symbol = "★", data = "p",
        threstype = "below threshold", threshold = "0.05",
        relative.pos = 0.5,  valign = "middle", halign = "right",
        offset = 25, color = "red", size = 12,
        font.family = "Arial"),
        list(type = "Text", data = "p", format = ".2e", prefix = "p = ",
        threstype = "below threshold", threshold = "0.05", color = "#555555",
        relative.pos = 0.0,  valign = "top", halign = "center",
        size = 6, offset = 2, font.family = "Arial",
        font.weight = "normal", font.style = "normal")))
    expect_true(TestWidget(pp, "annot-overlay-text"))

    pp <- SmallMultiples(data.with.stats[-10,-3,], "Column",
        overlay.annotation.list = list(list(type = "Arrow - up", data = "p",
        threstype = "below threshold", threshold = "0.05",
        relative.pos = 0.0,  valign = "top", halign = "center",
        offset = 5, color = "red", size = 20,
        font.family = "Arial"), list(type = "Arrow - down", data = "p",
        threstype = "above threshold", threshold = "0.05", color = "blue",
        relative.pos = 1.0,  valign = "top", halign = "center",
        size = 20, offset = 5, font.family = "Arial",
        font.weight = "normal", font.style = "normal")))
    expect_true(TestWidget(pp, "annot-overlay-column-smallmult"))

    pp <- SmallMultiples(data.with.stats[-10,-3,], "Radar",
        overlay.annotation.list = list(list(type = "Custom text",
        custom.symbol = "*", data = "p",
        threstype = "below threshold", threshold = "0.05",
        color = "red", size = 20, font.family = "Arial")),
        x.tick.font.size = 9, average.show = TRUE)
    expect_true(TestWidget(pp, "annot-overlay-radar-smallmult"))

    pp <- Radar(data.with.stats[-10,-3,],
        overlay.annotation.list = list(list(type = "Caret - up", data = "p",
        threstype = "above threshold", threshold = "1.96",
        color = NULL, size = 20,
        font.family = "Arial"), list(type = "Caret - down", data = "p",
        threstype = "below threshold", threshold = "-1.96", color = NULL,
        size = 20, font.family = "Arial",
        font.weight = "normal", font.style = "normal")))
    expect_true(TestWidget(pp, "annot-overlay-radar-caret"))
})

dat.with.colcmp <- structure(c("58.3333333333333", "41.6666666666667", "64.2857142857143",
"35.7142857142857", "50.188679245283", "49.811320754717", "25",
"75", "48.8054607508532", "51.1945392491468", "35.7142857142857",
"64.2857142857143", "0", "100", "1.44309826516645", "-1.44309826516645",
"2.88928578847612", "-2.88928578847612", "0.32397254347378",
"-0.32397254347378", "-3.16356487521093", "3.16356487521093",
"-0.244941520775787", "0.244941520775787", "-2.12026368475829",
"2.12026368475829", "-1.39839409648114", "1.39839409648114",
"0.148992791985379", "0.148992791985379", "0.00386117978910683",
"0.00386117978910683", "0.745958821255696", "0.745958821255696",
"0.00155849612347869", "0.00155849612347869", "0.806501711785767",
"0.806501711785767", "0.0339838143903261", "0.0339838143903261",
"0.161994754984221", "0.161994754984221", "d f", NA, "c D e F",
NA, "d f", "b", NA, "a B c e", "d", "b", NA, "a B c", NA, NA), .Dim = c(2L,
7L, 4L), .Dimnames = list(c("Male", "Female"), c("Living with your parents/guardian",
"Living alone", "Living with partner only", "Living with children only",
"Living with partner and children", "Sharing accommodation",
"Other (Please type into the box.)"), c("Column %", "z-Statistic",
"p", "Column Comparisons")), basedescriptiontext = "sample size = 800", basedescription = list(
    Minimum = 800L, Maximum = 800L, Range = FALSE, Total = 800L,
    Missing = 0L, EffectiveSampleSize = 800L, EffectiveSampleSizeProportion = 100,
    FilteredProportion = 0), questiontypes = c("PickOne", "PickOne"
), span = list(rows = structure(list(c("Male", "Female", "NET"
)), class = "data.frame", .Names = "", row.names = c(NA, 3L)),
    columns = structure(list(c("Living with your parents/guardian",
    "Living alone", "Living with partner only", "Living with children only",
    "Living with partner and children", "Sharing accommodation",
    "Other (Please type into the box.)", "NET")), class = "data.frame", .Names = "", row.names = c(NA,
    8L))), name = "table.Gender.by.Living.arrangements.2", questions = c("Gender",
"Living arrangements"), assigned.rownames = TRUE)

test_that("Showing column comparisons with arrows",
{
    pp <- Column(dat.with.colcmp, type = "Stacked",
        overlay.annotation.list = list(list(type = "Arrow - up",
        data = "Column Comparisons", threstype = "above threshold", threshold = " ",
        relative.pos = 0.5, halign = "Center", valign = "Middle", offset = 0,
        color = "#FF0000", size = 11, font.family = "Arial")))
    expect_true(TestWidget(pp, "annot-overlay-colcmp-stacked"))
    
    pp <- Radar(aperm(dat.with.colcmp,c(2,1,3)),
        overlay.annotation.list = list(list(type = "Arrow - up",
        data = "Column Comparisons", threstype = "above threshold", threshold = " ",
        color = NULL, size = 11, font.family = "Arial Black")))
    expect_true(TestWidget(pp, "annot-overlay-colcmp-radar"))
    

    pp <- Column(dat.with.colcmp,
        overlay.annotation.list = list(list(type = "Arrow - up",
        data = "Column Comparisons", threstype = "above threshold", 
        threshold = " ",
        relative.pos = 0, halign = "Center", valign = "Top", offset = 5,
        color = "#444444", size = 11, font.family = "Courier New"),
        list(type = "Arrow - down", data = "z-Statistic",
        threstype = "below threshold", threshold = "-1.96",
        relative.pos = 1.0, halign = "Center", valign = "Top", offset = 5,
        color = "#FF0000", size = 15),
        list(type = "Arrow - up", data = "z-Statistic",
        threstype = "above threshold", threshold = "1.96",
        relative.pos = 1.0, halign = "Center", valign = "Top", offset = 5,
        color = "#0000FF", size = 15)))
    expect_true(TestWidget(pp, "annot-overlay-colcmp-clustered"))
})
