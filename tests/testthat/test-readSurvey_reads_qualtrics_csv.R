test_that("readSurvey() reads data in qualtrics standard and legacy format and converts columns", {

  # Test if can read standard format
  survey <- suppressWarnings(qualtRics::readSurvey("files/sample.csv",
                                                   convertStandardColumns = TRUE))
  # Tests
  expect_equal(dim(survey)[1], 1)
  expect_equal(dim(survey)[2], 20)
  expect_true(is.numeric(as.numeric(survey$StartDate)))
  expect_true(is.numeric(survey$LocationLatitude))
  expect_true(is.factor(survey$Status))

  # Test if can read legacy format
  survey_legacy <- suppressWarnings(qualtRics::readSurvey("files/sample_legacy.csv",
                                                   convertStandardColumns = TRUE,
                                                   legacyFormat = TRUE))
  # Tests
  expect_equal(dim(survey_legacy)[1], 1)
  expect_equal(dim(survey_legacy)[2], 15)
  expect_true(is.numeric(as.numeric(survey_legacy$V8))) # StartDate
  expect_true(is.numeric(survey_legacy$LocationLatitude))
  expect_true(is.factor(survey_legacy$V7)) # Status
})
