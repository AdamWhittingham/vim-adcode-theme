.PHONY: build
build:
	./theme.rb > colors/adCode.vim

.PHONY: dev
dev:
	bundle exec guard

.PHONY: test
test: build
	cp -r colors ~/.config/nvim/
	ls ~/.config/nvim/colors

.PHONY: test-clean
test-clean:
	rm ~/.config/nvim/colors/adCode.vim
	rm ~/.vim/colors/adCode.vim
