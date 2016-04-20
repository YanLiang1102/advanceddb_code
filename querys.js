db.product_yan.find().limit(30)

db.product_yan.aggregate(
{$product: {product_id: "$product_id", 
            address : "$", 
            value1 : "$value1", 
            value2 : "$value2", 
            value3 : "$value3",
            sum : {$add : ["$value1", "$value2", "$value3"]}}},
{$sort: {sum: -1}}
)

db = connect("localhost:27017/YanDB")

https://docs.mongodb.org/v3.0/tutorial/deploy-shard-cluster/

https://docs.mongodb.org/v3.0/tutorial/deploy-shard-cluster/

https://docs.mongodb.org/manual/tutorial/deploy-shard-cluster/

rs.initiate( {
   _id: "configReplSet",
   configsvr: true,
   members: [
      { _id: 0, host: "gpel11.cs.ou.edu:29578" },
      { _id: 1, host: "gpel12.cs.ou.edu:29579" },
      { _id: 2, host: "gpel13.cs.ou.edu:29580" }
   ]
    } )

mongos --configdb configReplSet/<cfgsvr1:port1>,<cfgsvr2:port2>,<cfgsvr3:port3>


---output
> rs.initiate( {
...    _id: "configReplSet",
...    configsvr: true,
...    members: [
...       { _id: 0, host: "gpel11.cs.ou.edu:29578" },
...       { _id: 1, host: "gpel12.cs.ou.edu:29579" },
...       { _id: 2, host: "gpel13.cs.ou.edu:29580" }
...    ]
... } )
{ "ok" : 1 }



//after running the mongos
 sharding: { configDB: "configReplSet/gpel11.cs.ou.edu:29478,gpel12.cs.ou.edu:29479,gpel13.cs.ou.edu:29480" } }
2016-04-12T03:25:01.363-0500 I SHARDING [mongosMain] Updating config server connection string to: configReplSet/gpel11.cs.ou.edu:29478,gpel12.cs.ou.edu:29479,gpel13.cs.ou.edu:29480
2016-04-12T03:25:01.363-0500 I NETWORK  [mongosMain] Starting new replica set monitor for configReplSet/gpel11.cs.ou.edu:29478,gpel12.cs.ou.edu:29479,gpel13.cs.ou.edu:29480
2016-04-12T03:25:01.363-0500 I NETWORK  [ReplicaSetMonitorWatcher] starting
2016-04-12T03:25:01.366-0500 I SHARDING [thread1] creating distributed lock ping thread for process gpel11:21102:1460449501:-2056810528 (sleeping for 30000ms)
2016-04-12T03:25:01.373-0500 I ASIO     [NetworkInterfaceASIO-ShardRegistry-0] Successfully connected to gpel11.cs.ou.edu:29478
2016-04-12T03:25:01.376-0500 I ASIO     [NetworkInterfaceASIO-ShardRegistry-0] Successfully connected to gpel12.cs.ou.edu:29479
2016-04-12T03:25:01.378-0500 I ASIO     [NetworkInterfaceASIO-ShardRegistry-0] Successfully connected to gpel11.cs.ou.edu:29478
2016-04-12T03:25:01.382-0500 W SHARDING [replSetDistLockPinger] pinging failed for distributed lock pinger :: caused by :: LockStateChangeFailed findAndModify query predicate didn't match any lock document
2016-04-12T03:25:01.384-0500 I NETWORK  [HostnameCanonicalizationWorker] Starting hostname canonicalization worker
2016-04-12T03:25:01.384-0500 I SHARDING [Balancer] about to contact config servers and shards
2016-04-12T03:25:01.385-0500 I SHARDING [Balancer] config servers and shards contacted successfully
2016-04-12T03:25:01.385-0500 I SHARDING [Balancer] balancer id: gpel11:21102 started
2016-04-12T03:25:01.397-0500 I ASIO     [NetworkInterfaceASIO-ShardRegistry-0] Successfully connected to gpel13.cs.ou.edu:29480
2016-04-12T03:25:01.407-0500 I SHARDING [Balancer] distributed lock 'balancer' acquired for 'doing balance round', ts : 570cb0dd14cdab51a76b10f2
2016-04-12T03:25:01.408-0500 I SHARDING [Balancer] about to log metadata event into actionlog: { _id: "gpel11-2016-04-12T03:25:01.408-0500-570cb0dd14cdab51a76b10f3", server: "gpel11", clientAddr: "", time: new Date(1460449501408), what: "balancer.round", ns: "", details: { executionTimeMillis: 22, errorOccured: false, candidateChunks: 0, chunksMoved: 0 } }
2016-04-12T03:25:01.426-0500 I NETWORK  [mongosMain] waiting for connections on port 21102
2016-04-12T03:25:01.426-0500 I SHARDING [Balancer] distributed lock with ts: 570cb0dd14cdab51a76b10f2' unlocked.

