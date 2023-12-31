# TODO:
import csv
import sys


def main():
    # TODO: Check for command-line usage
    if len(sys.argv) != 3:
        print("Usage: python dna.py database.csv sequence.txt")
        return

    # TODO: Read database file into a variable
    database_filename = sys.argv[1]
    with open(database_filename, newline="") as database_file:
        database_reader = csv.DictReader(database_file)
        # Read the header row to get the STRs
        str_list = database_reader.fieldnames[1:]

        # Create a dictionary to store the data from the CSV
        database = {}
        for row in database_reader:
            database[row["name"]] = {
                str_name: int(str_count)
                for str_name, str_count in row.items()
                if str_name != "name"
            }

    # TODO: Read DNA sequence file into a variable
    sequence_filename = sys.argv[2]
    with open(sequence_filename, "r") as sequence_file:
        dna_sequence = sequence_file.read()

    # TODO: Find longest match of each STR in DNA sequence
    str_counts = {}
    for str_name in str_list:
        str_counts[str_name] = longest_match(dna_sequence, str_name)

    # TODO: Check database for matching profiles
    for person, str_data in database.items():
        if all(str_data[str_name] == str_counts[str_name] for str_name in str_list):
            print(person)
            return

    print("No match")


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):
        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:
            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
