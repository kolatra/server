import random
import os

def main():
    filename = '/home/tyler/.dotfiles/logos'
    with open(filename, 'r') as file:
        lines = [line.rstrip() for line in file]

        index = random.randint(0, len(lines))

        line = lines[index]

        parts = line.split()
        logo = parts[1]

        print(f'Using {logo}')
        os.system(f'fastfetch -l {logo}')

if __name__ == "__main__":
    main()
