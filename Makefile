.PHONY: all clean install uninstall configure

CONTENT_LANGUAGE="Content-Language: ru"
MIME_TEXT_CSS=text/css
MIME_TEXT_HTML=text/html
MIME_TEXT_PLAIN=text/plain
MIME_IMAGE_ICON=image/vnd.microsoft.icon
MIME_IMAGE_JPEG=image/jpeg
MIME_IMAGE_PNG=image/png
MIME_APPLICATION_ZIP=application/zip
MIME_APPLICATION_GZIP=application/x-gzip
MIME_APPLICATION_XML=application/xml
MIME_APPLICATION_RSSXML=application/rss+xml

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

BINARY_TARGETS=$(BIN_DIR)\robots.txt $(BIN_DIR)\favicon.ico $(BIN_DIR)\googledffc38e6f05ff431.html $(BIN_DIR)\yandex_461c9af9cde122fb.html $(BIN_DIR_AVATARS)\mabu.50x50.jpg $(BIN_DIR_AVATARS)\mabu.90x90.png $(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg $(BIN_DIR_RES)\heap.zip

TEXT_TARGETS=$(BIN_DIR)\rss.rss.gz $(BIN_DIR)\rss.rss $(BIN_DIR)\sitemap.xml.gz $(BIN_DIR)\sitemap.xml $(BIN_DIR)\styles.css.gz $(BIN_DIR)\styles.css

ARTICLES=$(BIN_DIR_ARTICLES)\default.htm.gz $(BIN_DIR_ARTICLES)\default.htm $(BIN_DIR_ARTICLES)\poorly-designed-code.htm.gz $(BIN_DIR_ARTICLES)\poorly-designed-code.htm $(BIN_DIR_ARTICLES)\tips.htm.gz $(BIN_DIR_ARTICLES)\tips.htm $(BIN_DIR_ARTICLES)\bstr.htm.gz $(BIN_DIR_ARTICLES)\bstr.htm $(BIN_DIR_ARTICLES)\guid.htm.gz $(BIN_DIR_ARTICLES)\guid.htm $(BIN_DIR_ARTICLES)\hresult.htm.gz $(BIN_DIR_ARTICLES)\hresult.htm $(BIN_DIR_ARTICLES)\inifiles.htm.gz $(BIN_DIR_ARTICLES)\inifiles.htm $(BIN_DIR_ARTICLES)\unicode.htm.gz $(BIN_DIR_ARTICLES)\unicode.htm $(BIN_DIR_ARTICLES)\winapi-errors.htm.gz $(BIN_DIR_ARTICLES)\winapi-errors.htm $(BIN_DIR_ARTICLES)\winapi-registry.htm.gz $(BIN_DIR_ARTICLES)\winapi-registry.htm

TUTORIALS=$(BIN_DIR_TUTORIALS)\default.htm.gz $(BIN_DIR_TUTORIALS)\default.htm $(BIN_DIR_TUTORIALS)\install.htm.gz $(BIN_DIR_TUTORIALS)\install.htm $(BIN_DIR_TUTORIALS)\first-program.htm.gz $(BIN_DIR_TUTORIALS)\first-program.htm $(BIN_DIR_TUTORIALS)\datatypes.htm.gz $(BIN_DIR_TUTORIALS)\datatypes.htm $(BIN_DIR_TUTORIALS)\variables.htm.gz $(BIN_DIR_TUTORIALS)\variables.htm $(BIN_DIR_TUTORIALS)\statements.htm.gz $(BIN_DIR_TUTORIALS)\statements.htm

GENERATED_TARGETS=$(BIN_DIR)\default.htm.gz $(BIN_DIR)\default.htm $(ARTICLES) $(TUTORIALS) $(BIN_DIR_PROJECTS)\default.htm.gz $(BIN_DIR_PROJECTS)\default.htm $(BIN_DIR_USERS)\default.htm.gz $(BIN_DIR_USERS)\default.htm $(BIN_DIR_USERS)\mabu.htm.gz $(BIN_DIR_USERS)\mabu.htm $(BIN_DIR_HELP)\default.htm.gz $(BIN_DIR_HELP)\default.htm $(BIN_DIR_HELP)\about.htm.gz $(BIN_DIR_HELP)\about.htm $(BIN_DIR_HELP)\links.htm.gz $(BIN_DIR_HELP)\links.htm

TEMPLATES=templates\main.htm templates\styles.css.utf-8wobom.txt 

all: $(BINARY_TARGETS) $(TEXT_TARGETS) $(GENERATED_TARGETS)

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


$(BIN_DIR)\styles.css: templates\styles.css.txt
	copy /Y templates\styles.css.txt $(BIN_DIR)\styles.css
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/styles.css    $(BIN_DIR)\styles.css    $(MIME_TEXT_CSS)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

templates\styles.css.txt: styles.css
	$(ONELINE_UTIL_PATH) /utf-8 styles.css
	move /Y styles.css.txt templates\styles.css.txt

$(BIN_DIR)\styles.css.gz: templates\styles.css.utf-8wobom.txt
	copy /Y templates\styles.css.utf-8wobom.txt $(TMP_DIR)\styles.css
	creategzip.cmd $(TMP_DIR) styles.css.gz styles.css
	del $(TMP_DIR)\styles.css
	move /Y $(TMP_DIR)\styles.css.gz $(BIN_DIR)\styles.css.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/styles.css.gz $(BIN_DIR)\styles.css.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

templates\styles.css.utf-8wobom.txt: styles.css
	$(ONELINE_UTIL_PATH) /utf-8wobom styles.css
	move /Y styles.css.utf-8wobom.txt templates\styles.css.utf-8wobom.txt


$(BIN_DIR)\rss.rss: $(OBJ_DIR)\rss.rss.txt
	copy /Y $(OBJ_DIR)\rss.rss.txt $(BIN_DIR)\rss.rss
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/rss.rss    $(BIN_DIR)\rss.rss    $(MIME_APPLICATION_RSSXML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\rss.rss.txt: rss.rss
	$(ONELINE_UTIL_PATH) /utf-8 rss.rss
	move /Y rss.rss.txt $(OBJ_DIR)\rss.rss.txt

$(BIN_DIR)\rss.rss.gz: $(OBJ_DIR)\rss.rss.utf-8wobom.txt
	copy /Y $(OBJ_DIR)\rss.rss.utf-8wobom.txt $(TMP_DIR)\rss.rss
	creategzip.cmd $(TMP_DIR) rss.rss.gz rss.rss
	del $(TMP_DIR)\rss.rss
	move /Y $(TMP_DIR)\rss.rss.gz $(BIN_DIR)\rss.rss.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/rss.rss.gz $(BIN_DIR)\rss.rss.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\rss.rss.utf-8wobom.txt: rss.rss
	$(ONELINE_UTIL_PATH) /utf-8wobom rss.rss
	move /Y rss.rss.utf-8wobom.txt $(OBJ_DIR)\rss.rss.utf-8wobom.txt


$(BIN_DIR)\sitemap.xml: $(OBJ_DIR)\sitemap.xml.txt
	copy /Y $(OBJ_DIR)\sitemap.xml.txt $(BIN_DIR)\sitemap.xml
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/sitemap.xml    $(BIN_DIR)\sitemap.xml    $(MIME_APPLICATION_XML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\sitemap.xml.txt: sitemap.xml
	$(ONELINE_UTIL_PATH) /utf-8 sitemap.xml
	move /Y sitemap.xml.txt $(OBJ_DIR)\sitemap.xml.txt

$(BIN_DIR)\sitemap.xml.gz: $(OBJ_DIR)\sitemap.xml.utf-8wobom.txt
	copy /Y $(OBJ_DIR)\sitemap.xml.utf-8wobom.txt $(TMP_DIR)\sitemap.xml
	creategzip.cmd $(TMP_DIR) sitemap.xml.gz sitemap.xml
	del $(TMP_DIR)\sitemap.xml
	move /Y $(TMP_DIR)\sitemap.xml.gz $(BIN_DIR)\sitemap.xml.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/sitemap.xml.gz $(BIN_DIR)\sitemap.xml.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\sitemap.xml.utf-8wobom.txt: sitemap.xml
	$(ONELINE_UTIL_PATH) /utf-8wobom sitemap.xml
	move /Y sitemap.xml.utf-8wobom.txt $(OBJ_DIR)\sitemap.xml.utf-8wobom.txt


$(OBJ_DIR)\default.htm: default.options.yaml $(TEMPLATES) default.metadata.yaml default.md
	$(PANDOC_UTIL_PATH) -d default.options.yaml
	move /Y default.htm $(OBJ_DIR)\default.htm

$(BIN_DIR)\default.htm: $(OBJ_DIR)\default.htm.txt
	copy /Y $(OBJ_DIR)\default.htm.txt $(BIN_DIR)\default.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/default.htm    $(BIN_DIR)\default.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\default.htm.txt: $(OBJ_DIR)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR)\default.htm

$(BIN_DIR)\default.htm.gz: $(OBJ_DIR)\default.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR)\default.htm.utf-8wobom.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	del $(TMP_DIR)\default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR)\default.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/default.htm.gz $(BIN_DIR)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\default.htm.utf-8wobom.txt: $(OBJ_DIR)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR)\default.htm


