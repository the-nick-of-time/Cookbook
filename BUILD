load("@bazel_latex//:latex.bzl", "latex_document")

filegroup(
    name = "recipes",
    srcs = glob(["entries/*.tex"]),
)

filegroup(
    name = "packages",
    srcs = [
        "@bazel_latex//packages:fontspec",
        "@bazel_latex//packages:hyperref",
        "@bazel_latex//packages:geometry",
        "@bazel_latex//packages:cuisine",
        "@bazel_latex//packages:fancyhdr",
        "@bazel_latex//packages:subfiles",
        "@bazel_latex//packages:tabularx",
        "@bazel_latex//packages:etoolbox",
        "@bazel_latex//packages:thumbs",
        "@bazel_latex//packages:diagbox",
        "@bazel_latex//packages:hhline",
        "@bazel_latex//packages:nicefrac",
        "@bazel_latex//packages:siunitx",
        "@bazel_latex//packages:substr",
    ],
)

latex_document(
    name = "Cookbook",
    main = "Cookbook.tex",
    srcs = [
        ":recipes",
        ":packages",
    ]
)

latex_document(
    name = "Cookbook-Tested",
    main = "Cookbook.tex",
    srcs = [
        ":recipes",
        ":packages",
    ]
)

latex_document(
    name = "Cookbook-Digital",
    main = "Cookbook.tex",
    srcs = [
        ":recipes",
        ":packages",
    ]
)
