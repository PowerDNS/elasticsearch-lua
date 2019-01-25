package = "elasticsearch-lua"
version = "1.0.1-1"
source = {
  url = "git://github.com/PowerDNS/elasticsearch-lua",
  branch = "powerdns"
}
description = {
  summary = "Elasticsearch client for the Lua language",
  detailed = [[
    This is an elasticsearch client written in Lua. In accordance with other official low level clients, the client accepts associative arrays in the form of lua table as parameters. It is a fork of the origina client written by DhavalKapil
  ]],
  homepage = "https://github.com/PowerDNS/elasticsearch-lua",
  license = "MIT"
}
dependencies = {
  "lua = 5.1",
  "luasocket",
  "lua-cjson",
  "lunitx"
}
build = {
  type = "builtin",
  modules = {
    ["elasticsearch"] = "src/elasticsearch.lua",
    ["elasticsearch.Nodes"] = "src/elasticsearch/Nodes.lua",
    ["elasticsearch.Transport"] = "src/elasticsearch/Transport.lua",
    ["elasticsearch.Tasks"] = "src/elasticsearch/Tasks.lua",
    ["elasticsearch.Cluster"] = "src/elasticsearch/Cluster.lua",
    ["elasticsearch.Snapshot"] = "src/elasticsearch/Snapshot.lua",
    ["elasticsearch.Cat"] = "src/elasticsearch/Cat.lua",
    ["elasticsearch.helpers"] = "src/elasticsearch/helpers.lua",
    ["elasticsearch.Settings"] = "src/elasticsearch/Settings.lua",
    ["elasticsearch.Logger"] = "src/elasticsearch/Logger.lua",
    ["elasticsearch.parser"] = "src/elasticsearch/parser.lua",
    ["elasticsearch.Indices"] = "src/elasticsearch/Indices.lua",
    ["elasticsearch.Client"] = "src/elasticsearch/Client.lua",

    ["elasticsearch.connection.Connection"] = "src/elasticsearch/connection/Connection.lua",

    ["elasticsearch.selector.RoundRobinSelector"] = "src/elasticsearch/selector/RoundRobinSelector.lua",
    ["elasticsearch.selector.Selector"] = "src/elasticsearch/selector/Selector.lua",
    ["elasticsearch.selector.StickyRoundRobinSelector"] = "src/elasticsearch/selector/StickyRoundRobinSelector.lua",
    ["elasticsearch.selector.RandomSelector"] = "src/elasticsearch/selector/RandomSelector.lua",

    ["elasticsearch.connectionpool.ConnectionPool"] = "src/elasticsearch/connectionpool/ConnectionPool.lua",
    ["elasticsearch.connectionpool.StaticConnectionPool"] = "src/elasticsearch/connectionpool/StaticConnectionPool.lua",
    ["elasticsearch.connectionpool.SniffConnectionPool"] = "src/elasticsearch/connectionpool/SniffConnectionPool.lua",

    ["elasticsearch.endpoints.MSearch"] = "src/elasticsearch/endpoints/MSearch.lua",
    ["elasticsearch.endpoints.TermVectors"] = "src/elasticsearch/endpoints/TermVectors.lua",
    ["elasticsearch.endpoints.Suggest"] = "src/elasticsearch/endpoints/Suggest.lua",
    ["elasticsearch.endpoints.PutTemplate"] = "src/elasticsearch/endpoints/PutTemplate.lua",
    ["elasticsearch.endpoints.Search"] = "src/elasticsearch/endpoints/Search.lua",
    ["elasticsearch.endpoints.Bulk"] = "src/elasticsearch/endpoints/Bulk.lua",
    ["elasticsearch.endpoints.SearchExists"] = "src/elasticsearch/endpoints/SearchExists.lua",
    ["elasticsearch.endpoints.ReIndex"] = "src/elasticsearch/endpoints/ReIndex.lua",
    ["elasticsearch.endpoints.Index"] = "src/elasticsearch/endpoints/Index.lua",
    ["elasticsearch.endpoints.TemplateEndpoint"] = "src/elasticsearch/endpoints/TemplateEndpoint.lua",
    ["elasticsearch.endpoints.CountPercolate"] = "src/elasticsearch/endpoints/CountPercolate.lua",
    ["elasticsearch.endpoints.MPercolate"] = "src/elasticsearch/endpoints/MPercolate.lua",
    ["elasticsearch.endpoints.GetTemplate"] = "src/elasticsearch/endpoints/GetTemplate.lua",
    ["elasticsearch.endpoints.RenderSearchTemplate"] = "src/elasticsearch/endpoints/RenderSearchTemplate.lua",
    ["elasticsearch.endpoints.Percolate"] = "src/elasticsearch/endpoints/Percolate.lua", 
    ["elasticsearch.endpoints.Info"] = "src/elasticsearch/endpoints/Info.lua",
    ["elasticsearch.endpoints.Delete"] = "src/elasticsearch/endpoints/Delete.lua",
    ["elasticsearch.endpoints.SearchShards"] = "src/elasticsearch/endpoints/SearchShards.lua",
    ["elasticsearch.endpoints.DeleteTemplate"] = "src/elasticsearch/endpoints/DeleteTemplate.lua",
    ["elasticsearch.endpoints.Update"] = "src/elasticsearch/endpoints/Update.lua",
    ["elasticsearch.endpoints.Get"] = "src/elasticsearch/endpoints/Get.lua",
    ["elasticsearch.endpoints.Scroll"] = "src/elasticsearch/endpoints/Scroll.lua",
    ["elasticsearch.endpoints.Explain"] = "src/elasticsearch/endpoints/Explain.lua",
    ["elasticsearch.endpoints.MTermVectors"] = "src/elasticsearch/endpoints/MTermVectors.lua",
    ["elasticsearch.endpoints.MGet"] = "src/elasticsearch/endpoints/MGet.lua",
    ["elasticsearch.endpoints.SearchTemplate"] = "src/elasticsearch/endpoints/SearchTemplate.lua",
    ["elasticsearch.endpoints.Count"] = "src/elasticsearch/endpoints/Count.lua",
    ["elasticsearch.endpoints.Ping"] = "src/elasticsearch/endpoints/Ping.lua",
    ["elasticsearch.endpoints.FieldStats"] = "src/elasticsearch/endpoints/FieldStats.lua",
    ["elasticsearch.endpoints.Endpoint"] = "src/elasticsearch/endpoints/Endpoint.lua",
    ["elasticsearch.endpoints.UpdateByQuery"] = "src/elasticsearch/endpoints/UpdateByQuery.lua",
    ["elasticsearch.endpoints.Mlt"] = "src/elasticsearch/endpoints/Mlt.lua",
    ["elasticsearch.endpoints.DeleteByQuery"] = "src/elasticsearch/endpoints/DeleteByQuery.lua",

    ["elasticsearch.endpoints.Cat.Aliases"] = "src/elasticsearch/endpoints/Cat/Aliases.lua",
    ["elasticsearch.endpoints.Cat.Health"] = "src/elasticsearch/endpoints/Cat/Health.lua",
    ["elasticsearch.endpoints.Cat.Nodes"] = "src/elasticsearch/endpoints/Cat/Nodes.lua",
    ["elasticsearch.endpoints.Cat.NodeAttrs"] = "src/elasticsearch/endpoints/Cat/NodeAttrs.lua",
    ["elasticsearch.endpoints.Cat.PendingTasks"] = "src/elasticsearch/endpoints/Cat/PendingTasks.lua",
    ["elasticsearch.endpoints.Cat.Allocation"] = "src/elasticsearch/endpoints/Cat/Allocation.lua",
    ["elasticsearch.endpoints.Cat.CatEndpoint"] = "src/elasticsearch/endpoints/Cat/CatEndpoint.lua",
    ["elasticsearch.endpoints.Cat.Recovery"] = "src/elasticsearch/endpoints/Cat/Recovery.lua",
    ["elasticsearch.endpoints.Cat.FieldData"] = "src/elasticsearch/endpoints/Cat/FieldData.lua",
    ["elasticsearch.endpoints.Cat.Snapshots"] = "src/elasticsearch/endpoints/Cat/Snapshots.lua",
    ["elasticsearch.endpoints.Cat.ThreadPool"] = "src/elasticsearch/endpoints/Cat/ThreadPool.lua",
    ["elasticsearch.endpoints.Cat.Segments"] = "src/elasticsearch/endpoints/Cat/Segments.lua",
    ["elasticsearch.endpoints.Cat.Repositories"] = "src/elasticsearch/endpoints/Cat/Repositories.lua",
    ["elasticsearch.endpoints.Cat.Count"] = "src/elasticsearch/endpoints/Cat/Count.lua",
    ["elasticsearch.endpoints.Cat.Master"] = "src/elasticsearch/endpoints/Cat/Master.lua",
    ["elasticsearch.endpoints.Cat.Indices"] = "src/elasticsearch/endpoints/Cat/Indices.lua",
    ["elasticsearch.endpoints.Cat.Shards"] = "src/elasticsearch/endpoints/Cat/Shards.lua",
    ["elasticsearch.endpoints.Cat.Plugins"] = "src/elasticsearch/endpoints/Cat/Plugins.lua",
    ["elasticsearch.endpoints.Cat.Help"] = "src/elasticsearch/endpoints/Cat/Help.lua",

    ["elasticsearch.endpoints.Cluster.Health"] = "src/elasticsearch/endpoints/Cluster/Health.lua",
    ["elasticsearch.endpoints.Cluster.PendingTasks"] = "src/elasticsearch/endpoints/Cluster/PendingTasks.lua",
    ["elasticsearch.endpoints.Cluster.Stats"] = "src/elasticsearch/endpoints/Cluster/Stats.lua",
    ["elasticsearch.endpoints.Cluster.Reroute"] = "src/elasticsearch/endpoints/Cluster/Reroute.lua",
    ["elasticsearch.endpoints.Cluster.State"] = "src/elasticsearch/endpoints/Cluster/State.lua",
    ["elasticsearch.endpoints.Cluster.GetSettings"] = "src/elasticsearch/endpoints/Cluster/GetSettings.lua",
    ["elasticsearch.endpoints.Cluster.PutSettings"] = "src/elasticsearch/endpoints/Cluster/PutSettings.lua",

    ["elasticsearch.endpoints.Indices.Open"] = "src/elasticsearch/endpoints/Indices/Open.lua",
    ["elasticsearch.endpoints.Indices.GetFieldMapping"] = "src/elasticsearch/endpoints/Indices/GetFieldMapping.lua",
    ["elasticsearch.endpoints.Indices.DeleteAlias"] = "src/elasticsearch/endpoints/Indices/DeleteAlias.lua",
    ["elasticsearch.endpoints.Indices.Status"] = "src/elasticsearch/endpoints/Indices/Status.lua",
    ["elasticsearch.endpoints.Indices.GetUpgrade"] = "src/elasticsearch/endpoints/Indices/GetUpgrade.lua",
    ["elasticsearch.endpoints.Indices.Refresh"] = "src/elasticsearch/endpoints/Indices/Refresh.lua",
    ["elasticsearch.endpoints.Indices.IndicesEndpoint"] = "src/elasticsearch/endpoints/Indices/IndicesEndpoint.lua",
    ["elasticsearch.endpoints.Indices.GetWarmer"] = "src/elasticsearch/endpoints/Indices/GetWarmer.lua",
    ["elasticsearch.endpoints.Indices.PutTemplate"] = "src/elasticsearch/endpoints/Indices/PutTemplate.lua",
    ["elasticsearch.endpoints.Indices.ExistsType"] = "src/elasticsearch/endpoints/Indices/ExistsType.lua",
    ["elasticsearch.endpoints.Indices.Close"] = "src/elasticsearch/endpoints/Indices/Close.lua",
    ["elasticsearch.endpoints.Indices.ExistsAlias"] = "src/elasticsearch/endpoints/Indices/ExistsAlias.lua",
    ["elasticsearch.endpoints.Indices.Create"] = "src/elasticsearch/endpoints/Indices/Create.lua",
    ["elasticsearch.endpoints.Indices.GetMapping"] = "src/elasticsearch/endpoints/Indices/GetMapping.lua",
    ["elasticsearch.endpoints.Indices.GetTemplate"] = "src/elasticsearch/endpoints/Indices/GetTemplate.lua",
    ["elasticsearch.endpoints.Indices.Stats"] = "src/elasticsearch/endpoints/Indices/Stats.lua",
    ["elasticsearch.endpoints.Indices.GetAliases"] = "src/elasticsearch/endpoints/Indices/GetAliases.lua",
    ["elasticsearch.endpoints.Indices.UpdateAliases"] = "src/elasticsearch/endpoints/Indices/UpdateAliases.lua",
    ["elasticsearch.endpoints.Indices.Recovery"] = "src/elasticsearch/endpoints/Indices/Recovery.lua",
    ["elasticsearch.endpoints.Indices.Delete"] = "src/elasticsearch/endpoints/Indices/Delete.lua",
    ["elasticsearch.endpoints.Indices.ValidateQuery"] = "src/elasticsearch/endpoints/Indices/ValidateQuery.lua",
    ["elasticsearch.endpoints.Indices.Exists"] = "src/elasticsearch/endpoints/Indices/Exists.lua",
    ["elasticsearch.endpoints.Indices.ClearCache"] = "src/elasticsearch/endpoints/Indices/ClearCache.lua",
    ["elasticsearch.endpoints.Indices.PostUpgrade"] = "src/elasticsearch/endpoints/Indices/PostUpgrade.lua",
    ["elasticsearch.endpoints.Indices.DeleteTemplate"] = "src/elasticsearch/endpoints/Indices/DeleteTemplate.lua",
    ["elasticsearch.endpoints.Indices.Segments"] = "src/elasticsearch/endpoints/Indices/Segments.lua",
    ["elasticsearch.endpoints.Indices.Get"] = "src/elasticsearch/endpoints/Indices/Get.lua",
    ["elasticsearch.endpoints.Indices.GetSettings"] = "src/elasticsearch/endpoints/Indices/GetSettings.lua",
    ["elasticsearch.endpoints.Indices.PutSettings"] = "src/elasticsearch/endpoints/Indices/PutSettings.lua",
    ["elasticsearch.endpoints.Indices.ExistsTemplate"] = "src/elasticsearch/endpoints/Indices/ExistsTemplate.lua",
    ["elasticsearch.endpoints.Indices.DeleteMapping"] = "src/elasticsearch/endpoints/Indices/DeleteMapping.lua",
    ["elasticsearch.endpoints.Indices.GetAlias"] = "src/elasticsearch/endpoints/Indices/GetAlias.lua",
    ["elasticsearch.endpoints.Indices.Analyze"] = "src/elasticsearch/endpoints/Indices/Analyze.lua",
    ["elasticsearch.endpoints.Indices.PutAlias"] = "src/elasticsearch/endpoints/Indices/PutAlias.lua",
    ["elasticsearch.endpoints.Indices.Optimize"] = "src/elasticsearch/endpoints/Indices/Optimize.lua",
    ["elasticsearch.endpoints.Indices.ShardStores"] = "src/elasticsearch/endpoints/Indices/ShardStores.lua",
    ["elasticsearch.endpoints.Indices.PutMapping"] = "src/elasticsearch/endpoints/Indices/PutMapping.lua",
    ["elasticsearch.endpoints.Indices.PutWarmer"] = "src/elasticsearch/endpoints/Indices/PutWarmer.lua",
    ["elasticsearch.endpoints.Indices.DeleteWarmer"] = "src/elasticsearch/endpoints/Indices/DeleteWarmer.lua",
    ["elasticsearch.endpoints.Indices.ForceMerge"] = "src/elasticsearch/endpoints/Indices/ForceMerge.lua",
    ["elasticsearch.endpoints.Indices.Flush"] = "src/elasticsearch/endpoints/Indices/Flush.lua",
    ["elasticsearch.endpoints.Indices.Seal"] = "src/elasticsearch/endpoints/Indices/Seal.lua",

    ["elasticsearch.endpoints.Nodes.Stats"] = "src/elasticsearch/endpoints/Nodes/Stats.lua",
    ["elasticsearch.endpoints.Nodes.Info"] = "src/elasticsearch/endpoints/Nodes/Info.lua",
    ["elasticsearch.endpoints.Nodes.HotThreads"] = "src/elasticsearch/endpoints/Nodes/HotThreads.lua",
    ["elasticsearch.endpoints.Nodes.Shutdown"] = "src/elasticsearch/endpoints/Nodes/Shutdown.lua",
    ["elasticsearch.endpoints.Nodes.NodesEndpoint"] = "src/elasticsearch/endpoints/Nodes/NodesEndpoint.lua",

    ["elasticsearch.endpoints.Snapshot.Status"] = "src/elasticsearch/endpoints/Snapshot/Status.lua",
    ["elasticsearch.endpoints.Snapshot.SnapshotEndpoint"] = "src/elasticsearch/endpoints/Snapshot/SnapshotEndpoint.lua",
    ["elasticsearch.endpoints.Snapshot.Create"] = "src/elasticsearch/endpoints/Snapshot/Create.lua",
    ["elasticsearch.endpoints.Snapshot.VerifyRepository"] = "src/elasticsearch/endpoints/Snapshot/VerifyRepository.lua",
    ["elasticsearch.endpoints.Snapshot.Restore"] = "src/elasticsearch/endpoints/Snapshot/Restore.lua",
    ["elasticsearch.endpoints.Snapshot.Delete"] = "src/elasticsearch/endpoints/Snapshot/Delete.lua",
    ["elasticsearch.endpoints.Snapshot.Get"] = "src/elasticsearch/endpoints/Snapshot/Get.lua",
    ["elasticsearch.endpoints.Snapshot.DeleteRepository"] = "src/elasticsearch/endpoints/Snapshot/DeleteRepository.lua",
    ["elasticsearch.endpoints.Snapshot.GetRepository"] = "src/elasticsearch/endpoints/Snapshot/GetRepository.lua",
    ["elasticsearch.endpoints.Snapshot.CreateRepository"] = "src/elasticsearch/endpoints/Snapshot/CreateRepository.lua",

    ["elasticsearch.endpoints.Tasks.Cancel"] = "src/elasticsearch/endpoints/Tasks/Cancel.lua",
    ["elasticsearch.endpoints.Tasks.Get"] = "src/elasticsearch/endpoints/Tasks/Get.lua",
    ["elasticsearch.endpoints.Tasks.TasksEndpoint"] = "src/elasticsearch/endpoints/Tasks/TasksEndpoint.lua"
  },
  copy_directories = {"tests"}
}
