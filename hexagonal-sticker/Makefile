
BUILDDIR = build
SRCDIR = src


PNG_TARGETS = $(patsubst $(SRCDIR)/%-source.svg,$(BUILDDIR)/%.png,$(wildcard $(SRCDIR)/*-source.svg))
SVG_TARGETS = $(patsubst $(SRCDIR)/%-source.svg,$(BUILDDIR)/%.svg,$(wildcard $(SRCDIR)/*-source.svg))

.PHONY: all clean
all: $(PNG_TARGETS) $(SVG_TARGETS)

$(BUILDDIR)/%.png: $(SRCDIR)/%-source.svg
	mkdir -p ${BUILDDIR}
	inkscape $< -i layer3 -j -C -o $@ -w 181 -h 209 -y 0

$(BUILDDIR)/%.svg: $(SRCDIR)/%-source.svg
	mkdir -p ${BUILDDIR}
	inkscape $< -i layer3 -j -C -l -o $@ -w 181 -h 209 -y 0

clean:
	rm -f ${BUILDDIR}/*.png ${BUILDDIR}/*.svg
