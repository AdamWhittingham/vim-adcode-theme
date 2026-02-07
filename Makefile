.PHONY: build
build:
	./theme.rb > colors/adCode.vim

.PHONY: dev
dev:
	bundle exec guard

.PHONY: prod
prod: build
	cp -r colors ~/.config/nvim/
	ls ~/.config/nvim/colors
