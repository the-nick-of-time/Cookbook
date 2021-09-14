def read_data():
    return {"Water": 240, "Butter": 230}

def table(data):
    body = ["{} & {:.0f} & {:.1f} \\\\".format(name, density, density / 16)
            for name, density in data.items()]
    # using % instead of new-style formatting because otherwise I would have to escape the {}
    template = r"""\begin{table}[ht]
            \centering
            \label{tab:density}
            \caption{Densities of common ingredients}
            \begin{tabular}{c|c|c}
                Ingredient      & \fr{g}{cup} & \fr{g}{tablespoon} \\ \hline
                %s
            \end{tabular}
    \end{table}"""
    return template % '\n'.join(body)

def macro(data):
    template = r"""\DeclareDocumentCommand{\%s}{ m m g }{%
    \IfNoValueTF{#3}{#2}{\fr{{#2}}{{#3}}} % if two arguments, interpret as #2/#3
    cup\IfNoValueTF{#3}{\ifthenelse{\equal{#2}{1}}{}{s}}{s} % if only one argument and that argument is exactly "1" then omit -s, else include it
    \FPupn\grams{\IfNoValueTF{#3}{#2}{#3 #2 /} 150 * 0 round}%
    (\FPprint{\grams} grams) %
    #1 flour}"""
