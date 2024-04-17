//A01 - A02

db.getCollection("baseball").find()

//B01

db.getCollection("baseball").find({"pct" : {$gte : 0.400, $lte : 0.450}})

//B02

db.getCollection("baseball").find({"league" : /Central/})

//BO3

db.getCollection("baseball").aggregate([{$match : {"player_list.position" : "C"}},
{$project : {_id : 0, team : 1, player_list : {$filter : {input : "$player_list", 
    as : "player", cond : {$eq : ["$$player.position", "C"]}}}}},{$limit : 2}])
    
//B04

db.getCollection("baseball").aggregate([{$match: {"player_list.batting_avg" : {$gte : 0.300, $lte : 0.400}, 
    "player_list.position" : "1B"}},{$project : {_id : 0, team : 1, player_list : 
        {$filter : {input : "$player_list", as : "player", cond : {$and : [{$eq : 
            ["$$player.position", "1B"]},{$gte: ["$$player.batting_avg", 0.300]}, {$lte : 
                ["$$player.batting_avg", 0.400]} ]}}}}}, {$limit : 1}])       
                       
//B05

db.getCollection("baseball").updateOne({"team" : "Chicago White Sox"}, 
{$pull : {"player_list" : {"player": "Jose Abreu"}}})

//B06

db.getCollection("baseball").updateOne({"team" : "Chicago White Sox"}, 
{$push : {"player_list" : {"player" : "Yasmani Grandal", "jersey_number" : "24", 
    "position" : "C", "batting_avg" : 0.150, "DOB" : ISODATE("1988-11-08")}}})
    
//B07

db.getCollection("baseball").updateOne({"team": "Chicago White Sox", "player_list.player": 
"Yasmani Grandal" }, {$unset: { "player_list.$.birthdate": ""}})

//B08

db.getCollection("baseball").updateOne({"team" : "Chicago White Sox", "player_list.player": 
"Yasmani Grandal" }, {$set : { "player_list.$.batting_avg": 0.250}})

//B09

db.getCollection("baseball").updateOne({"team": "Chicago White Sox", "player_list.player": 
"Yasmani Grandal"}, {$set : {"player_list.$.batting_avg" : 0.250}})

//B10
            
db.getCollection("baseball").aggregate([{$unwind : "$player_list"},{$group : 
    {_id : "$team", average_batting_avg : {$avg: "$player_list.batting_avg"}}},
    {$sort: {average_batting_avg: -1}}])
    
          