$(OBJ_DIR_ARTICLES)\default.htm: articles\default.options.yaml $(TEMPLATES) articles\default.metadata.yaml articles\default.md
	$(PANDOC_UTIL_PATH) -d articles\default.options.yaml
	move /Y articles\default.htm $(OBJ_DIR_ARTICLES)\default.htm

$(BIN_DIR_ARTICLES)\default.htm: $(OBJ_DIR_ARTICLES)\default.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\default.htm.txt $(BIN_DIR_ARTICLES)\default.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/default.htm    $(BIN_DIR_ARTICLES)\default.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\default.htm.txt: $(OBJ_DIR_ARTICLES)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\default.htm

$(BIN_DIR_ARTICLES)\default.htm.gz: $(OBJ_DIR_ARTICLES)\default.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\default.htm.utf-8wobom.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	del $(TMP_DIR)\default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_ARTICLES)\default.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/default.htm.gz $(BIN_DIR_ARTICLES)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\default.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\default.htm


$(OBJ_DIR_ARTICLES)\poorly-designed-code.htm: articles\poorly-designed-code.options.yaml $(TEMPLATES) articles\poorly-designed-code.metadata.yaml articles\poorly-designed-code.md
	$(PANDOC_UTIL_PATH) -d articles\poorly-designed-code.options.yaml
	move /Y articles\poorly-designed-code.htm $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm

