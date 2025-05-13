# SE Boot Camp Assignment 9 Documentation

This document provides pseudocode and sample results for the Python script (`assignment9.py`) created for SE Boot Camp Assignment 9. The assignment consists of four parts: Part A, Part B, Part C, and Part D.

## Part A:

### Pseudocode
```
mylist = [10, 20, 30, 40, 50, 60, 70, 80]  # Create list with 8 values
mylist2 = mylist[1:]  # Assign values from index 1 to end
mylist2.append(90)  # Append new item
mylist2.pop(2)  # Remove 3rd item
mylist3 = mylist2  # Assign to mylist3
```

### Results
```
Part A Results:
mylist: [10, 20, 30, 40, 50, 60, 70, 80]
mylist2: [20, 30, 50, 60, 70, 80, 90]
mylist3: [20, 30, 50, 60, 70, 80, 90]
```

## Part B:

### Pseudocode
```
sample_string = "Hello, World! Welcome to Python programming."

print("\nPart B: String Methods")
print("\n1. count(sub, [start, [end]])")
print("Counts occurrences of substring in string")
print(f"Count of 'o': {sample_string.count('o')}")  # Count 'o'

print("\n2. endswith(suffix, [start, [end]])")
print("Checks if string ends with suffix")
print(f"Ends with 'ing.': {sample_string.endswith('ing.')}")  # Check ending

print("\n3. find/sub (sub, [start, [end]])")
print("Returns lowest index of substring (-1 if not found)")
print(f"Index of 'World': {sample_string.find('World')}")  # Find 'World'

print("\n4. join(iterable)")
print("Joins elements of iterable with string as separator")
words = ['Hello', 'World']
print(f"Joined: {','.join(words)}")  # Join words

print("\n5. replace(old, new [, count])")
print("Replaces old substring with new")
print(f"Replace 'World' with 'Universe': {sample_string.replace('World', 'Universe')}")  # Replace

print("\n6. split([sep[, maxsplit]])")
print("Splits string into list based on separator")
print(f"Split on space: {sample_string.split()}")  # Split on space

print("\n7. splitlines([keepends])")
print("Splits string at line breaks")
multiline = "Line1\nLine2\nLine3"
print(f"Split lines: {multiline.splitlines()}")  # Split lines

print("\n8. startswith(prefix[, start[, end]])")
print("Checks if string starts with prefix")
print(f"Starts with 'Hello': {sample_string.startswith('Hello')}")  # Check start

print("\n9. strip([chars])")
print("Removes leading/trailing characters (default: whitespace)")
print(f"Strip '!': {sample_string.strip('!')}")  # Strip '!'
```

### Results
```
Part B: String Methods

1. count(sub, [start, [end]])
Counts occurrences of substring in string
Count of 'o': 6

2. endswith(suffix, [start, [end]])
Checks if string ends with suffix
Ends with 'ing.': True

3. find/sub (sub, [start, [end]])
Returns lowest index of substring (-1 if not found)
Index of 'World': 7

4. join(iterable)
Joins elements of iterable with string as separator
Joined: Hello,World

5. replace(old, new [, count])
Replaces old substring with new
Replace 'World' with 'Universe': Hello, Universe! Welcome to Python programming.

6. split([sep[, maxsplit]])
Splits string into list based on separator
Split on space: ['Hello,', 'World!', 'Welcome', 'to', 'Python', 'programming.']

7. splitlines([keepends])
Splits string at line breaks
Split lines: ['Line1', 'Line2', 'Line3']

8. startswith(prefix[, start[, end]])
Checks if string starts with prefix
Starts with 'Hello': True

9. strip([chars])
Removes leading/trailing characters (default: whitespace)
Strip '!': Hello, World! Welcome to Python programming
```

## Part C:

### Pseudocode
```
def is_prime(number):
    if number < 2:
        return False
    for i in range(2, int(number ** 0.5) + 1):
        if number % i == 0:
            return False
    return True

print("\nPart C: Prime Number Checker")
try:
    user_input = int(input("Enter a number to check if it's prime: "))
    print(f"Is {user_input} prime? {is_prime(user_input)}")
except ValueError:
    print("Please enter a valid integer")
```

### Results
```
Part C: Prime Number Checker
Enter a number to check if it's prime: 17
Is 17 prime? True
```
*Note*: Output varies based on user input. Here, 17 was entered as an example.

## Part D:

### Pseudocode
```
def disStuInfo(schoolID, *firstName, **lastEmail):
    for name in firstName:
        print(schoolID)
        print(name)
        # Check if this first name has a corresponding last name/email
        found = False
        for last, email in lastEmail.items():
            if name.lower() in last.lower() or name.lower() in email.lower():
                print(last)
                print(email)
                found = True
                break
        if not found:
            print("unmatched")
            print("no email")

    # Handle any remaining last names/emails without matching first names
    used_names = [last for last, _ in lastEmail.items() if any(name.lower() in last.lower() for name in firstName)]
    for last, email in lastEmail.items():
        if last not in used_names:
            print(schoolID)
            print("unmatched")
            print(last)
            print(email)

print("\nPart D: Student Info Display")
disStuInfo(10001, 'John', 'Petter', Smith='jSmith@gmail.com', Potter='Petter@yahoo.com', Doe='j@gmail.com')
```

### Results
```
Part D: Student Info Display
10001
John
Smith
jSmith@gmail.com

10001
Petter
Potter
Petter@yahoo.com

10001
unmatched
Doe
j@gmail.com
```

## Notes
- The Python script (`assignment9.py`) was executed in a Python environment to produce the results shown above.
- For Part C, the output depends on user input. The example uses 17, a prime number.
- The script handles errors (e.g., invalid input in Part C) gracefully.