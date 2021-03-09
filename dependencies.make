URL=http://www.freebasic.su
URL_ARTICLES=$(URL)/articles
URL_AVATARS=$(URL)/avatars
URL_CATEGORIES=$(URL)/categories
URL_HELP=$(URL)/help
URL_PROFILEPICTURES=$(URL)/profilepictures
URL_PROJECTS=$(URL)/projects
URL_RES=$(URL)/res
URL_TASKS=$(URL)/tasks
URL_TUTORIALS=$(URL)/tutorials
URL_USERS=$(URL)/users

BIN_DIR=C:\Programming\WebSites\www.freebasic.su
BIN_DIR_ARTICLES=$(BIN_DIR)\articles
BIN_DIR_CATEGORIES=$(BIN_DIR)\categories
BIN_DIR_TUTORIALS=$(BIN_DIR)\tutorials
BIN_DIR_TASKS=$(BIN_DIR)\tasks
BIN_DIR_PROJECTS=$(BIN_DIR)\projects
BIN_DIR_USERS=$(BIN_DIR)\users
BIN_DIR_HELP=$(BIN_DIR)\help
BIN_DIR_AVATARS=$(BIN_DIR)\avatars
BIN_DIR_PROFILEPICTURES=$(BIN_DIR)\profilepictures
BIN_DIR_RES=$(BIN_DIR)\res
OBJ_DIR=obj
OBJ_DIR_ARTICLES=$(OBJ_DIR)\articles
OBJ_DIR_CATEGORIES=$(OBJ_DIR)\categories
OBJ_DIR_TUTORIALS=$(OBJ_DIR)\tutorials
OBJ_DIR_TASKS=$(OBJ_DIR)\tasks
OBJ_DIR_PROJECTS=$(OBJ_DIR)\projects
OBJ_DIR_USERS=$(OBJ_DIR)\users
OBJ_DIR_HELP=$(OBJ_DIR)\help
TMP_DIR=tmp

configure:
	mkdir $(BIN_DIR)
	mkdir $(BIN_DIR_ARTICLES)
	mkdir $(BIN_DIR_AVATARS)
	mkdir $(BIN_DIR_CATEGORIES)
	mkdir $(BIN_DIR_HELP)
	mkdir $(BIN_DIR_PROFILEPICTURES)
	mkdir $(BIN_DIR_PROJECTS)
	mkdir $(BIN_DIR_RES)
	mkdir $(BIN_DIR_TASKS)
	mkdir $(BIN_DIR_TUTORIALS)
	mkdir $(BIN_DIR_USERS)
	mkdir $(OBJ_DIR)
	mkdir $(OBJ_DIR_ARTICLES)
	mkdir $(OBJ_DIR_CATEGORIES)
	mkdir $(OBJ_DIR_TUTORIALS)
	mkdir $(OBJ_DIR_TASKS)
	mkdir $(OBJ_DIR_PROJECTS)
	mkdir $(OBJ_DIR_USERS)
	mkdir $(OBJ_DIR_HELP)
	mkdir $(TMP_DIR)

