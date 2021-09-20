load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file", "http_archive")

http_archive(
    name = "bazel_latex",
    sha256 = "4af7e8bc134e8b24d5f4b01b06d150d096b1698bdcbd38683cd18ee01af39fa5",
    strip_prefix = "bazel-latex-1.1",
    url = "https://github.com/ProdriveTechnologies/bazel-latex/archive/v1.1.tar.gz",
    patches = ["//:packages.patch"],
)

load("@bazel_latex//:repositories.bzl", "latex_repositories")

latex_repositories()

http_file(
    name = "tengwar_quenya",
    urls = ["https://dl.dafont.com/dl/?f=tengwar_quenya"],
    sha256 = "e2b7b6ae14b12dbf717aed4b8d9a9b05b9e46fc6313b7d08bed39caaa019303c",
)

http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.4.0/rules_python-0.4.0.tar.gz",
    sha256 = "954aa89b491be4a083304a2cb838019c8b8c3720a7abb9c4cb81ac7a24230cea",
)