$(BIN_DIR_ARTICLES)\poorly-designed-code.htm: $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm.txt $(BIN_DIR_ARTICLES)\poorly-designed-code.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/poorly-designed-code.htm    $(BIN_DIR_ARTICLES)\poorly-designed-code.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\poorly-designed-code.htm.txt: $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm

$(BIN_DIR_ARTICLES)\poorly-designed-code.htm.gz: $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm.utf-8wobom.txt $(TMP_DIR)\poorly-designed-code.htm
	creategzip.cmd $(TMP_DIR) poorly-designed-code.htm.gz poorly-designed-code.htm
	del $(TMP_DIR)\poorly-designed-code.htm
	move /Y $(TMP_DIR)\poorly-designed-code.htm.gz $(BIN_DIR_ARTICLES)\poorly-designed-code.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/poorly-designed-code.htm.gz $(BIN_DIR_ARTICLES)\poorly-designed-code.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\poorly-designed-code.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\poorly-designed-code.htm


$(OBJ_DIR_ARTICLES)\tips.htm: articles\tips.options.yaml $(TEMPLATES) articles\tips.metadata.yaml articles\tips.md
	$(PANDOC_UTIL_PATH) -d articles\tips.options.yaml
	move /Y articles\tips.htm $(OBJ_DIR_ARTICLES)\tips.htm

$(BIN_DIR_ARTICLES)\tips.htm: $(OBJ_DIR_ARTICLES)\tips.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\tips.htm.txt $(BIN_DIR_ARTICLES)\tips.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/tips.htm    $(BIN_DIR_ARTICLES)\tips.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\tips.htm.txt: $(OBJ_DIR_ARTICLES)\tips.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\tips.htm

$(BIN_DIR_ARTICLES)\tips.htm.gz: $(OBJ_DIR_ARTICLES)\tips.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\tips.htm.utf-8wobom.txt $(TMP_DIR)\tips.htm
	creategzip.cmd $(TMP_DIR) tips.htm.gz tips.htm
	del $(TMP_DIR)\tips.htm
	move /Y $(TMP_DIR)\tips.htm.gz $(BIN_DIR_ARTICLES)\tips.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/tips.htm.gz $(BIN_DIR_ARTICLES)\tips.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\tips.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\tips.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\tips.htm


$(OBJ_DIR_ARTICLES)\bstr.htm: articles\bstr.options.yaml $(TEMPLATES) articles\bstr.metadata.yaml articles\bstr.md
	$(PANDOC_UTIL_PATH) -d articles\bstr.options.yaml
	move /Y articles\bstr.htm $(OBJ_DIR_ARTICLES)\bstr.htm

$(BIN_DIR_ARTICLES)\bstr.htm: $(OBJ_DIR_ARTICLES)\bstr.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\bstr.htm.txt $(BIN_DIR_ARTICLES)\bstr.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/bstr.htm    $(BIN_DIR_ARTICLES)\bstr.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\bstr.htm.txt: $(OBJ_DIR_ARTICLES)\bstr.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\bstr.htm

$(BIN_DIR_ARTICLES)\bstr.htm.gz: $(OBJ_DIR_ARTICLES)\bstr.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\bstr.htm.utf-8wobom.txt $(TMP_DIR)\bstr.htm
	creategzip.cmd $(TMP_DIR) bstr.htm.gz bstr.htm
	del $(TMP_DIR)\bstr.htm
	move /Y $(TMP_DIR)\bstr.htm.gz $(BIN_DIR_ARTICLES)\bstr.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/bstr.htm.gz $(BIN_DIR_ARTICLES)\bstr.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\bstr.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\bstr.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\bstr.htm


$(OBJ_DIR_ARTICLES)\guid.htm: articles\guid.options.yaml $(TEMPLATES) articles\guid.metadata.yaml articles\guid.md
	$(PANDOC_UTIL_PATH) -d articles\guid.options.yaml
	move /Y articles\guid.htm $(OBJ_DIR_ARTICLES)\guid.htm

