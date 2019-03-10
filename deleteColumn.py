import sqlite3
conn = sqlite3.connect('recipes.db') # Warning: This file is created in the current directory
conn.execute("ALTER TABLE recipe_tbl DROP description;")
conn.commit()
