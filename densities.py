# grams per cup
densities = {
    "Granulated sugar": 190,
    "Brown sugar (packed)": 200,
    "Butter": 230,
    "Water": 240,
    "Flour": 150,
    "Milk": 250,
    "Heavy cream": 230,
    "Honey": 340,
    "Cornmeal": 140,
}

def main():
    print(r'''\begin{table}[ht]
	\centering
	\label{tab:density}
	\caption{Densities of common ingredients}
	\begin{tabular}{c|c|c}
    Ingredient      & \fr{g}{cup} & \fr{g}{tablespoon} \\ \hline''')
    for ingredient, density in densities.items():
        print('{ingredient} & {density} & {dtb:.1f} \\\\'.format(ingredient=ingredient, density=density, dtb=density/16))
    print(r'''\end{tabular}
    \end{table}''')

if __name__ == "__main__":
    main()