#!/bin/bash

echo Enter the name of the dish: >&2
read title
echo Enter how long it takes to make: >&2
read time
echo Enter how much it produces: >&2
read yield

./new.sh "$title" "$time" "$yield"
