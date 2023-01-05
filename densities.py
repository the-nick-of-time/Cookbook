import sys

# grams per cup
densities = [
    ("Granulated sugar", "sugar", 190),
    ("Brown sugar (packed)", "brownsugar", 200),
    ("Powdered sugar", "powderedsugar", 190),
    ("Butter", "butter", 230),
    ("Water", "water", 240),
    ("Flour", "SKIP", 150),
    ("Milk", "milk", 250),
    ("Heavy cream", "cream", 230),
    ("Honey", "honey", 340),
    ("Cornmeal", "cornmeal", 140),
    ("Buttermilk powder", "buttermilk", 160),
]

def table():
    print(r'''\begin{table}[ht]
	\centering
	\label{tab:density}
	\caption{Densities of common ingredients}
	\begin{tabular}{ccc}
    Ingredient      & \fr{g}{cup} & \fr{g}{tablespoon} \\ \midrule''')
    for ingredient, _, density in densities:
        print(f'{ingredient} & {density} & {density/16:.1f} \\\\')
    print(r'''\end{tabular}
    \end{table}''')

def macros():
    for ingredient, macro, density in densities:
        if macro == "SKIP":
            continue
        print(fr'\newcommand{{\{macro}}}[1]{{\directlua{{tex.print(doc.density("{ingredient.lower()}", "cup", {density}, \luastring{{#1}}))}}}}')

if __name__ == "__main__":
    options = {
        "table": table,
        "macros": macros,
    }
    options[sys.argv[1]]()
