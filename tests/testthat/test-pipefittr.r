##
## [testpipefittr.r]
##
## author     : Ed Goodwin
## project    : pipefittr
## createdate : 05.07.2016
##
## description:
##    test of piping functionality in pipefittr
##
## version: 0.01
## changelog:
##

context("test harness for pipefittr")
test_that("Simple bunny foo foo convert", {
  #skip("Format feature not implemented")
  teststring = paste(
    "bop_on( scoop_up( hop_through(foo_foo, forest),",
    "field_mouse ), head )",
    sep = ""
  )
  pipestring = paste(
    "foo_foo %>%\n",
    "  hop_through(forest) %>%\n",
    "  scoop_up(field_mouse) %>%\n",
    "  bop_on(head)",
    sep = ""
  )
  expect_equal(pipefittr(teststring, pretty=T), paste(pipestring))
})

test_that("Complex bunny foo foo convert",{
  skip("Format feature not implemented")
  teststring = paste(
    "tmp_bunny1 <- foo_foo\n",
    "tmp_bunny2 <- hop_through(tmp_bunny1, forest)\n",
    "tmp_bunny3 <- scoop_up(tmp_bunny2, field_mouse)\n",
    "tmp_bunny4 <- bop_on(tmp_bunny3, head),\n",
    sep = ""
  )
  
  pipestring = paste(
    "foo_foo <- little_bunny()\n",
    "tmp_bunny4 <- foo_foo %>%\n", 
    "  hop_through(forest) %>%\n", 
    "  scoop_up(field_mouse) %>%\n",
    "bop_on(head)",
    sep = ""
  )
  expect_match(pipestring, pipefittr(teststring, pretty=TRUE))
})


