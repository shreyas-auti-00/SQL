--------------------------------------------------------------------SET 7--------------------------------------------------
--60 What would be the output of the following query(INNER JOIN) 
 SELECT T1.ID, T2.ID FROM TBL_1 T1 INNER JOIN TBL_2 T2 ON T1.ID = T2.ID 

--66 What would be the output of the following query.(Related Tables : Table_1,Table_2) 
SELECT A.[ID] ,A.[Name],B.[ID] ,B.[Name] FROM [Table_1] A INNER JOIN [Table_2] B 
ON A.ID = B.ID 

--67. What would be the output of the following query.(Related Tables : Table_1,Table_2) 
SELECT A.[ID] ,A.[Name],B.[ID] ,B.[Name] FROM [Table_1] A INNER JOIN [Table_2] B 
ON A.ID = B.ID AND A.[Name] = B.[Name] 

--70 What would be the output of the following query.(Related Tables : Table_1,Table_2) --(INNER JOIN WITH NOT EQUAL !=) 
SELECT A.[ID], A.[Name],B.[ID], B.[Name] FROM [Table_1] A INNER JOIN [Table_2] B 
ON A.ID != B.ID

--75 Write down the query to fatch record from Table_1 which not exist in Table_2(based on ID column) 
select * from table_1 a left join table_2 b on a.id = b.id where b.name is null

--77 write down the query to fatch record from Table_2 which not exist in Table_1(based on ID column)
select * from table_1 a right join table_2 b on a.id = b.id where a.name is null

--------------------------------------------------------------------SET 8 ---------------------------------------------------------------------------------