$(BIN_DIR_ARTICLES)\guid.htm: $(OBJ_DIR_ARTICLES)\guid.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\guid.htm.txt $(BIN_DIR_ARTICLES)\guid.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/guid.htm    $(BIN_DIR_ARTICLES)\guid.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\guid.htm.txt: $(OBJ_DIR_ARTICLES)\guid.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\guid.htm

$(BIN_DIR_ARTICLES)\guid.htm.gz: $(OBJ_DIR_ARTICLES)\guid.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\guid.htm.utf-8wobom.txt $(TMP_DIR)\guid.htm
	creategzip.cmd $(TMP_DIR) guid.htm.gz guid.htm
	del $(TMP_DIR)\guid.htm
	move /Y $(TMP_DIR)\guid.htm.gz $(BIN_DIR_ARTICLES)\guid.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/guid.htm.gz $(BIN_DIR_ARTICLES)\guid.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\guid.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\guid.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\guid.htm


$(OBJ_DIR_ARTICLES)\hresult.htm: articles\hresult.options.yaml $(TEMPLATES) articles\hresult.metadata.yaml articles\hresult.md
	$(PANDOC_UTIL_PATH) -d articles\hresult.options.yaml
	move /Y articles\hresult.htm $(OBJ_DIR_ARTICLES)\hresult.htm

$(BIN_DIR_ARTICLES)\hresult.htm: $(OBJ_DIR_ARTICLES)\hresult.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\hresult.htm.txt $(BIN_DIR_ARTICLES)\hresult.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/hresult.htm    $(BIN_DIR_ARTICLES)\hresult.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\hresult.htm.txt: $(OBJ_DIR_ARTICLES)\hresult.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\hresult.htm

$(BIN_DIR_ARTICLES)\hresult.htm.gz: $(OBJ_DIR_ARTICLES)\hresult.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\hresult.htm.utf-8wobom.txt $(TMP_DIR)\hresult.htm
	creategzip.cmd $(TMP_DIR) hresult.htm.gz hresult.htm
	del $(TMP_DIR)\hresult.htm
	move /Y $(TMP_DIR)\hresult.htm.gz $(BIN_DIR_ARTICLES)\hresult.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/hresult.htm.gz $(BIN_DIR_ARTICLES)\hresult.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\hresult.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\hresult.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\hresult.htm


$(OBJ_DIR_ARTICLES)\inifiles.htm: articles\inifiles.options.yaml $(TEMPLATES) articles\inifiles.metadata.yaml articles\inifiles.md
	$(PANDOC_UTIL_PATH) -d articles\inifiles.options.yaml
	move /Y articles\inifiles.htm $(OBJ_DIR_ARTICLES)\inifiles.htm

$(BIN_DIR_ARTICLES)\inifiles.htm: $(OBJ_DIR_ARTICLES)\inifiles.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\inifiles.htm.txt $(BIN_DIR_ARTICLES)\inifiles.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/inifiles.htm    $(BIN_DIR_ARTICLES)\inifiles.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\inifiles.htm.txt: $(OBJ_DIR_ARTICLES)\inifiles.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\inifiles.htm

$(BIN_DIR_ARTICLES)\inifiles.htm.gz: $(OBJ_DIR_ARTICLES)\inifiles.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\inifiles.htm.utf-8wobom.txt $(TMP_DIR)\inifiles.htm
	creategzip.cmd $(TMP_DIR) inifiles.htm.gz inifiles.htm
	del $(TMP_DIR)\inifiles.htm
	move /Y $(TMP_DIR)\inifiles.htm.gz $(BIN_DIR_ARTICLES)\inifiles.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/inifiles.htm.gz $(BIN_DIR_ARTICLES)\inifiles.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\inifiles.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\inifiles.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\inifiles.htm


$(OBJ_DIR_ARTICLES)\unicode.htm: articles\unicode.options.yaml $(TEMPLATES) articles\unicode.metadata.yaml articles\unicode.md
	$(PANDOC_UTIL_PATH) -d articles\unicode.options.yaml
	move /Y articles\unicode.htm $(OBJ_DIR_ARTICLES)\unicode.htm

$(BIN_DIR_ARTICLES)\unicode.htm: $(OBJ_DIR_ARTICLES)\unicode.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\unicode.htm.txt $(BIN_DIR_ARTICLES)\unicode.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/unicode.htm    $(BIN_DIR_ARTICLES)\unicode.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\unicode.htm.txt: $(OBJ_DIR_ARTICLES)\unicode.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\unicode.htm

$(BIN_DIR_ARTICLES)\unicode.htm.gz: $(OBJ_DIR_ARTICLES)\unicode.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\unicode.htm.utf-8wobom.txt $(TMP_DIR)\unicode.htm
	creategzip.cmd $(TMP_DIR) unicode.htm.gz unicode.htm
	del $(TMP_DIR)\unicode.htm
	move /Y $(TMP_DIR)\unicode.htm.gz $(BIN_DIR_ARTICLES)\unicode.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/unicode.htm.gz $(BIN_DIR_ARTICLES)\unicode.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\unicode.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\unicode.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\unicode.htm


