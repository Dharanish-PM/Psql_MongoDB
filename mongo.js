var getColl=db.getCollection("Products")
getColl.insert({
    "product_name":"Samsung Fridge",
    "Manufacture_Date":"2023-7-14",
    "Warranty":15,
    "Price":150000,
    "Quantity":25,
    "createdAt" : ISODate("2023-09-28T10:55:51.603Z"),
    "updatedAt" : ISODate("2023-09-28T10:55:51.603Z")
    })
getColl.insert({
    "product_name":"Closet",
    "Manufacture_Date":"2023-5-14",
    "Warranty":14,
    "Price":110000,
    "Quantity":40, 
    "createdAt" : ISODate("2023-10-28T10:55:51.603Z"),
    "updatedAt" : ISODate("2023-10-28T10:55:51.603Z")
    })
getColl.insert({
    "product_name":"Closet-New",
    "Manufacture_Date":"2023-5-14",
    "Warranty":14,
    "Price":110000,
    "Quantity":40, 
    "createdAt" : ISODate("2023-05-28T10:55:51.603Z"),
    "updatedAt" : ISODate("2023-05-28T10:55:51.603Z")
    })
getColl.insert({
    "product_name":"Apple-Iphone",
    "Manufacture_Date":"2021-2-14",
    "Warranty":14,
    "Price":210000,
    "Quantity":12,
    "createdAt" : ISODate("2023-08-28T10:55:51.603Z"),
    "updatedAt" : ISODate("2023-08-28T10:55:51.603Z")
    })
  
getColl.remove({"product_name" : "Closet",})
//Proucts with 14 months of warranty taken and group with price and quantiy is added in total for each group
getColl.aggregate( [
   {
      $match: { Warranty: 14 }
   },
   {
       $group:{_id:"$Price",totalQuantity:{$sum:"$Quantity"}}
   }
])

getColl.aggregate( [
   {
      $match: { Warranty: 14 }
   },
   {
       $count:"Total products with warranty of 14 months : "
   }
])

getColl.aggregate( [
   {
      $match: { Warranty: 14 }
   },
   {
       $sort:{product_name:1}
   }
])
getColl.aggregate( [
   {
       $group:{_id:"$Price",Total:{$sum:1}}
   }
])

getColl.aggregate( [
   {
       $group:{_id:"$Price",MaxQuantity:{$max:"$Quantity"}}
   }
])

getColl.aggregate( [
   {
       $group:{_id:"$Price",MinQuantity:{$min:"$Quantity"}}
   }
])

getColl.find({}).limit(1)

getColl.countDocuments()
getColl.find({})




