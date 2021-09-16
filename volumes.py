from fractions import Fraction

# convert to mL
volume = {
    "Teaspoon": 5,
    "Tablespoon": 15,
    "Fluid Ounce": 30,
    "Cup": 240,
    "mL": 1,
}
def nicefrac(mL, othermL):
    ratio = Fraction(mL, othermL)
    if ratio.denominator != 1:
        return f'\\nicefrac{{{ratio.numerator}}}{{{ratio.denominator}}}'
    return str(ratio.numerator)

def main():
    print(r'''\begin{table}[h]
	\centering
	\label{tab:volume}
	\caption{Volume}
	\begin{tabular}{c||c|c|c|c|c}
    \diagbox[dir=NW]{One}{Is this many}& \textbf{mL} & \textbf{Teaspoon} & \textbf{Tablespoon} & \textbf{Fluid Ounce} & \textbf{Cup} \\ \hhline{=#=|=|=|=|=}''')

    order = sorted(volume.items(), key=lambda item: item[1])
    for name, mL in order:
        row = [f'\\textbf{{{name}}}'] + [nicefrac(mL, othermL) for _, othermL in order]
        print('&'.join(row), end="\\\\\n")

    print(r'''\end{tabular}
    \end{table}''')

if __name__ == "__main__":
    main()
