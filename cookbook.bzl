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


def individual(file):
    name = file.rsplit('.', 1)[0].split('/', 1)[1]
    latex_document(
        name = name,
        main = file,
        srcs = [
            ":packages",
            "Cookbook.tex",
        ]
    )
