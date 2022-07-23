REPO = https://github.com/mattam82/Coq-Equations.git
TAG = v1.3-8.16
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	# some Dune dependency mixup; build plugin first
	dune build '%{cmxa:workdir/src/equations_plugin}'
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 --no-checkout -b $(TAG) $(REPO) $(WORKDIR)
	( cd $(WORKDIR) && git checkout $(TAG) && git apply ../patches/legacy-compat.patch )
	rm $(WORKDIR)/theories/HoTT/dune  # HoTT still not available for 8.14

