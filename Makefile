clean:
	echo "cleaning"
	rm -rf build/public_html/*

tangle:
	echo "tangling"
	emacs --batch -l org --eval "(setq org-confirm-babel-evaluate nil)" --eval "(org-babel-tangle-file \"src/posts/org-publish.org\")"

build:
	echo "building"
	emacs --batch -l org --script "scripts/build.el"

publish: 
	echo "publishing"
	bash ./private-sync-script.sh

all: tangle build publish  	
	echo "all done"
