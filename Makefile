REPO = https://github.com/mattam82/Coq-Equations.git
TAG = v1.2.4-8.13
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 --no-checkout -b $(TAG) $(REPO) $(WORKDIR)
	( cd $(WORKDIR) && git checkout $(TAG) )
	cp -r dune-files/* $(WORKDIR)/

