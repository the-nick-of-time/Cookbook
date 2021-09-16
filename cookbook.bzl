load("@bazel_latex//:latex.bzl", "latex_document")

def cookbook(name):
    latex_document(
        name = name,
        main = "Cookbook.tex",
        srcs = [
            ":recipes",
            ":packages",
            ":density-table",
            ":volume-table",
        ]
    )