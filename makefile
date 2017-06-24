main:
	@echo "Available Make Flags:"
	@echo "[list] List Database Entries"
	@echo "[clean] Remove Database Entries, Reset Page Count"

list:
	@mysql -p -D "ignore_bot" -e "SELECT * FROM repositories;"

clean:
	@mysql -p -D "ignore_bot" -e "DELETE FROM repositories;"
	@echo -n "1" > page_number.txt
