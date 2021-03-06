#' Check monitor data for required demographic variables
#'
#' @inheritParams apply_youth_sojourn
#' @param demo_names character vector of required demographic variable names to
#'   look for
#' @param fix_sex_var logical. Should "Sex" be changed to "SexM" and dummy
#'   coded?
#' @param ... further arguments passed to svDialogs functions
#'
#' @return A properly-formatted data frame of monitor data
#' @keywords internal
#'
youth_name_test <- function(AG,
  demo_names = c("id", "Age", "Sex", "BMI"),
  demo_interactive = FALSE, fix_sex_var = TRUE, ...) {

  if ("Sex" %in% demo_names & "Sex" %in% names(AG) & fix_sex_var) {
    demo_names <- gsub("Sex", "SexM", demo_names)
    names(AG) <- gsub("Sex", "SexM", names(AG))
    AG$SexM <- ifelse(AG$SexM == "F", 0, 1)
  }

  if (all(demo_names %in% names(AG))) {

    return(AG)

  }

  missing_vars <- paste(
    setdiff(demo_names, names(AG)),
    collapse = ", "
  )

  if (demo_interactive) {

    svDialogs::dlg_message(
      paste(
        "Missing demographic variables: ",
        missing_vars,
        ".\n You will now be prompted to enter all demographic variables.",
        "\n (You can ignore those not listed above.)",
        sep = ""
      ),
      ...
     )

    demo <- input_demographic(...)

    for (i in setdiff(demo_names, names(AG))) {
      AG[ ,i] <- demo[ ,i]
    }

  } else {

    stop(paste(
      "The following required variables are missing:",
      missing_vars
    ))

  }

  return(AG)

}
