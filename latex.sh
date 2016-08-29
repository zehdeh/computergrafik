mkdir -p .output
current_dir="$(pwd)"
filename=$(basename "$1")
extension="${filename##*.}"
name="${filename%.*}"
pdflatex --output-directory=.output $name
openout_any=a bibtex .output/$name
pdflatex --output-directory=.output $name
pdflatex --output-directory=.output $name
mv .output/$name.pdf .
echo | evince $name.pdf &
