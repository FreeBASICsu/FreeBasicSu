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

PANDOC_PATH="$(ProgramFiles)\Pandoc\pandoc.exe"
ONELINE_PATH="C:\Programming\Unsorted FreeBASIC Projects\OneLine\oneline.exe"
ARCHIVATOR_PATH="$(ProgramFiles)\7-Zip\7z.exe"
HTTPPUT_PATH="C:\Programming\Unsorted FreeBASIC Projects\Http PUT\HttpPUT.exe"
IP_BIND_ADDRESS=0.0.0.0
CREDENTIALS=$(WWW_USERNAME):$(WWW_PASSWORD)

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

BIN_DIR=bin
OBJ_DIR=obj
TMP_DIR=obj
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

.PHONY: WWW_FREEBASIC_SU all clean install uninstall configure

WWW_FREEBASIC_SU: BINARY_TARGETS TEXT_TARGETS GENERATED_TARGETS

BINARY_TARGETS: $(BIN_DIR)\robots.txt $(BIN_DIR)\favicon.ico $(BIN_DIR)\googledffc38e6f05ff431.html $(BIN_DIR)\yandex_461c9af9cde122fb.html $(BIN_DIR_AVATARS)\mabu.50x50.jpg $(BIN_DIR_AVATARS)\mabu.90x90.png $(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg $(BIN_DIR_RES)\heap.zip

TEXT_TARGETS: $(BIN_DIR)\styles.css.gz $(BIN_DIR)\styles.css $(BIN_DIR)\rss.rss.gz $(BIN_DIR)\rss.rss $(BIN_DIR)\sitemap.xml.gz $(BIN_DIR)\sitemap.xml

GENERATED_TARGETS: $(BIN_DIR)\default.htm.gz $(BIN_DIR)\default.htm $(BIN_DIR_TUTORIALS)\default.htm.gz $(BIN_DIR_TUTORIALS)\default.htm $(BIN_DIR_PROJECTS)\default.htm.gz $(BIN_DIR_PROJECTS)\default.htm $(BIN_DIR_USERS)\default.htm.gz $(BIN_DIR_USERS)\default.htm $(BIN_DIR_USERS)\mabu.htm.gz $(BIN_DIR_USERS)\mabu.htm $(BIN_DIR_HELP)\default.htm.gz $(BIN_DIR_HELP)\default.htm $(BIN_DIR_HELP)\about.htm.gz $(BIN_DIR_HELP)\about.htm $(BIN_DIR_HELP)\links.htm.gz $(BIN_DIR_HELP)\links.htm

$(BIN_DIR)\robots.txt: robots.txt
	copy /B /Y robots.txt $(BIN_DIR)\robots.txt
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/robots.txt $(BIN_DIR)\robots.txt $(MIME_TEXT_PLAIN) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\favicon.ico: favicon.ico
	copy /B /Y favicon.ico $(BIN_DIR)\favicon.ico
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/favicon.ico $(BIN_DIR)\favicon.ico $(MIME_IMAGE_ICON) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\googledffc38e6f05ff431.html: googledffc38e6f05ff431.html
	copy /B /Y googledffc38e6f05ff431.html $(BIN_DIR)\googledffc38e6f05ff431.html
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/googledffc38e6f05ff431.html $(BIN_DIR)\googledffc38e6f05ff431.html $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\yandex_461c9af9cde122fb.html: yandex_461c9af9cde122fb.html
	copy /B /Y yandex_461c9af9cde122fb.html $(BIN_DIR)\yandex_461c9af9cde122fb.html
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/yandex_461c9af9cde122fb.html $(BIN_DIR)\yandex_461c9af9cde122fb.html $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_AVATARS)\mabu.50x50.jpg: avatars\mabu.50x50.jpg
	copy /B /Y avatars\mabu.50x50.jpg $(BIN_DIR_AVATARS)\mabu.50x50.jpg
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_AVATARS)/mabu.50x50.jpg $(BIN_DIR_AVATARS)\mabu.50x50.jpg $(MIME_IMAGE_JPEG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_AVATARS)\mabu.90x90.png: avatars\mabu.90x90.png
	copy /B /Y avatars\mabu.90x90.png $(BIN_DIR_AVATARS)\mabu.90x90.png
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_AVATARS)/mabu.90x90.png $(BIN_DIR_AVATARS)\mabu.90x90.png $(MIME_IMAGE_PNG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg: profilepictures\mabu.original.jpg
	copy /B /Y profilepictures\mabu.original.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_PROFILEPICTURES)/mabu.original.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.original.jpg $(MIME_IMAGE_JPEG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg: profilepictures\mabu.200x200.jpg
	copy /B /Y profilepictures\mabu.200x200.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_PROFILEPICTURES)/mabu.200x200.jpg $(BIN_DIR_PROFILEPICTURES)\mabu.200x200.jpg $(MIME_IMAGE_JPEG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_RES)\heap.zip: res\heap.zip
	copy /B /Y res\heap.zip $(BIN_DIR_RES)\heap.zip
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_RES)/heap.zip $(BIN_DIR_RES)\heap.zip $(MIME_APPLICATION_ZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)


