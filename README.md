# DB_Lab_IUT
# **Lab 8**
In this section three main points are discussed :
- Exclusive lock can't work Simultaneously with shared lock
- Dirty read
- NonRepeatable read
This code shows a scenario that Exclusive lock can't work with shared lock:
![picture](lock.PNG)

as we see in the picture below we read the Dirty data in the second transaction:
![picture](image/DR.PNG)

here we see the non repeatable read problems as the data we select in first transaction had been changed via transaction2
![picture](image/NRR.PNG)
