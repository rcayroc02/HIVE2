python userlogs.py

pscp -i "C:\Users\ROG\Downloads\llave-cluster.ppk" "C:\Users\ROG\Desktop\big data\indice invertido\usuarios.log" hadoop@ec2-34-226-141-155.compute-1.amazonaws.com:/home/hadoop/


hdfs dfs -put usuarios.log /user/hadoop/wordcount/

hdfs dfs -mkdir -p /user/hadoop/usuarioslog/
hdfs dfs -mv /user/hadoop/wordcount/usuarios.log /user/hadoop/usuarioslog/
hdfs dfs -ls /user/hadoop/wordcount/




CREATE EXTERNAL TABLE user_logs (
  user_id STRING,
  `timestamp` STRING,
  query STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '/user/hadoop/usuarioslog/';


SELECT user_id, COUNT(*) AS entry_count
FROM user_logs
GROUP BY user_id
ORDER BY entry_count DESC
LIMIT 20;

