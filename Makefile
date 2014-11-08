FILES=index.html

INPUT_DIR=src
OUTPUT_DIR=output

BASE_TEMPLATES=$(INPUT_DIR)/base.html

INPUT_FILES=$(patsubst %,%(INPUT_DIR)/%,$(FILES))
OUTPUT_FILES=$(patsubst %,$(OUTPUT_DIR)/%,$(FILES))

$(OUTPUT_DIR)/%.html: src/%.html $(BASE_TEMPLATES) data.json
	jinja2 --format=json $< data.json > $@

all: $(OUTPUT_FILES)
	rsync -az static/ output/static/

.PHONY: clean

clean:
	rm output/*.html
