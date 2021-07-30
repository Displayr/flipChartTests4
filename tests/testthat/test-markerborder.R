context("Marker border")

tb <- structure(c(21.7684616846345, 16.8273954590784, 23.6218418617686,
22.3939814605362, 15.3883195339823, 20.2682378794749, 22.3469131808503,
19.5399118569831, 24.9071455030989, 12.9377915795928, 24.2191612233134,
14.4972683594848, 26.9645648467198, 22.8280612061214, 11.4909443643606,
21.4238052135251, 16.9520193150924, 23.230939342932, 22.1717903016062,
16.2214458268442, 21.7684616846345, 16.8273954590784, 23.6218418617686,
22.3939814605362, 15.3883195339823), .Dim = c(5L, 5L), .Dimnames = list(
    c("Available", "Clean", "Dependable", "Informed", "Safe"),
    c("< 15%", "15 - 50%", "> 50% and Regional median", "Regional median",
    "NET")))

args <- c('autocolor' = 'opacity = 0.2, marker.border.colors = NULL, marker.border.width = 2, marker.border.opacity = 1',
          'onecolor' = 'marker.border.colors = "red", marker.border.width = 2, marker.border.opacity = 1')
charting.funcs <- c("Bar", "BarMultiColor", "Column", "ColumnMultiColor", "Pyramid") 

for (func in charting.funcs[6])
{
    for (ii in 1:length(args))
    {
        filestem <- paste0("mkborder-", tolower(func), "-", names(args)[ii])
        test_that(filestem,
        {
            cmd <- paste0(func, "(tb, ", args[ii], ")")
            pp <- suppressWarnings(eval(parse(text=cmd)))
            #print(pp)
            #readline(prompt=paste0(filestem, ": press [enter] to continue: "))
            expect_true(TestWidget(pp, filestem, delay = 2))
        })
    }
}