# styles.css -> (OneLine) ->
# 1. styles.css.utf-8.txt (UTF-8 без BOM) -> styles.css -> styles.css.gz + Отправить архив на сервер
# 2. styles.css.txt (UTF-8 BOM) -> перезаписать styles.css + Отправить на сервер

$(BIN_DIR)\styles.css.gz: $(BIN_DIR)\styles.css
	move /Y $(BIN_DIR_HELP)\styles.css.utf-8.txt $(TMP_DIR)\styles.css
	creategzip.cmd $(TMP_DIR) styles.css.gz styles.css
	move /Y $(TMP_DIR)\styles.css.gz $(BIN_DIR_HELP)\styles.css.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/styles.css.gz $(BIN_DIR)\styles.css.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\styles.css: styles.css
	$(ONELINE_PATH) styles.css
	move /Y styles.css.utf-8.txt $(BIN_DIR)\styles.css.utf-8.txt
	move /Y styles.css.txt $(BIN_DIR)\styles.css
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/styles.css $(BIN_DIR)\styles.css $(MIME_TEXT_CSS) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR)\rss.rss.gz: $(BIN_DIR)\rss.rss
	move /Y $(BIN_DIR_HELP)\rss.rss.utf-8.txt $(TMP_DIR)\rss.rss
	creategzip.cmd $(TMP_DIR) rss.rss.gz rss.rss
	move /Y $(TMP_DIR)\rss.rss.gz $(BIN_DIR_HELP)\rss.rss.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/rss.rss.gz $(BIN_DIR)\rss.rss.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\rss.rss: rss.rss
	$(ONELINE_PATH) rss.rss
	move /Y rss.rss.utf-8.txt $(BIN_DIR)\rss.rss.utf-8.txt
	move /Y rss.rss.txt $(BIN_DIR)\rss.rss
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/rss.rss $(BIN_DIR)\rss.rss $(MIME_APPLICATION_RSSXML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR)\sitemap.xml.gz: $(BIN_DIR)\sitemap.xml
	move /Y $(BIN_DIR_HELP)\sitemap.xml.utf-8.txt $(TMP_DIR)\sitemap.xml
	creategzip.cmd $(TMP_DIR) sitemap.xml.gz sitemap.xml
	move /Y $(TMP_DIR)\sitemap.xml.gz $(BIN_DIR_HELP)\sitemap.xml.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/sitemap.xml.gz $(BIN_DIR)\sitemap.xml.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\sitemap.xml: sitemap.xml
	$(ONELINE_PATH) sitemap.xml
	move /Y sitemap.xml.utf-8.txt $(BIN_DIR)\sitemap.xml.utf-8.txt
	move /Y sitemap.xml.txt $(BIN_DIR)\sitemap.xml
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/sitemap.xml $(BIN_DIR)\sitemap.xml $(MIME_APPLICATION_RSSXML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


# default.options.yaml -> (PANDOC_PATH) ->
# default.htm -> (OneLine) ->
# 1. default.htm.utf-8.txt (UTF-8 без BOM) -> default.htm -> default.htm.gz + Отправить архив на сервер
# 2. default.htm.txt (UTF-8 BOM) -> перезаписать default.htm + Отправить на сервер

$(BIN_DIR)\default.htm.gz: $(BIN_DIR)\default.htm
	move /Y $(BIN_DIR)\default.htm.utf-8.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR)\default.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/default.htm.gz $(BIN_DIR)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\default.htm: default.options.yaml
	$(PANDOC_PATH) -d default.options.yaml
	$(ONELINE_PATH) default.htm
	move /Y default.htm.utf-8.txt $(BIN_DIR)\default.htm.utf-8.txt
	move /Y default.htm.txt $(BIN_DIR)\default.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL)/default.htm $(BIN_DIR)\default.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_TUTORIALS)\default.htm.gz: $(BIN_DIR_TUTORIALS)\default.htm
	move /Y $(BIN_DIR_TUTORIALS)\default.htm.utf-8.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_TUTORIALS)\default.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/default.htm.gz $(BIN_DIR_TUTORIALS)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_TUTORIALS)\default.htm: tutorials\default.options.yaml
	$(PANDOC_PATH) -d tutorials\default.options.yaml
	$(ONELINE_PATH) tutorials\default.htm
	move /Y tutorials\default.htm.utf-8.txt $(BIN_DIR_TUTORIALS)\default.htm.utf-8.txt
	move /Y tutorials\default.htm.txt $(BIN_DIR_TUTORIALS)\default.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_TUTORIALS)/default.htm $(BIN_DIR_TUTORIALS)\default.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_PROJECTS)\default.htm.gz: $(BIN_DIR_PROJECTS)\default.htm
	move /Y $(BIN_DIR_PROJECTS)\default.htm.utf-8.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_PROJECTS)\default.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_PROJECTS)/default.htm.gz $(BIN_DIR_PROJECTS)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_PROJECTS)\default.htm: projects\default.options.yaml
	$(PANDOC_PATH) -d projects\default.options.yaml
	$(ONELINE_PATH) projects\default.htm
	move /Y projects\default.htm.utf-8.txt $(BIN_DIR_PROJECTS)\default.htm.utf-8.txt
	move /Y projects\default.htm.txt $(BIN_DIR_PROJECTS)\default.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_PROJECTS)/default.htm $(BIN_DIR_PROJECTS)\default.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_USERS)\default.htm.gz: $(BIN_DIR_USERS)\default.htm
	move /Y $(BIN_DIR_USERS)\default.htm.utf-8.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_USERS)\default.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/default.htm.gz $(BIN_DIR_USERS)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_USERS)\default.htm: users\default.options.yaml
	$(PANDOC_PATH) -d users\default.options.yaml
	$(ONELINE_PATH) users\default.htm
	move /Y users\default.htm.utf-8.txt $(BIN_DIR_USERS)\default.htm.utf-8.txt
	move /Y users\default.htm.txt $(BIN_DIR_USERS)\default.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/default.htm $(BIN_DIR_USERS)\default.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_USERS)\mabu.htm.gz: $(BIN_DIR_USERS)\mabu.htm
	move /Y $(BIN_DIR_USERS)\mabu.htm.utf-8.txt $(TMP_DIR)\mabu.htm
	creategzip.cmd $(TMP_DIR) mabu.htm.gz mabu.htm
	move /Y $(TMP_DIR)\mabu.htm.gz $(BIN_DIR_USERS)\mabu.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/mabu.htm.gz $(BIN_DIR_USERS)\mabu.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_USERS)\mabu.htm: users\mabu.options.yaml
	$(PANDOC_PATH) -d users\mabu.options.yaml
	$(ONELINE_PATH) users\mabu.htm
	move /Y users\mabu.htm.utf-8.txt $(BIN_DIR_USERS)\mabu.htm.utf-8.txt
	move /Y users\mabu.htm.txt $(BIN_DIR_USERS)\mabu.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_USERS)/mabu.htm $(BIN_DIR_USERS)\mabu.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_HELP)\default.htm.gz: $(BIN_DIR_HELP)\default.htm
	move /Y $(BIN_DIR_HELP)\default.htm.utf-8.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR_HELP)\default.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/default.htm.gz $(BIN_DIR_HELP)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_HELP)\default.htm: help\default.options.yaml
	$(PANDOC_PATH) -d help\default.options.yaml
	$(ONELINE_PATH) help\default.htm
	move /Y help\default.htm.utf-8.txt $(BIN_DIR_HELP)\default.htm.utf-8.txt
	move /Y help\default.htm.txt $(BIN_DIR_HELP)\default.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/default.htm $(BIN_DIR_HELP)\default.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_HELP)\about.htm.gz: $(BIN_DIR_HELP)\about.htm
	move /Y $(BIN_DIR_HELP)\about.htm.utf-8.txt $(TMP_DIR)\about.htm
	creategzip.cmd $(TMP_DIR) about.htm.gz about.htm
	move /Y $(TMP_DIR)\about.htm.gz $(BIN_DIR_HELP)\about.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/about.htm.gz $(BIN_DIR_HELP)\about.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_HELP)\about.htm: help\about.options.yaml
	$(PANDOC_PATH) -d help\about.options.yaml
	$(ONELINE_PATH) help\about.htm
	move /Y help\about.htm.utf-8.txt $(BIN_DIR_HELP)\about.htm.utf-8.txt
	move /Y help\about.htm.txt $(BIN_DIR_HELP)\about.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/about.htm $(BIN_DIR_HELP)\about.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_HELP)\links.htm.gz: $(BIN_DIR_HELP)\links.htm
	move /Y $(BIN_DIR_HELP)\links.htm.utf-8.txt $(TMP_DIR)\links.htm
	creategzip.cmd $(TMP_DIR) links.htm.gz links.htm
	move /Y $(TMP_DIR)\links.htm.gz $(BIN_DIR_HELP)\links.htm.gz
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/links.htm.gz $(BIN_DIR_HELP)\links.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_HELP)\links.htm: help\links.options.yaml
	$(PANDOC_PATH) -d help\links.options.yaml
	$(ONELINE_PATH) help\links.htm
	move /Y help\links.htm.utf-8.txt $(BIN_DIR_HELP)\links.htm.utf-8.txt
	move /Y help\links.htm.txt $(BIN_DIR_HELP)\links.htm
	$(HTTPPUT_PATH) $(IP_BIND_ADDRESS) $(URL_HELP)/links.htm $(BIN_DIR_HELP)\links.htm $(MIME_TEXT_HTML) $(CREDENTIALS) $(CONTENT_LANGUAGE)


