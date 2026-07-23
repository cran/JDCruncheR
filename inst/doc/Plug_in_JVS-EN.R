## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
    comment = "#>"
)

## ----setup--------------------------------------------------------------------
library("JDCruncheR")

## ----echo = TRUE, eval = FALSE------------------------------------------------
# library("rjwsacruncher")
# 
# options(
#     is_cruncher_v3 = TRUE,
#     default_matrix_item = c(
#         "span.start",
#         "span.end",
#         "log",
#         "span.n",
#         "regression.nout",
#         "regression.ntd",
#         "m-statistics.m7",
#         "decomposition.seasonal-filters",
#         "decomposition.trend-filter",
#         "decomposition.d7-trend-filter",
#         "quality.summary",
#         "regression.lp",
#         "regression.leaster",
#         "diagnostics.seas-sa-ac1:3",
#         "diagnostics.seas-sa-ac1",
#         "diagnostics.seas-lin-combined",
#         "regression.out(*)",
#         "regression.td-ftest:3",
#         "residuals.lb:3",
#         "diagnostics.td-sa-last:2",
#         "diagnostics.seas-sa-f:2",
#         "arima.p", "arima.d", "arima.q", "arima.bp", "arima.bd", "arima.bq",
#         "m-statistics.q", "m-statistics.q-m2"
#     ),
#     default_tsmatrix_series = c(
#         "decomposition.y_cmp",
#         "decomposition.s_cmp",
#         "decomposition.sa_cmp",
#         "decomposition.t_cmp"
#     )
# )
# 
# cruncher_and_param(
#     workspace = "path/to/the/workspace/file.xml",
#     cruncher_bin_directory = "path/to/the/cruncher/v3/bin/directory",
#     csv_layout = "vtable",
#     short_column_headers = FALSE,
#     refreshall = FALSE,
#     v3 = TRUE,
#     delete_existing_file = TRUE,
#     policy = "None"
# )

## ----echo = TRUE, eval = TRUE-------------------------------------------------
# Path leading to the directory containing the needed files
dir_path <- system.file(
    "extdata",
    "WS/WS_world/Output/SAProcessing-1",
    package = "JDCruncheR"
)

JVS <- extract_JVS(dir = dir_path)

## ----echo = FALSE, eval = TRUE------------------------------------------------
rownames(JVS) <- NULL
knitr::kable(JVS[, 1L:7L])

## ----echo = TRUE, eval = FALSE------------------------------------------------
# write(JVS, format = "csv", export_dir = "path/to/the/export/directory", overwrite = TRUE)

## ----echo = TRUE, eval = FALSE------------------------------------------------
# write(JVS, format = "xlsx", export_dir = "path/to/the/export/directory", overwrite = TRUE)

