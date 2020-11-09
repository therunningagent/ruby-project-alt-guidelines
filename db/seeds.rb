Character.destroy_all
Game.destroy_all
User.destroy_all


Character.create([
    {name: "Luis Torres", health_count: 5, total_money: 1000, speed: 1},
    {name: "Thomas Garayua", health_count: 5, total_money: 1000, speed: 3},
    {name: "Chelsey", health_count: 10, total_money: 300, speed: 2},
    {name: "Zohren", health_count: 8 , total_money: 200, speed: 3},
    {name: "Charlie", health_count: 1, total_money: 100, speed: 3}
])

c1 = Character.first
c2 = Character.second
c3 = Character.third
c4 = Character.fourth
c5 = Character.last

User.create([
    {username: "charlie"},
    {username: "ashley"},
    {username: "thomas"},
    {username: "go452"},
    {username: "loltest"}
])

u1 = User.first
u2 = User.second
u3 = User.third
u4 = User.fourth
u5 = User.last

# where do you get id from?


Game.create([
    {user_id: u1.id, character_id: c1.id, health_count: 5, total_money: 1000},
    {user_id: u2.id, character_id: c2.id, health_count: 5, total_money: 1000},
    {user_id: u3.id, character_id: c3.id, health_count: 5, total_money: 1000},
    {user_id: u4.id, character_id: c4.id, health_count: 5, total_money: 1000},
    {user_id: u5.id, character_id: c5.id, health_count: 5, total_money: 1000}
])