default.md:
default.metadata.yaml:
default.options.yaml: template.htm default.metadata.yaml default.md
favicon.ico:
googledffc38e6f05ff431.html:
robots.txt:
rss.rss:
sitemap.xml: robots.txt
styles.css:
template.htm:
yandex_461c9af9cde122fb.html:

tutorials\default.md:
tutorials\default.metadata.yaml:
tutorials\default.options.yaml: template.htm tutorials\default.metadata.yaml tutorials\default.md

projects\default.md:
projects\default.metadata.yaml:
projects\default.options.yaml: template.htm projects\default.metadata.yaml projects\default.md

users\default.md:
users\default.metadata.yaml:
users\default.options.yaml: template.htm users\default.metadata.yaml users\default.md

users\mabu.md:
users\mabu.metadata.yaml:
users\mabu.options.yaml: template.htm users\mabu.metadata.yaml users\mabu.md

help\about.md:
help\about.metadata.yaml:
help\about.options.yaml: template.htm help\about.metadata.yaml help\about.md

help\default.md:
help\default.metadata.yaml:
help\default.options.yaml: template.htm help\default.metadata.yaml help\default.md

help\links.md:
help\links.metadata.yaml:
help\links.options.yaml: template.htm help\links.metadata.yaml help\links.md

users\mabu\mabu.50x50.jpg:
users\mabu\mabu.90x90.png:
users\mabu\mabu.original.jpg:
users\mabu\mabu.200x200.jpg:

res\heap.zip:

configure:
	mkdir $(TMP_DIR)
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
