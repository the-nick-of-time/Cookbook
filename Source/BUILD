# load(":compile.bzl", "build_cookbook")
load("@bazel_latex//:latex.bzl", "latex_document")

# build_cookbook(
#     name = "Cookbook"
# )

# build_cookbook(
#     name = "Cookbook - Tested"
# )

latex_document(
    name = "Cookbook",
    main = ":Cookbook.tex",
    srcs = glob([":entries/*.tex"]) + [
        "@bazel_latex//packages:hyperref",
        "@bazel_latex//packages:geometry",
        "@bazel_latex//packages:cuisine",
        "@bazel_latex//packages:fancyhdr",
        "@bazel_latex//packages:subfiles",
        # "@bazel_latex//packages:libertine",
        "@bazel_latex//packages:tabularx",
        "@bazel_latex//packages:etoolbox",
        "@bazel_latex//packages:thumbs",
        "@bazel_latex//packages:tengwarscript",
        "@bazel_latex//packages:diagbox",
        "@bazel_latex//packages:hhline",
        "@bazel_latex//packages:nicefrac",
        "@bazel_latex//packages:siunitx",
        "@bazel_latex//packages:substr",
    ]
)