$(OBJ_DIR_ARTICLES)\winapi-errors.htm: articles\winapi-errors.options.yaml $(TEMPLATES) articles\winapi-errors.metadata.yaml articles\winapi-errors.md
	$(PANDOC_UTIL_PATH) -d articles\winapi-errors.options.yaml
	move /Y articles\winapi-errors.htm $(OBJ_DIR_ARTICLES)\winapi-errors.htm

$(BIN_DIR_ARTICLES)\winapi-errors.htm: $(OBJ_DIR_ARTICLES)\winapi-errors.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\winapi-errors.htm.txt $(BIN_DIR_ARTICLES)\winapi-errors.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/winapi-errors.htm    $(BIN_DIR_ARTICLES)\winapi-errors.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\winapi-errors.htm.txt: $(OBJ_DIR_ARTICLES)\winapi-errors.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\winapi-errors.htm

$(BIN_DIR_ARTICLES)\winapi-errors.htm.gz: $(OBJ_DIR_ARTICLES)\winapi-errors.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\winapi-errors.htm.utf-8wobom.txt $(TMP_DIR)\winapi-errors.htm
	creategzip.cmd $(TMP_DIR) winapi-errors.htm.gz winapi-errors.htm
	del $(TMP_DIR)\winapi-errors.htm
	move /Y $(TMP_DIR)\winapi-errors.htm.gz $(BIN_DIR_ARTICLES)\winapi-errors.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/winapi-errors.htm.gz $(BIN_DIR_ARTICLES)\winapi-errors.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\winapi-errors.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\winapi-errors.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\winapi-errors.htm


$(OBJ_DIR_ARTICLES)\winapi-registry.htm: articles\winapi-registry.options.yaml $(TEMPLATES) articles\winapi-registry.metadata.yaml articles\winapi-registry.md
	$(PANDOC_UTIL_PATH) -d articles\winapi-registry.options.yaml
	move /Y articles\winapi-registry.htm $(OBJ_DIR_ARTICLES)\winapi-registry.htm

$(BIN_DIR_ARTICLES)\winapi-registry.htm: $(OBJ_DIR_ARTICLES)\winapi-registry.htm.txt
	copy /Y $(OBJ_DIR_ARTICLES)\winapi-registry.htm.txt $(BIN_DIR_ARTICLES)\winapi-registry.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/winapi-registry.htm    $(BIN_DIR_ARTICLES)\winapi-registry.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\winapi-registry.htm.txt: $(OBJ_DIR_ARTICLES)\winapi-registry.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_ARTICLES)\winapi-registry.htm

$(BIN_DIR_ARTICLES)\winapi-registry.htm.gz: $(OBJ_DIR_ARTICLES)\winapi-registry.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_ARTICLES)\winapi-registry.htm.utf-8wobom.txt $(TMP_DIR)\winapi-registry.htm
	creategzip.cmd $(TMP_DIR) winapi-registry.htm.gz winapi-registry.htm
	del $(TMP_DIR)\winapi-registry.htm
	move /Y $(TMP_DIR)\winapi-registry.htm.gz $(BIN_DIR_ARTICLES)\winapi-registry.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_ARTICLES)/winapi-registry.htm.gz $(BIN_DIR_ARTICLES)\winapi-registry.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_ARTICLES)\winapi-registry.htm.utf-8wobom.txt: $(OBJ_DIR_ARTICLES)\winapi-registry.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_ARTICLES)\winapi-registry.htm


$(OBJ_DIR_TUTORIALS)\default.htm: tutorials\default.options.yaml $(TEMPLATES) tutorials\default.metadata.yaml tutorials\default.md
	$(PANDOC_UTIL_PATH) -d tutorials\default.options.yaml
	move /Y tutorials\default.htm $(OBJ_DIR_TUTORIALS)\default.htm

$(BIN_DIR_TUTORIALS)\default.htm: $(OBJ_DIR_TUTORIALS)\default.htm.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\default.htm.txt $(BIN_DIR_TUTORIALS)\default.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/default.htm    $(BIN_DIR_TUTORIALS)\default.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\default.htm.txt: $(OBJ_DIR_TUTORIALS)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_TUTORIALS)\default.htm

$(BIN_DIR_TUTORIALS)\default.htm.gz: $(OBJ_DIR_TUTORIALS)\default.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\default.htm.utf-8wobom.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	del $(TMP_DIR)\default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_TUTORIALS)\default.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/default.htm.gz $(BIN_DIR_TUTORIALS)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\default.htm.utf-8wobom.txt: $(OBJ_DIR_TUTORIALS)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_TUTORIALS)\default.htm


$(OBJ_DIR_TUTORIALS)\install.htm: tutorials\install.options.yaml $(TEMPLATES) tutorials\install.metadata.yaml tutorials\install.md
	$(PANDOC_UTIL_PATH) -d tutorials\install.options.yaml
	move /Y tutorials\install.htm $(OBJ_DIR_TUTORIALS)\install.htm

