load 'Base.class.rb'

db = Base.new

db.select("model")
db.select("size")
db.select('weight')
db.from('products')
where = Hash.new
where["price"] = 100
where["size"] = 11
where["condition"]= "OR"

db.where(where)
db.print


dbSet = Base.new

dbSet.update("orders")
set = Hash.new
set["price"] = "150"
set["model"] = "1234X"

dbSet.set(set)
where = Hash.new
where["price"] = 100
where["size"] = 11
where["condition"]= "AND"
dbSet.where(where)

where2 = Hash.new
where2["price2"] = 100
where2["size2"] = 11
where2["condition"]= "OR"
dbSet.where(where2)
dbSet.print


dbIn = Base.new
dbIn.insert('products')

dbIn.set(set)
dbIn.print


