load("@bazel_latex//:latex.bzl", "latex_document")

def build_cookbook(name):
    latex_document(
        name = name,
        srcs = native.glob([":entries/*.tex"]) + [
            "@bazel_latex//packages:hyperref",
            "@bazel_latex//packages:cuisine",
            "@bazel_latex//packages:fancyhdr",
            "@bazel_latex//packages:subfiles",
            "@bazel_latex//packages:libertine",
            "@bazel_latex//packages:tabularx",
            "@bazel_latex//packages:etoolbox",
            "@bazel_latex//packages:thumbs",
            "@bazel_latex//packages:tengwarscript",
            "@bazel_latex//packages:slashbox",
            "@bazel_latex//packages:hhline",
            "@bazel_latex//packages:nicefrac",
            "@bazel_latex//packages:siunitx",
            "@bazel_latex//packages:substr",
        ],
        main = ":Cookbook.tex",
    )

