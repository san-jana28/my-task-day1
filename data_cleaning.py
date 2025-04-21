import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
data = {
    "StudentID": [1, 2, 3, 4],
    "Name": ["Jerry", "Jenny", "John", "Emily"],
    "Gender": ["Female", "Female", "Male", "Female"],
    "Course": ["Math", "Science", "Literature", "Math"],
    "LastExamScore": [85, 78, 95, None],
    "DateOfBirth": ["2003-05-14", "2002-11-22", "2003-05-14", "2003-07-11"],
    "Age": [18, 19, 18, 18]
}

df = pd.DataFrame(data)

print("Missing values before cleaning:\n", df.isnull().sum())

df["LastExamScore"].fillna(df["LastExamScore"].mean(), inplace=True)

df.drop_duplicates(subset=["StudentID"], inplace=True)

df["Gender"] = df["Gender"].str.lower()

df["DateOfBirth"] = pd.to_datetime(df["DateOfBirth"], format='%Y-%m-%d')

df.columns = df.columns.str.lower().str.replace(' ', '_')

df["age"] = df["age"].astype(int)

df.to_csv('cleaned_student_performance.csv', index=False)

plt.pie(df[''])

print("\nCleaned DataFrame:\n", df)
print("\nSummary of changes:")
print("- Missing values handled")
print("- Duplicates removed")
print("- Standardized gender values")
print("- Date of birth converted to datetime")
print("- Column headers renamed for consistency")
print("- Fixed age data type")