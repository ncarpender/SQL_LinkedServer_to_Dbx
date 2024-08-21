declare @httppath nvarchar(255) = '/sql/1.0/warehouses/203e27f5e77e415f'
declare @hostname nvarchar(255) = 'adb-721606653816808.8.azuredatabricks.net'
declare @pat nvarchar(255)  = 'dapi39e0f901f57c2398e266ac97ea25a6b4-3'
declare @conn nvarchar(1000) = 'DRIVER=Simba Spark ODBC Driver;
ThriftTransport=2;
UID=token;
UseNativeQuery=1;
SSL=1;
Port=443;
Min_TLS=1.2;
AuthMech=3;
HTTPPath=' + @httppath + ';
Host=' + @hostname + ';
PWD=' + @pat 



--exec(' select a.* from openrowset(''MSDASQL'', ''' + @conn + ''', ''select ''''world'''' as hello'') as a')


exec(' select a.* from openrowset(''MSDASQL'', ''' + @conn + ''', ''select * from carpender_raw.sample_data_sales_lt.customer limit 100'') as a')
