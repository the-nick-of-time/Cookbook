load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

# http_archive(
#     name = "bazel_latex",
#     sha256 = "2d8d5f590cfc8aa8e6d155c37c2d3540f3ab4d23ac96a576cdda8a1cf1b1e3ed",
#     strip_prefix = "bazel-latex-0.19",
#     url = "https://github.com/ProdriveTechnologies/bazel-latex/archive/v0.19.tar.gz",
# )

local_repository(
    name = "bazel_latex",
    path = "/home/nthurmes/code/bazel-latex-customized",
)

load("@bazel_latex//:repositories.bzl", "latex_repositories")

latex_repositories()

http_file(
    name = "tengwar_quenya",
    urls = ["https://dl.dafont.com/dl/?f=tengwar_quenya"],
    sha256 = "e2b7b6ae14b12dbf717aed4b8d9a9b05b9e46fc6313b7d08bed39caaa019303c",
)
