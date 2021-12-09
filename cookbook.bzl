"""Summarize a build of the cookbook, having all prerequisites.

The jobname has to change across the three versions but nothing else.
"""

load("@bazel_latex//:latex.bzl", "latex_document")

def cookbook(name):
    latex_document(
        name = name,
        main = "Cookbook.tex",
        srcs = [
            "//entries:recipes",
            ":packages",
            ":density-table",
            ":volume-table",
        ],
    )
