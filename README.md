# Introduction:

**Analyzing American Baby Names:** I recently completed a dynamic project centered around American baby names🍼💡   . Thrilled by the endless possibilities of data exploration, I began this SQL project inspired by Data Camp 🚀📊. With the goal of uncovering insights within the extensive dataset provided by the United States Social Security Administration, I wielded the power of SQL to reveal fascinating trends, patterns, and the evolving popularity of names over the past century 📈🔍.

I used the power of SQL to unravel the vast datasets, offering a fascinating exploration into the ever-evolving landscape of baby names 👶📊. From timeless classics to emerging trends, I navigated through decades of data to uncover patterns, trends, and the enduring popularity of names, all while deepening my understanding of SQL's capabilities and functionalities 🚀.

join me as we dive into the world of SQL queries and uncover the stories hidden within the baby names dataset! ✨🔍

SQL queries? Check them out here: [Project_baby_names](/Project_baby_names/)

# Background: 

In this project, we're analyzing changes in American baby name preferences since 1910 using dataset from the United States Social Security Administration. We're exploring which names have remained popular for over a century and comparing them to recent top names. This not only helps new parents but also hones skills applicable to understanding trends and popularity in various industries. 🍼💼

# Dataset:

The dataset comprises detailed records of baby names from the United States, capturing over a million entries. 

| Column | Description |
| ------ | ----------- |
| Id     | The unique identifier for each name record |
| Name   | The given first name of the baby. |
| Year   | The year the name was registered. |
| Gender | The gender of the baby (`M` for male, `F` for female). |
| State  | The U.S. state where the name was registered. |
| Count  | The number of occurrences of the name in that particular year and state. |


# Objective:

### Below are the questions I aimed to answer through my analysis:


1️⃣ Names chosen for over a century?

2️⃣ Differences in name popularity types?

3️⃣ Top female names since 1920?

4️⃣ Trendy female names ending with 's' post-2010?

5️⃣ Rise of 'Alexis' in popularity?

6️⃣ Male names with consistent popularity?

7️⃣ Yearly most popular male names?

8️⃣ Male name most often at number one?

### Washington State Specific: 

As a resident of Washington (WA), I was particularly curious about conducting a specific analysis for our state, delving into the unique trends and patterns of baby names within our community. 🌟🍼

1️⃣ All-time favorites in Washington?

2️⃣ Recent trendy names in Washington?

3️⃣ Unique Washington names?

4️⃣ Decadal name trends in Washington?

5️⃣ Top gender-neutral names in Washington?


# Tools I Used:

In my Data Analyst job market project, I utilized a dynamic suite of tools to navigate and analyze data effectively:

- **SQL & PostgreSQL:** 📊 SQL and PostgreSQL formed the backbone, enabling seamless querying and analysis of job market data.

- **Visual Studio Code:** 💻 Visual Studio Code provided the canvas for coding, offering a user-friendly interface and a plethora of extensions for efficient development.

- **Git:** 🔄 Git kept track of every twist and turn in the project's journey, ensuring version control and collaboration.

- **GitHub:** 🌐 GitHub served as the central repository, fostering collaboration and sharing insights with the community.

# The Analysis: 

In this project I have employed a variety of SQL techniques:

 - Including utilizing CASE WHEN statements for conditional logic.

 - Pattern matching using the LIKE operator to identify specific name endings.

 - Incorporating subqueries to filter and analyze subsets of data.

 - Leveraging common table expressions (CTEs) for organizing and simplifying complex queries.

 - Harnessing the power of window functions for advanced analytical tasks such as calculating cumulative counts and identifying trends over time. 

 ## 1. 10 Classic American names:

 This query aims to identify top 10 classic American baby names by selecting names that have been consistently popular across the span of 105 years, from 1910 to 2010.

 ```sql
SELECT Name, SUM(Count) AS total_babies
FROM names
WHERE year BETWEEN 1910 AND 2014
GROUP BY Name 
HAVING COUNT(DISTINCT Year) = 105
ORDER BY total_babies DESC;
```
![Top 10 Classic American baby names](Project_baby_names\assets\popular_names_1910_2014.png)
*This bar chart visualizes the top 10 most consistently popular names from 1910 to 2014, ranked by their total occurrences, showcasing the enduring popularity of names like James, John, and Robert.*