BINARY_TARGETS: $(BIN_DIR)\robots.txt $(BIN_DIR)\favicon.ico $(BIN_DIR)\googledffc38e6f05ff431.html $(BIN_DIR)\yandex_461c9af9cde122fb.html $(BIN_DIR_AVATARS)\mabu.50x50.jpg $(BIN_DIR_AVATARS)\mabu.90x90.png $(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg $(BIN_DIR_RES)\heap.zip

TEXT_TARGETS: $(BIN_DIR)\rss.rss.gz $(BIN_DIR)\rss.rss $(BIN_DIR)\sitemap.xml.gz $(BIN_DIR)\sitemap.xml $(BIN_DIR)\styles.css.gz $(BIN_DIR)\styles.css

GENERATED_TARGETS: $(BIN_DIR)\default.htm.gz $(BIN_DIR_ARTICLES)\default.htm.gz $(BIN_DIR_ARTICLES)\bstr.htm.gz $(BIN_DIR_ARTICLES)\guid.htm.gz $(BIN_DIR_ARTICLES)\hresult.htm.gz $(BIN_DIR_ARTICLES)\inifiles.htm.gz $(BIN_DIR_ARTICLES)\winapi-errors.htm.gz $(BIN_DIR_ARTICLES)\winapi-registry.htm.gz $(BIN_DIR_TUTORIALS)\default.htm.gz $(BIN_DIR_TUTORIALS)\install.htm.gz $(BIN_DIR_PROJECTS)\default.htm.gz $(BIN_DIR_USERS)\default.htm.gz $(BIN_DIR_USERS)\mabu.htm.gz $(BIN_DIR_HELP)\default.htm.gz $(BIN_DIR_HELP)\about.htm.gz $(BIN_DIR_HELP)\links.htm.gz


$(BIN_DIR)\robots.txt: robots.txt
	copy /B /Y robots.txt $(BIN_DIR)\robots.txt
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/robots.txt $(BIN_DIR)\robots.txt $(MIME_TEXT_PLAIN) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\favicon.ico: favicon.ico
	copy /B /Y favicon.ico $(BIN_DIR)\favicon.ico
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/favicon.ico $(BIN_DIR)\favicon.ico $(MIME_IMAGE_ICON) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\googledffc38e6f05ff431.html: googledffc38e6f05ff431.html
	copy /B /Y googledffc38e6f05ff431.html $(BIN_DIR)\googledffc38e6f05ff431.html
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/googledffc38e6f05ff431.html $(BIN_DIR)\googledffc38e6f05ff431.html $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\yandex_461c9af9cde122fb.html: yandex_461c9af9cde122fb.html
	copy /B /Y yandex_461c9af9cde122fb.html $(BIN_DIR)\yandex_461c9af9cde122fb.html
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/yandex_461c9af9cde122fb.html $(BIN_DIR)\yandex_461c9af9cde122fb.html $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_AVATARS)\mabu.50x50.jpg: avatars\mabu.50x50.jpg
	copy /B /Y avatars\mabu.50x50.jpg $(BIN_DIR_AVATARS)\mabu.50x50.jpg
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_AVATARS)/mabu.50x50.jpg $(BIN_DIR_AVATARS)\mabu.50x50.jpg $(MIME_IMAGE_JPEG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_AVATARS)\mabu.90x90.png: avatars\mabu.90x90.png
	copy /B /Y avatars\mabu.90x90.png $(BIN_DIR_AVATARS)\mabu.90x90.png
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_AVATARS)/mabu.90x90.png $(BIN_DIR_AVATARS)\mabu.90x90.png $(MIME_IMAGE_PNG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg: profilepictures\mabu.original.jpg
	copy /B /Y profilepictures\mabu.original.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_PROFILEPICTURES)/mabu.original.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg $(MIME_IMAGE_JPEG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg: profilepictures\mabu.200x200.jpg
	copy /B /Y profilepictures\mabu.200x200.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_PROFILEPICTURES)/mabu.200x200.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg $(MIME_IMAGE_JPEG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_RES)\heap.zip: res\heap.zip
	copy /B /Y res\heap.zip $(BIN_DIR_RES)\heap.zip
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_RES)/heap.zip $(BIN_DIR_RES)\heap.zip $(MIME_APPLICATION_ZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR)\styles.css: $(OBJ_DIR)\styles.css
	copy /Y $(OBJ_DIR)\styles.css $(BIN_DIR)\styles.css
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/styles.css    $(BIN_DIR)\styles.css    $(MIME_TEXT_CSS)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\styles.css: styles.css
	$(ONELINE_UTIL_PATH) /utf-8 styles.css
	move /Y styles.css.txt $(OBJ_DIR)\styles.css

$(BIN_DIR)\styles.css.gz: $(OBJ_DIR)\styles.css.utf-8wobom.txt
	copy /Y $(OBJ_DIR)\styles.css.utf-8wobom.txt $(TMP_DIR)\styles.css
	creategzip.cmd $(TMP_DIR) styles.css.gz styles.css
	del $(TMP_DIR)\styles.css
	move /Y $(TMP_DIR)\styles.css.gz $(BIN_DIR)\styles.css.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/styles.css.gz $(BIN_DIR)\styles.css.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\styles.css.utf-8wobom.txt: styles.css
	$(ONELINE_UTIL_PATH) /utf-8wobom styles.css
	move /Y styles.css.utf-8wobom.txt $(OBJ_DIR)\styles.css.utf-8wobom.txt