$(BIN_DIR_TUTORIALS)\install.htm: $(OBJ_DIR_TUTORIALS)\install.htm.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\install.htm.txt $(BIN_DIR_TUTORIALS)\install.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/install.htm    $(BIN_DIR_TUTORIALS)\install.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\install.htm.txt: $(OBJ_DIR_TUTORIALS)\install.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_TUTORIALS)\install.htm

$(BIN_DIR_TUTORIALS)\install.htm.gz: $(OBJ_DIR_TUTORIALS)\install.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\install.htm.utf-8wobom.txt $(TMP_DIR)\install.htm
	creategzip.cmd $(TMP_DIR) install.htm.gz install.htm
	del $(TMP_DIR)\install.htm
	move /Y $(TMP_DIR)\install.htm.gz $(BIN_DIR_TUTORIALS)\install.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/install.htm.gz $(BIN_DIR_TUTORIALS)\install.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\install.htm.utf-8wobom.txt: $(OBJ_DIR_TUTORIALS)\install.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_TUTORIALS)\install.htm


$(OBJ_DIR_TUTORIALS)\first-program.htm: tutorials\first-program.options.yaml $(TEMPLATES) tutorials\first-program.metadata.yaml tutorials\first-program.md
	$(PANDOC_UTIL_PATH) -d tutorials\first-program.options.yaml
	move /Y tutorials\first-program.htm $(OBJ_DIR_TUTORIALS)\first-program.htm

$(BIN_DIR_TUTORIALS)\first-program.htm: $(OBJ_DIR_TUTORIALS)\first-program.htm.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\first-program.htm.txt $(BIN_DIR_TUTORIALS)\first-program.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/first-program.htm    $(BIN_DIR_TUTORIALS)\first-program.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\first-program.htm.txt: $(OBJ_DIR_TUTORIALS)\first-program.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_TUTORIALS)\first-program.htm

$(BIN_DIR_TUTORIALS)\first-program.htm.gz: $(OBJ_DIR_TUTORIALS)\first-program.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\first-program.htm.utf-8wobom.txt $(TMP_DIR)\first-program.htm
	creategzip.cmd $(TMP_DIR) first-program.htm.gz first-program.htm
	del $(TMP_DIR)\first-program.htm
	move /Y $(TMP_DIR)\first-program.htm.gz $(BIN_DIR_TUTORIALS)\first-program.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/first-program.htm.gz $(BIN_DIR_TUTORIALS)\first-program.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\first-program.htm.utf-8wobom.txt: $(OBJ_DIR_TUTORIALS)\first-program.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_TUTORIALS)\first-program.htm


$(OBJ_DIR_TUTORIALS)\datatypes.htm: tutorials\datatypes.options.yaml $(TEMPLATES) tutorials\datatypes.metadata.yaml tutorials\datatypes.md
	$(PANDOC_UTIL_PATH) -d tutorials\datatypes.options.yaml
	move /Y tutorials\datatypes.htm $(OBJ_DIR_TUTORIALS)\datatypes.htm

$(BIN_DIR_TUTORIALS)\datatypes.htm: $(OBJ_DIR_TUTORIALS)\datatypes.htm.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\datatypes.htm.txt $(BIN_DIR_TUTORIALS)\datatypes.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/datatypes.htm    $(BIN_DIR_TUTORIALS)\datatypes.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\datatypes.htm.txt: $(OBJ_DIR_TUTORIALS)\datatypes.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_TUTORIALS)\datatypes.htm

$(BIN_DIR_TUTORIALS)\datatypes.htm.gz: $(OBJ_DIR_TUTORIALS)\datatypes.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\datatypes.htm.utf-8wobom.txt $(TMP_DIR)\datatypes.htm
	creategzip.cmd $(TMP_DIR) datatypes.htm.gz datatypes.htm
	del $(TMP_DIR)\datatypes.htm
	move /Y $(TMP_DIR)\datatypes.htm.gz $(BIN_DIR_TUTORIALS)\datatypes.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/datatypes.htm.gz $(BIN_DIR_TUTORIALS)\datatypes.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\datatypes.htm.utf-8wobom.txt: $(OBJ_DIR_TUTORIALS)\datatypes.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_TUTORIALS)\datatypes.htm


$(OBJ_DIR_TUTORIALS)\variables.htm: tutorials\variables.options.yaml $(TEMPLATES) tutorials\variables.metadata.yaml tutorials\variables.md
	$(PANDOC_UTIL_PATH) -d tutorials\variables.options.yaml
	move /Y tutorials\variables.htm $(OBJ_DIR_TUTORIALS)\variables.htm

$(BIN_DIR_TUTORIALS)\variables.htm: $(OBJ_DIR_TUTORIALS)\variables.htm.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\variables.htm.txt $(BIN_DIR_TUTORIALS)\variables.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/variables.htm    $(BIN_DIR_TUTORIALS)\variables.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\variables.htm.txt: $(OBJ_DIR_TUTORIALS)\variables.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_TUTORIALS)\variables.htm

