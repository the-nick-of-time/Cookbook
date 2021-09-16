load("@bazel_latex//:latex.bzl", "latex_document")
load("//:cookbook.bzl", "cookbook")

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

py_binary(
    name = "densities",
    srcs = ["densities.py"],
)

genrule(
    name = "density-table",
    tools = [":densities"],
    outs = ["density-table.tex"],
    cmd = "$(location :densities) >$@",
)

py_binary(
    name = "volumes",
    srcs = ["volumes.py"],
)

genrule(
    name = "volume-table",
    tools = [":volumes"],
    outs = ["volume-table.tex"],
    cmd = "$(location :volumes) >$@",
)

cookbook(
    name = "Cookbook",
)

cookbook(
    name = "Cookbook-Tested",
)

cookbook(
    name = "Cookbook-Digital",
)

sh_binary(
    name = "new",
    srcs = [":new.sh"],
)
