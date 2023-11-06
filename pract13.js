db.movies.insertMany([
  {
    name: "Movie1",
    type: "Action",
    budget: 1000000,
    producer: {
      name: "producer1",
      address: "PUNE"
    }
  },
  {
    name: "Movie2",
    type: "Drama",
    budget: 800000,
    producer: {
      name: "producer2",
      address: "Mumbai"
    }
  },
  {
    name: "Movie3",
    type: "Horror",
    budget: 1500000,
    producer: {
      name: "producer1",
      address: "PUNE"
    }
  }
]);

db.movies.find({budget:{$gt:100000}},{name:1,_id:0});
db.movies.find({"producer.address":'PUNE'},{"producer.name":1,_id:0});
db.movies.updateMany({type:'Action'},{$set:{type:'Horror'}});
db.movies.find();
db.movies.find({'producer.name':'producer1'},{'producer.name':1,'producer.address':1,_id:0});
