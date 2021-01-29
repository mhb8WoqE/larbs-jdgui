share := /usr/local/share/jdgui
bin := $(share)/jdgui.jar
local := /usr/local/bin
script := $(local)/jdgui

install:
	mkdir -p $(share)
	curl -Ls -o $(bin) $$(curl -s https://api.github.com/repos/java-decompiler/jd-gui/releases/latest | grep -P '.*browser_.*(?<!min).jar' | cut -d\" -f4)
	echo -e "#!/usr/bin/sh\njava -Dawt.useSystemAAFontSettings=on -jar $(bin)" > $(script)
	chmod +x $(script)

clean:
	rm $(script)
	rm $(bin)
