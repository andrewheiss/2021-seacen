remote_host = cloud
remote_dir = ~/sites/talks/public_html/2021-seacen
remote_dest = $(remote_host):$(remote_dir)

.PHONY: clean html upload serve

serve:
	Rscript -e "servr::httw(dir = '_site', port = 7000)"

html:
	Rscript -e "rmarkdown::render_site(encoding = 'UTF-8')"

clean:
	Rscript -e "rmarkdown::clean_site(preview = FALSE)"

upload:
	rsync -crvP --delete _site/ $(remote_dest)
