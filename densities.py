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
	\begin{tabular}{ccc}
    Ingredient      & \fr{g}{cup} & \fr{g}{tablespoon} \\ \midrule''')
    for ingredient, density in densities.items():
        print(f'{ingredient} & {density} & {density/16:.1f} \\\\')
    print(r'''\end{tabular}
    \end{table}''')

if __name__ == "__main__":
    main()