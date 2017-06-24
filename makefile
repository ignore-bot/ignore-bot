main:
	@echo "Available Make Flags:"
	@echo ""
	@echo "[install] Setup Directory for Use"
	@echo "[list]    List Database Entries"
	@echo "[clean]   Remove Database Entries, Reset Page Count"
	@echo ""

install:
	@echo ./db.sh
	@echo -n "1" > page_number.txt

list:
	@mysql -p -D "ignore_bot" -e "SELECT * FROM repos;"

clean: install
