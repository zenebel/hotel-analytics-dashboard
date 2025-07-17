const express = require("express");
const { Client } = require("pg");

const app = express();

// Database connection
const db = new Client({
  host: "localhost",
  database: "hotel_analytics",
  user: "lydiaz",
  password: "",
});

//connect to database
db.connect();

// test route
app.get("/api/test", (req, res) => {
  res.send("Hello Hotel API!");
});

app.get("/api/hotels", (req, res) => {
  // SQL query
  const query = "SELECT * FROM hotels";

  // run query
  db.query(query, (err, result) => {
    if (err) {
      res.status(500).send("Database error");
    } else {
      res.json(result.rows); //send hotel data as JSON
    }
  });
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
