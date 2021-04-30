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

.PHONY: WWW_WEBSITE all clean install uninstall configure

WWW_WEBSITE: BINARY_TARGETS TEXT_TARGETS GENERATED_TARGETS

include dependencies.make