$(BIN_DIR_TUTORIALS)\variables.htm.gz: $(OBJ_DIR_TUTORIALS)\variables.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\variables.htm.utf-8wobom.txt $(TMP_DIR)\variables.htm
	creategzip.cmd $(TMP_DIR) variables.htm.gz variables.htm
	del $(TMP_DIR)\variables.htm
	move /Y $(TMP_DIR)\variables.htm.gz $(BIN_DIR_TUTORIALS)\variables.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/variables.htm.gz $(BIN_DIR_TUTORIALS)\variables.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\variables.htm.utf-8wobom.txt: $(OBJ_DIR_TUTORIALS)\variables.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_TUTORIALS)\variables.htm


$(OBJ_DIR_TUTORIALS)\statements.htm: tutorials\statements.options.yaml $(TEMPLATES) tutorials\statements.metadata.yaml tutorials\statements.md
	$(PANDOC_UTIL_PATH) -d tutorials\statements.options.yaml
	move /Y tutorials\statements.htm $(OBJ_DIR_TUTORIALS)\statements.htm

$(BIN_DIR_TUTORIALS)\statements.htm: $(OBJ_DIR_TUTORIALS)\statements.htm.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\statements.htm.txt $(BIN_DIR_TUTORIALS)\statements.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/statements.htm    $(BIN_DIR_TUTORIALS)\statements.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\statements.htm.txt: $(OBJ_DIR_TUTORIALS)\statements.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_TUTORIALS)\statements.htm

$(BIN_DIR_TUTORIALS)\statements.htm.gz: $(OBJ_DIR_TUTORIALS)\statements.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_TUTORIALS)\statements.htm.utf-8wobom.txt $(TMP_DIR)\statements.htm
	creategzip.cmd $(TMP_DIR) statements.htm.gz statements.htm
	del $(TMP_DIR)\statements.htm
	move /Y $(TMP_DIR)\statements.htm.gz $(BIN_DIR_TUTORIALS)\statements.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/statements.htm.gz $(BIN_DIR_TUTORIALS)\statements.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_TUTORIALS)\statements.htm.utf-8wobom.txt: $(OBJ_DIR_TUTORIALS)\statements.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_TUTORIALS)\statements.htm


$(OBJ_DIR_PROJECTS)\default.htm: projects\default.options.yaml $(TEMPLATES) projects\default.metadata.yaml projects\default.md
	$(PANDOC_UTIL_PATH) -d projects\default.options.yaml
	move /Y projects\default.htm $(OBJ_DIR_PROJECTS)\default.htm

$(BIN_DIR_PROJECTS)\default.htm: $(OBJ_DIR_PROJECTS)\default.htm.txt
	copy /Y $(OBJ_DIR_PROJECTS)\default.htm.txt $(BIN_DIR_PROJECTS)\default.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_PROJECTS)/default.htm    $(BIN_DIR_PROJECTS)\default.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_PROJECTS)\default.htm.txt: $(OBJ_DIR_PROJECTS)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_PROJECTS)\default.htm

$(BIN_DIR_PROJECTS)\default.htm.gz: $(OBJ_DIR_PROJECTS)\default.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_PROJECTS)\default.htm.utf-8wobom.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	del $(TMP_DIR)\default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_PROJECTS)\default.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_PROJECTS)/default.htm.gz $(BIN_DIR_PROJECTS)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_PROJECTS)\default.htm.utf-8wobom.txt: $(OBJ_DIR_PROJECTS)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_PROJECTS)\default.htm


$(OBJ_DIR_USERS)\default.htm: users\default.options.yaml $(TEMPLATES) users\default.metadata.yaml users\default.md
	$(PANDOC_UTIL_PATH) -d users\default.options.yaml
	move /Y users\default.htm $(OBJ_DIR_USERS)\default.htm

$(BIN_DIR_USERS)\default.htm: $(OBJ_DIR_USERS)\default.htm.txt
	copy /Y $(OBJ_DIR_USERS)\default.htm.txt $(BIN_DIR_USERS)\default.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/default.htm    $(BIN_DIR_USERS)\default.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_USERS)\default.htm.txt: $(OBJ_DIR_USERS)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_USERS)\default.htm

$(BIN_DIR_USERS)\default.htm.gz: $(OBJ_DIR_USERS)\default.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_USERS)\default.htm.utf-8wobom.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	del $(TMP_DIR)\default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_USERS)\default.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/default.htm.gz $(BIN_DIR_USERS)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_USERS)\default.htm.utf-8wobom.txt: $(OBJ_DIR_USERS)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_USERS)\default.htm


$(OBJ_DIR_USERS)\mabu.htm: users\mabu.options.yaml $(TEMPLATES) users\mabu.metadata.yaml users\mabu.md
	$(PANDOC_UTIL_PATH) -d users\mabu.options.yaml
	move /Y users\mabu.htm $(OBJ_DIR_USERS)\mabu.htm

