import csv
import requests
from bs4 import BeautifulSoup

# Send a GET request to the URL
url = 'http://pokemondb.net/pokedex/all'
response = requests.get(url)

# Create a BeautifulSoup object to parse the HTML content
soup = BeautifulSoup(response.content, 'html.parser')

# Find the table containing the Pokémon data
table = soup.find('table', {'id': 'pokedex'})

# Open a CSV file to write the data
with open('pokemon_data.csv', 'w', newline='') as file:
    writer = csv.writer(file)

    # Write the header row
    writer.writerow(['Name', 'Type1', 'Type2', 'HP', 'Attack', 'Defense', 'Sp. Atk', 'Sp. Def', 'Speed'])

    # Iterate over each row in the table (excluding the header row)
    rows = table.find_all('tr')[1:]
    for row in rows:
        # Extract the data from each column
        columns = row.find_all('td')
        name = columns[1].text.strip()
        type1 = columns[2].text.strip()
        type2 = columns[3].text.strip()
        hp = columns[4].text.strip()
        attack = columns[5].text.strip()
        defense = columns[6].text.strip()
        sp_atk = columns[7].text.strip()
        sp_def = columns[8].text.strip()
        speed = columns[9].text.strip()

        # Write the data to the CSV file
        writer.writerow([name, type1, type2, hp, attack, defense, sp_atk, sp_def, speed])

print("Data scraped and saved to 'pokemon_data.csv' file.")





