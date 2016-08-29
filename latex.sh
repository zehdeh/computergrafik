mkdir -p .output
current_dir="$(pwd)"
filename=$(basename "$1")
extension="${filename##*.}"
name="${filename%.*}"
pdflatex -output-directory=.output $1
mv .output/$name.pdf .
echo | evince $name.pdf &
