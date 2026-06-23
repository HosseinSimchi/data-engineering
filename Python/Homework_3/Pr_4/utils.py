def read_file(path):
    try:
        with open(path, "r", encoding="utf-8") as file:
            return file.read()
    except FileNotFoundError:
        print("Error: The file is not find")
        return None


def write_file(path, text):
    try:
        with open(path, "w", encoding="utf-8") as file:
            file.write(text)
        print("Saved Successfully!")

    except Exception as e:
        print("Error while writing the text: ", e)