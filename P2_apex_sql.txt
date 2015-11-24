select 
jt3.title title,
jt4.genre genre,
jt5.metascore metascore,
jt1.tname tname,
jt2.phone phone
from apex_collections t,
json_table(t.clob001, '$.X0_1[*]' COLUMNS rid for ordinality, tname varchar2(100) path '$') jt1,
json_table(t.clob001, '$.X1_1[*]' COLUMNS rid for ordinality, phone varchar2(50) path '$') jt2,
json_table(t.clob001, '$.TITLE[*]' COLUMNS rid for ordinality, title varchar2(50) path '$') jt3,
json_table(t.clob001, '$.GENRE[*]' COLUMNS rid for ordinality, genre varchar2(100) path '$') jt4,
json_table(t.clob001, '$.METASCORE[*]' COLUMNS rid for ordinality, metascore number path '$') jt5,
json_table(t.clob001, '$.X2_1[*]' COLUMNS rid for ordinality, zip varchar2(10) path '$') jt6
where t.collection_name = 'P2_DOREST_RESULTS' and
jt1.rid = jt2.rid and jt2.rid = jt3.rid and jt3.rid = jt4.rid and jt4.rid = jt5.rid and jt5.rid = jt6.rid and
zip IS NOT NULL and
metascore >= :P2_META and
tname LIKE CONCAT(CONCAT('%',:P2_THEATRE),'%')
order by zip, title