$(BIN_DIR_USERS)\mabu.htm: $(OBJ_DIR_USERS)\mabu.htm.txt
	copy /Y $(OBJ_DIR_USERS)\mabu.htm.txt $(BIN_DIR_USERS)\mabu.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/mabu.htm    $(BIN_DIR_USERS)\mabu.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_USERS)\mabu.htm.txt: $(OBJ_DIR_USERS)\mabu.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_USERS)\mabu.htm

$(BIN_DIR_USERS)\mabu.htm.gz: $(OBJ_DIR_USERS)\mabu.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_USERS)\mabu.htm.utf-8wobom.txt $(TMP_DIR)\mabu.htm
	creategzip.cmd $(TMP_DIR) mabu.htm.gz mabu.htm
	del $(TMP_DIR)\mabu.htm
	move /Y $(TMP_DIR)\mabu.htm.gz $(BIN_DIR_USERS)\mabu.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/mabu.htm.gz $(BIN_DIR_USERS)\mabu.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_USERS)\mabu.htm.utf-8wobom.txt: $(OBJ_DIR_USERS)\mabu.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_USERS)\mabu.htm


$(OBJ_DIR_HELP)\default.htm: help\default.options.yaml $(TEMPLATES) help\default.metadata.yaml help\default.md
	$(PANDOC_UTIL_PATH) -d help\default.options.yaml
	move /Y help\default.htm $(OBJ_DIR_HELP)\default.htm

$(BIN_DIR_HELP)\default.htm: $(OBJ_DIR_HELP)\default.htm.txt
	copy /Y $(OBJ_DIR_HELP)\default.htm.txt $(BIN_DIR_HELP)\default.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/default.htm    $(BIN_DIR_HELP)\default.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_HELP)\default.htm.txt: $(OBJ_DIR_HELP)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_HELP)\default.htm

$(BIN_DIR_HELP)\default.htm.gz: $(OBJ_DIR_HELP)\default.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_HELP)\default.htm.utf-8wobom.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	del $(TMP_DIR)\default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_HELP)\default.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/default.htm.gz $(BIN_DIR_HELP)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_HELP)\default.htm.utf-8wobom.txt: $(OBJ_DIR_HELP)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_HELP)\default.htm


$(OBJ_DIR_HELP)\about.htm: help\about.options.yaml $(TEMPLATES) help\about.metadata.yaml help\about.md
	$(PANDOC_UTIL_PATH) -d help\about.options.yaml
	move /Y help\about.htm $(OBJ_DIR_HELP)\about.htm

$(BIN_DIR_HELP)\about.htm: $(OBJ_DIR_HELP)\about.htm.txt
	copy /Y $(OBJ_DIR_HELP)\about.htm.txt $(BIN_DIR_HELP)\about.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/about.htm    $(BIN_DIR_HELP)\about.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_HELP)\about.htm.txt: $(OBJ_DIR_HELP)\about.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_HELP)\about.htm

$(BIN_DIR_HELP)\about.htm.gz: $(OBJ_DIR_HELP)\about.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_HELP)\about.htm.utf-8wobom.txt $(TMP_DIR)\about.htm
	creategzip.cmd $(TMP_DIR) about.htm.gz about.htm
	del $(TMP_DIR)\about.htm
	move /Y $(TMP_DIR)\about.htm.gz $(BIN_DIR_HELP)\about.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/about.htm.gz $(BIN_DIR_HELP)\about.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_HELP)\about.htm.utf-8wobom.txt: $(OBJ_DIR_HELP)\about.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_HELP)\about.htm


$(OBJ_DIR_HELP)\links.htm: help\links.options.yaml $(TEMPLATES) help\links.metadata.yaml help\links.md
	$(PANDOC_UTIL_PATH) -d help\links.options.yaml
	move /Y help\links.htm $(OBJ_DIR_HELP)\links.htm

$(BIN_DIR_HELP)\links.htm: $(OBJ_DIR_HELP)\links.htm.txt
	copy /Y $(OBJ_DIR_HELP)\links.htm.txt $(BIN_DIR_HELP)\links.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/links.htm    $(BIN_DIR_HELP)\links.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_HELP)\links.htm.txt: $(OBJ_DIR_HELP)\links.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR_HELP)\links.htm

$(BIN_DIR_HELP)\links.htm.gz: $(OBJ_DIR_HELP)\links.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR_HELP)\links.htm.utf-8wobom.txt $(TMP_DIR)\links.htm
	creategzip.cmd $(TMP_DIR) links.htm.gz links.htm
	del $(TMP_DIR)\links.htm
	move /Y $(TMP_DIR)\links.htm.gz $(BIN_DIR_HELP)\links.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/links.htm.gz $(BIN_DIR_HELP)\links.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_HELP)\links.htm.utf-8wobom.txt: $(OBJ_DIR_HELP)\links.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR_HELP)\links.htm
