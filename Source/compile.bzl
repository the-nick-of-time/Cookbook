def build_cookbook(name):
    native.genrule(
        name = name,
        srcs = [":Cookbook.tex"] + native.glob([":entries/*.tex"]),
        outs = [name + ".pdf"],
        cmd = "pdflatex -synctex=1 -interaction=nonstopmode -jobname='{}' $(location :Cookbook.tex) > /dev/null".format(name)
    )

