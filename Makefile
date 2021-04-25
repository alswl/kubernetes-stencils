kube_icons_version = "unknown"

install:
	pip3 install omnigraffle-stencil

vendor:
	mkdir -p vendor
	git clone --depth=1 https://github.com/kubernetes/community.git vendor/community


build: kube_icons_version=$(shell git -C vendor/community log --format="%h" icons/svg | head -n 1)
build:
	mkdir -p output
	echo 
	omnigraffle-stencil --svg ./vendor/community/icons/svg --stencil-file ./output/kubernetes-$(kube_icons_version).gstencil
	zip -r ./output/kubernetes-$(kube_icons_version).gstencil.zip ./output/kubernetes-$(kube_icons_version).gstencil
