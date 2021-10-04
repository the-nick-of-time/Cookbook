"""Summarize the build inputs to the cookbook so only the jobname needs to be specified."""

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
